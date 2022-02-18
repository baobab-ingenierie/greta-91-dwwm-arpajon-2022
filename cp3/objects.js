/**
 * Objet littéral : peu recommandé même si pratique
 */

let obj1 = {};

// attributs primitifs
obj1.fname = 'Emmanuel';
obj1.age = 41;
obj1.female = false;

// attribut composé
obj1.skills = ['Statistiques', 'SQL', 'Prise de parole en public'];

// attribut objet
obj1.kids = [
    { 'fname': 'Adam', 'age': 6 },
    { 'fname': 'Eve', 'age': 11, hobbies: ['danse', 'rugby'] }
]

// méthode
obj1.sayHello = function () {
    console.log(this.fname + ' vous salue bien !');
};

obj1.sayHello();

console.log(obj1);

/**
 * Objet avec constructeur : plus académique
 * @param {string} fname prénom 
 * @param {string} dob date de naissance
 * @param {number} size taille en m
 */

class Person {
    // attribut publics
    fname = '';
    dob = '';

    // attribut privé
    #size = 0;
    #lang = ['FR'];

    // constructeur
    constructor(newFname, newDob) {
        this.fname = newFname;
        this.dob = newDob;
    }

    // accesseurs ou getters : 
    // récupère la valeur d'un attribut privé (encapsulation)
    getSize = function () {
        return this.#size;
    };

    getLang = function () {
        return this.#lang;
    };

    getAge = function () {
        return Math.floor((Date.now() - new Date(this.dob)) / 1000 / 3600 / 24 / 365.25);
    };

    /**
     * mutateurs ou setters :
     * change la valeur d'un attribut privé (encapsulation)
     * @param {number} newSize taille en mètres
     * @return {void}
     */

    setSize = function (newSize) {
        // teste si nombre
        if (isNaN(newSize)) {
            throw 'Vous devez indiquer un nombre.';
        }

        // teste si taille est comprise entre 50cm et 2m72
        if (newSize < .5 || newSize > 2.72) {
            throw 'La taille doit être comprise entre 50cm et 2m72';
        }

        this.#size = newSize;
    };

    /**
     * Langues parlées par la personne
     * @param {string} newLang nouvelle langue parlée
     * @return {void}
     */

    setLang = function (newLang) {
        // teste si le code ISO 639 (langues) est correctement formatté
        // ^[A-Za-z]{2}$
        if (!newLang.match(/^[A-Za-z]{2}$/)) {
            throw 'Le code doit correspondre exactement à deux caractères alpha.'
        }

        this.#lang.push(newLang.toUpperCase());
    };

    // Méthode publique

    /**
     * Faire dire "Salut" à la personne
     * @param {boolean} all (true) pour toutes les langues (false) pour la 1ère
     * @return {void} salutations dans une ou plusieurs langues
     */

    sayHello = function (all = false) {
        let end = all ? this.#lang.length : 1;
        for (let i = 0; i < end; i++) {
            console.info(this.#getHello(this.#lang[i]));
        }
    };

    #getHello = function (curr) {
        // Renvoie "Salut" dans la langue parlée par la personne
        switch (curr) {
            case 'FR':
                return 'Salut !';
            case 'EN':
                return 'Hello !';
            case 'ES':
                return 'Holà !';
            case 'DE':
                return 'Halo !';
            case 'IT':
                return 'Ciao !';
            case 'AR':
                return 'Salam !';
            default:
                return 'Wesh ma gueule !';
        }
    };
}

let obj2 = new Person('Quentin', '1995-11-02');
console.info(obj2.getAge());

obj2.setSize(1.65);
console.info(obj2.getSize());

obj2.setLang('EN');
obj2.setLang('JP');
console.info(obj2.getLang());

obj2.sayHello();
obj2.sayHello(true);

console.log(obj2);