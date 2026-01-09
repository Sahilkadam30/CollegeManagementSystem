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
<title>Club Corner</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #F6F0D7;
}

/* Page Container */
.container {
    width: 90%;
    margin: 30px auto;
}

/* Header */
.header {
	text-align: center;
    background: #173c25;
    color: white;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 25px;
}

.header h1 {
    margin: 0;
}

.back-btn {
    position: absolute;
    top: 30px;
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
/* Grid */
.club-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 20px;
}

/* Club Card */
.club-card {
    background: white;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
    animation: fadeUp 0.6s ease;
}

.club-card:hover {
    transform: translateY(-6px);
}

.club-card h2 {
    margin-top: 0;
    color: #0d6efd;
}

.club-card p {
    font-size: 14px;
    margin: 6px 0;
}

.member-list {
    margin: 8px 0;
    padding-left: 18px;
}

.member-list li {
    font-size: 14px;
}

/* Buttons */
.btn {
    padding: 8px 16px;
    background: #173c25;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin-top: 10px;
}

.btn:hover {
    background: #084298;
}

/* Guidelines */
.guidelines {
    background: white;
    margin-top: 40px;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.1);
}

.guidelines h3 {
    color: #0d6efd;
}

.guidelines ul {
    padding-left: 20px;
}

.guidelines li {
    margin: 10px 0;
    line-height: 1.6;
}

/* Animation */
@keyframes fadeUp {
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

<div class="header">
    <button class="back-btn" onclick="history.back()">Back</button>
        <h1>🎓 Club Corner</h1>
        <p>Explore clubs, connect with coordinators & participate</p>
    </div>
<div class="container">
    

    <!-- Clubs -->
    <div class="club-grid">

        <!-- Technical Club -->
        <div class="club-card">
            <h2>💻 Technical Club</h2>
            <p><b>Activities:</b> Coding, Robotics, AI, Hackathons</p>
            <p><b>Faculty Coordinator:</b> Dr. A. Sharma</p>
            <p>📞 9876543210 | ✉ techfaculty@college.edu</p>
            <p><b>Student Coordinator:</b> Rahul Patil</p>
            <p>📞 9123456780 | ✉ rahul.tech@college.edu</p>

            <ul class="member-list">
                <li>Student 1</li>
                <li>Student 2</li>
                <li>Student 3</li>
                <li>Student 4</li>
                <li>Student 5</li>
            </ul>

            <button class="btn" 
				onclick="location.href='joinclub.jsp?club=Technical Club'">
				Join Club
			</button>
        </div>

        <!-- Cultural Club -->
        <div class="club-card">
            <h2>🎭 Cultural Club</h2>
            <p><b>Activities:</b> Dance, Music, Drama, Festivals</p>
            <p><b>Faculty Coordinator:</b> Prof. Neha Kulkarni</p>
            <p>📞 9988776655 | ✉ cultural@college.edu</p>
            <p><b>Student Coordinator:</b> Sneha Deshmukh</p>
            <p>📞 9012345678 | ✉ sneha.cultural@college.edu</p>

            <ul class="member-list">
                <li>Student 1</li>
                <li>Student 2</li>
                <li>Student 3</li>
                <li>Student 4</li>
                <li>Student 5</li>
            </ul>

            <button class="btn" 
				onclick="location.href='joinclub.jsp?club=Technical Club'">
				Join Club
			</button>
        </div>

        <!-- Sports Club -->
        <div class="club-card">
            <h2>🏏 Sports Club</h2>
            <p><b>Activities:</b> Indoor & Outdoor Sports</p>
            <p><b>Faculty Coordinator:</b> Prof. R. Jadhav</p>
            <p>📞 9090909090 | ✉ sports@college.edu</p>
            <p><b>Student Coordinator:</b> Amit Pawar</p>
            <p>📞 9123987654 | ✉ amit.sports@college.edu</p>

            <ul class="member-list">
                <li>Student 1</li>
                <li>Student 2</li>
                <li>Student 3</li>
                <li>Student 4</li>
                <li>Student 5</li>
            </ul>

            <button class="btn" 
				onclick="location.href='joinclub.jsp?club=Technical Club'">
				Join Club
			</button>
        </div>

        <!-- Literary Club -->
        <div class="club-card">
            <h2>📚 Literary Club</h2>
            <p><b>Activities:</b> Debates, Writing, Quizzes, Public Speaking</p>
            <p><b>Faculty Coordinator:</b> Prof. S. Mehta</p>
            <p>📞 9887766554 | ✉ literary@college.edu</p>
            <p><b>Student Coordinator:</b> Anjali Verma</p>
            <p>📞 9988123456 | ✉ anjali.lit@college.edu</p>

            <ul class="member-list">
                <li>Student 1</li>
                <li>Student 2</li>
                <li>Student 3</li>
                <li>Student 4</li>
                <li>Student 5</li>
            </ul>

            <button class="btn" 
				onclick="location.href='joinclub.jsp?club=Technical Club'">
				Join Club
			</button>
        </div>

        <!-- NSS -->
        <div class="club-card">
            <h2>🤝 NSS / Social Service Club</h2>
            <p><b>Activities:</b> Community Service & Social Work</p>
            <p><b>Faculty Coordinator:</b> Prof. K. Patil</p>
            <p>📞 9876001122 | ✉ nss@college.edu</p>
            <p><b>Student Coordinator:</b> Riya Joshi</p>
            <p>📞 9099887766 | ✉ riya.nss@college.edu</p>

            <ul class="member-list">
                <li>Student 1</li>
                <li>Student 2</li>
                <li>Student 3</li>
                <li>Student 4</li>
                <li>Student 5</li>
            </ul>

            <button class="btn" 
				onclick="location.href='joinclub.jsp?club=Technical Club'">
				Join Club
			</button>
        </div>
        
        <!-- environmental club -->
        
        <div class="club-card">
            <h2>🌍 Environmental / Eco Club</h2>
            <p><b>Activities:</b>Environment awareness activities</p>
            <p><b>Faculty Coordinator:</b> Prof. M. Deshmukh</p>
            <p>📞 8549687521 | ✉ eco@college.edu</p>
            <p><b>Student Coordinator:</b> parag mehta</p>
            <p>📞 9548762541 | ✉ parag.eco@college.edu</p>

            <ul class="member-list">
                <li>Student 1</li>
                <li>Student 2</li>
                <li>Student 3</li>
                <li>Student 4</li>
                <li>Student 5</li>
            </ul>

            <button class="btn" 
				onclick="location.href='joinclub.jsp?club=Technical Club'">
				Join Club
			</button>
        </div>
        
        <!-- science club -->
        <div class="club-card">
            <h2>🔬 Science / Innovation Club</h2>
            <p><b>Activities:</b>Research, projects, exhibitions</p>
            <p><b>Faculty Coordinator:</b> Prof. R. magar</p>
            <p>📞 7548965845 | ✉ science@college.edu</p>
            <p><b>Student Coordinator:</b> Raghav Chopra</p>
            <p>📞 8956284578 | ✉ raghav.sciencce@college.edu</p>

            <ul class="member-list">
                <li>Student 1</li>
                <li>Student 2</li>
                <li>Student 3</li>
                <li>Student 4</li>
                <li>Student 5</li>
            </ul>

            <button class="btn" 
				onclick="location.href='joinclub.jsp?club=Technical Club'">
				Join Club
			</button>
        </div>
        
        <!-- Photography / Media Club -->
        <div class="club-card">
            <h2>📸 Photography / Media Club </h2>
            <p><b>Activities:</b>Photography, videography, editing</p>
            <p><b>Faculty Coordinator:</b> Prof. T. Desai</p>
            <p>📞 8547968521 | ✉ media@college.edu</p>
            <p><b>Student Coordinator:</b> Veer Kapoor</p>
            <p>📞 6954857958 | ✉ veer.media@college.edu</p>

            <ul class="member-list">
                <li>Student 1</li>
                <li>Student 2</li>
                <li>Student 3</li>
                <li>Student 4</li>
                <li>Student 5</li>
            </ul>

            <button class="btn" 
				onclick="location.href='joinclub.jsp?club=Technical Club'">
				Join Club
			</button>

        </div>

    </div>

    <!-- Guidelines -->
    <div class="guidelines">
        <h3>📌 Guidelines for Club Membership</h3>
        <ul>
            <li>All currently enrolled students are eligible to apply.</li>
            <li>Registration must be completed within the given deadline.</li>
            <li>Students should show genuine interest and commitment.</li>
            <li>Regular attendance in meetings and events is mandatory.</li>
            <li>Maintain discipline and respectful conduct.</li>
            <li>Participation requires prior approval from coordinators.</li>
            <li>Teamwork and cooperation are expected.</li>
            <li>Assigned responsibilities must be completed on time.</li>
            <li>Misconduct may lead to cancellation of membership.</li>
            <li>College reserves the right to remove inactive members.</li>
        </ul>
    </div>

</div>

</body>
</html>
