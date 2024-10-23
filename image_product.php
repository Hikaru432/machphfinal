<?php
include 'config.php'; // Assuming this file contains your database connection code

if (isset($_GET['id'])) {
    $productId = intval($_GET['id']);

    // Fetch the image from the database
    $query = "SELECT product_image FROM products WHERE id = '$productId'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        header("Content-type: image/jpeg"); // Adjust based on image type
        echo $row['product_image'];
    } else {
        echo "Image not found.";
    }
} else {
    echo "No product ID provided.";
}
?>
