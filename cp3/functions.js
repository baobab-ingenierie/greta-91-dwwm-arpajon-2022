/**
 * Fonction qui renvoie le niveau d'expérience par rapport
 * au nombre d'années passé en paramètre
 * @param {number} nb nombre d'années d'expérience (1 à 49)
 * @return {string} expérience littérale
 */

function expertise(nb) {
    if (!isNaN(nb) && nb >= 1 && nb <= 49) {
        switch (true) {
            case nb < 10:
                return 'Padawan';
            case nb < 20:
                return 'Débutant';
            case nb < 30:
                return 'Confirmé';
            case nb < 40:
                return 'Expert';
            default:
                return 'Jedi';
        }
    } else {
        throw 'L\'argument doit être un nombre compris entre 1 et 49.';
    }
}

/**
 * Fonction qui retourne l'âge en années à partir de deux
 * dates passées en paramètres
 * @param {string} date1 une date
 * @param {string} date2 une autre date
 * @return {number} âge en années
 */

function age(date1, date2) {
    // Deux variables
    let d1 = new Date(date1), d2 = new Date(date2), datediff;

    // Différence entre les deux dates en ms
    if (d1 > d2) {
        datediff = d1 - d2;
    } else if (d2 > d1) {
        datediff = d2 - d1;
    } else {
        datediff = 0
    }

    // Conversion en années
    datediff = datediff / 1000 / 60 / 60 / 24 / 365.25;
    return Math.floor(datediff);
}

let age2 = function (date1, date2) {
    let d1 = new Date(date1), d2 = new Date(date2);
    return Math.floor((d1 >= d2 ? d1 - d2 : d2 - d1) / 1000 / 60 / 60 / 24 / 365.25);
}

/**
 * Fonction qui renvoie la somme des valeurs passées en paramètres.
 * Seules les valeurs numériques seront additionnées.
 * @return {number} résultat de la somme
 */

function sum() {
    // Teste s'il y a au moins 2 arguments
    let result = 0;
    if (arguments.length > 1) {
        for (let i = 0; i < arguments.length; i++) {
            if (!isNaN(arguments[i])) {
                result += parseFloat(arguments[i]); // Number(arguments[i]) !!!
            } else {
                console.warn(arguments[i] + ' n\est pas un nombre !');
            }
        }
        return result;
    } else {
        throw 'Il faut au moins deux arguments.';
    }
}

/**
 * Fonction qui renvoie la moyenne des valeurs passées en paramètres.
 * Seules les valeurs numériques seront prises en compte.
 * @param {number} ...vals valeurs numériques
 * @return {number} résultat de la moyenne
 */

function average(...vals) {
    let result = 0;
    for (let i = 0; i < vals.length; i++) {
        result += Number(vals[i]) / vals.length;
    }
    return result;
}






