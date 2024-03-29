<?php
session_start();

// Replace the following with your actual database credentials
$servername = "localhost";
$username = "root";
$password = "";
$database = "grading_system";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (!isset($_SESSION["username"])) {
    header("Location: login.php");
    exit();
}

// Initialize variables
$id = $first_name = $last_name = $dob = $email = $address = "";

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "SELECT * FROM tblstudent WHERE S_ID = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        $id = $row['S_ID'];
        $first_name = $row['FNAME'];
        $last_name = $row['LNAME'];
        $dob = $row['BIRTHDATE'];
        $email = $row['EMAIL'];
        $address = $row['ADDRESS'];

    } else {
        echo "Student not found.";
        exit();
    }

    $stmt->close();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $dob = $_POST['dob'];
    $email = $_POST['email'];
    $address = $_POST['address'];

    $sql = "UPDATE tblstudent SET FNAME=?, LNAME=?, BIRTHDATE=?, EMAIL=?, ADDRESS=? WHERE S_ID=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssssi", $first_name, $last_name, $dob, $email, $address, $id);
    $stmt->execute();
    $stmt->close();

    header("Location: student/index.php");
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card mt-5">
                    <div class="card-header">
                        <h2 class="text-center">Edit Student</h2>
                    </div>
                    <div class="card-body">
                        <form method="post" action="update.php">
                            <input type="hidden" name="id" value="<?php echo $id; ?>">
                            <div class="form-group">
                                <label for="first_name">First Name:</label>
                                <input type="text" class="form-control" name="first_name" value="<?php echo $first_name; ?>" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <label for="last_name">Last Name:</label>
                                <input type="text" class="form-control" name="last_name" value="<?php echo $last_name; ?>" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <label for="dob">Birthdate:</label>
                                <input type="text" class="form-control" name="dob" value="<?php echo $dob; ?>" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="text" class="form-control" name="email" value="<?php echo $email; ?>" required>
                            </div>
                            <br>
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <input type="text" class="form-control" name="address" value="<?php echo $address; ?>" required>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary btn-block">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

<?php
$conn->close();
?>
