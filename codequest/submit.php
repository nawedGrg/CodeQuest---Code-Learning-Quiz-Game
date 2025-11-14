<?php
session_start();
include 'db.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized']);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = $_SESSION['user_id'];
    $score = intval($_POST['score'] ?? 0);
    $topic = $_POST['topic'] ?? '';
    
    if ($score >= 0 && $score <= 100 && !empty($topic)) {
        // Insert score into scores table
        $stmt = $conn->prepare("INSERT INTO scores (user_id, topic, score, date) VALUES (?, ?, ?, NOW())");
        $stmt->bind_param("isi", $user_id, $topic, $score);
        
        if ($stmt->execute()) {
            // Update user's total score
            $updateStmt = $conn->prepare("UPDATE users SET total_score = total_score + ? WHERE id = ?");
            $updateStmt->bind_param("ii", $score, $user_id);
            $updateStmt->execute();
            
            echo json_encode(['success' => true, 'message' => 'Score saved successfully']);
        } else {
            echo json_encode(['success' => false, 'message' => 'Error saving score']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Invalid score or topic']);
    }
} else {
    http_response_code(405);
    echo json_encode(['error' => 'Method not allowed']);
}
?>

