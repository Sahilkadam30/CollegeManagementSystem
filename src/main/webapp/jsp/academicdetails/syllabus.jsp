<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department & Syllabus</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
}

/* Header */
.header {
	text-align: center;
    background: #9D8960;
    color: white;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 25px;
}

.header h1 {
    margin: 0;
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
    background: #e7f1ff;
    transform: translateY(-1px);
}
.container {
    width: 90%;
    margin: 30px auto;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 25px;
}

.card {
    background: #ffffff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

h2 {
    margin-top: 0;
    color: white;
    background: #9D8960;
    border-radius: 10px;
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
    background: #9D8960;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background: #084298;
}

.result-box {
    margin-top: 15px;
    background: #f8f9fa;
    padding: 15px;
    border-radius: 8px;
}

ul {
    padding-left: 18px;
}
</style>

<script>
function showDepartmentInfo() {
    const dept = document.getElementById("deptInfo").value;
    let info = "";

    if (dept === "CSE") {
        info = `
            <h4>Computer Science Engineering</h4>
            <h4>HOD : Prof. K. S. Jonson</h4>
            <h4>Contact : 78945612396</h4>
            <p>Computer Science Engineering focuses on computers, software, and programming. Students learn languages
            like Java, Python, and C++, along with subjects such as Data Structures, Operating Systems, Databases, 
            Artificial Intelligence, and Web Development. CSE graduates can work as software developers, system engineers, 
            data analysts, or cybersecurity experts.</p>`;
    }
    else if (dept === "ECE") {
        info = `
            <h4>Electronics and Communication Engineering</h4>
            <h4>HOD : Prof. M. B. Thomas</h4>
            <h4>Contact : 5628457895</h4>
            <p>Electronics and Communication Engineering focuses on electronic circuits, communication systems, and 
            signal processing. Students study subjects like Digital Electronics, Microprocessors, Communication Systems, 
            VLSI, and Embedded Systems. ECE engineers work in telecommunications, electronics manufacturing, IoT, and 
            semiconductor industries.</p>`;
    }
    else if (dept === "MECH") {
        info = `
            <h4>Mechanical Engineering</h4>
            <h4>HOD : Prof. A. B. Mob</h4>
            <h4>Contact : 8567210259</h4>
            <p>Mechanical Engineering deals with the design, manufacturing, and maintenance of machines. Students study 
            subjects like Thermodynamics, Fluid Mechanics, Machine Design, and Manufacturing Processes. Mechanical 
            engineers work in industries such as automobiles, aerospace, power plants, and robotics.</p>`;
    }
    else if (dept === "CIVIL") {
        info = `
            <h4>Civil Engineering</h4>
            <h4>HOD : Prof. K. S. Jackson</h4>
            <h4>Contact : 5674985215</h4>
            <p>Civil Engineering focuses on the planning, design, and construction of infrastructure like buildings, 
            bridges, roads, dams, and airports. Key subjects include Structural Engineering, Geotechnical Engineering, 
            Transportation Engineering, and Environmental Engineering. Civil engineers play an important role in 
            nation-building and urban development.</p>`;
    }
    else if (dept === "EE") {
        info = `
            <h4>Electrical Engineering</h4>
            <h4>HOD : Prof. T. Z. Tailor</h4>
            <h4>Contact : 7569854215</h4>
            <p>Electrical Engineering deals with electrical systems, power generation, transmission, and electronic devices.
			Students learn about Power Systems, Control Systems, Electrical Machines, and Renewable Energy. Electrical 
			engineers work in power plants, electrical equipment industries, and energy sectors.</p>`;
    }

    document.getElementById("deptResult").innerHTML = info;
}
</script>

</head>
<body>

	<div class="header">
		<button class="back-btn" onclick="history.back()">Back</button>	
        <h1>Department and Syllabus</h1>
    </div>
<div class="container">

    <!-- CARD 1 : SYLLABUS -->
    <div class="card">
    <h2>📚 View Syllabus</h2>

    <form action="<%= request.getContextPath() %>/SyllabusFetch" method="post">

        <label>-- Select Department --</label>
        <select id="syllabusDept" name="dept" required>
        <option value="" >select option</option>
            <option value="Computer Science and Engineering" name="Computer Science and Engineering">Computer Science and Engineering</option>
            <option value="Electronics and Communication Engineering" name="Electronics and Communication Engineering">Electronics and Communication Engineering</option>
            <option value="Mechanical Engineering" name="Mechanical Engineering">Mechanical Engineering</option>
            <option value="Civil Engineering" name="Civil Engineering">Civil Engineering</option>
            <option value="Electrical Engineering" name="Electrical Engineering">Electrical Engineering</option>
        </select>

        <label>Select Semester</label>
        <select id="semester" name="semester" required>
        	<option value="">-- select option --</option>
            <option value="1" name="1">1</option>
            <option value="2" name="2">2</option>
            <option value="3" name="3">3</option>
            <option value="4" name="4">4</option>
            <option value="5" name="5">5</option>
            <option value="6" name="6">6</option>
            <option value="7" name="7">7</option>
            <option value="8" name="8">8</option>
        </select>

        <button type="submit" class="form-btn">View</button>

    </form>

    
    	<div id="syllabusResult" class="result-box">
			<%
    			ArrayList<String> syllabus =(ArrayList<String>) request.getAttribute("syllabusList");
    			if (syllabus != null) {
			%>
    		<h3>Department: <%=  request.getAttribute("dept_name") %></h3>
    		<h3>Semester: <%=  request.getAttribute("semester_name") %></h4>
			<h3>Subjects: </h3>
    		<% if (!syllabus.isEmpty()) { %>
        		<ul>
            		<% for (String s : syllabus) { %>
                		<li><%= s %></li>
            		<% } %>
        		</ul>
    		<% } else { %>
        		<p>No records found.</p>
    		<% } %>
				<%
    				}
				%>			
		</div>
    	

</div>

    <!-- CARD 2 : DEPARTMENT INFO -->
    <div class="card">
        <h2>🏫 Department Information</h2>

        <label>Select Department</label>
        <select id="deptInfo" onchange="showDepartmentInfo()">
            <option value="">-- Select Department --</option>
            <option value="CSE">Computer Science & Engineering</option>
            <option value="ECE">Electronics & Communication Engineering</option>
            <option value="MECH">Mechanical Engineering</option>
            <option value="CIVIL">Civil Engineering</option>
            <option value="EE">Electrical Engineering</option>
        </select>

        <div id="deptResult" class="result-box"></div>
    </div>

</div>

</body>
</html>
