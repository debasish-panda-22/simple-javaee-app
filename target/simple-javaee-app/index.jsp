<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tomcat Server Demo</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h1>Welcome to the Tomcat Server Demo</h1>
        <p>This page is served by Apache Tomcat.</p>
        <p>Current server time: <%= new java.util.Date() %></p>
        <div>
            <label for="name-input">Enter your name:</label>
            <input type="text" id="name-input">
            <button id="greet-button">Greet</button>
            <p id="greeting"></p>
        </div>
        <button id="color-button">Change Background Color</button>
    </main>
    <footer>
        <p>&copy; 2025 Tomcat Server Demo</p>
    </footer>
    <script src="script.js"></script>
</body>
</html>
