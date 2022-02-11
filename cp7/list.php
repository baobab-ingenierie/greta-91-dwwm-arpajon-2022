<?php
if (isset($_GET['db']) && !empty($_GET['db'])) {
    $db = htmlspecialchars($_GET['db']);
} else {
    $db = '';
}

if (isset($_GET['table']) && !empty($_GET['table'])) {
    $table = htmlspecialchars($_GET['table']);
} else {
    $table = 'Table';
}
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo strtoupper($table); ?></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>

<body class="container">

    <h1><?php echo strtoupper($table); ?></h1>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="../cp2/index.html">Accueil</a></li>
            <li class="breadcrumb-item"><a href="bo.php">Back-office</a></li>
            <li class="breadcrumb-item active" aria-current="page"><?php echo ucfirst($table); ?></li>
        </ol>
    </nav>

    <div id="dataTable">
        <?php
        // Imports
        include_once 'constants.inc.php';

        // Gestion des erreurs
        try {
            // Connexion
            $dsn = 'mysql:host=%s;dbname=%s;charset=utf8';
            $cnn = new PDO(
                sprintf($dsn, HOST, DB),
                USER,
                PASS,
                array(
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                )
            );

            // Préparation et exécution de la requête
            $sql = "SELECT * FROM $db.$table";
            $res = $cnn->prepare($sql);
            $res->execute();

            // Lecture du résultat et création du tableau HTML
            $html = '<table class="table table-striped table-hover table-dark">';


            // Affichage des en-têtes
            $html .= '<thead><tr>';
            for ($i = 0; $i < $res->columnCount(); $i++) {
                $meta = $res->getColumnMeta($i);
                $html .= '<th>' . strtoupper($meta['name']) . '</th>';
            }
            $html .= '</tr></thead>';

            // Affichage des données
            $html .= '<tbody>';
            while ($row = $res->fetch()) {
                $html .= '<tr>';
                foreach ($row as $val) {
                    // $html .= '<td>' . $val . '</td>';
                    $html .= "<td>$val</td>";
                }
                $html .= '</tr>';
            }
            $html .= '</tbody>';
            $html .= '</table>';
            echo $html;

            // Déconnexion
            unset($cnn);
        } catch (PDOException $err) {
            echo '<p class="alert alert-danger">' . $err->getMessage() . '</p>';
        }
        ?>
    </div>
</body>

</html>