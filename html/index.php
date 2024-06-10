<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="css/styles.css">
  </head>

<body>

<?php
function exception_error_handler($errno, $errstr, $errfile, $errline ) {
  throw new ErrorException($errstr, $errno, 0, $errfile, $errline);
}
set_error_handler("exception_error_handler");

try {
  $conn=pg_connect("host=basic-postgres port=5432 dbname=mydb user=postgres password=postgres");
} Catch (Exception $e) {
  Echo $e->getMessage();
  exit;
}




$result = pg_query($conn, "SELECT version()");
if (!$result) {
  echo "An error occurred.\n";
  exit;
}
?>

<h1>Version</h1>
<p>
<?php
while ($row = pg_fetch_row($result)) {
  echo "Version: $row[0]";
  echo "<br />\n";
}
?>
</p>
</body>
</html>