<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Placement Updates</title>

<style>
body {
    font-family: Arial, sans-serif;
    background:  #F6F0D7;
    margin: 0;
    padding: 20px;
}


/* Header */
.header {
	text-align: center;
    position: relative;
    background:#BA7B1B;
    color: #fff;
    padding: 20px 20px 20px 60px;
    border-radius: 12px;
    animation: fadeSlide 0.6s ease;
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
.card-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 20px;
    margin-top: 30px;
}

.card {
    background: #ffffff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.card h2 {
    color: #2980b9;
    margin-bottom: 10px;
}

.card p {
    margin: 6px 0;
    color: #333;
    font-size: 14px;
}

.card strong {
    color: #000;
}

.apply-btn {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 15px;
    background: #BA7B1B;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-size: 14px;
}

.apply-btn:hover {
    background: #219150;
}

.contact-section {
    margin-top: 40px;
    background: #ffffff;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.contact-section h2 {
    color: #2c3e50;
    margin-bottom: 15px;
}
</style>

</head>
<body>

	<div class="header">
		<button class="back-btn" onclick="history.back()">Back</button>	
        <h1>📢 Placement Updates</h1>
    </div>

<div class="card-container">
    <!-- Company Card 1 -->
    <div class="card">
        <h2>TCS</h2>
        <p><strong>Expected Package:</strong> ₹4 – 7 LPA</p>
        <p><strong>Designation:</strong> Software Engineer</p>
        <p><strong>Mark Criteria:</strong> Minimum 60% in all academics</p>
        <p><strong>Preferred Technologies:</strong> Java, SQL, Web Technologies</p>
        <p><strong>Company Info:</strong> Tata Consultancy Services is a leading global IT services company.</p>
        <p><strong>Interview Process:</strong> Online Test → Technical → HR</p>
        <p><strong>Deadline to Apply:</strong> 30 September 2025</p>

        <a href="https://www.tcs.com/careers" target="_blank" class="apply-btn">Apply Now</a>
    </div>

    <!-- Company Card 2 -->
    <div class="card">
        <h2>Infosys</h2>
        <p><strong>Expected Package:</strong> ₹3.6 – 8 LPA</p>
        <p><strong>Designation:</strong> System Engineer</p>
        <p><strong>Mark Criteria:</strong> Minimum 65%</p>
        <p><strong>Preferred Technologies:</strong> Java, Python, DBMS</p>
        <p><strong>Company Info:</strong> Infosys provides digital transformation and consulting services.</p>
        <p><strong>Interview Process:</strong> Aptitude → Technical → HR</p>
        <p><strong>Deadline to Apply:</strong> 5 October 2025</p>

        <a href="https://www.infosys.com/careers" target="_blank" class="apply-btn">Apply Now</a>
    </div>

    <!-- Company Card 3 -->
    <div class="card">
        <h2>Wipro</h2>
        <p><strong>Expected Package:</strong> ₹3.5 – 6.5 LPA</p>
        <p><strong>Designation:</strong> Project Engineer</p>
        <p><strong>Mark Criteria:</strong> 60% throughout</p>
        <p><strong>Preferred Technologies:</strong> C, Java, Cloud Basics</p>
        <p><strong>Company Info:</strong> Wipro is a multinational IT and consulting company.</p>
        <p><strong>Interview Process:</strong> Written Test → Technical → HR</p>
        <p><strong>Deadline to Apply:</strong> 10 October 2025</p>

        <a href="https://careers.wipro.com" target="_blank" class="apply-btn">Apply Now</a>
    </div>

</div>

<!-- Contact Section -->
<div class="contact-section">
    <h2>📞 Training & Placement Office – Contact Details</h2>

    <p><strong>Office Contact Number:</strong> 0251-123456</p>
    <p><strong>Email:</strong> placement@engineeringcollege.edu</p>

    <p><strong>Placement Coordinator:</strong> Mr. Rahul Sharma</p>
    <p><strong>Phone Number:</strong> 0251-654321</p>
    <p><strong>Mobile Number:</strong> +91 98765 43210</p>

    <p>If you have any queries regarding placement updates, feel free to contact the Training and Placement Office.</p>
</div>

</body>
</html>
