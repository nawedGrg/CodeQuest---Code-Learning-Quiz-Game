# 🚀 CodeQuest Setup Guide

## Quick Start

### Step 1: Database Setup

1. **Create Database:**
   ```sql
   CREATE DATABASE codequest;
   ```

2. **Import Database:**
   - Open phpMyAdmin
   - Select `codequest` database
   - Click "Import" tab
   - Choose `database.sql` file
   - Click "Go"

### Step 2: Configure Database Connection

Edit `db.php` and update your database credentials:
```php
$host = "localhost";
$dbname = "codequest";
$username = "root";        // Your MySQL username
$password = "";            // Your MySQL password
```

### Step 3: Start Server

#### Option A: PHP Built-in Server
```bash
php -S localhost:8000
```
Then open: `http://localhost:8000`

#### Option B: XAMPP
1. Copy project to `C:\xampp\htdocs\space`
2. Start Apache and MySQL from XAMPP Control Panel
3. Open: `http://localhost:8081/space/index.php`


### Step 4: Test the Application

1. Register a new account
2. Login with your credentials
3. Select a topic (HTML, CSS, JS, PHP, SQL)
4. Take a quiz and see your score!

## Troubleshooting

### Database Connection Error
- ✅ Check MySQL is running
- ✅ Verify database name is `codequest`
- ✅ Check username/password in `db.php`
- ✅ Ensure database exists: `SHOW DATABASES;`

### Questions Not Loading
- ✅ Verify questions exist: `SELECT COUNT(*) FROM questions WHERE topic='HTML';`
- ✅ Check browser console for errors
- ✅ Ensure `get_questions.php` is accessible
- ✅ Check PHP error logs

### Session Issues
- ✅ Ensure `session_start()` is before any output
- ✅ Check PHP session configuration
- ✅ Clear browser cookies
- ✅ Verify file permissions

### Theme Toggle Not Working
- ✅ Clear browser cache
- ✅ Check `script.js` is loaded
- ✅ Verify localStorage is enabled in browser
- ✅ Check browser console for errors

## Default Sample Data

The database includes:
- **50 sample questions** (10 per topic: HTML, CSS, JS, PHP, SQL)
- Questions cover fundamental programming concepts
- Each question includes 4 options and explanations

## Adding More Questions

To add more questions, use this SQL template:
```sql
INSERT INTO questions (topic, question, option_a, option_b, option_c, option_d, correct_answer, explanation) 
VALUES (
    'HTML',  -- Topic: HTML, CSS, JS, PHP, or SQL
    'Your question text?',  -- The question
    'Option A text',        -- First option
    'Option B text',        -- Second option
    'Option C text',        -- Third option
    'Option D text',        -- Fourth option
    'a',                    -- Correct answer: a, b, c, or d
    'Explanation of the answer'  -- Explanation text
);
```

## File Structure

```
space/
├── database.sql       # Database schema & sample questions
├── db.php            # Database connection
├── index.php         # Home/login/register page
├── login.php         # Login handler
├── register.php      # Registration handler
├── logout.php        # Logout handler
├── quiz.php          # Quiz interface
├── quiz.js           # Quiz logic
├── get_questions.php # API: Fetch questions
├── submit.php        # API: Save score
├── leaderboard.php   # Leaderboard page
├── profile.php       # User profile
├── styles.css        # Application styles
├── script.js         # Theme toggle & utilities
├── README.md         # Full documentation
└── SETUP.md          # This file
```

## Security Notes

- ✅ Passwords are hashed using PHP's `password_hash()`
- ✅ Prepared statements prevent SQL injection
- ✅ Sessions are used for authentication
- ✅ Input is sanitized with `htmlspecialchars()`
- ⚠️ For production: Use HTTPS, add CSRF protection, implement rate limiting

## Next Steps

1. ✅ Test all features (register, login, quiz, leaderboard)
2. ✅ Add more questions to the database
3. ✅ Customize colors in `styles.css`
4. ✅ Add your own branding
5. ✅ Deploy to a web server

## Support

If you encounter any issues:
1. Check the browser console for JavaScript errors
2. Check PHP error logs
3. Verify database connection
4. Ensure all files are in the correct location
5. Check file permissions (PHP needs read access)

---

**Happy Coding! 🎮✨**

