<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$database = "grading_system";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (!isset($_SESSION["username"])) {
    header("Location: login.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
    $inst_id = $_GET['id'];

    // Use a prepared statement to avoid SQL injection
    $sql = "DELETE FROM instructor WHERE INST_ID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $inst_id);

    // Display a confirmation prompt using JavaScript
    echo '<script>
            var confirmation = confirm("Are you sure you want to delete this?");
            if (confirmation) {
                window.location.href = "delete.php?id=' . $inst_id . '";
            } else {
                window.location.href = "index.php";
            }
          </script>';
}

$conn->close();
?>
