/**
 * Evénément onchange sur le calendrier DOB
 */

document.querySelector('#dob').addEventListener(
    'change',
    (e) => {
        document.querySelector('#dobVal').textContent = e.target.value < 19 ? 'Trop jeune pour travailler chez nous !' : age(Date.now(), e.target.value) + ' an(s)';
    }
);

/**
 * Evénément onchange sur le contrôle années d'expérience
 */

document.querySelector('#exp').addEventListener(
    'change',
    (e) => {
        document.querySelector('#expVal').textContent = expertise(e.target.value);
    }
);

/**
 * Evénément onclick sur le bouton de sauvegarde locale
 * https://developers.google.com/maps/documentation/javascript/geocoding
 */

document.querySelector('#save').addEventListener(
    'click',
    (evt) => {
        let inputs = document.querySelectorAll('#candidate input:not([type=hidden])[name]'), candidate = {}, jobs = [];
        console.log(inputs);

        // méthode forEach
        inputs.forEach((input) => {
            // console.log(input.type);
            if (input.type === 'radio') {
                if (input.checked) {
                    candidate[input.name] = input.value;
                }
            } else if (input.type === 'checkbox') {
                if (input.checked) {
                    jobs.push(input.value);
                }
            } else {
                candidate[input.name] = input.value;
            }
        });

        candidate.jobs = jobs;
        // console.log(candidate);

        // Stockage local de l'objet sérialisé (converti en string)
        let key = document.querySelector('#fname').value;
        if (key !== '') {
            localStorage.setItem(key, JSON.stringify(candidate));
            alert('Stockage local terminé avec succès.');
            console.log(evt);
            evt.preventDefault(); // stoppe l'événement en cours
        } else {
            alert('Vous devez saisir un prénom !');
        }
    }
);

/**
 * Evénément ondomcontentloaded sur le document (qd doc chargé)
 * AJAX avec fetch()
 */

document.addEventListener(
    'DOMContentLoaded',
    function () {
        // Vide la liste
        let select = document.querySelector('#region'), option;
        select.innerHTML = '';

        // Lance la requête AJAX via URL vers API REST
        fetch('https://geo.api.gouv.fr/departements/83/communes')
            // Méthode de promesse
            .then(function (resp) {
                return resp.json();
            })
            // Exploite les data
            .then(function (data) {
                // console.log(data);
                data.forEach(function (obj) {
                    // console.log(obj);
                    option = document.createElement('option');
                    option.value = obj.codesPostaux[0];
                    option.textContent = obj.nom;
                    select.appendChild(option);
                })
            })
            // Si erreur
            .catch(function (err) {
                console.warn(err);
            })
    }
);

/**
 * Evénément onchange de la liste des communes
 * DHTML (Dynamic HTML)
 */

document.querySelector('#region').addEventListener(
    'change',
    function (evt) {
        // Options d'affichage
        let options = {
            // center: new google.maps.LatLng(48.52, 2.19),
            mapTypeId: google.maps.MapTypeId.ROADMAP, // ou HYBRID, SATELLITE ou TERRAIN
            zoom: 15,
            scrollWheel: false
        };

        // Localisation adresse
        let map = new google.maps.Map(document.querySelector('#carte'), options);
        let geocoder = new google.maps.Geocoder();
        geocoder.geocode(
            { 'address': evt.target.value + ',France' },
            function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location); // A AJOUTER !
                    let marker = new google.maps.Marker({
                        position: results[0].geometry.location.latLng,
                        map: map
                    });
                }
            }
        );
    }
);