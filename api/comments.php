<?php

require_once('config_db.php');
require_once('functions.php');

if (isset($_POST['type'])) {

    $post_id = 0;
    $fields_count = 0;

    if (isset($_POST['parent_id'])) {
        $parent_id = clear_get($_POST['parent_id']);
        $fields_count++;
    } else {
        $parent_id = 0;
    }

    if (isset($_POST['post_id'])) {
        $post_id = clear_get($_POST['post_id']);
        $fields_count++;
    };

    if (isset($_POST['user_name'])) {
        $user_name = clear_get($_POST['user_name']);
        $fields_count++;
    };

    if (isset($_POST['user_email'])) {
        $user_email = clear_get($_POST['user_email']);
        $fields_count++;
    };

    if (isset($_POST['level'])) {
        $level = clear_get($_POST['level']);
        $fields_count++;
    } else {
        $level = 0;
    }

    if (isset($_POST['comment'])) {
        $content = makeURLs(clear_get($_POST['comment']));
        $fields_count++;
    };

    if (verifyRecaptcha ()) {
        $db_query = "INSERT INTO comments (parent_id, post_id, user_name, user_email, content) VALUES ('" . $parent_id . "', '" . $post_id . "', '" . $user_name . "', '" . $user_email . "', '" . $content . "');";
        $result = mysql_query($db_query);
        echo $db_query;
        echo $result;
    } else {
        header("HTTP/1.1 401 Unauthorized");
        exit;
    };

} // END OF POST
    else if (isset($_GET['type'])) {
    $db_query = '';
    $result = '';

    if ($_GET['type'] == 'read_list' && (isset ($_GET['post_id']))) {
        $post_id = clear_get($_GET['post_id']);
        $db_query = "SELECT * FROM comments WHERE post_id = $post_id AND parent_id = 0 ORDER BY date";
        $result = mysql_query($db_query);

        while ($row = mysql_fetch_assoc($result)) {
            $row['related_comments'] = getAllChildrenComments($row['id'], 0);
            $row['level'] = 0;
            $encode[] = $row;
        }

        echo(json_encode($encode));
    }

} else {
    echo("What do you want, stranger?");
    exit();
}