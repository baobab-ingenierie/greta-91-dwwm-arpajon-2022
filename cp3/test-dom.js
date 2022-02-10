document.addEventListener(
    'DOMContentLoaded',
    function () {
        // Pourrait être un objet JSON venant d'un web service
        let friends = [
            'Fabrice',
            'Quentin',
            'Emmanuel',
            'Christine',
            'Adil',
            'Peter',
            'Gaël',
            'Arnaud',
            'Zackaria',
            'Abdoul',
            'Philippe',
            'Kamel',
            'Gore',
            'Wayafinatou',
            'Xavier'
        ];

        // Bâtir le SELECT et ses OPTIONS à partir du tableau
        let option, select = document.createElement('select');
        select.setAttribute('id', 'myFriends');
        select.setAttribute('style', 'width:100%');
        document.body.appendChild(select);
        for (let i = 0; i < friends.length; i++) {
            option = document.createElement('option');
            option.setAttribute('value', i);
            option.setAttribute('class', 'red');
            option.textContent = friends[i];
            select.appendChild(option);
        }
    }
);