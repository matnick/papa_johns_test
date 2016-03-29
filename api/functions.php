<?

function clear_get($var)
{
    return mysql_real_escape_string($var);
}

function getAllChildrenComments($id, $tree_level)
{
    $query = "SELECT * FROM comments WHERE parent_id = $id ORDER BY date";
    $result = mysql_query($query);

    $children = array();

    if (mysql_num_rows($result) > 0) {
        $tree_level++;
        while ($row = mysql_fetch_assoc($result)) {
            $row['level'] = $tree_level;
            $row['related_comments'] = getAllChildrenComments($row['id'], $tree_level);
            $children[] = $row;

        }
    }
    return $children;
}

function verifyRecaptcha()
{
    require('../tools/GoogleReCaptcha/autoload.php');
    $secret = "6LcN4xsTAAAAAJB1jFQfjJpbGdfTTwm4pXN1vBbZ";
    $gRecaptchaResponse = mysql_real_escape_string($_POST['recaptcha']);
    $remoteIp = $_SERVER['HTTP_X_REAL_IP'];
    $recaptcha = new \ReCaptcha\ReCaptcha($secret);
    $resp = $recaptcha->verify($gRecaptchaResponse, $remoteIp);
    if ($resp->isSuccess()) {
        $recaptcha_checked = 1;
    } else {
        $recaptcha_checked = 0;
        $errors = $resp->getErrorCodes();
    }
    return $recaptcha_checked;
    echo $recaptcha_checked;
}

function makeURLs($text)
{
    $text = preg_replace( "(www\.)", "http://www.", $text );
    $text = preg_replace( "(http://http://www\.)", "http://www.", $text );
    $text = preg_replace( "(https://http://www\.)", "https://www.", $text );
    $regExUrl = "/(http|https)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/";
    $text = preg_replace_callback($regExUrl, function($matches) {
        return '<a href="' . $matches[0] . '" target="_blank">' . $matches[0] . '</a>';
    }, $text);
    return $text;
}