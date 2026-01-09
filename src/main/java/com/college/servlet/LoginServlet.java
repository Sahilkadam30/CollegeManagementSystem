package com.college.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String student_prn = request.getParameter("prn");
        String password = request.getParameter("password");

        String encryptedPassword = PasswordUtil.encryptPassword(password);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/collegemanagement", "root", "sahil1212");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM student WHERE prn=? AND password=?");
            ps.setString(1, student_prn);
            ps.setString(2, encryptedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("prn", student_prn);
                session.setAttribute("name", rs.getString("name"));

                request.getRequestDispatcher("/jsp/dashboard.jsp").forward(request, response);
 
            } else {
            	out.println("<h2 style='color:red'> INVALID CREDENTIAL TRY AGAIN </h2>");
            	request.getRequestDispatcher("/jsp/Loginpage.jsp").include(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
