<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Sign Up</title>

<style>
body {
    font-family: Arial;
    background-color: #f2f2f2;
}
.container {
    width: 400px;
    margin: 80px auto;
    background: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
h2 {
    text-align: center;
    color: #333;
}
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
}
button {
    width: 100%;
    padding: 10px;
    background: #4a6fa5;
    color: white;
    border: none;
    font-size: 16px;
}
a {
    text-decoration: none;
    color: #4a6fa5;
}
</style>
</head>

<body>
<div class="container">
    <h2>Student Sign Up</h2>
    <form action="<%= request.getContextPath() %>/SignupServlet" method="post">
        <input type="text" name="prn" placeholder="PRN Number" required>
        <input type="text" name="name" placeholder="Full Name" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Register</button>
    </form>
    <p align="center">Already registered? <a href="Loginpage.jsp">Login</a></p>
</div>
</body>
</html>
