<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Academic Details</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
}

/* Back button aligned with header */
.header {
    position: relative;
    text-align: center;
    background: #5d4215;
    color: white;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 25px;
}

.back-btn {
    position: absolute;
    top: 30px;
    left: 15px;
    transform: translateY(-50%);
    padding: 8px 14px;
    background: #ffffff;
    color: #0d6efd;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    font-weight: 600;
    box-shadow: 0 3px 6px rgba(0,0,0,0.15);
    transition: all 0.2s ease;
}

.back-btn:hover {
    background: #e7f1ff;
    transform: translateY(-50%) scale(1.05);
}


.header h1 {
    margin: 0;
}

.container {
    width: 450px;
    margin: 40px auto;
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
}

label {
    font-weight: bold;
    display: block;
    margin-top: 10px;
}

select, button {
    padding: 10px;
    margin-top: 8px;
    border-radius: 6px;
}

.form-btn {
    width: 100%;
}

button {
    background: #5d4215;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background: #0056b3;
}

.result-box {
    margin-top: 20px;
    background: #f8f9fa;
    padding: 15px;
    border-radius: 8px;
}
</style>
</head>

<body>

	<div class="header">
		<button class="back-btn" onclick="history.back()">Back</button>
        <h1>👤 Academic Details</h1>
    </div>
    
<div class="container">

    <form action="<%= request.getContextPath() %>/AcademicDetailsServlet" method="post">
        
        <label>Select Department</label>
        <select name="department" required>
            <option value="">-- Select Department --</option>
            <option value="CSE">Computer Science</option>
            <option value="IT">Information Technology</option>
            <option value="ECE">Electronics</option>
            <option value="MECH">Mechanical</option>
            <option value="CIVIL">Civil</option>
        </select>

        <label>Select Semester</label>
        <select name="semester" required>
            <option value="">-- Select Semester --</option>
            <option value="1">Semester 1</option>
            <option value="2">Semester 2</option>
            <option value="3">Semester 3</option>
            <option value="4">Semester 4</option>
            <option value="5">Semester 5</option>
            <option value="6">Semester 6</option>
            <option value="7">Semester 7</option>
            <option value="8">Semester 8</option>
        </select>

        <button type="submit">View Result</button>
    </form>

    <!-- Result Section -->
    <%
        Integer s1 = (Integer) request.getAttribute("subject1");
        if (s1 != null) {
    %>
    <div class="result-box">
        <h3>📊 Result</h3>
        <p>Subject 1: <b><%= request.getAttribute("subject1") %></b></p>
        <p>Subject 2: <b><%= request.getAttribute("subject2") %></b></p>
        <p>Subject 3: <b><%= request.getAttribute("subject3") %></b></p>
        <p>Subject 4: <b><%= request.getAttribute("subject4") %></b></p>
        <p>Subject 5: <b><%= request.getAttribute("subject5") %></b></p>
    </div>
    <% } %>

</div>

</body>
</html>
