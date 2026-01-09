<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    .login-container {
        width: 350px;
        margin: 100px auto;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #333333;
        margin-bottom: 20px;
    }

    label {
        font-weight: bold;
        color: #555555;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #4a6fa5;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #3b5d8a;
    }

    .signup-link {
        text-align: center;
        margin-top: 15px;
    }

    .signup-link a {
        text-decoration: none;
        color: #4a6fa5;
        font-weight: bold;
    }

    .signup-link a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="login-container">
    <h2>Student Login</h2>
    
    <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
        <label>PRN Number</label>
        <input type="text" name="prn" placeholder="Enter PRN Number" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter Password" required>

        <input type="submit" value="Login">
    </form>

    <div class="signup-link">
        New Student? <a href="Signup.jsp">Sign Up</a>
    </div>
</div>

</body>
</html>
