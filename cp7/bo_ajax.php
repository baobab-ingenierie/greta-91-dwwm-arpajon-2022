<?php

/**
 * Comme une API REST, ce script prend en charge l'appel de bo.php sous forme de requête AJAX via le paramaètre db qui correspond au nom de la BDD dont il faut renvoyer les tables
 */

if (isset($_GET['db']) && !empty($_GET['db'])) {
    try {
        include_once 'constants.inc.php';

        $cnn = new PDO(
            sprintf('mysql:host=%s;dbname=%s;charset=utf8', HOST, DB),
            USER,
            PASS,
            array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
            )
        );

        $sql = 'SELECT table_schema, table_name, table_rows, create_time, engine
        FROM information_schema.tables
        WHERE table_schema = ?';

        $res = $cnn->prepare($sql);
        $res->execute(array($_GET['db']));
        echo json_encode($res->fetchAll());
    } catch (PDOException $err) {
        echo $err->getMessage();
    }
} else {
    echo 'Aucune BDD trouvée.';
}
