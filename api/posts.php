<?
require_once('config_db.php');
require_once('functions.php');

if (isset($_GET['type']) && $_GET['type'] == 'read_one' && (isset ($_GET['id']))) {

        $uid = 2;

        $id = clear_get($_GET['id']) * 1;

        $db_query = 'SELECT * FROM posts WHERE id =' . $id;

        $result = mysql_query($db_query);

        while ($row = mysql_fetch_assoc($result)) {

                $encode[] = $row;
        }

        echo(json_encode($encode));
}