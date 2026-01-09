<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("prn") == null) {
        response.sendRedirect("loginpage.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile</title>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #F6F0D7;
    margin: 0;
    padding: 0;
}

/* Header */
.header {
	text-align: center;
    background: #30608C;
    color: white;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 25px;
}

.header h1 {
    margin: 0;
}

/* Profile Card */
.profile-card {
    width: 80%;
    margin: 40px auto;
    background: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

/* Top Section */
.profile-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* Left Info */
.profile-info p {
    margin: 8px 0;
    font-size: 16px;
}

/* Right Image */
.profile-photo img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    border: 3px solid #007bff;
}

/* Buttons */
.options {
    margin-top: 30px;
}

.options button {
    padding: 10px 20px;
    margin-right: 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    background: #30608C;
    color: #fff;
    font-size: 15px;
}

.options button:hover {
    background: #0056b3;
}

/* Hidden Sections */
.section {
    display: none;
    margin-top: 25px;
    padding: 20px;
    background: #f8f9fa;
    border-radius: 8px;
}

.section h3 {
    margin-top: 0;
}
input, textarea {
    width: 100%;
    padding: 8px;
    margin: 8px 0;
}

/* Back button aligned with header */
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
    transform: translateY(-1px);
}

/* Active Click */
.back-btn:active {
    transform: scale(0.97);
}
.back-btn {
    position: fixed;
    top: 20px;
    left: 20px;
    z-index: 1000;
}

/* Form width control */
.form-container {
    max-width: 600px;   
    margin: 0 auto;     
}

/* Input styling */
.form-container input,
.form-container textarea {
    width: 100%;
    max-width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Update button */
.form-container button {
    margin-top: 10px;
    padding: 10px 20px;
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

.form-container button:hover {
    background: #0056b3;
}
/* Page load animation */
.profile-card {
    animation: fadeSlideIn 0.6s ease-in-out;
}

@keyframes fadeSlideIn {
    from {
        opacity: 0;
        transform: translateY(25px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Section smooth show */
.section {
    animation: fadeUp 0.4s ease;
}

@keyframes fadeUp {
    from {
        opacity: 0;
        transform: translateY(15px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Input focus animation */
.form-container input:focus,
.form-container textarea:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 0 2px rgba(0,123,255,0.2);
    transition: 0.3s;
}

/* Button hover animation */
.options button,
.form-container button,
.back-btn {
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.options button:hover,
.form-container button:hover,
.back-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 12px rgba(0,0,0,0.2);
}

/* Card container for details */
.details-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 20px;
    margin-top: 20px;
}

/* Individual info card */
.info-card {
    background: #ffffff;
    border-radius: 12px;
    padding: 18px 20px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
}

.info-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

/* Card title */
.info-card h3 {
    margin-top: 0;
    margin-bottom: 15px;
    font-size: 18px;
    color: #007bff;
    border-bottom: 2px solid #e6e6e6;
    padding-bottom: 6px;
}

/* Card text */
.info-card p {
    margin: 6px 0;
    font-size: 15px;
}

/* Highlight labels */
.info-card p b {
    color: #333;
}

/* Section spacing */
.section h2 {
    margin-top: 25px;
    color: #444;
}



</style>

<script>
function showSection(id) {
    document.getElementById("details").style.display = "none";
    document.getElementById("update").style.display = "none";
    document.getElementById(id).style.display = "block";
}
</script>

</head>
<body>

	<div class="header">
        <h1>👤 My Profile</h1>
    </div>

<div class="profile-card">

    <!-- Top Profile Section -->
    	<button class="back-btn" onclick="history.back()">Back</button>

		
    <div class="profile-top">
        <div class="profile-info">
            <p><b>Name:</b> <%= session.getAttribute("name") %></p>
            <p><b>PRN:</b> <%= session.getAttribute("prn") %></p>
            <p><b>DOB:</b> <%= session.getAttribute("dob") %></p>
            <p><b>Department:</b> <%= session.getAttribute("course_name") %></p>
        </div>

        <div class="profile-photo">
            <img src="images/student.png" alt="Student Photo">
        </div>
    </div>

    <!-- Options -->
    <div class="options">
        <button onclick="showSection('details')">View Student Details</button>
        <button onclick="showSection('update')">Update Personal Details</button>
    </div>

    <!-- Student Details -->
   <div id="details" class="section">
    <h3>Student Details</h3>

    <div class="details-grid">

        <!-- Personal Details -->
        <div class="info-card">
            <h3>Personal Details</h3>
            <p><b>Name:</b> <%= session.getAttribute("name") %></p>
            <p><b>Gender:</b> <%= session.getAttribute("gender") %></p>
            <p><b>DOB:</b> <%= session.getAttribute("dob") %></p>
            <p><b>Mobile:</b> <%= session.getAttribute("mobile") %></p>
            <p><b>Aadhar:</b> <%= session.getAttribute("aadhar") %></p>
            <p><b>Address:</b> <%= session.getAttribute("address") %></p>
            <p><b>City:</b> <%= session.getAttribute("city") %></p>
            <p><b>State:</b> <%= session.getAttribute("state") %></p>
            <p><b>Pincode:</b> <%= session.getAttribute("pin") %></p>
        </div>

        <!-- Academic - 10th -->
        <div class="info-card">
            <h3>10th Academic Details</h3>
            <p><b>School Name:</b> <%= session.getAttribute("schoolName") %></p>
            <p><b>School Address:</b> <%= session.getAttribute("schoolAddress") %></p>
            <p><b>Marks:</b> <%= session.getAttribute("schoolMarks") %></p>
            <p><b>Grade:</b> <%= session.getAttribute("schoolGrade") %></p>
        </div>

        <!-- Academic - 12th -->
        <div class="info-card">
            <h3>12th Academic Details</h3>
            <p><b>Junior College:</b> <%= session.getAttribute("jcName") %></p>
            <p><b>College Address:</b> <%= session.getAttribute("jcAddress") %></p>
            <p><b>Marks:</b> <%= session.getAttribute("jcMarks") %></p>
            <p><b>Grade:</b> <%= session.getAttribute("jcGrade") %></p>
        </div>

        <!-- College Details -->
        <div class="info-card">
            <h3>College Details</h3>
            <p><b>College Name:</b> <%= session.getAttribute("collegeName") %></p>
            <p><b>College Code:</b> <%= session.getAttribute("collegeCode") %></p>
            <p><b>College Address:</b> <%= session.getAttribute("collegeAddress") %></p>
            <p><b>City:</b> <%= session.getAttribute("collegeCity") %></p>
            <p><b>Course:</b> <%= session.getAttribute("course_name") %></p>
            <p><b>Admission Date:</b> <%= session.getAttribute("admissiondate") %></p>
        </div>

    </div>
</div>

    <!-- Update Details -->
    <div id="update" class="section">
        <h3>Update Personal Information</h3>

        <div class="form-container">
    		<form action="<%= request.getContextPath() %>/Updateinformation" method="post">

            <label>Mobile Number</label>
            <input type="text" name="mobile" required>

            <label>Address</label>
            <textarea name="address" required></textarea>

            <label>Aadhar Number</label>
            <input type="text" name="aadhar" required>

            <label>City</label>
            <input type="text" name="city" required>

            <label>Course</label>
            <input type="text" name="course" required>

            <label>Admission Date</label>
            <input type="date" name="admissionDate" required>

            <button type="submit">Update</button>
        </form>
    </div>

</div>

</body>
</html>
