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

    <div id="databases">
        <?php
        // Imports
        include_once 'constants.inc.php';

        // Gestion erreurs
        try {
            // Connexion
            $cnn = new PDO(
                sprintf('mysql:host=%s;dbname=%s;charset=utf8', HOST, DB),
                USER,
                PASS,
                array(
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                )
            );

            // Préparation et exécution de la requête SQL
            $sql = 'SELECT schema_name
                        FROM information_schema.schemata
                        WHERE schema_name NOT LIKE ?
                        AND schema_name NOT IN (?,?,?)
                        ORDER BY schema_name';
            $params = array(
                '%schema',
                'mysql',
                'phpmyadmin',
                'sys'
            );
            $res = $cnn->prepare($sql);
            $res->execute($params);
            // var_dump($res->fetchAll());

            // Parcours du résultat et gébération du SELECT
            $html = '<select name="" id="bdd" class="form-control">
            <option value="">--- Choisir une BDD ---</option>';
            foreach ($res->fetchAll() as $val) {
                $html .= '<option value="' . $val['SCHEMA_NAME'] . '">' . strtoupper($val['SCHEMA_NAME']) . '</option>';
            }
            $html .= '</select>';
            echo $html;
        } catch (PDOException $err) {
            echo '<p class="alert alert-danger">' . $err->getMessage() . '</p>';
        }
        ?>
    </div>

    <section id="tables" class="d-flex flex-wrap justify-content-around">
    </section>

    <script src="bo.js"></script>
</body>

</html>