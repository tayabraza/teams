<?php 
header("Content-type: application/json");
$servername = "localhost";
$username = "teams";
$password = "teams";
$dbname = "teams";
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$total_members = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(id) AS total FROM people"));
$total = $total_members['total'];

?>
