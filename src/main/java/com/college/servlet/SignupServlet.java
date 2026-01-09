package com.college.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String prn = request.getParameter("prn");
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        String encryptedPassword = PasswordUtil.encryptPassword(password);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/collegemanagement", "root", "sahil1212");

            PreparedStatement ps = con.prepareStatement(
            	    "INSERT INTO student (prn, name, password) VALUES (?, ?, ?)"
            	);
            ps.setString(1, prn);
            ps.setString(2, name);
            ps.setString(3, encryptedPassword);

            ps.executeUpdate();

            HttpSession session = request.getSession();
            session.setAttribute("prn", prn);
            session.setAttribute("name", name);

            request.getRequestDispatcher("/jsp/dashboard.jsp")
                   .forward(request, response);

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
