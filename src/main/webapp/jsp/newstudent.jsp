<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Student Login</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #F6F0D7;
        margin: 0;
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
	.header h1 {
    	margin: 0;
	}
	
	.back-btn1 {
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

.back-btn1:hover {
    background: #e7f1ff;
    transform: translateY(-1px);
}

    .form-container {
        max-width: 1000px;
        margin: auto;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }

    .section-title {
        margin-top: 25px;
        margin-bottom: 15px;
        color: #4a6fa5;
        border-bottom: 2px solid #ddd;
        padding-bottom: 5px;
    }

    .form-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }

    label {
        font-weight: bold;
        font-size: 14px;
    }

    input, select {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    .full-width {
        grid-column: span 3;
    }

    .btn-container {
        text-align: center;
        margin-top: 30px;
    }

    .save-btn {
        background-color: #4a6fa5;
        color: white;
        padding: 10px 30px;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
    }

    .save-btn:hover {
        background-color: #3b5d8a;
    }
    
    .save-btn {
    	padding: 10px 20px;
    	background-color: #28a745;
    	color: white;
    	border: none;
    	border-radius: 5px;
    	cursor: pointer;
	}

	.back-btn {
    	padding: 10px 20px;
    	background-color: #6c757d;
    	color: white;
    	border: none;
    	border-radius: 5px;
    	cursor: pointer;
	}
    
</style>

<script>
    function confirmSubmit() {
        return confirm("Are you sure you want to submit student details?");
    }
</script>

</head>
<body>

	<div class="header">
		<button class="back-btn1" onclick="history.back()">Back</button>
        <h1>🎓 New Student Login</h1>
    </div>

<div class="form-container">

<form action="<%= request.getContextPath() %>/Newlogin" method="post">

    <!-- COLLEGE DETAILS -->
    <h2 class="section-title">College Details</h2>

    <div class="form-grid">
        <div>
            <label>College Name</label>
            <input type="text" name="college_name" required>
        </div>

        <div>
            <label>College Code</label>
            <input type="text" name="college_code" required>
        </div>

        <div class="full-width">
            <label>Address</label>
            <input type="text" name="college_address">
        </div>

        <div>
            <label>City</label>
            <input type="text" name="college_city">
        </div>

        <div>
            <label>Pincode</label>
            <input type="text" name="college_pin">
        </div>
    </div>

    <!-- STUDENT DETAILS -->
    <h2 class="section-title">Student Personal Details</h2>

    <div class="form-grid">
        <div>
            <label>PRN Number</label>
            <input type="text" name="student_prn" required>
        </div>

        <div>
            <label>First Name</label>
            <input type="text" name="student_fname" required>
        </div>

        <div>
            <label>Last Name</label>
            <input type="text" name="student_lname" required>
        </div>

        <div>
            <label>Gender</label>
            <select name="student_gender">
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>
        </div>

        <div>
            <label>Date of Birth</label>
            <input type="date" name="student_dob">
        </div>

        <div>
            <label>Phone</label>
            <input type="text" name="student_phone">
        </div>
        
        <div>
            <label>Aadhar number</label>
            <input type="text" name="student_aadhar">
        </div>

        <div>
            <label>Email</label>
            <input type="email" name="student_email">
        </div>

        <div class="full-width">
            <label>Address</label>
            <input type="text" name="student_address">
        </div>
		
		<div>
            <label>City</label>
            <input type="text" name="student_city">
        </div>

        <div>
            <label>State</label>
            <input type="text" name="student_state">
        </div>

        <div>
            <label>Pincode</label>
            <input type="text" name="student_pin">
        </div>
    </div>
    
    <h2 class="section-title">Student Academic Details</h2>
    <h3 class="section-title">Add 10th Details</h3>
    <div class="form-grid">
    	<div>
            <label>School name</label>
            <input type="text" name="school_name">
        </div>
        
        <div>
            <label>School address</label>
            <input type="text" name="school_address">
        </div>
        
        <div>
            <label>10th Marks (%)</label>
            <input type="text" name="school_marks">
        </div>
        
        <div>
            <label>10th Grade</label>
            <input type="text" name="school_grade">
        </div>
    </div>
    
    <h3 class="section-title">Add 12th Details</h3>
    	<div class="form-grid">
    		<div>
            	<label>Junior College name</label>
            	<input type="text" name="juniorcollege_name">
        	</div>
        
        	<div>
            	<label>Junior College address</label>
            	<input type="text" name="juniorcollege_address">
        	</div>
        
        	<div>
            	<label>12th Marks (%)</label>
            	<input type="text" name="juniorcollege_marks">
        	</div>
        
        	<div>
            	<label>12th Grade</label>
            	<input type="text" name="juniorcollege_grade">
        	</div>
    	</div>
 
    <h3 class="section-title">Add Course Details</h3>
    
     <div class="form-grid">
     	<div>
            <label>Course</label>
            <input type="text" name="course_name">
        </div>

        <div>
            <label>Year</label>
            <select name="course_year">
                <option>First Year</option>
                <option>Second Year</option>
                <option>Third Year</option>
                <option>Last Year</option>
            </select>
        </div>

        <div>
            <label>Part</label>
            <select name="course_semester">
                <option>First</option>
                <option>Second</option>
            </select>
        </div>
        
        <div>
            <label>Admission Date</label>
            <input type="date" name="course_admissiondate">
        </div>
     </div>

    <!-- SAVE BUTTON -->
    <div style="display:flex; justify-content:space-between; margin-top:20px;">
    
    <button type="submit" class="save-btn">
        Save
    </button>

    <button type="button" class="back-btn" onclick="history.back()">
        Back
    </button>

</div>  

</form>
</div>
</body>
</html>
