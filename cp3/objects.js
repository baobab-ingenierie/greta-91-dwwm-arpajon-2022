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

    constructor(newFname, newDob, newSize = 1.69) {
        this.fname = newFname;
        this.dob = newDob;
        this.#size=newSize; // A modifier avec mutateur
    }
}

let obj2 = new Person('Quentin', '1995-11-02');
console.log(obj2);
// obj2.fname = 'Tarentino';
// console.log(obj2);
