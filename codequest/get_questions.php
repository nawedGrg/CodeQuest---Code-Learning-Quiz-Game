<?php
session_start();
include 'db.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Unauthorized']);
    exit();
}

// Get topic from request
$topic = isset($_GET['topic']) ? strtoupper($_GET['topic']) : 'HTML';
$valid_topics = ['HTML', 'CSS', 'JS', 'PHP', 'SQL'];

if (!in_array($topic, $valid_topics)) {
    $topic = 'HTML';
}

// Fetch 10 random questions for the topic
$stmt = $conn->prepare("SELECT id, level, question, option_a, option_b, option_c, option_d, correct_answer, explanation FROM questions WHERE topic = ? ORDER BY RAND() LIMIT 10");
$stmt->bind_param("s", $topic);
$stmt->execute();
$result = $stmt->get_result();

$questions = [];
while ($row = $result->fetch_assoc()) {
    $questions[] = [
        'id' => $row['id'],
        'level' => $row['level'],
        'question' => $row['question'],
        'option_a' => $row['option_a'],
        'option_b' => $row['option_b'],
        'option_c' => $row['option_c'],
        'option_d' => $row['option_d'],
        'correct_answer' => $row['correct_answer'],
        'explanation' => $row['explanation']
    ];
}

header('Content-Type: application/json');
echo json_encode($questions);
?>

