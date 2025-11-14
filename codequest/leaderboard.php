<?php
session_start();
include 'db.php';

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: index.php');
    exit();
}

// Get top 10 users by total score
$leaderboardQuery = "SELECT username, total_score FROM users ORDER BY total_score DESC LIMIT 10";
$leaderboardResult = $conn->query($leaderboardQuery);

// Get current user's rank
$userId = $_SESSION['user_id'];
$rankQuery = "SELECT COUNT(*) + 1 as rank FROM users WHERE total_score > (SELECT total_score FROM users WHERE id = ?)";
$stmt = $conn->prepare($rankQuery);
$stmt->bind_param("i", $userId);
$stmt->execute();
$rankResult = $stmt->get_result();
$userRank = $rankResult->fetch_assoc()['rank'];

// Get user's total score
$userScoreQuery = "SELECT total_score FROM users WHERE id = ?";
$stmt = $conn->prepare($userScoreQuery);
$stmt->bind_param("i", $userId);
$stmt->execute();
$userScoreResult = $stmt->get_result();
$userScore = $userScoreResult->fetch_assoc()['total_score'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leaderboard | CodeQuest</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body class="light-theme">
    <div class="container">
        <header class="main-header">
            <a href="index.php" class="back-btn">← Back</a>
            <h1>🏆 Leaderboard</h1>
            <p class="subtitle">Top 10 Players</p>
            <button id="theme-toggle" class="theme-toggle" aria-label="Toggle theme">🌙</button>
        </header>

        <div class="leaderboard-container">
            <div class="user-rank-card">
                <h3>Your Rank</h3>
                <p class="rank-number">#<?php echo $userRank; ?></p>
                <p class="rank-score"><?php echo $userScore; ?> points</p>
            </div>

            <div class="leaderboard-list">
                <h2>Top Players</h2>
                <table class="leaderboard-table">
                    <thead>
                        <tr>
                            <th>Rank</th>
                            <th>Username</th>
                            <th>Total Score</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $rank = 1;
                        while ($row = $leaderboardResult->fetch_assoc()):
                            $isCurrentUser = ($row['username'] === $_SESSION['username']);
                        ?>
                        <tr class="<?php echo $isCurrentUser ? 'current-user' : ''; ?>">
                            <td class="rank">#<?php echo $rank; ?></td>
                            <td class="username">
                                <?php 
                                echo htmlspecialchars($row['username']);
                                if ($isCurrentUser) echo ' (You)';
                                ?>
                            </td>
                            <td class="score"><?php echo $row['total_score']; ?> pts</td>
                        </tr>
                        <?php
                        $rank++;
                        endwhile;
                        ?>
                    </tbody>
                </table>
            </div>

            <div class="leaderboard-actions">
                <a href="index.php" class="btn btn-primary">Back to Home</a>
                <a href="profile.php" class="btn btn-secondary">View Profile</a>
            </div>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>

