package com.college.filter;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter(urlPatterns = {
		"/jsp/Loginpage.jsp",
		"/jsp/Signup.jsp",
        "/jsp/dashboard.jsp",
        "/jsp/Myprofile.jsp"
})
public class StudentDataFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("prn") == null) {
            chain.doFilter(request, response);
            return;
        }

        // Avoid fetching again if data already exists
        if (session.getAttribute("fname") != null) {
            chain.doFilter(request, response);
            return;
        }

        int prn = Integer.parseInt(session.getAttribute("prn").toString());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/collegemanagement",
                    "root",
                    "sahil1212");

            /* ================= PERSONAL DETAILS ================= */
            PreparedStatement ps1 = con.prepareStatement(
                    "SELECT * FROM StudentPersonalDetails WHERE student_prn = ?");
            ps1.setInt(1, prn);
            ResultSet rs1 = ps1.executeQuery();

            if (rs1.next()) {
            	session.setAttribute("fname", rs1.getString("student_fname"));
                session.setAttribute("lname", rs1.getString("student_lname"));

                session.setAttribute(
                    "name",
                    rs1.getString("student_fname") + " " + rs1.getString("student_lname")
                );
                session.setAttribute("gender", rs1.getString("student_gender"));
                session.setAttribute("dob", rs1.getDate("student_dob"));
                session.setAttribute("mobile", rs1.getString("student_phone"));
                session.setAttribute("aadhar", rs1.getString("student_aadhar"));
                session.setAttribute("email", rs1.getString("student_email"));
                session.setAttribute("address", rs1.getString("student_address"));
                session.setAttribute("city", rs1.getString("student_city"));
                session.setAttribute("state", rs1.getString("student_state"));
                session.setAttribute("pin", rs1.getInt("student_pin"));
            }

            /* ================= COURSE DETAILS ================= */
            PreparedStatement ps2 = con.prepareStatement(
                    "SELECT * FROM StudentCourseDetails WHERE student_prn = ?");
            ps2.setInt(1, prn);
            ResultSet rs2 = ps2.executeQuery();

            if (rs2.next()) {
                session.setAttribute("course_name", rs2.getString("course_name"));
                session.setAttribute("year", rs2.getString("course_year"));
                session.setAttribute("semester", rs2.getString("course_semester"));
                session.setAttribute("admissiondate", rs2.getString("course_admissiondate"));
            }

            /* ================= ACADEMIC DETAILS ================= */
            PreparedStatement ps3 = con.prepareStatement(
                    "SELECT * FROM StudentAcademicDetails WHERE student_prn = ?");
            ps3.setInt(1, prn);
            ResultSet rs3 = ps3.executeQuery();

            if (rs3.next()) {
                session.setAttribute("schoolName", rs3.getString("school_name"));
                session.setAttribute("schoolAddress", rs3.getString("school_address"));
                session.setAttribute("schoolMarks", rs3.getBigDecimal("school_marks"));
                session.setAttribute("schoolGrade", rs3.getString("school_grade"));
                session.setAttribute("jcName", rs3.getString("juniorcollege_name"));
                session.setAttribute("jcAddress", rs3.getString("juniorcollege_address"));
                session.setAttribute("jcMarks", rs3.getBigDecimal("juniorcollege_marks"));
                session.setAttribute("jcGrade", rs3.getString("juniorcollege_grade"));
            }

            /* ================= COLLEGE DETAILS ================= */
            PreparedStatement ps4 = con.prepareStatement(
            	    "SELECT * FROM StudentCollegeDetails WHERE student_prn = ?"
            	);
            	ps4.setInt(1, prn);
            	ResultSet rs4 = ps4.executeQuery();

            if (rs4.next()) {
                session.setAttribute("collegeName", rs4.getString("college_name"));
                session.setAttribute("collegeCode", rs4.getString("college_code"));
                session.setAttribute("collegeAddress", rs4.getString("college_address"));
                session.setAttribute("collegeCity", rs4.getString("college_city"));
                session.setAttribute("collegePin", rs4.getInt("college_pin"));
            }
            


            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // VERY IMPORTANT: allow request to continue
        chain.doFilter(request, response);
    }
}
