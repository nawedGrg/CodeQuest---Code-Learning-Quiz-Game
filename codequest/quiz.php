<?php
session_start();
include 'db.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit();
}

// Get topic from URL
$topic = isset($_GET['topic']) ? strtoupper($_GET['topic']) : 'HTML';
$valid_topics = ['HTML', 'CSS', 'JS', 'PHP', 'SQL'];

if (!in_array($topic, $valid_topics)) {
    $topic = 'HTML';
}

$_SESSION['current_topic'] = $topic;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz - <?php echo $topic; ?> | CodeQuest</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body class="light-theme">
    <div class="container">
        <header class="quiz-header">
            <a href="index.php" class="back-btn">← Back</a>
            <h1><?php echo $topic; ?> Quiz</h1>
            <button id="theme-toggle" class="theme-toggle" aria-label="Toggle theme">🌙</button>
            <div class="quiz-info">
                <span id="question-counter">Question 1 of 10</span>
                <span id="score-display">Score: 0</span>
            </div>
        </header>

        <div class="quiz-container">
            <div class="progress-bar">
                <div id="progress" class="progress-fill"></div>
            </div>

            <div id="quiz-content" class="quiz-content">
                <div id="loading" class="loading">Loading questions...</div>
                <div id="question-container" style="display: none;">
                    <h2 id="question-text" class="question-text"></h2>
                    <div id="options-container" class="options-container"></div>
                    <button id="next-btn" class="btn btn-primary" style="display: none;">Next Question</button>
                </div>
            </div>

            <div id="quiz-complete" class="quiz-complete" style="display: none;">
                <h2>🎉 Quiz Complete!</h2>
                <p class="final-score">Your Score: <span id="final-score">0</span>/100</p>
                <div id="explanations" class="explanations"></div>
                <button id="retry-btn" class="btn btn-primary">Try Again</button>
                <a href="index.php" class="btn btn-secondary">Back to Home</a>
            </div>
        </div>
    </div>

    <div id="feedback-modal" class="modal" style="display: none;">
        <div class="modal-content">
            <span id="feedback-icon" class="feedback-icon"></span>
            <p id="feedback-message" class="feedback-message"></p>
            <button id="close-feedback" class="btn btn-primary">Continue</button>
        </div>
    </div>

    <script>
        const topic = '<?php echo $topic; ?>';
        const userId = <?php echo $_SESSION['user_id']; ?>;
    </script>
    <script src="script.js"></script>
    <script src="quiz.js"></script>
</body>
</html>

