// Quiz Logic
let questions = [];
let currentQuestion = 0;
let score = 0;
let userAnswers = [];
let questionStartTime = Date.now();

// Initialize quiz
document.addEventListener('DOMContentLoaded', function() {
    loadQuestions();
    
    document.getElementById('next-btn').addEventListener('click', nextQuestion);
    document.getElementById('close-feedback').addEventListener('click', closeFeedback);
    document.getElementById('retry-btn').addEventListener('click', function() {
        location.reload();
    });
});

async function loadQuestions() {
    try {
        const response = await fetch(`get_questions.php?topic=${topic}`);
        const data = await response.json();
        
        if (data.error) {
            document.getElementById('loading').textContent = 'Error loading questions. Please try again.';
            return;
        }
        
        questions = data;
        if (questions.length > 0) {
            document.getElementById('loading').style.display = 'none';
            document.getElementById('question-container').style.display = 'block';
            showQuestion(0);
        } else {
            document.getElementById('loading').textContent = 'No questions available for this topic.';
        }
    } catch (error) {
        console.error('Error loading questions:', error);
        document.getElementById('loading').textContent = 'Error loading questions. Please try again.';
    }
}

function showQuestion(index) {
    if (index >= questions.length) {
        endQuiz();
        return;
    }
    
    currentQuestion = index;
    const question = questions[index];
    questionStartTime = Date.now();
    
    // Update question counter
    document.getElementById('question-counter').textContent = `Question ${index + 1} of ${questions.length}`;
    
    // Update progress bar
    const progress = ((index) / questions.length) * 100;
    document.getElementById('progress').style.width = progress + '%';
    
    // Display question with difficulty level
    const questionText = document.getElementById('question-text');
    const levelBadge = question.level ? `<span class="level-badge level-${question.level.toLowerCase()}">${question.level}</span>` : '';
    questionText.innerHTML = `${levelBadge} ${question.question}`;
    
    // Display options
    const optionsContainer = document.getElementById('options-container');
    optionsContainer.innerHTML = '';
    
    const options = [
        { key: 'a', value: question.option_a },
        { key: 'b', value: question.option_b },
        { key: 'c', value: question.option_c },
        { key: 'd', value: question.option_d }
    ];
    
    options.forEach(option => {
        const button = document.createElement('button');
        button.className = 'option-btn';
        button.textContent = option.value;
        button.onclick = () => checkAnswer(option.key);
        optionsContainer.appendChild(button);
    });
    
    // Hide next button
    document.getElementById('next-btn').style.display = 'none';
}

function checkAnswer(selectedAnswer) {
    const question = questions[currentQuestion];
    const isCorrect = selectedAnswer === question.correct_answer;
    
    // Store user answer
    userAnswers.push({
        question: question.question,
        selected: selectedAnswer,
        correct: question.correct_answer,
        explanation: question.explanation,
        isCorrect: isCorrect
    });
    
    // Disable all option buttons
    const optionButtons = document.querySelectorAll('.option-btn');
    optionButtons.forEach(btn => {
        btn.disabled = true;
        if (btn.textContent === question['option_' + question.correct_answer]) {
            btn.classList.add('correct');
        } else if (btn.textContent === question['option_' + selectedAnswer] && !isCorrect) {
            btn.classList.add('incorrect');
        }
    });
    
    // Update score
    if (isCorrect) {
        score += 10;
        document.getElementById('score-display').textContent = `Score: ${score}`;
        showFeedback('✅ Correct!', question.explanation, 'correct');
    } else {
        showFeedback('❌ Incorrect!', `Correct answer: ${question['option_' + question.correct_answer]}. ${question.explanation}`, 'incorrect');
    }
    
    // Show next button
    document.getElementById('next-btn').style.display = 'block';
}

function showFeedback(icon, message, type) {
    const modal = document.getElementById('feedback-modal');
    const iconEl = document.getElementById('feedback-icon');
    const messageEl = document.getElementById('feedback-message');
    
    iconEl.textContent = icon;
    messageEl.textContent = message;
    modal.className = `modal ${type}`;
    modal.style.display = 'flex';
}

function closeFeedback() {
    document.getElementById('feedback-modal').style.display = 'none';
    nextQuestion();
}

function nextQuestion() {
    // Close modal if open
    const modal = document.getElementById('feedback-modal');
    if (modal.style.display === 'flex') {
        modal.style.display = 'none';
    }
    
    currentQuestion++;
    if (currentQuestion < questions.length) {
        showQuestion(currentQuestion);
    } else {
        endQuiz();
    }
}

function endQuiz() {
    // Update final progress
    document.getElementById('progress').style.width = '100%';
    
    // Hide question container
    document.getElementById('question-container').style.display = 'none';
    
    // Show quiz complete
    const completeSection = document.getElementById('quiz-complete');
    completeSection.style.display = 'block';
    
    // Display final score
    document.getElementById('final-score').textContent = score;
    
    // Display explanations
    displayExplanations();
    
    // Submit score to server
    submitScore();
}

function displayExplanations() {
    const explanationsContainer = document.getElementById('explanations');
    explanationsContainer.innerHTML = '<h3>Review Your Answers</h3>';
    
    userAnswers.forEach((answer, index) => {
        const explanationDiv = document.createElement('div');
        explanationDiv.className = `explanation-item ${answer.isCorrect ? 'correct' : 'incorrect'}`;
        
        explanationDiv.innerHTML = `
            <div class="explanation-header">
                <span class="explanation-icon">${answer.isCorrect ? '✅' : '❌'}</span>
                <strong>Question ${index + 1}</strong>
            </div>
            <p class="explanation-question">${answer.question}</p>
            <p class="explanation-text">${answer.explanation}</p>
        `;
        
        explanationsContainer.appendChild(explanationDiv);
    });
}

async function submitScore() {
    try {
        const formData = new URLSearchParams();
        formData.append('score', score);
        formData.append('topic', topic);
        
        const response = await fetch('submit.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: formData
        });
        
        const result = await response.text();
        console.log('Score submitted:', result);
    } catch (error) {
        console.error('Error submitting score:', error);
    }
}

