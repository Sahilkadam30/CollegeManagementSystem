<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("prn") == null) {
        response.sendRedirect("Loginpage.jsp");
        return;
    }

    String clubName = request.getParameter("club");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Club</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f4f6f9;
}

/* Page Layout */
.container {
    max-width: 700px;
    margin: 40px auto;
    background: #ffffff;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.1);
    animation: fadeUp 0.5s ease;
}

h2 {
    color: #0d6efd;
    margin-top: 0;
}

/* Form */
label {
    font-weight: 600;
    display: block;
    margin-top: 15px;
}

input, textarea {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    border-radius: 6px;
    border: 1px solid #ccc;
    font-size: 14px;
}

textarea {
    resize: none;
    height: 90px;
}

input:focus, textarea:focus {
    outline: none;
    border-color: #0d6efd;
    box-shadow: 0 0 5px rgba(13,110,253,0.3);
}

/* Buttons */
.btn-group {
    margin-top: 25px;
    display: flex;
    gap: 15px;
}

.btn {
    padding: 10px 20px;
    border-radius: 6px;
    border: none;
    font-size: 15px;
    cursor: pointer;
}

.btn-submit {
    background: #0d6efd;
    color: #fff;
}

.btn-submit:hover {
    background: #084298;
}

.btn-cancel {
    background: #6c757d;
    color: #fff;
}

.btn-cancel:hover {
    background: #5a6268;
}

/* Animation */
@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(25px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

<script>
function submitEvent() {
    window.location = "<%= request.getContextPath() %>/jsp/submitsuccess.jsp";
}
</script>

</head>

<body>

<div class="container">

    <h2>Join Club Application</h2>

    <p><b>Club Name:</b> <%= clubName != null ? clubName : "Selected Club" %></p>

    <form action="<%= request.getContextPath() %>/JoinClubServlet" method="post">

        <!-- Hidden values -->
        <input type="hidden" name="clubName" value="<%= clubName %>">

        <label>Student Name</label>
        <input type="text" value="<%= session.getAttribute("name") %>" readonly>

        <label>PRN</label>
        <input type="text" value="<%= session.getAttribute("prn") %>" readonly>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Why do you want to join this club?</label>
        <textarea name="reasonToJoin" placeholder="Explain your interest in this club..." required></textarea>

        <label>Why should we select you?</label>
        <textarea name="whySelectYou" placeholder="Mention your skills, strengths, or experience..." required></textarea>

		<label>Have you been part of any club or team before?</label>
        <textarea name="partof" placeholder="yes / no" required></textarea>
        
        <label>How will you promote club activities?</label>
        <textarea name="promoting" placeholder="write in 4-5 lines" required></textarea>
        
        <label>How will you manage club activities along with academics?</label>
        <textarea name="clubwithacademics" placeholder="write in 4-5 lines" required></textarea>
        
        <label>Achievements (if any)</label>
        <textarea name="achievements" placeholder="Competitions, certifications, awards, projects, etc."></textarea>

        <div class="btn-group">
            <button type="submit" class="btn btn-submit" onclick="submitEvent()">Submit Application</button>
            <button type="button" class="btn btn-cancel" onclick="history.back()">Cancel</button>
        </div>

    </form>

</div>

</body>
</html>
