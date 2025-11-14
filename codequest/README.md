# 🎮 CodeQuest - Code Learning Quiz Game

An interactive web application where users can test their programming knowledge across HTML, CSS, JavaScript, PHP, and SQL. The application features user authentication, score tracking, leaderboards, and detailed explanations for quiz answers.

## 🚀 Features

### 🧑‍🎓 User System
- User registration and login
- Secure password hashing
- User profile with total score and progress
- Session management

### 🧠 Quiz Engine
- Choose from 5 topics: HTML, CSS, JavaScript, PHP, SQL
- 10 random questions per quiz
- Multiple choice answers
- Instant feedback with correct/incorrect indicators
- Progress tracking with animated progress bar

### 🧾 Score Tracking
- Automatic score saving to database
- Total score accumulation
- Quiz history tracking
- Leaderboard showing top 10 players
- Statistics by topic (average, best score, attempts)

### 💡 Learning Mode
- Detailed explanations for each answer
- Review all answers after quiz completion
- Visual indicators for correct/incorrect answers

### 🌈 UI Features
- Dark/light theme toggle (persists across sessions)
- Responsive design for all screen sizes
- Smooth animations and transitions
- Modern, clean interface

## 📋 Requirements

- PHP 7.4 or higher
- MySQL 5.7 or higher
- Web server (Apache/Nginx) or PHP built-in server
- Modern web browser

## 🛠️ Installation

### 1. Database Setup

1. Create a MySQL database:
```sql
CREATE DATABASE codequest;
```

2. Import the database schema and sample questions:
```bash
mysql -u root -p codequest < database.sql
```

Or use phpMyAdmin to import the `database.sql` file.

### 2. Database Configuration

Update the database credentials in `db.php`:
```php
$host = "localhost";
$dbname = "codequest";
$username = "root";
$password = ""; // Your MySQL password
```

### 3. Start the Server

#### Using PHP Built-in Server:
```bash
php -S localhost:8000
```

#### Using XAMPP/WAMP:
- Place the project in `htdocs` or `www` directory
- Access via `http://localhost/codequest`

#### Using Laragon:
- Place the project in `laragon/www` directory
- Access via `http://codequest.test`

### 4. Access the Application

Open your browser and navigate to:
- `http://localhost:8000` (PHP built-in server)
- `http://localhost/codequest` (XAMPP/WAMP)
- `http://space.test` (Laragon)

## 📁 Project Structure

```
codequest/
├── database.sql          # Database schema and sample questions
├── db.php               # Database connection
├── index.php            # Home page (login/register/dashboard)
├── login.php            # Login handler
├── register.php         # Registration handler
├── logout.php           # Logout handler
├── quiz.php             # Quiz interface
├── quiz.js              # Quiz logic and interactions
├── get_questions.php    # API endpoint for fetching questions
├── submit.php           # Score submission handler
├── leaderboard.php      # Leaderboard page
├── profile.php          # User profile page
├── styles.css           # Application styles (with theme support)
├── script.js            # Main JavaScript (theme toggle, etc.)
└── README.md            # This file
```

## 🎯 Usage

### For Users:

1. **Register/Login**: Create an account or login with existing credentials
2. **Choose Topic**: Select a programming topic (HTML, CSS, JS, PHP, SQL)
3. **Take Quiz**: Answer 10 questions, get instant feedback
4. **Review Results**: See your score and explanations for all answers
5. **View Profile**: Check your statistics and quiz history
6. **Leaderboard**: See how you rank against other players

### For Developers:

#### Adding New Questions

Insert questions into the `questions` table:
```sql
INSERT INTO questions (topic, question, option_a, option_b, option_c, option_d, correct_answer, explanation) 
VALUES ('HTML', 'Your question here?', 'Option A', 'Option B', 'Option C', 'Option D', 'a', 'Explanation here');
```

#### Modifying Quiz Settings

Edit `quiz.php` and `quiz.js` to change:
- Number of questions per quiz
- Points per question
- Quiz timer (if added)

## 🔒 Security Features

- Password hashing using PHP's `password_hash()`
- Prepared statements to prevent SQL injection
- Session-based authentication
- Input validation and sanitization
- XSS protection with `htmlspecialchars()`

## 🎨 Customization

### Changing Colors

Edit the CSS variables in `styles.css`:
```css
:root {
  --accent-primary: #4299e1;
  --accent-secondary: #48bb78;
  /* ... */
}
```

### Adding New Topics

1. Add questions to the database with the new topic name
2. Add a topic card in `index.php`
3. Update the `$valid_topics` array in `quiz.php` and `get_questions.php`

## 📊 Database Schema

### users
- `id` (INT, PRIMARY KEY)
- `username` (VARCHAR, UNIQUE)
- `password` (VARCHAR, HASHED)
- `total_score` (INT, DEFAULT 0)
- `created_at` (TIMESTAMP)

### questions
- `id` (INT, PRIMARY KEY)
- `topic` (VARCHAR)
- `question` (TEXT)
- `option_a`, `option_b`, `option_c`, `option_d` (VARCHAR)
- `correct_answer` (VARCHAR)
- `explanation` (TEXT)

### scores
- `id` (INT, PRIMARY KEY)
- `user_id` (INT, FOREIGN KEY)
- `topic` (VARCHAR)
- `score` (INT)
- `date` (TIMESTAMP)

## 🐛 Troubleshooting

### Database Connection Error
- Check database credentials in `db.php`
- Ensure MySQL server is running
- Verify database name is correct

### Session Issues
- Ensure `session_start()` is called before any output
- Check PHP session configuration
- Clear browser cookies

### Questions Not Loading
- Verify questions exist in database for selected topic
- Check browser console for JavaScript errors
- Ensure `get_questions.php` is accessible

## 🚀 Future Enhancements

- [ ] Timer for each question
- [ ] Achievement badges system
- [ ] Charts and graphs for statistics (Chart.js)
- [ ] Sound effects for correct/incorrect answers
- [ ] Difficulty levels (Easy, Medium, Hard)
- [ ] AI question generator (OpenAI API)
- [ ] Multiplayer quiz mode
- [ ] Question categories and tags
- [ ] Export quiz results as PDF

## 📝 License

This project is open source and available for educational purposes.

## 👤 Author

Dewan Gurung

## 🙏 Acknowledgments

- Sample questions cover fundamental concepts in HTML, CSS, JavaScript, PHP, and SQL
- UI inspired by modern quiz applications
- Built with vanilla PHP, JavaScript, and CSS for simplicity and performance

---

**Happy Coding! 🎮✨**
