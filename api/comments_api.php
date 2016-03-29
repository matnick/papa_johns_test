<?php

require_once('config_db.php');
require_once('functions.php');

if (isset($_POST['type'])) {

    $db_query = '';
    $result = '';

// Updating comments
    if (($_POST['type'] == 'update' && (isset ($_POST['id'])))) {
        $id = clear_get($_POST['id']) * 1;
        $fields_count = 0;
        $string = '';
        if (isset($_POST['comment'])) {
            $string =  "comment = '" . clear_get($_POST['comment'])."'";
            $fields_count++;
        };
        if ($fields_count != 0) {
            $db_query = 'UPDATE blog_comments SET ' . $string . ' WHERE id =' . $id;
            $result = mysql_query($db_query);
        } else {
            echo("No data to update!");
        };
    } //Creating new comment
    else if (($_POST['type'] == 'create') && (isset($_POST['post_id']))) {
        $post_id = 0;
        $fields_count = 0;
        $comment = '';

        if (isset($_POST['comment'])) {
            $comment = clear_get($_POST['comment']);
            $fields_count++;
        };

        if (isset($_POST['post_id'])) {
            $post_id = clear_get($_POST['post_id']);
            $fields_count++;
        };

        if ($fields_count != 0) {
            $db_query = "INSERT INTO admin_liquimoly.blog_comments (comment, user, post_id ) VALUES ('".$comment ."', '".$uid."', '".$post_id."');";
            $result = mysql_query($db_query);
            echo $db_query;
            echo $result;
        } else {
            echo("Please fill all the fields!");
        };
    }
    echo($db_query);
    echo('<br> result: ' . $result);
}
// END OF POST
else if (isset($_GET['type']) ){
    $db_query = '';
    $result = '';

    if ($_GET['type'] == 'read_one' && (isset ($_GET['id']))){
        $id = clear_get($_GET['id']) * 1;
        $db_query = 'SELECT * FROM blog_comments WHERE id ='.$id;
        $result = mysql_query($db_query);
    }

    if ($_GET['type'] == 'read_list' && (isset ($_GET['post_id']))){
        $post_id = clear_get($_GET['post_id']);
        $db_query = "SELECT admin_liquimoly.blog_comments.*, admin_mh.users.name, admin_mh.users.ava FROM admin_liquimoly.blog_comments RIGHT OUTER JOIN admin_mh.users ON admin_mh.users.id = admin_liquimoly.blog_comments.user  WHERE post_id = $post_id ORDER BY date";
        $result = mysql_query($db_query);
    }

    else if ($_GET['type'] == 'delete' && (isset ($_GET['id']))){
        $id = clear_get($_GET['id']) * 1;
        $db_query = 'DELETE FROM blog_comments WHERE id ='.$id;
        $result = mysql_query($db_query);
    }

    echo_json_data($result, $uid);
}
else { echo ("What do you want, stranger?"); exit();}