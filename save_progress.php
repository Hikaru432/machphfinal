<?php
session_start();
include 'config.php';

if (isset($_POST['user_id']) && isset($_POST['car_id']) && isset($_POST['progress']) && isset($_POST['progressing']) && isset($_POST['mechanic_id']) && isset($_POST['progressingpercentage']) && isset($_POST['nameprogress'])) {
    $userId = $_POST['user_id'];
    $carId = $_POST['car_id'];
    $progress = $_POST['progress'];
    $progressing = $_POST['progressing']; 
    $mechanicId = $_POST['mechanic_id'];
    $progressingPercentage = $_POST['progressingpercentage'];
    $nameProgress = $_POST['nameprogress']; // Get the name of the progress category

    // Check if the record with the same user_id, car_id, mechanic_id, and nameprogress exists
    $checkQuery = "SELECT progressing FROM accomplishtask WHERE user_id = ? AND car_id = ? AND mechanic_id = ? AND nameprogress = ?";
    $stmt = mysqli_prepare($conn, $checkQuery);
    mysqli_stmt_bind_param($stmt, 'iiis', $userId, $carId, $mechanicId, $nameProgress);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_store_result($stmt);

    if (mysqli_stmt_num_rows($stmt) > 0) {
        // Fetch existing progressing value
        mysqli_stmt_bind_result($stmt, $existingProgressing);
        mysqli_stmt_fetch($stmt);

        // Append the new progressing value if it doesn't already exist
        if (strpos($existingProgressing, $progressing) === false) { // Check if progressing value doesn't already exist
            $newProgressing = $existingProgressing . ', ' . $progressing; // Append new progressing with a comma

            // Update the row: Set the progressing column to the appended value, and update progressingpercentage to the new value
            $updateQuery = "UPDATE accomplishtask SET progress_percentage = ?, progressing = ?, progressingpercentage = ? WHERE user_id = ? AND car_id = ? AND mechanic_id = ? AND nameprogress = ?";
            $updateStmt = mysqli_prepare($conn, $updateQuery);
            mysqli_stmt_bind_param($updateStmt, 'issiiis', $progress, $newProgressing, $progressingPercentage, $userId, $carId, $mechanicId, $nameProgress);
            mysqli_stmt_execute($updateStmt);

            echo "Progress updated successfully for category: " . htmlspecialchars($nameProgress);
            mysqli_stmt_close($updateStmt);
        } else {
            echo "This progress for " . htmlspecialchars($progressing) . " already exists in category: " . htmlspecialchars($nameProgress);
        }
    } else {
        // Insert a new record if none exists
        $insertQuery = "INSERT INTO accomplishtask (user_id, car_id, progress_percentage, progressing, mechanic_id, progressingpercentage, nameprogress) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $insertStmt = mysqli_prepare($conn, $insertQuery);
        mysqli_stmt_bind_param($insertStmt, 'iiissis', $userId, $carId, $progress, $progressing, $mechanicId, $progressingPercentage, $nameProgress);
        mysqli_stmt_execute($insertStmt);

        if (mysqli_stmt_affected_rows($insertStmt) > 0) {
            echo "Progress saved successfully for category: " . htmlspecialchars($nameProgress);
        } else {
            echo "Error saving progress for category: " . htmlspecialchars($nameProgress);
        }

        mysqli_stmt_close($insertStmt);
    }

    mysqli_stmt_close($stmt);
} else {
    echo "Incomplete data received.";
}
?>
