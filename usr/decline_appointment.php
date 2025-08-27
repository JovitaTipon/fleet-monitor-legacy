<?php
session_start();
include('vendor/inc/config.php');
include('vendor/inc/checklogin.php');
check_login();
$driver_id = isset($_SESSION['u_id']) ? (int) $_SESSION['u_id'] : 0;
$booking_id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
if ($driver_id && $booking_id) {
    // Only allow driver assigned to this booking to accept
    "UPDATE tms_bookings
        SET status = 'declined', driver_id = NULL
        WHERE booking_id = ? AND driver_id = ? AND status = 'pending'";
    if ($stmt = $mysqli->prepare($sql)) {
        $stmt->bind_param('ii', $booking_id, $driver_id);
        $stmt->execute();
        if ($stmt->affected_rows > 0) {
            $_SESSION['success'] = "Booking accepted.";
        } else {
            $_SESSION['error'] = "Could not accept booking. Maybe it's already handled or you are not the assigned driver.";
        }
        $stmt->close();
    }
}
header('Location: user-dashboard.php');
exit();
