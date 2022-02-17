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