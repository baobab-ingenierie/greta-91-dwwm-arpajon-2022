/**
 * Branche un écouteur d'événement sur la liste des BDD pour déclencher une requête AJAX et afficher les tables sous forme de cards
 */

document.getElementById('bdd').addEventListener(
    'change',
    function () {
        let xhr = new XMLHttpRequest();
        xhr.open('get', 'bo_ajax.php?db=' + this.value);
        xhr.addEventListener(
            'readystatechange',
            function () {
                if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 0)) {
                    document.getElementById('tables').innerHTML = '';
                    // document.getElementById('tables').textContent = xhr.responseText;
                    let data = JSON.parse(xhr.responseText);
                    let div, img, div2, h5, p, a;
                    for (let i = 0; i < data.length; i++) {
                        // Création DIV
                        div = document.createElement('div');
                        div.setAttribute('class', 'card m-3');
                        div.setAttribute('style', 'width:20rem;');
                        document.getElementById('tables').appendChild(div);
                        // Création IMG
                        img = document.createElement('img');
                        img.src = 'bo.jpg';
                        div.appendChild(img);
                        // Création DIV2
                        div2 = document.createElement('div');
                        div2.className = 'card-body';
                        div.appendChild(div2);
                        // Création H5
                        h5 = document.createElement('h5');
                        h5.className = 'card-title';
                        h5.textContent = data[i].TABLE_NAME;
                        div2.appendChild(h5);
                        // Création P
                        p = document.createElement('p');
                        p.className = 'card-text';
                        p.textContent = 'Table créée le ' + data[i].CREATE_TIME + ' sur un moteur ' + data[i].ENGINE + ' et contenant ' + data[i].TABLE_ROWS + ' ligne(s)';
                        div2.appendChild(p);
                        // Création A
                        a = document.createElement('a');
                        a.href = 'list.php?db=' + data[i].TABLE_SCHEMA + '&table=' + data[i].TABLE_NAME;
                        a.className = 'btn btn-info';
                        a.textContent = 'Voir les données';
                        div2.appendChild(a);
                    }
                }
            }
        );
        xhr.send();
    }
);