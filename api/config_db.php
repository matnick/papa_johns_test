<?

$host="localhost";
$db_name = "it77";
$user ="USER";
$pass="PASSWORD";
$lnk = mysql_connect($host, $user, $pass) or die("cant connect to db");
$db = mysql_select_db($db_name, $lnk) or die("cant select db");
mysql_query("set names utf8");
mysql_query("SET lc_time_names = 'ru_RU'");