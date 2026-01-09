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
<title>Request Submitted</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #e3f2fd, #f9f9f9);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.success-card {
    background: #ffffff;
    padding: 35px 40px;
    border-radius: 14px;
    text-align: center;
    box-shadow: 0 10px 30px rgba(0,0,0,0.15);
    animation: fadeIn 0.6s ease;
    max-width: 520px;
}

.success-icon {
    font-size: 55px;
    color: #28a745;
    margin-bottom: 15px;
}

.success-card h2 {
    margin: 10px 0;
    color: #0d6efd;
}

.success-card p {
    font-size: 16px;
    color: #555;
    line-height: 1.6;
}

.btn-group {
    margin-top: 25px;
}

.btn {
    padding: 10px 22px;
    margin: 8px;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    transition: all 0.2s ease;
}

.btn-dashboard {
    background: #0d6efd;
    color: #fff;
}

.btn-dashboard:hover {
    background: #084298;
}

.btn-logout {
    background: #dc3545;
    color: #fff;
}

.btn-logout:hover {
    background: #b02a37;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

</head>
<body>

<div class="success-card">
    <div class="success-icon">✅</div>

    <h2>Request Submitted Successfully</h2>

    <p>
        Your request has been sent to the concerned authority.<br>
        We will reach you soon regarding the approval status.<br><br>
        Please stay updated and check the <b>Notification</b> section
        for approved requests.
    </p>

    <div class="btn-group">
        <a href="dashboard.jsp">
            <button class="btn btn-dashboard">Go to Dashboard</button>
        </a>

        <a href="LogoutServlet">
            <button class="btn btn-logout">Logout</button>
        </a>
    </div>
</div>

</body>
</html>
