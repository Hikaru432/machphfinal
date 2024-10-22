<?php
include 'config.php';

$message = []; // Initialize the message array

if (isset($_POST['submit'])) {
    // User input validation and sanitization
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $firstname = mysqli_real_escape_string($conn, $_POST['firstname']);
    $middlename = mysqli_real_escape_string($conn, $_POST['middlename']);
    $lastname = mysqli_real_escape_string($conn, $_POST['lastname']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $homeaddress = mysqli_real_escape_string($conn, $_POST['homeaddress']);
    $barangay = mysqli_real_escape_string($conn, $_POST['barangay']);
    $province = mysqli_real_escape_string($conn, $_POST['province']);
    $municipality = mysqli_real_escape_string($conn, $_POST['municipality']);
    $zipcode = mysqli_real_escape_string($conn, $_POST['zipcode']);
    $pass = mysqli_real_escape_string($conn, md5($_POST['password']));
    $cpass = mysqli_real_escape_string($conn, md5($_POST['cpassword']));
    $image = $_FILES['image']['name'];
    $image_size = $_FILES['image']['size'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = __DIR__ . '/uploaded_img/' . $image; // Use absolute path with __DIR__
    $role = 'user'; // Default role

    // Check if the user already exists
    $select = mysqli_query($conn, "SELECT * FROM user WHERE email = '$email'") or die('query failed');

    if (mysqli_num_rows($select) > 0) {
        $message[] = 'User already exists';
    } else {
        // Additional validation checks
        if ($pass != $cpass) {
            $message[] = 'Confirm password not matched!';
        } elseif ($image_size > 2000000) {
            $message[] = 'Image size is too large!';
        } elseif (!is_writable(__DIR__ . '/uploaded_img/')) {
            $message[] = 'Upload directory is not writable. Please check folder permissions.';
        } else {
            // Insert user details into the database
            $insert = mysqli_query($conn, "INSERT INTO user (name, email, password, image, firstname, middlename, lastname, homeaddress, barangay, province, municipality, zipcode, role)
            VALUES ('$name', '$email', '$pass', '$image', '$firstname', '$middlename', '$lastname', '$homeaddress', '$barangay', '$province', '$municipality', '$zipcode', '$role')") or die('query failed');         
            
            if ($insert) {
                // Attempt to move the uploaded file
                if (move_uploaded_file($image_tmp_name, $image_folder)) {
                    $message[] = 'Registered successfully and image uploaded!';
                    header('location:index.php');
                } else {
                    $message[] = 'Failed to upload the image. Please check permissions and folder path.';
                }
            } else {
                $message[] = 'Registration failed!';
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>register</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">
</head>
<body>
   
<div class="form-container">
   <form action="" method="post" enctype="multipart/form-data">
      <h3>register now</h3>
      <?php
      if(isset($message)){
         foreach($message as $message){
            echo '<div class="message">'.$message.'</div>';
         }
      }
      ?>
      <div class="form-column form-column-1" style="margin-top:56px;">
            <input type="text" name="homeaddress" placeholder="Enter home address" class="box" required>
            <input type="text" name="barangay" placeholder="Enter barangay" class="box" required>
            <input type="text" name="municipality" placeholder="Enter city" class="box" required>
            <input type="text" name="province" placeholder="Enter province" class="box" required>
            <input type="text" name="zipcode" placeholder="Enter zip code" class="box" required>
            <input type="file" name="image" class="box" accept="image/jpg, image/jpeg, image/png">

         <br>
         </div>
         
         <div class="form-column form-column-2">
            <input type="text" name="name" placeholder="Enter username" class="box" required>
            <input type="email" name="email" placeholder="Enter email" class="box" required>
            <input type="password" name="password" placeholder="Enter password" class="box" required>
            <input type="password" name="cpassword" placeholder="Confirm password" class="box" required>
            <input type="text" name="firstname" placeholder="Enter first name" class="box" required>
            <input type="text" name="middlename" placeholder="Enter middle name" class="box" required>
            <input type="text" name="lastname" placeholder="Enter last name" class="box" required>
            <input type="submit" name="submit" value="register now" class="btn">
            <p>already have an account? <a href="index.php">login now</a></p>
       </div>
   </form>
</div>

</body>
</html>
