<?php
session_start();
include 'db.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit();
}

$userId = $_SESSION['user_id'];
$username = $_SESSION['username'];

// Get user's total score
$userQuery = "SELECT total_score FROM users WHERE id = ?";
$stmt = $conn->prepare($userQuery);
$stmt->bind_param("i", $userId);
$stmt->execute();
$userResult = $stmt->get_result();
$user = $userResult->fetch_assoc();

// Get user's quiz history
$historyQuery = "SELECT topic, score, date FROM scores WHERE user_id = ? ORDER BY date DESC LIMIT 10";
$stmt = $conn->prepare($historyQuery);
$stmt->bind_param("i", $userId);
$stmt->execute();
$historyResult = $stmt->get_result();

// Get stats by topic
$statsQuery = "SELECT topic, AVG(score) as avg_score, MAX(score) as max_score, COUNT(*) as attempts FROM scores WHERE user_id = ? GROUP BY topic";
$stmt = $conn->prepare($statsQuery);
$stmt->bind_param("i", $userId);
$stmt->execute();
$statsResult = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile | CodeQuest</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body class="light-theme">
    <div class="container">
        <header class="main-header">
            <a href="index.php" class="back-btn">← Back</a>
            <h1>👤 Profile</h1>
            <button id="theme-toggle" class="theme-toggle" aria-label="Toggle theme">🌙</button>
        </header>

        <div class="profile-container">
            <div class="profile-header">
                <div class="profile-avatar"><?php echo strtoupper(substr($username, 0, 1)); ?></div>
                <h2><?php echo htmlspecialchars($username); ?></h2>
                <p class="total-score-badge">Total Score: <span><?php echo $user['total_score']; ?></span> points</p>
            </div>

            <div class="profile-stats">
                <h3>Statistics by Topic</h3>
                <div class="stats-grid">
                    <?php
                    $topics = ['HTML', 'CSS', 'JS', 'PHP', 'SQL'];
                    $statsByTopic = [];
                    while ($stat = $statsResult->fetch_assoc()) {
                        $statsByTopic[$stat['topic']] = $stat;
                    }
                    
                    foreach ($topics as $topic):
                        $stat = $statsByTopic[$topic] ?? null;
                    ?>
                    <div class="stat-card">
                        <h4><?php echo $topic; ?></h4>
                        <?php if ($stat): ?>
                            <p>Average: <?php echo number_format($stat['avg_score'], 1); ?>%</p>
                            <p>Best: <?php echo $stat['max_score']; ?>%</p>
                            <p>Attempts: <?php echo $stat['attempts']; ?></p>
                        <?php else: ?>
                            <p>No attempts yet</p>
                        <?php endif; ?>
                    </div>
                    <?php endforeach; ?>
                </div>
            </div>

            <div class="quiz-history">
                <h3>Recent Quiz History</h3>
                <?php if ($historyResult->num_rows > 0): ?>
                    <table class="history-table">
                        <thead>
                            <tr>
                                <th>Topic</th>
                                <th>Score</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($history = $historyResult->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($history['topic']); ?></td>
                                <td><?php echo $history['score']; ?>%</td>
                                <td><?php echo date('M d, Y H:i', strtotime($history['date'])); ?></td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <p class="no-history">No quiz history yet. Start your first quiz!</p>
                <?php endif; ?>
            </div>

            <div class="profile-actions">
                <a href="index.php" class="btn btn-primary">Start Quiz</a>
                <a href="leaderboard.php" class="btn btn-secondary">Leaderboard</a>
                <a href="logout.php" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>

