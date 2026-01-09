<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Office Section</title>

<style>
body {
    font-family: Arial;
    background-color: #F6F0D7;
}
.header {
    text-align: center;
    background: #30608C;
    color: white;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 25px;
}
.guidlines{
    padding: 20px;
    margin: 15px;
    border-radius: 10px;
}
.guidelines ul {
    padding-left: 25px;
}

.guidelines li {
    margin-bottom: 12px;     
    line-height: 1.6;        
    font-size: 16px;
}

.card {
    background: #fff;
    padding: 20px;
    margin: 15px;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
table {
    width: 100%;
    border-collapse: collapse;
}
th, td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    align-item: center;
}
.center {
    text-align: center;
}
.fees-table th,
.fees-table td {
    text-align: center;
}


.pending { color: red; }
.submitted { color: green; }
</style>

</head>
<body>

<div class="header">
    <h1>🏢 Office Section</h1>
</div>

<%
    Map student = (Map) request.getAttribute("student");
    Map fees = (Map) request.getAttribute("fees");
    List<Map<String,String>> documents =
            (List<Map<String,String>>) request.getAttribute("documents");
    List<String> guidelines =
            (List<String>) request.getAttribute("guidelines");
%>

<!-- ================= STUDENT DETAILS ================= -->
<div class="card">
    <h2>Student Details</h2>
    <p><b>Name:</b> <%= student.get("name") %></p>
    <p><b>PRN:</b> <%= student.get("prn") %></p>
    <p><b>Admission Scheme:</b> <%= student.get("scheme") %></p>
</div>

<!-- ================= FEES DETAILS ================= -->
<div class="card">
    <h2>Fees Details</h2>
    <table class="fees-table">
        <tr>
            <th>Total Fees</th>
            <th>Paid Fees</th>
            <th>Pending Fees</th>
            <th>Last Paid</th>
            <th>Deadline</th>
        </tr>
        <%
    		Object total = fees.get("total");
    		Object paid = fees.get("paid");
    		Object pending = fees.get("pending");
    		Object lastPaid = fees.get("lastPaid");
    		Object deadline = fees.get("deadline");
		%>
        <tr>
    		<td>₹<%= (total == null ? "0" : total) %></td>
    		<td>₹<%= (paid == null ? "0" : paid) %></td>
    		<td class="pending">₹<%= (pending == null ? "0" : pending) %></td>
    		<td><%= (lastPaid == null ? "--" : lastPaid) %></td>
    		<td><%= (deadline == null ? "--" : deadline) %></td>
		</tr>
    </table>
</div>

<!-- ================= DOCUMENT CHECKLIST ================= -->
<div class="card">
    <h2>Document Checklist</h2>
    <table>
    <tr>
        <th class="center">Document</th>
        <th class="center">Status</th>
    </tr>

    <%
        for(Map<String,String> doc : documents) {
            String status = doc.get("status");
    %>
    <tr>
        <td class="center"><%= doc.get("name") %></td>
        <td class="center <%= status.equalsIgnoreCase("Pending") ? "pending" : "submitted" %>">
            <%= status %>
        </td>
    </tr>
    <%
        }
    %>
</table>
</div>

<!-- ================= OFFICE GUIDELINES ================= -->
<div class="guidlines">
    <h2>Office & Fees Guidelines</h2>
    <ul>
        <%
            if (guidelines != null && !guidelines.isEmpty()) {
                for (String g : guidelines) {
        %>
            <li><%= g %></li>
        <%
                }
            } else {
        %>
            <li style="color:red;">No guidelines available</li>
        <%
            }
        %>
    </ul>
</div>

</body>
</html>
