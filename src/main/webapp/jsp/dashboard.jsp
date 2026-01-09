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
<title>Student Dashboard</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #F6F0D7;
    }
    
	html {
    scroll-behavior: smooth;
	}
	
    .profile-container {
    position: relative;
	}
	
	.header {
    background-color: #4a6fa5;
    color: white;
    padding-left: 10px;
    padding-right: 20px;
    display: flex;                    
    justify-content: space-between;   
    align-items: center; 
    position: sticky;
    top: 0;
    z-index: 1000;            

    animation: slideDown 0.8s ease-out;
	}

	.profile-circle {
    	width: 42px;
    	height: 42px;
    	background-color: black;
    	border-radius: 50%;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    	cursor: pointer;
    	position: relative;
	}

	.profile-circle::after {
    	content: "";
    	width: 10px;
   	 	height: 10px;
    	background-color: #2ecc71;
    	border-radius: 50%;
    	position: absolute;
    	bottom: 4px;
    	right: 4px;
    	border: 2px solid white;
	}

	.profile-dropdown {
    	position: absolute;
    	top: 55px;
    	right: 0;
    	width: 240px;
    	background-color: white;
    	border-radius: 10px;
    	padding: 15px;
    	box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    	opacity: 0;
    	visibility: hidden;
    	transform: translateY(10px);
    	transition: all 0.3s ease;
    	z-index: 1000;
	}

	.profile-container:hover .profile-dropdown {
    	opacity: 1;
    	visibility: visible;
    	transform: translateY(0);
	}

	.profile-dropdown h3 {
    	margin: 0 0 10px;
    	color: #2f4f7f;
    	font-size: 18px;
    	margin-bottom: 12px;;
	}

	.profile-dropdown p {
    	margin: 4px 0;
    	font-size: 14px;
    	color: #333;
    	line-height: 1.6;
	}

	.logout-btn {
    	display: block;
    	margin-top: 12px;
    	text-align: center;
    	background-color: #e74c3c;
    	color: white;
    	padding: 8px;
    	border-radius: 6px;
    	text-decoration: none;
    	font-weight: bold;
	}

	.logout-btn:hover {
    	background-color: #c0392b;
	}

    .container {
        padding: 40px;
    }

    .welcome-box {
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        margin-bottom: 30px;
    }
    .welcome-box {
    background-color: #eef4fb;
    border-left: 6px solid #d6a400;
	}
    

    .cards {
    	display: grid;
    	grid-template-columns: repeat(3, 1fr); 
   		gap: 30px;
	}

    .card {
        flex: 1;
        height:200px;
        height:200px;
        background-color: #9CAB84;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 8px rgba(0,0,0,0.1);
        text-align: center;
    }

    .card h2 {
        color: white;
        margin-bottom: 10px;
    }

    .card p {
        color: black;
    }
    .card-link {
    	text-decoration: none;
    	color: inherit;
	}

	.card {
    	cursor: pointer;
    	transition: transform 0.2s ease, box-shadow 0.2s ease;
	}

	.card:hover {
    	transform: translateY(-5px);
    	box-shadow: 0 4px 15px rgba(0,0,0,0.15);
	}
    
 
	.header {
    	animation: slideDown 0.8s ease-out;
	}

	.welcome-box {
    	animation: fadeUp 0.9s ease-out;
	}
	.card {
    	opacity: 0;
    	animation: cardFade 0.8s ease forwards;
	}
	
	.card h2{
		text-decoration: none;
		color: black;
	}
	
	.card p{
		text-decoration: none;
		color: black;
	}
	
	.card:nth-child(1) { animation-delay: 0.1s; }
	.card:nth-child(2) { animation-delay: 0.2s; }
	.card:nth-child(3) { animation-delay: 0.3s; }
	.card:nth-child(4) { animation-delay: 0.4s; }
	.card:nth-child(5) { animation-delay: 0.5s; }
	.card:nth-child(6) { animation-delay: 0.6s; }
	.card:nth-child(7) { animation-delay: 0.7s; }
	.card:nth-child(8) { animation-delay: 0.8s; }
	.card:nth-child(9) { animation-delay: 0.9s; }
	.card:nth-child(10) { animation-delay: 0.9s; }

	@keyframes slideDown {
    	from {
        	opacity: 0;
        	transform: translateY(-30px);
    	}
    	to {
        	opacity: 1;
        	transform: translateY(0);
    	}
	}

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

	@keyframes cardFade {
    	from {
        	opacity: 0;
        	transform: translateY(30px) scale(0.95);
    	}
    	to {
        	opacity: 1;
        	transform: translateY(0) scale(1);
    	}
	}
    
</style>

</head>
<body>

<div class="header">
    <h1>College Management System</h1>

    <div class="profile-container">
        <div class="profile-circle">
            <span>✔</span>
        </div>

        <div class="profile-dropdown">
            <h3><%= session.getAttribute("name") %></h3>
            <p><b>PRN:</b> <%= session.getAttribute("prn") %></p>
            <p><b>Year:</b> <%= session.getAttribute("year") %></p>
            <p><b>Mobile:</b> <%= session.getAttribute("mobile") %></p>
            <p><b>Email:</b> <%= session.getAttribute("email") %></p>

            <a href="logout.jsp" class="logout-btn">Logout</a>
        </div>
    </div>
</div>


<div class="container">

    <div class="welcome-box">
    	<h1 class="welcome-title">
       	 	<span class="welcome-icon">🎓</span>
        		Welcome, <%= session.getAttribute("name") %>
        	<span class="wave">👋</span>
    	</h1>
    	<p><b>PRN Number:</b> <%= session.getAttribute("prn") %></p>
    	<p class="welcome-msg">You have successfully logged in to the student portal.</p>
	</div>


    <div class="cards">
    	
    	<a href="<%= request.getContextPath() %>/jsp/newstudent.jsp" class="card-link">
    		<div class="card">
            	<h2>New student login</h2>
            	<p>Enter student details</p>
        	</div>
        </a>
        
        <a href="<%= request.getContextPath() %>/jsp/Myprofile.jsp" class="card-link">
        	<div class="card">
            	<h2>My Profile</h2>
            	<p>View and update your personal details</p>
        	</div>
		</a>
		
		<a href="<%= request.getContextPath() %>/jsp/academicdetails/academicdetails.jsp" class="card-link">
        	<div class="card">
            	<h2>Academic Details</h2>
            	<p>View marks, subjects and results</p>
        	</div>
        </a>
        
        <a href="<%= request.getContextPath() %>/jsp/academicdetails/syllabus.jsp" class="card-link">
        	<div class="card">
            	<h2>department and syllabus</h2>
            	<p>syllabus and department information</p>
        	</div>
        </a>
        
        <a href="<%=request.getContextPath()%>/GalleryView" class="card-link">
        	<div class="card">
            	<h2>Gallery</h2>
            	<p>college events photographs</p>
        	</div>
        </a>
        
        <a href="<%= request.getContextPath() %>/jsp/eventmanagement/eventmanagement.jsp" class="card-link">
        	<div class="card">
            	<h2>Event Management</h2>
            	<p>add update and view event</p>
        	</div>
        </a>
        
        <a href="<%= request.getContextPath() %>/jsp/clubcorner/clubcorner.jsp" class="card-link">
        	<div class="card">
            	<h2>Club Corner</h2>
            	<p>various club activities</p>
        	</div>
		</a>
		
		<a href="<%= request.getContextPath() %>/jsp/notification/notification.jsp" class="card-link">
        	<div class="card">
            	<h2>Notifications</h2>
            	<p>Check latest college updates</p>
       	 	</div>
       	 </a>
        
        <a href="<%= request.getContextPath() %>/jsp/placementupdates/placementupdates.jsp" class="card-link">
        	<div class="card">
            	<h2>Placement updates</h2>
            	<p>Check latest placement updates and upcoming compnies</p>
        	</div>
        </a>
        
        <a href="<%= request.getContextPath() %>/OfficeSectionServlet" class="card-link">
        	<div class="card">
            	<h2>Office Section</h2>
            	<p>Review Documents, Scholarship and fees</p>
        	</div>
        </a>
        
        <a href="<%= request.getContextPath() %>/jsp/placementupdates/placementupdates.jsp" class="card-link">
        	<div class="card">
            	<h2>Transport Department</h2>
            	<p>Check Buses, Route and Pass System</p>
        	</div>
        </a>
        
        <a href="<%= request.getContextPath() %>/jsp/placementupdates/placementupdates.jsp" class="card-link">
        	<div class="card">
            	<h2>Hostel / PG</h2>
            	<p>Check Hostel Avalability and Process</p>
        	</div>
        </a>

    </div>

</div>

</body>
</html>

