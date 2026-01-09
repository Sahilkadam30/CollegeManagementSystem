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
<title>Event Registration</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    margin: 0;
    padding: 0;
}

/* Container */
.container {
    width: 90%;
    max-width: 800px;
    margin: 40px auto;
}

/* Card */
.card {
    background: #fff;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.1);
    animation: fadeSlide 0.6s ease;
}

/* Header */
.card h2 {
    margin-top: 0;
    color: #0d6efd;
    text-align: center;
}

/* Sections */
.section {
    margin-top: 25px;
}

.section h3 {
    color: #333;
    border-bottom: 2px solid #0d6efd;
    padding-bottom: 5px;
}

/* Inputs */
label {
    font-weight: 600;
    margin-top: 12px;
    display: block;
}

input, textarea {
    width: 70%;
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
.btn {
    margin-top: 20px;
    padding: 12px 25px;
    background: #0d6efd;
    color: #fff;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 15px;
    font-weight: 600;
    transition: 0.2s;
}

.btn:hover {
    background: #084298;
    transform: translateY(-1px);
}

/* Back Button */
.back-btn {
    position: absolute;
    top: 5px;
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
    background: #e7f1ff;
    transform: translateY(-1px);
}

/* Animation */
@keyframes fadeSlide {
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

<button class="back-btn" onclick="history.back()">Back</button>

<div class="container">
    <div class="card">

        <h2>Event Registration Form</h2>

        <!-- Student Details -->
        <div class="section">
            <h3>Student Details</h3>

            <label>Student Name</label>
            <input type="text" value="<%= session.getAttribute("name") %>" readonly>

            <label>PRN</label>
            <input type="text" value="<%= session.getAttribute("prn") %>" readonly>

            <label>Student Email</label>
            <input type="email" required>
        </div>

        <!-- Event Details -->
        <div class="section">
            <h3>Event Details</h3>

            <label>Event Name</label>
            <input type="text" required>

            <label>Event Date</label>
            <input type="date" required>

            <label>Venue</label>
            <input type="text" required>

            <label>Event Description</label>
            <textarea required></textarea>
        </div>

        <!-- Coordinator Details -->
        <div class="section">
            <h3>Coordinator Details</h3>

            <label>Event Coordinator Name</label>
            <input type="text" required>

            <label>Coordinator Mobile Number</label>
            <input type="tel" required>
        </div>

        <button class="btn" onclick="submitEvent()">Submit Request</button>

    </div>
</div>

</body>
</html>
