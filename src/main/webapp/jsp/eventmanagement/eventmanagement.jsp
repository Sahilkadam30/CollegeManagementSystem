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
<title>College Event Management</title>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #F6F0D7;
    margin: 0;
}

/* Container */
.container {
    width: 90%;
    margin: 30px auto;
}

/* Header */
.header {
	text-align: center;
    position: relative;
    background:rgb(101, 81, 35);
    color: #fff;
    padding: 20px 20px 20px 60px;
    border-radius: 12px;
    animation: fadeSlide 0.6s ease;
}

.back-btn {
    position: absolute;
    top: 25px;
    left: 20px;
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

/* Grid */
.event-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    margin-top: 25px;
}

/* Cards */
.event-card, .form-section {
    background: #fff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    animation: fadeSlide 0.6s ease;
    transition: 0.3s;
}

.event-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.event-card h3 {
    color: #0d6efd;
}

.btn {
    padding: 8px 15px;
    background: rgb(101, 81, 35);
    border: none;
    color: #fff;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
}

.btn:hover {
    background: #0056b3;
}

/* Form */
.form-section {
    margin-top: 35px;
    margin-right: 400px;
}

label {
    font-weight: bold;
    margin-top: 10px;
    display: block;
}

input, textarea {
    width: 40%;
    padding: 10px;
    margin-top: 6px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

input:focus, textarea:focus {
    outline: none;
    border-color: #0d6efd;
}

/* Animation */
@keyframes fadeSlide {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>

<script>
function submitRequest() {
    alert("The request has been sent to the Event Manager. We will contact you soon.");
    window.location.href = "<%= request.getContextPath() %>/jsp/dashboard.jsp";
}
</script>

</head>
<body>

	<div class="header">
        <h1>College Event Management</h1>
    </div>

<div class="container">

	<button class="back-btn" onclick="history.back()">Back</button>
    <!-- Header -->
	
	<h2>Upcoming Events</h2>
    <!-- Event Cards -->
    <div class="event-grid">
		
        <div class="event-card">
            <h3><b>Tech Fest 2026</b></h3>
            <p><b>Date:</b> 15 January 2026</p>
            <p><b>Venue:</b> Main Auditorium</p>
            <p><b>Details: </b>A technical festival with coding and AI events.</p>
            <a href="<%= request.getContextPath() %>/jsp/eventmanagement/register.jsp">
        		<button class="btn">Register</button>
    		</a>
        </div>

        <div class="event-card">
            <h3><b>Cultural Fest</b></h3>
            <p><b>Date:</b> 22 february 2026</p>
            <p><b>Venue:</b> Open Ground</p>
            <p><b>Details: </b>Dance, music, and drama performances.</p>
            <a href="<%= request.getContextPath() %>/jsp/eventmanagement/register.jsp">
        		<button class="btn">Register</button>
    		</a>
        </div>

    </div>

	<h2>Guidlines for Event request form</h2>
	
	<div class="event-grid">
		<div class="guidlines">
			<h3>📌 Event Submission Guidelines for Students</h3>
			<p>■ <b>Please read the following instructions carefully before submitting an event request:</b></p>
			<p>■ <b>Accurate Event Details:</b> Ensure the event name, date, venue, and description are correct and clearly mentioned.</p>
			<p>■ <b>Advance Submission:</b> Event requests must be submitted at least 7–10 days in advance of the proposed event date. </p>
			<p>■ <b>Student Responsibility:</b> The submitting student will be treated as the primary point of contact for all communications. </p>
			<p>■ <b>Coordinator Information:</b> Provide a valid Event Coordinator name and mobile number and The coordinator must be available during the event. </p>
			<p>■ <b>One Request per Event:</b> Do not submit duplicate requests for the same event. Multiple submissions may lead to rejection. </p>
			<p>■ <b>Approval Process:</b> Submission of the form does not guarantee approval. The request will be reviewed by the Event Manager / College Authority. </p>
			<p>■ <b>Changes After Submission:</b> Any changes to event details after submission must be communicated to the Event Manager.</p>
		</div>
	</div>
    <!-- Event Request Form -->
    <div class="form-section">
        <h3>Event Request Form</h3>

        <form onsubmit="submitRequest(); return false;">

            <label>Event Name</label>
            <input type="text" required>

            <label>Event Date</label>
            <input type="date" required>

            <label>Venue</label>
            <input type="text" required>

            <label>Event Description</label>
            <textarea rows="4" required></textarea>

            <label>Student Name</label>
            <input type="text" value="<%= session.getAttribute("name") %>" readonly>

            <label>PRN</label>
            <input type="text" value="<%= session.getAttribute("prn") %>" readonly>

            <label>Student Email</label>
            <input type="email" required>

            <label>Coordinator Name</label>
            <input type="text" required>

            <label>Coordinator Mobile</label>
            <input type="tel" required>

            <br><br>
            <button type="submit" class="btn">Submit Request</button>
        </form>
    </div>

</div>

</body>
</html>
