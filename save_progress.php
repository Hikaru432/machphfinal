<?php
session_start();
include 'config.php';

if (isset($_POST['user_id']) && isset($_POST['car_id']) && isset($_POST['progress']) && isset($_POST['progressing']) && isset($_POST['mechanic_id']) && isset($_POST['progressingpercentage'])) {
    $userId = $_POST['user_id'];
    $carId = $_POST['car_id'];
    $progress = $_POST['progress'];
    $progressing = $_POST['progressing']; 
    $mechanicId = $_POST['mechanic_id'];
    $progressingPercentage = $_POST['progressingpercentage']; // Get the progressing percentage

    // Insert progress for each checkbox checked
    $insertQuery = "INSERT INTO accomplishtask (user_id, car_id, progress_percentage, progressing, mechanic_id, progressingpercentage) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $insertQuery);
    mysqli_stmt_bind_param($stmt, 'iiissi', $userId, $carId, $progress, $progressing, $mechanicId, $progressingPercentage);
    mysqli_stmt_execute($stmt);

    if (mysqli_stmt_affected_rows($stmt) > 0) {
        echo "Progress saved successfully for: " . htmlspecialchars($progressing);
    } else {
        echo "Error saving progress for: " . htmlspecialchars($progressing);
    }

    mysqli_stmt_close($stmt);
} else {
    echo "Incomplete data received.";
}
?>
