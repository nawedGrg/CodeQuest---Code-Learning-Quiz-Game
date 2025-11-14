-- CodeQuest Database Setup
-- Run this SQL script to create the database and tables

CREATE DATABASE IF NOT EXISTS codequest;
USE codequest;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    total_score INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Questions table
CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic VARCHAR(20) NOT NULL,
    level VARCHAR(10) NOT NULL DEFAULT 'Easy',
    question TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_answer VARCHAR(1) NOT NULL,
    explanation TEXT NOT NULL
);

-- Scores table
CREATE TABLE IF NOT EXISTS scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    topic VARCHAR(20) NOT NULL,
    score INT NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Sample HTML Questions
INSERT INTO questions (topic, level, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
-- Easy HTML Questions
('HTML', 'Easy', 'What does HTML stand for?', 'HyperText Markup Language', 'High Tech Modern Language', 'Home Tool Markup Language', 'Hyperlink Text Markup Language', 'a', 'HTML stands for HyperText Markup Language, the standard markup language for creating web pages.'),
('HTML', 'Easy', 'Which tag is used to create a hyperlink?', '<link>', '<a>', '<href>', '<url>', 'b', 'The <a> tag is used to create hyperlinks in HTML. It stands for anchor.'),
('HTML', 'Easy', 'What is the correct HTML element for the largest heading?', '<h6>', '<head>', '<heading>', '<h1>', 'd', '<h1> is used for the largest heading, while <h6> is the smallest.'),
('HTML', 'Easy', 'Which attribute is used to define inline styles?', 'class', 'style', 'styles', 'css', 'b', 'The style attribute is used to apply inline CSS styles directly to HTML elements.'),
('HTML', 'Easy', 'What is the correct HTML element for inserting a line break?', '<br>', '<break>', '<lb>', '<line>', 'a', '<br> is a self-closing tag used to insert a line break in HTML.'),
('HTML', 'Easy', 'Which HTML element defines the title of a document?', '<meta>', '<title>', '<head>', '<header>', 'b', 'The <title> element defines the title shown in the browser tab.'),
('HTML', 'Easy', 'What does the <div> element do?', 'Defines a division or section', 'Creates a link', 'Inserts an image', 'Creates a table', 'a', '<div> is a block-level container used to group and style HTML elements.'),
('HTML', 'Easy', 'Which tag is used for an unordered list?', '<ol>', '<ul>', '<list>', '<li>', 'b', '<ul> creates an unordered (bulleted) list, while <ol> creates an ordered (numbered) list.'),
('HTML', 'Easy', 'What is the purpose of the <meta> tag?', 'To create metadata', 'To insert images', 'To create links', 'To style elements', 'a', 'The <meta> tag provides metadata about the HTML document, such as character set and viewport settings.'),
('HTML', 'Easy', 'Which attribute is used to make an input field required?', 'mandatory', 'require', 'required', 'must', 'c', 'The required attribute makes an input field mandatory for form submission.'),
('HTML', 'Easy', 'Which tag is used to insert an image?', '<img>', '<image>', '<picture>', '<photo>', 'a', 'The <img> tag is used to embed images in HTML documents.'),
('HTML', 'Easy', 'What is the correct HTML for creating a paragraph?', '<p>', '<para>', '<paragraph>', '<text>', 'a', 'The <p> tag defines a paragraph in HTML.'),
('HTML', 'Easy', 'Which attribute specifies an alternate text for an image?', 'alt', 'title', 'src', 'href', 'a', 'The alt attribute provides alternative text for images, important for accessibility.'),
('HTML', 'Easy', 'What does the <strong> tag do?', 'Makes text bold', 'Makes text italic', 'Underlines text', 'Changes text color', 'a', 'The <strong> tag makes text bold and indicates important content.'),
('HTML', 'Easy', 'Which tag is used to create a table row?', '<tr>', '<td>', '<th>', '<table>', 'a', 'The <tr> tag defines a row in an HTML table.'),

-- Medium HTML Questions
('HTML', 'Medium', 'What is the semantic meaning of the <article> element?', 'A decorative element', 'An independent, self-contained content', 'A navigation element', 'A header element', 'b', 'The <article> element represents independent, self-contained content that could be distributed separately.'),
('HTML', 'Medium', 'Which HTML5 element is used for navigation links?', '<nav>', '<menu>', '<navigation>', '<links>', 'a', 'The <nav> element is used to define a set of navigation links.'),
('HTML', 'Medium', 'What is the difference between <div> and <span>?', 'No difference', '<div> is block-level, <span> is inline', '<span> is block-level, <div> is inline', 'Both are inline', 'b', '<div> is a block-level element that starts on a new line, while <span> is an inline element.'),
('HTML', 'Medium', 'Which attribute is used to specify the character encoding?', 'charset', 'encoding', 'char', 'type', 'a', 'The charset attribute in the <meta> tag specifies the character encoding for the document.'),
('HTML', 'Medium', 'What does the <form> element\'s action attribute specify?', 'The form\'s styling', 'The URL where form data is sent', 'The form\'s validation rules', 'The form\'s method', 'b', 'The action attribute specifies where to send the form data when the form is submitted.'),
('HTML', 'Medium', 'Which input type is used for email addresses?', 'type="text"', 'type="email"', 'type="mail"', 'type="address"', 'b', 'The type="email" input provides email validation and appropriate keyboard on mobile devices.'),
('HTML', 'Medium', 'What is the purpose of the <label> element?', 'To style text', 'To associate text with form controls', 'To create links', 'To add comments', 'b', 'The <label> element improves accessibility by associating text with form controls.'),
('HTML', 'Medium', 'Which HTML5 element represents a section of a page?', '<section>', '<div>', '<area>', '<block>', 'a', 'The <section> element represents a thematic grouping of content.'),
('HTML', 'Medium', 'What does the <iframe> element do?', 'Creates an inline frame', 'Inserts an image', 'Creates a form', 'Adds audio', 'a', 'The <iframe> element embeds another HTML page within the current page.'),
('HTML', 'Medium', 'Which attribute makes an input field read-only?', 'disabled', 'readonly', 'static', 'fixed', 'b', 'The readonly attribute makes an input field read-only, but it can still be submitted with the form.'),

-- Hard HTML Questions
('HTML', 'Hard', 'What is the difference between async and defer attributes in <script> tags?', 'No difference', 'async loads in parallel and executes immediately, defer loads in parallel but executes after parsing', 'defer loads in parallel and executes immediately, async executes after parsing', 'Both wait for parsing', 'b', 'async downloads the script in parallel and executes it immediately when available. defer downloads in parallel but executes only after the document has been parsed.'),
('HTML', 'Hard', 'What is the purpose of the <template> element?', 'To style content', 'To create reusable HTML content that is not rendered', 'To add comments', 'To create tables', 'b', 'The <template> element holds HTML content that is not rendered until cloned via JavaScript.'),
('HTML', 'Hard', 'Which HTML5 API allows web pages to store data locally?', 'LocalStorage API', 'FileStorage API', 'DataStorage API', 'WebStorage API', 'a', 'The LocalStorage API allows web pages to store key-value pairs locally in the browser.'),
('HTML', 'Hard', 'What is the difference between <b> and <strong> tags?', 'No difference', '<b> is visual, <strong> is semantic', '<strong> is visual, <b> is semantic', 'Both are semantic', 'b', '<b> is purely visual (bold), while <strong> has semantic meaning indicating importance.'),
('HTML', 'Hard', 'What does the crossorigin attribute in <link> and <script> tags do?', 'Sets the origin', 'Controls how the element handles cross-origin requests', 'Disables CORS', 'Enables CORS', 'b', 'The crossorigin attribute specifies how the element handles cross-origin requests, affecting CORS behavior.'),
('HTML', 'Hard', 'Which HTML5 element is used for time-based content?', '<time>', '<date>', '<timestamp>', '<datetime>', 'a', 'The <time> element represents a specific period in time and can include a datetime attribute.'),
('HTML', 'Hard', 'What is the purpose of the <details> and <summary> elements?', 'To create tables', 'To create collapsible content sections', 'To add metadata', 'To style content', 'b', 'The <details> and <summary> elements create a disclosure widget that can be expanded or collapsed.'),
('HTML', 'Hard', 'Which attribute in <meta> tag is used for responsive design?', 'viewport', 'responsive', 'mobile', 'scale', 'a', 'The viewport meta tag controls how the page is displayed on mobile devices, essential for responsive design.'),
('HTML', 'Hard', 'What is the difference between <header> and <head>?', 'No difference', '<head> is document metadata, <header> is visible page header', '<header> is document metadata, <head> is visible', 'Both are visible', 'b', '<head> contains document metadata (not visible), while <header> is a semantic HTML5 element for visible page headers.'),
('HTML', 'Hard', 'What does the <picture> element provide that <img> does not?', 'Nothing', 'Art direction and responsive images', 'Better styling', 'Animation', 'b', 'The <picture> element allows multiple <source> elements for different conditions, enabling art direction and responsive images.');

-- Sample CSS Questions
INSERT INTO questions (topic, level, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
-- Easy CSS Questions
('CSS', 'Easy', 'What does CSS stand for?', 'Computer Style Sheets', 'Creative Style Sheets', 'Cascading Style Sheets', 'Colorful Style Sheets', 'c', 'CSS stands for Cascading Style Sheets, used to style HTML elements.'),
('CSS', 'Easy', 'Which property is used to change the text color?', 'font-color', 'text-color', 'color', 'text-style', 'c', 'The color property is used to set the text color of an element.'),
('CSS', 'Easy', 'How do you select an element with id "demo"?', '.demo', '#demo', '*demo', 'demo', 'b', 'The # symbol is used to select elements by their id attribute.'),
('CSS', 'Easy', 'Which property is used to change the font size?', 'text-size', 'font-size', 'text-style', 'size', 'b', 'The font-size property controls the size of text in an element.'),
('CSS', 'Easy', 'How do you make text bold?', 'font-weight: bold;', 'text-bold: true;', 'bold: yes;', 'style: bold;', 'a', 'The font-weight property with value "bold" makes text bold.'),
('CSS', 'Easy', 'Which property is used to change the background color?', 'bg-color', 'background-color', 'color-background', 'backcolor', 'b', 'The background-color property sets the background color of an element.'),
('CSS', 'Easy', 'How do you center align text?', 'text-align: center;', 'align: center;', 'text-center: true;', 'center: text;', 'a', 'The text-align property with value "center" centers text horizontally.'),
('CSS', 'Easy', 'Which property is used to add space between elements?', 'spacing', 'margin', 'padding', 'space', 'b', 'The margin property creates space outside an element, while padding creates space inside.'),
('CSS', 'Easy', 'What is the default value of the position property?', 'relative', 'absolute', 'static', 'fixed', 'c', 'The default position value is static, meaning elements follow normal document flow.'),
('CSS', 'Easy', 'Which property is used to change the font family?', 'font-family', 'font-type', 'text-font', 'family', 'a', 'The font-family property specifies the font family for text.'),
('CSS', 'Easy', 'How do you select an element with class "example"?', '#example', '.example', '*example', 'example', 'b', 'The dot (.) symbol is used to select elements by their class attribute.'),
('CSS', 'Easy', 'Which property is used to underline text?', 'text-decoration: underline;', 'underline: true;', 'text-underline: yes;', 'decoration: underline;', 'a', 'The text-decoration property with value "underline" adds an underline to text.'),
('CSS', 'Easy', 'What does the display: none; property do?', 'Hides the element', 'Shows the element', 'Moves the element', 'Colors the element', 'a', 'display: none; completely removes the element from the document flow.'),
('CSS', 'Easy', 'Which property is used to set the width of an element?', 'width', 'w', 'size', 'element-width', 'a', 'The width property sets the width of an element.'),
('CSS', 'Easy', 'How do you make text italic?', 'font-style: italic;', 'text-italic: true;', 'italic: yes;', 'style: italic;', 'a', 'The font-style property with value "italic" makes text italic.'),

-- Medium CSS Questions
('CSS', 'Medium', 'What is the difference between margin and padding?', 'No difference', 'Margin is outside the border, padding is inside', 'Padding is outside, margin is inside', 'Both are the same', 'b', 'Margin creates space outside the element\'s border, while padding creates space inside the border.'),
('CSS', 'Medium', 'What does the box-sizing: border-box; property do?', 'Adds a border', 'Includes padding and border in element width', 'Removes padding', 'Changes border style', 'b', 'border-box includes padding and border in the element\'s total width and height.'),
('CSS', 'Medium', 'Which CSS property is used for flexbox layout?', 'display: flex;', 'layout: flex;', 'flex: true;', 'display: flexbox;', 'a', 'display: flex; enables flexbox layout for flexible and responsive designs.'),
('CSS', 'Medium', 'What is the CSS specificity order?', 'ID > Class > Element', 'Class > ID > Element', 'Element > Class > ID', 'All equal', 'a', 'ID selectors have higher specificity than class selectors, which have higher specificity than element selectors.'),
('CSS', 'Medium', 'What does z-index control?', 'Horizontal position', 'Vertical stacking order', 'Element size', 'Color depth', 'b', 'z-index controls the stacking order of positioned elements (higher values appear on top).'),
('CSS', 'Medium', 'What is the difference between :hover and :active pseudo-classes?', 'No difference', ':hover is mouse over, :active is being clicked', ':active is mouse over, :hover is clicked', 'Both are the same', 'b', ':hover applies when the mouse is over an element, :active applies when the element is being clicked.'),
('CSS', 'Medium', 'What does the float property do?', 'Makes text float', 'Positions element to left or right, allowing text to wrap', 'Makes element invisible', 'Changes element color', 'b', 'float positions an element to the left or right, allowing other content to wrap around it.'),
('CSS', 'Medium', 'What is a CSS media query used for?', 'To add media files', 'To apply styles based on device characteristics', 'To play videos', 'To add images', 'b', 'Media queries allow CSS to apply different styles based on screen size, resolution, and other device characteristics.'),
('CSS', 'Medium', 'What does the !important declaration do?', 'Makes a rule optional', 'Gives a CSS rule higher priority', 'Removes the rule', 'Hides the rule', 'b', '!important gives a CSS rule the highest priority, overriding other conflicting rules.'),
('CSS', 'Medium', 'What is the difference between inline and block elements?', 'No difference', 'Block starts on new line, inline flows with content', 'Inline starts on new line, block flows', 'Both are the same', 'b', 'Block elements start on a new line and take full width, inline elements flow with content.'),

-- Hard CSS Questions
('CSS', 'Hard', 'What is the CSS Grid layout system?', 'A way to add borders', 'A two-dimensional layout system for rows and columns', 'A way to add colors', 'A text styling system', 'b', 'CSS Grid is a two-dimensional layout system that allows you to create complex layouts with rows and columns.'),
('CSS', 'Hard', 'What is the difference between transform and transition?', 'No difference', 'transform changes appearance, transition animates the change', 'transition changes, transform animates', 'Both are the same', 'b', 'transform applies visual transformations, while transition animates property changes over time.'),
('CSS', 'Hard', 'What does the ::before pseudo-element do?', 'Styles the element', 'Inserts content before an element', 'Removes content', 'Hides the element', 'b', 'The ::before pseudo-element inserts content before the element\'s content, often used for decorative purposes.'),
('CSS', 'Hard', 'What is the difference between rem and em units?', 'No difference', 'rem is relative to root, em is relative to parent', 'em is relative to root, rem is relative to parent', 'Both are absolute', 'b', 'rem units are relative to the root element\'s font size, while em units are relative to the parent element\'s font size.'),
('CSS', 'Hard', 'What does the will-change property do?', 'Changes the element', 'Hints to browser about upcoming changes for optimization', 'Removes the element', 'Styles the element', 'b', 'will-change hints to the browser about properties that will change, allowing it to optimize rendering.'),
('CSS', 'Hard', 'What is the CSS cascade?', 'A waterfall effect', 'The process of determining which styles apply when multiple rules conflict', 'A layout method', 'A color scheme', 'b', 'The cascade is the algorithm that determines which CSS rules apply when multiple rules could apply to the same element.'),
('CSS', 'Hard', 'What does the contain property do?', 'Contains text', 'Isolates an element\'s rendering to improve performance', 'Adds a border', 'Changes size', 'b', 'The contain property allows you to indicate that an element and its contents are independent of the rest of the document tree.'),
('CSS', 'Hard', 'What is the difference between :nth-child() and :nth-of-type()?', 'No difference', ':nth-child() matches position among siblings, :nth-of-type() matches position among same type', ':nth-of-type() matches position, :nth-child() matches type', 'Both are the same', 'b', ':nth-child() selects based on position among all siblings, while :nth-of-type() selects based on position among elements of the same type.'),
('CSS', 'Hard', 'What does the clip-path property do?', 'Clips text', 'Defines a clipping region to show only part of an element', 'Removes the element', 'Adds a path', 'b', 'clip-path creates a clipping region that defines which part of an element should be visible.'),
('CSS', 'Hard', 'What is the purpose of CSS custom properties (variables)?', 'To store data', 'To define reusable values that can be changed dynamically', 'To add variables', 'To remove styles', 'b', 'CSS custom properties (--variable-name) allow you to store values that can be reused and changed dynamically throughout the stylesheet.');

-- Sample JavaScript Questions
INSERT INTO questions (topic, level, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
-- Easy JavaScript Questions
('JS', 'Easy', 'Which of the following is a JavaScript data type?', 'Float', 'Double', 'Number', 'Integer', 'c', 'JavaScript has Number type (not separate float/double/integer like other languages).'),
('JS', 'Easy', 'How do you declare a variable in JavaScript?', 'var variableName;', 'variable variableName;', 'v variableName;', 'declare variableName;', 'a', 'Variables can be declared using var, let, or const keywords.'),
('JS', 'Easy', 'Which method is used to output data to the console?', 'print()', 'console.log()', 'log()', 'output()', 'b', 'console.log() is used to output messages to the browser console.'),
('JS', 'Easy', 'What is the result of: "5" + 3?', '8', '53', 'Error', 'NaN', 'b', 'JavaScript converts the number to a string and concatenates, resulting in "53".'),
('JS', 'Easy', 'Which operator is used for strict equality?', '==', '===', '=', '!=', 'b', '=== checks both value and type, while == only checks value (with type coercion).'),
('JS', 'Easy', 'What does the Array.map() method do?', 'Modifies the original array', 'Creates a new array with transformed elements', 'Filters array elements', 'Sorts array elements', 'b', 'map() creates a new array by applying a function to each element of the original array.'),
('JS', 'Easy', 'How do you add an element to the end of an array?', 'array.add()', 'array.push()', 'array.append()', 'array.insert()', 'b', 'The push() method adds one or more elements to the end of an array.'),
('JS', 'Easy', 'Which method is used to remove the last element from an array?', 'array.pop()', 'array.remove()', 'array.delete()', 'array.shift()', 'a', 'pop() removes and returns the last element of an array.'),
('JS', 'Easy', 'What is the result of typeof null?', 'null', 'object', 'undefined', 'number', 'b', 'typeof null returns "object" - this is a known JavaScript quirk.'),
('JS', 'Easy', 'How do you check the length of an array?', 'array.length', 'array.size()', 'array.count()', 'array.getLength()', 'a', 'The length property returns the number of elements in an array.'),
('JS', 'Easy', 'What does the Array.filter() method do?', 'Modifies the array', 'Creates a new array with elements that pass a test', 'Sorts the array', 'Reverses the array', 'b', 'filter() creates a new array with all elements that pass the test implemented by the provided function.'),
('JS', 'Easy', 'Which keyword is used to declare a constant?', 'const', 'constant', 'let', 'var', 'a', 'const is used to declare a constant that cannot be reassigned.'),
('JS', 'Easy', 'What is the result of: 5 == "5"?', 'true', 'false', 'Error', 'undefined', 'a', '== performs type coercion, so 5 == "5" is true.'),
('JS', 'Easy', 'How do you access the first element of an array?', 'array[0]', 'array[1]', 'array.first()', 'array.get(0)', 'a', 'Array indices start at 0, so the first element is at index 0.'),
('JS', 'Easy', 'What does the Array.indexOf() method return if element is not found?', '0', '-1', 'null', 'undefined', 'b', 'indexOf() returns -1 if the element is not found in the array.'),

-- Medium JavaScript Questions
('JS', 'Medium', 'What is a closure in JavaScript?', 'A function that has access to variables in its outer scope', 'A way to close a file', 'A method to end a loop', 'A type of variable', 'a', 'A closure gives a function access to variables from its outer (enclosing) scope even after the outer function has returned.'),
('JS', 'Medium', 'What is the purpose of the "this" keyword?', 'Refers to the current object', 'Refers to the parent object', 'Refers to the global object', 'Refers to the function', 'a', 'The "this" keyword refers to the object that is executing the current function.'),
('JS', 'Medium', 'What is the difference between let and var?', 'No difference', 'let has block scope, var has function scope', 'var has block scope, let has function scope', 'Both are the same', 'b', 'let is block-scoped, while var is function-scoped. let also prevents hoisting issues.'),
('JS', 'Medium', 'What does the Array.reduce() method do?', 'Reduces array size', 'Executes a reducer function on each element, resulting in a single value', 'Removes elements', 'Sorts elements', 'b', 'reduce() executes a reducer function on each element, accumulating to a single output value.'),
('JS', 'Medium', 'What is an arrow function?', 'A function that points', 'A shorter syntax for writing functions with lexical this binding', 'A type of loop', 'A data structure', 'b', 'Arrow functions provide shorter syntax and automatically bind this from the enclosing context.'),
('JS', 'Medium', 'What is the difference between null and undefined?', 'No difference', 'null is assigned, undefined means variable not initialized', 'undefined is assigned, null means not initialized', 'Both are the same', 'b', 'null is an assigned value representing "no value", while undefined means a variable has been declared but not assigned.'),
('JS', 'Medium', 'What does the spread operator (...) do?', 'Expands iterables into individual elements', 'Compresses arrays', 'Removes elements', 'Sorts elements', 'a', 'The spread operator expands arrays or objects into individual elements or properties.'),
('JS', 'Medium', 'What is a Promise in JavaScript?', 'A guarantee', 'An object representing eventual completion or failure of an async operation', 'A type of loop', 'A data structure', 'b', 'A Promise represents a value that may be available now, in the future, or never.'),
('JS', 'Medium', 'What does async/await do?', 'Makes code synchronous', 'Provides a way to write asynchronous code that looks synchronous', 'Removes functions', 'Adds delays', 'b', 'async/await is syntactic sugar for Promises, making asynchronous code easier to read and write.'),
('JS', 'Medium', 'What is event bubbling?', 'A sound effect', 'The process where an event starts from the target element and bubbles up to the root', 'A type of loop', 'A data structure', 'b', 'Event bubbling is when an event starts at the target element and propagates up through parent elements.'),

-- Hard JavaScript Questions
('JS', 'Hard', 'What is the event loop in JavaScript?', 'A type of loop', 'The mechanism that handles asynchronous operations and callbacks', 'A data structure', 'A function', 'b', 'The event loop is JavaScript\'s concurrency model that handles asynchronous operations using a call stack and callback queue.'),
('JS', 'Hard', 'What is the difference between == and ===?', 'No difference', '== allows type coercion, === checks value and type strictly', '=== allows coercion, == is strict', 'Both are the same', 'b', '== performs type coercion before comparison, while === checks both value and type without coercion.'),
('JS', 'Hard', 'What is hoisting in JavaScript?', 'Lifting objects', 'The behavior of moving declarations to the top of their scope', 'A type of function', 'A data structure', 'b', 'Hoisting is JavaScript\'s behavior of moving variable and function declarations to the top of their containing scope.'),
('JS', 'Hard', 'What is a prototype in JavaScript?', 'A first version', 'A mechanism for inheritance where objects can inherit properties from other objects', 'A type of function', 'A data structure', 'b', 'Prototypes allow objects to inherit properties and methods from other objects, forming the basis of JavaScript\'s inheritance model.'),
('JS', 'Hard', 'What does the bind() method do?', 'Binds elements', 'Creates a new function with this set to a specific value', 'Removes functions', 'Adds properties', 'b', 'bind() creates a new function that, when called, has its this keyword set to the provided value.'),
('JS', 'Hard', 'What is the difference between call() and apply()?', 'No difference', 'call() takes arguments individually, apply() takes an array', 'apply() takes arguments individually, call() takes an array', 'Both are the same', 'b', 'Both invoke functions with a specific this value, but call() takes arguments individually while apply() takes an array.'),
('JS', 'Hard', 'What is a generator function?', 'A function that generates code', 'A function that can be paused and resumed, yielding multiple values', 'A type of loop', 'A data structure', 'b', 'Generator functions use function* syntax and yield keyword to create iterators that can pause execution.'),
('JS', 'Hard', 'What is the difference between shallow copy and deep copy?', 'No difference', 'Shallow copy copies references, deep copy creates new objects', 'Deep copy copies references, shallow creates new objects', 'Both are the same', 'b', 'Shallow copy copies object references, while deep copy creates completely new objects with copied values.'),
('JS', 'Hard', 'What is memoization?', 'A type of memory', 'An optimization technique that caches function results', 'A data structure', 'A function', 'b', 'Memoization is caching the results of expensive function calls and returning the cached result when the same inputs occur again.'),
('JS', 'Hard', 'What is the Temporal Dead Zone (TDZ)?', 'A time period', 'The period between entering scope and declaration where variables cannot be accessed', 'A data structure', 'A function', 'b', 'The TDZ is the period between entering a scope and the declaration where let/const variables exist but cannot be accessed.');

-- Sample PHP Questions
INSERT INTO questions (topic, level, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
-- Easy PHP Questions
('PHP', 'Easy', 'What does PHP stand for?', 'Personal Home Page', 'PHP: Hypertext Preprocessor', 'Private Home Page', 'Program Home Page', 'b', 'PHP originally stood for Personal Home Page, but now stands for PHP: Hypertext Preprocessor (recursive acronym).'),
('PHP', 'Easy', 'Which symbol is used to start a PHP variable?', '@', '$', '#', '&', 'b', 'PHP variables must start with the $ symbol followed by the variable name.'),
('PHP', 'Easy', 'What is the correct way to start a PHP script?', '<?php', '<?', '<php>', '<script>', 'a', 'PHP code must be enclosed in <?php ?> tags (or <? ?> for short tags).'),
('PHP', 'Easy', 'Which function is used to output text in PHP?', 'print()', 'echo', 'output()', 'display()', 'b', 'Both echo and print() can output text, but echo is more commonly used and slightly faster.'),
('PHP', 'Easy', 'Which superglobal variable is used to collect form data after submitting a form with method="post"?', '$_GET', '$_POST', '$_REQUEST', '$_FORM', 'b', '$_POST is used to collect form data sent via the POST method.'),
('PHP', 'Easy', 'What does the strlen() function do?', 'Returns the length of a string', 'Splits a string', 'Converts to lowercase', 'Replaces characters', 'a', 'strlen() returns the number of characters in a string.'),
('PHP', 'Easy', 'Which operator is used to concatenate strings in PHP?', '+', '.', '&', '|', 'b', 'The dot (.) operator is used to concatenate strings in PHP.'),
('PHP', 'Easy', 'What is the default method for sending form data?', 'GET', 'POST', 'PUT', 'DELETE', 'a', 'GET is the default method, but POST is more secure for sensitive data.'),
('PHP', 'Easy', 'Which function is used to start a session in PHP?', 'session_start()', 'start_session()', 'session_begin()', 'begin_session()', 'a', 'session_start() must be called before accessing or setting session variables.'),
('PHP', 'Easy', 'What does the count() function do?', 'Counts characters', 'Counts elements in an array', 'Counts words', 'Counts lines', 'b', 'count() returns the number of elements in an array.'),
('PHP', 'Easy', 'Which superglobal contains information about the server?', '$_SERVER', '$_ENV', '$_GLOBALS', '$_SESSION', 'a', '$_SERVER contains information about headers, paths, and script locations.'),
('PHP', 'Easy', 'What does the isset() function check?', 'If a variable is empty', 'If a variable is set and not null', 'If a variable is true', 'If a variable is false', 'b', 'isset() returns true if a variable is set and not null.'),
('PHP', 'Easy', 'Which function is used to include a file in PHP?', 'include()', 'import()', 'require()', 'Both include() and require()', 'd', 'Both include() and require() can include files, but require() stops execution on error.'),
('PHP', 'Easy', 'What does the array() function do?', 'Sorts an array', 'Creates an array', 'Removes array elements', 'Counts array elements', 'b', 'array() creates a new array in PHP.'),
('PHP', 'Easy', 'Which operator is used for comparison in PHP?', '=', '==', '===', 'Both == and ===', 'd', '== compares values, === compares both value and type.'),

-- Medium PHP Questions
('PHP', 'Medium', 'What is the correct way to connect to a MySQL database in PHP?', 'mysql_connect()', 'mysqli_connect()', 'connect_mysql()', 'db_connect()', 'b', 'mysqli_connect() is the modern way to connect to MySQL databases in PHP.'),
('PHP', 'Medium', 'What is the difference between include and require?', 'No difference', 'require stops execution on error, include continues', 'include stops on error, require continues', 'Both are the same', 'b', 'require() produces a fatal error and stops execution if the file is not found, while include() produces a warning.'),
('PHP', 'Medium', 'What does the prepared statement prevent?', 'Slow queries', 'SQL injection attacks', 'Database errors', 'Connection issues', 'b', 'Prepared statements prevent SQL injection by separating SQL code from data.'),
('PHP', 'Medium', 'What is the difference between == and === in PHP?', 'No difference', '== compares values, === compares value and type', '=== compares values, == compares type', 'Both are the same', 'b', '== performs type coercion, while === checks both value and type strictly.'),
('PHP', 'Medium', 'What does the explode() function do?', 'Causes an error', 'Splits a string into an array', 'Combines arrays', 'Removes elements', 'b', 'explode() splits a string by a delimiter into an array of strings.'),
('PHP', 'Medium', 'What is the purpose of the header() function?', 'To add HTML headers', 'To send HTTP headers', 'To create headers', 'To remove headers', 'b', 'header() sends raw HTTP headers to the client, often used for redirects or setting content type.'),
('PHP', 'Medium', 'What does the array_merge() function do?', 'Splits arrays', 'Merges one or more arrays', 'Removes duplicates', 'Sorts arrays', 'b', 'array_merge() combines one or more arrays into a single array.'),
('PHP', 'Medium', 'What is the difference between $_GET and $_POST?', 'No difference', '$_GET is in URL, $_POST is in request body', '$_POST is in URL, $_GET is in body', 'Both are the same', 'b', '$_GET contains data from URL parameters, $_POST contains data from form submissions in the request body.'),
('PHP', 'Medium', 'What does the file_get_contents() function do?', 'Writes to a file', 'Reads entire file into a string', 'Deletes a file', 'Creates a file', 'b', 'file_get_contents() reads an entire file into a string.'),
('PHP', 'Medium', 'What is a cookie in PHP?', 'A type of variable', 'A small piece of data stored on the client', 'A session variable', 'A database record', 'b', 'Cookies are small pieces of data stored on the user\'s computer, set using setcookie() function.'),

-- Hard PHP Questions
('PHP', 'Hard', 'What is the difference between PDO and mysqli?', 'No difference', 'PDO supports multiple databases, mysqli is MySQL-specific', 'mysqli supports multiple databases, PDO is MySQL-specific', 'Both are the same', 'b', 'PDO (PHP Data Objects) supports multiple databases, while mysqli is specific to MySQL.'),
('PHP', 'Hard', 'What is autoloading in PHP?', 'Loading files automatically', 'Automatically loading class files when needed', 'Auto-executing code', 'Auto-deleting files', 'b', 'Autoloading automatically loads class files when they are first used, using spl_autoload_register().'),
('PHP', 'Hard', 'What is the difference between static and instance methods?', 'No difference', 'Static methods belong to class, instance methods belong to object', 'Instance methods belong to class, static to object', 'Both are the same', 'b', 'Static methods are called on the class itself, while instance methods are called on an object instance.'),
('PHP', 'Hard', 'What does the namespace keyword do?', 'Creates a namespace', 'Organizes code into logical groups to avoid naming conflicts', 'Removes names', 'Adds names', 'b', 'Namespaces organize code and prevent naming conflicts between classes, functions, and constants.'),
('PHP', 'Hard', 'What is dependency injection?', 'Injecting errors', 'Providing dependencies to a class rather than creating them inside', 'Removing dependencies', 'Adding errors', 'b', 'Dependency injection provides a class with its dependencies from outside, improving testability and flexibility.'),
('PHP', 'Hard', 'What is the purpose of the __construct() method?', 'To destroy objects', 'To initialize an object when it is created', 'To remove objects', 'To copy objects', 'b', '__construct() is a magic method called automatically when an object is instantiated.'),
('PHP', 'Hard', 'What is the difference between abstract classes and interfaces?', 'No difference', 'Abstract classes can have implementation, interfaces cannot', 'Interfaces can have implementation, abstract cannot', 'Both are the same', 'b', 'Abstract classes can have both abstract and concrete methods, while interfaces can only define method signatures.'),
('PHP', 'Hard', 'What does the trait keyword do?', 'Creates a class', 'Enables code reuse through horizontal composition', 'Removes code', 'Adds errors', 'b', 'Traits allow code reuse in single-inheritance languages by enabling horizontal composition of methods.'),
('PHP', 'Hard', 'What is the purpose of the composer?', 'To write music', 'A dependency manager for PHP', 'To remove dependencies', 'To add errors', 'b', 'Composer is a dependency manager for PHP that manages project dependencies and autoloading.'),
('PHP', 'Hard', 'What does the yield keyword do?', 'Yields control', 'Creates a generator function that can be iterated', 'Stops execution', 'Removes functions', 'b', 'yield creates a generator function that can be paused and resumed, returning values one at a time.');

-- Sample SQL Questions
INSERT INTO questions (topic, level, question, option_a, option_b, option_c, option_d, correct_answer, explanation) VALUES
-- Easy SQL Questions
('SQL', 'Easy', 'What does SQL stand for?', 'Structured Query Language', 'Simple Query Language', 'Standard Query Language', 'System Query Language', 'a', 'SQL stands for Structured Query Language, used to manage relational databases.'),
('SQL', 'Easy', 'Which statement is used to retrieve data from a database?', 'GET', 'SELECT', 'FETCH', 'RETRIEVE', 'b', 'SELECT is used to query and retrieve data from database tables.'),
('SQL', 'Easy', 'Which clause is used to filter records?', 'FILTER', 'WHERE', 'HAVING', 'CONDITION', 'b', 'The WHERE clause is used to filter records based on specified conditions.'),
('SQL', 'Easy', 'Which function is used to count rows in SQL?', 'COUNT()', 'SUM()', 'TOTAL()', 'NUMBER()', 'a', 'COUNT() returns the number of rows that match a specified condition.'),
('SQL', 'Easy', 'Which keyword is used to sort results?', 'SORT BY', 'ORDER BY', 'ARRANGE BY', 'GROUP BY', 'b', 'ORDER BY is used to sort the result set in ascending or descending order.'),
('SQL', 'Easy', 'Which constraint ensures that a column cannot have NULL values?', 'UNIQUE', 'NOT NULL', 'PRIMARY KEY', 'CHECK', 'b', 'NOT NULL constraint ensures that a column must have a value and cannot be empty.'),
('SQL', 'Easy', 'Which statement is used to update data in a database?', 'MODIFY', 'UPDATE', 'CHANGE', 'ALTER', 'b', 'UPDATE is used to modify existing records in a database table.'),
('SQL', 'Easy', 'What is the purpose of the PRIMARY KEY constraint?', 'To uniquely identify each row', 'To create a link', 'To set a default value', 'To validate data', 'a', 'PRIMARY KEY uniquely identifies each row in a table and cannot be NULL.'),
('SQL', 'Easy', 'Which statement is used to delete data from a table?', 'REMOVE', 'DELETE', 'DROP', 'CLEAR', 'b', 'DELETE is used to remove rows from a table based on a condition.'),
('SQL', 'Easy', 'Which keyword is used to insert data into a table?', 'ADD', 'INSERT', 'CREATE', 'PUT', 'b', 'INSERT is used to add new rows of data into a table.'),
('SQL', 'Easy', 'What does the DISTINCT keyword do?', 'Sorts data', 'Returns only unique values', 'Filters data', 'Groups data', 'b', 'DISTINCT eliminates duplicate rows from the result set.'),
('SQL', 'Easy', 'Which operator is used to match patterns in SQL?', 'MATCH', 'LIKE', 'SIMILAR', 'PATTERN', 'b', 'LIKE is used with wildcards to match patterns in text data.'),
('SQL', 'Easy', 'What does the SUM() function do?', 'Counts rows', 'Adds up numeric values', 'Finds maximum', 'Finds minimum', 'b', 'SUM() calculates the sum of numeric values in a column.'),
('SQL', 'Easy', 'Which clause is used to limit the number of results?', 'LIMIT', 'TOP', 'RESTRICT', 'MAX', 'a', 'LIMIT restricts the number of rows returned in the result set.'),
('SQL', 'Easy', 'What does the AVG() function do?', 'Finds maximum', 'Calculates average', 'Finds minimum', 'Counts rows', 'b', 'AVG() calculates the average of numeric values in a column.'),

-- Medium SQL Questions
('SQL', 'Medium', 'What is the purpose of the JOIN clause?', 'To combine rows from two or more tables', 'To create a new table', 'To delete data', 'To update data', 'a', 'JOIN combines rows from multiple tables based on a related column between them.'),
('SQL', 'Medium', 'What does the GROUP BY clause do?', 'Groups rows that have the same values', 'Creates groups', 'Filters groups', 'Sorts groups', 'a', 'GROUP BY groups rows that have the same values in specified columns, often used with aggregate functions.'),
('SQL', 'Medium', 'What is the difference between INNER JOIN and LEFT JOIN?', 'No difference', 'INNER JOIN returns matching rows, LEFT JOIN returns all left table rows', 'LEFT JOIN returns matching, INNER returns all', 'Both are the same', 'b', 'INNER JOIN returns only matching rows, while LEFT JOIN returns all rows from the left table with matching right table rows.'),
('SQL', 'Medium', 'What is the purpose of the HAVING clause?', 'To filter rows', 'To filter groups after GROUP BY', 'To sort results', 'To join tables', 'b', 'HAVING filters groups created by GROUP BY, similar to WHERE but for aggregated data.'),
('SQL', 'Medium', 'What does the UNION operator do?', 'Joins tables', 'Combines results from multiple SELECT statements', 'Updates data', 'Deletes data', 'b', 'UNION combines the result sets of two or more SELECT statements, removing duplicates.'),
('SQL', 'Medium', 'What is a foreign key?', 'A primary key', 'A key that references a primary key in another table', 'A unique key', 'An index', 'b', 'A foreign key is a column that references the primary key of another table, establishing relationships.'),
('SQL', 'Medium', 'What does the EXISTS operator do?', 'Checks if a value exists', 'Checks if a subquery returns any rows', 'Creates a table', 'Deletes data', 'b', 'EXISTS returns true if a subquery returns at least one row.'),
('SQL', 'Medium', 'What is the difference between DELETE and TRUNCATE?', 'No difference', 'DELETE can be rolled back, TRUNCATE cannot; TRUNCATE is faster', 'TRUNCATE can be rolled back, DELETE cannot', 'Both are the same', 'b', 'DELETE removes rows one by one and can be rolled back, while TRUNCATE removes all rows quickly and cannot be rolled back.'),
('SQL', 'Medium', 'What does the CASE statement do?', 'Creates a case', 'Provides conditional logic in SQL queries', 'Deletes data', 'Updates data', 'b', 'CASE allows conditional logic, similar to if-else statements, in SQL queries.'),
('SQL', 'Medium', 'What is the purpose of an index?', 'To store data', 'To improve query performance by speeding up data retrieval', 'To delete data', 'To update data', 'b', 'Indexes create a data structure that allows faster lookups and sorting of data.'),

-- Hard SQL Questions
('SQL', 'Hard', 'What is the difference between a view and a table?', 'No difference', 'A view is a virtual table based on a query, a table stores actual data', 'A table is virtual, a view stores data', 'Both are the same', 'b', 'A view is a virtual table that doesn\'t store data but displays data from underlying tables based on a query.'),
('SQL', 'Hard', 'What is a stored procedure?', 'A table', 'A precompiled collection of SQL statements stored in the database', 'A view', 'An index', 'b', 'A stored procedure is a set of SQL statements stored in the database that can be executed repeatedly.'),
('SQL', 'Hard', 'What is the difference between UNION and UNION ALL?', 'No difference', 'UNION removes duplicates, UNION ALL keeps all rows', 'UNION ALL removes duplicates, UNION keeps all', 'Both are the same', 'b', 'UNION removes duplicate rows, while UNION ALL includes all rows from all queries, including duplicates.'),
('SQL', 'Hard', 'What is a transaction in SQL?', 'A query', 'A sequence of operations that are treated as a single unit', 'A table', 'An index', 'b', 'A transaction is a sequence of operations that must all succeed or all fail, ensuring data integrity.'),
('SQL', 'Hard', 'What does ACID stand for in database transactions?', 'Acid, Base, Compound, Data', 'Atomicity, Consistency, Isolation, Durability', 'Access, Control, Integrity, Data', 'All, Create, Insert, Delete', 'b', 'ACID properties ensure reliable database transactions: Atomicity, Consistency, Isolation, and Durability.'),
('SQL', 'Hard', 'What is the difference between a correlated and non-correlated subquery?', 'No difference', 'Correlated subquery references outer query, non-correlated is independent', 'Non-correlated references outer, correlated is independent', 'Both are the same', 'b', 'A correlated subquery references columns from the outer query, while a non-correlated subquery is independent.'),
('SQL', 'Hard', 'What is normalization in database design?', 'Making data normal', 'The process of organizing data to reduce redundancy and improve integrity', 'Adding data', 'Removing data', 'b', 'Normalization is the process of organizing data in a database to eliminate redundancy and ensure data integrity.'),
('SQL', 'Hard', 'What is the purpose of the COMMIT statement?', 'To start a transaction', 'To save all changes made in the current transaction', 'To rollback changes', 'To delete data', 'b', 'COMMIT saves all changes made during the current transaction to the database.'),
('SQL', 'Hard', 'What does the ROLLBACK statement do?', 'Saves changes', 'Undoes all changes made in the current transaction', 'Creates a table', 'Deletes a table', 'b', 'ROLLBACK undoes all changes made in the current transaction, restoring the database to its previous state.'),
('SQL', 'Hard', 'What is a trigger in SQL?', 'A query', 'A stored procedure that automatically executes in response to database events', 'A table', 'An index', 'b', 'A trigger is a database object that automatically executes a set of SQL statements when a specified event occurs.');

