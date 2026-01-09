<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("prn") == null) {
        response.sendRedirect("Loginpage.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notifications</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #F6F0D7;
}

/* Back button aligned with header */
.back-btn {
    position: absolute;
    top: 20px;
    left: 15px;
    padding: 8px 14px;
    background: #ffffff;
    color: #0d6efd;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    font-weight: 600;
    box-shadow: 0 3px 6px rgba(0,0,0,0.15);
    transition: all 0.2s ease;
}

.back-btn:hover {
    transform: translateY(-1px);
}
/* Header */
.header {
    background: #523826;
    color: white;
    padding: 10px;
    text-align: center;
    position: sticky;
    top: 0;
}

/* Container */
.container {
    padding: 30px;
}

/* Notification Card */
.notification {
    background: white;
    border-left: 6px solid #4a6fa5;
    border-radius: 8px;
    padding: 15px 20px;
    margin-bottom: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    animation: fadeIn 0.6s ease;
}

.notification h3 {
    margin: 0 0 8px;
    color: #2f4f7f;
}

.notification p {
    margin: 4px 0;
    color: #333;
}

.notification small {
    color: gray;
}

/* Type colors */
.approved { border-left-color: #2ecc71; }
.exam { border-left-color: #e67e22; }
.event { border-left-color: #3498db; }
.club { border-left-color: #9b59b6; }

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(15px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

</head>
<body>

<div class="header">
    <h1>🔔 Notifications</h1>
</div>

<div class="container">

	<button class="back-btn" onclick="history.back()">Back</button>
    <!-- FORM APPROVAL -->
    <div class="notification approved">
        <h3>✅ Form Approved</h3>
        <p>Your scholarship application has been approved by the college authority.</p>
        <small>Today, 10:15 AM</small>
    </div>

    <!-- EXAM SEAT NUMBER -->
    <div class="notification exam">
        <h3>📝 Exam Seat Number</h3>
        <p>Dear Student, your seat has been successfully allotted.<br><br>

		<b>Seat Number:</b> SE-2045<br>
		<b>Building Name:</b> Main Building<br>
		<b>Floor Number:</b> 2nd Floor<br>
		<b>Classroom Number:</b> C-204
		</p>
        <small>Yesterday, 5:40 PM</small>
    </div>

    <!-- UPCOMING EVENT -->
    <div class="notification event">
        <h3>🎉 Upcoming Event</h3>
        <p>Annual Tech Fest will be held on <b>15 January 2026</b>.</p>
        <small>2 days ago</small>
    </div>

    <!-- CLUB ACTIVITY -->
    <div class="notification club">
        <h3>🎭 Club Activity</h3>
        <p>Photography Club meeting scheduled on Friday at 4 PM.</p>
        <small>3 days ago</small>
    </div>

</div>

</body>
</html>
