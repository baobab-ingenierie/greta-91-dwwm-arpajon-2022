<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Back-Office</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>

<body class="container">

    <div class="jumbotron">
        <h1 class="display-4">Back-Office</h1>
        <p class="lead">Cette page permet d'accéder aux fonctionnalités de la base de données en cours : créer, lister, mettre à jour et supprimer les data (CRUD).</p>
        <hr class="my-4">
        <a class="btn btn-primary btn-lg" href="../cp2/index.html" role="button">Accueil</a>
    </div>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../cp2/index.html">Accueil</a></li>
            <li class="breadcrumb-item active" aria-current="page">Back-office</li>
        </ol>
    </nav>

    <div id="bddChoice">
        <select name="" id="bdd" class="form-control">
            <option value="">--- Choisir une BDD ---</option>
            <option value="arpajon" selected>ARPAJON</option>
        </select>
    </div>

    <section id="tables" class="d-flex flex-wrap justify-content-around">
        <?php
        // Imports
        include_once 'constants.inc.php';

        // Gestion des erreurs
        try {
            // Connexion à la BDD
            $dsn = 'mysql:host=%s;dbname=%s;charset=utf8';
            $cnn = new PDO(
                sprintf($dsn, HOST, DB),
                USER,
                PASS
            );

            // Ajustement des attributs de la connexion
            $cnn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $cnn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
            // var_dump($cnn);

            // Préparation et excécution de la requête
            $sql = 'SELECT table_schema, table_name, table_rows, create_time, engine
                    FROM information_schema.tables
                    WHERE table_schema = ?';
            $params = array('arpajon');
            $res = $cnn->prepare($sql);
            $res->execute($params);
            // var_dump($res);

            // Lecture de chaque ligne renvoyée par la requête : FECTH
            $card = '<div class="card m-3" style="width: 18rem;">
                            <img src="bo.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">%s</h5>
                                <p class="card-text">Cette table a été créée le %s avec comme moteur %s et contient approximativement %d ligne(s).</p>
                                <a href="list.php?table=%s" class="btn btn-info">Afficher les données</a>
                            </div>
                            </div>';
            while ($row = $res->fetch()) {
                // var_dump($row);
                echo sprintf($card, $row['TABLE_NAME'], $row['CREATE_TIME'], $row['ENGINE'], $row['TABLE_ROWS'], $row['TABLE_NAME']);
            }

            // Déconnexion
            unset($cnn);
        } catch (PDOException $err) {
            echo '<p class="alert alert-danger">' . $err->getMessage() . '</p>';
        }



        ?>
    </section>
</body>

</html>