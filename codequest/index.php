<?php
session_start();
include 'db.php';

// Check if user is logged in
$is_logged_in = isset($_SESSION['user_id']);
$username = $is_logged_in ? $_SESSION['username'] : '';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CodeQuest - Learn Coding Through Quizzes</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body class="light-theme">
    <div class="container">
        <header class="main-header">
            <h1>🎮 CodeQuest</h1>
            <p class="subtitle">Test Your Programming Knowledge</p>
            <button id="theme-toggle" class="theme-toggle" aria-label="Toggle theme">🌙</button>
        </header>

        <?php if (!$is_logged_in): ?>
            <!-- Login/Register Section -->
            <div class="auth-container">
                <div class="auth-tabs">
                    <button class="tab-btn active" data-tab="login">Login</button>
                    <button class="tab-btn" data-tab="register">Register</button>
                </div>

                <div id="login-form" class="auth-form active">
                    <h2>Login to CodeQuest</h2>
                    <form action="login.php" method="POST">
                        <div class="form-group">
                            <label for="login-username">Username</label>
                            <input type="text" id="login-username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="login-password">Password</label>
                            <input type="password" id="login-password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                    <?php if (isset($_GET['error']) && $_GET['error'] == 'login'): ?>
                        <p class="error-message">Invalid username or password!</p>
                    <?php endif; ?>
                </div>

                <div id="register-form" class="auth-form">
                    <h2>Create Account</h2>
                    <form action="register.php" method="POST">
                        <div class="form-group">
                            <label for="register-username">Username</label>
                            <input type="text" id="register-username" name="username" required minlength="3">
                        </div>
                        <div class="form-group">
                            <label for="register-password">Password</label>
                            <input type="password" id="register-password" name="password" required minlength="4">
                        </div>
                        <button type="submit" class="btn btn-primary">Register</button>
                    </form>
                    <?php if (isset($_GET['error']) && $_GET['error'] == 'register'): ?>
                        <p class="error-message">Username already exists!</p>
                    <?php endif; ?>
                    <?php if (isset($_GET['success']) && $_GET['success'] == 'register'): ?>
                        <p class="success-message">Registration successful! Please login.</p>
                        <?php endif; ?>
                </div>
            </div>
        <?php else: ?>
            <!-- Dashboard Section -->
            <div class="dashboard">
                <div class="welcome-section">
                    <h2>Welcome back, <span class="username"><?php echo htmlspecialchars($username); ?></span>! 👋</h2>
                    <p class="total-score">Total Score: <span><?php 
                        $stmt = $conn->prepare("SELECT total_score FROM users WHERE id = ?");
                        $stmt->bind_param("i", $_SESSION['user_id']);
                        $stmt->execute();
                        $result = $stmt->get_result();
                        $user = $result->fetch_assoc();
                        echo $user['total_score'] ?? 0;
                    ?></span> points</p>
                </div>

                <div class="topics-grid">
                    <h3>Choose a Topic to Start Quiz</h3>
                    <div class="topic-cards">
                        <a href="quiz.php?topic=HTML" class="topic-card">
                            <div class="topic-icon">📄</div>
                            <h4>HTML</h4>
                            <p>HyperText Markup Language</p>
                        </a>
                        <a href="quiz.php?topic=CSS" class="topic-card">
                            <div class="topic-icon">🎨</div>
                            <h4>CSS</h4>
                            <p>Cascading Style Sheets</p>
                        </a>
                        <a href="quiz.php?topic=JS" class="topic-card">
                            <div class="topic-icon">⚡</div>
                            <h4>JavaScript</h4>
                            <p>Dynamic Web Programming</p>
                        </a>
                        <a href="quiz.php?topic=PHP" class="topic-card">
                            <div class="topic-icon">🐘</div>
                            <h4>PHP</h4>
                            <p>Server-Side Scripting</p>
                        </a>
                        <a href="quiz.php?topic=SQL" class="topic-card">
                            <div class="topic-icon">🗄️</div>
                            <h4>SQL</h4>
                            <p>Database Queries</p>
                        </a>
                    </div>
                </div>

                <div class="dashboard-actions">
                    <a href="profile.php" class="btn btn-secondary">View Profile</a>
                    <a href="leaderboard.php" class="btn btn-secondary">Leaderboard</a>
                    <a href="logout.php" class="btn btn-danger">Logout</a>
                </div>
            </div>
        <?php endif; ?>
    </div>

    <script src="script.js"></script>
</body>
</html>

