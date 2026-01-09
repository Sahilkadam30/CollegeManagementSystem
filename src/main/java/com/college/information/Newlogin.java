package com.college.information;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Newlogin")
public class Newlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String student_prn = request.getParameter("student_prn");
		// for student college details
		String college_name = request.getParameter("college_name");
        String college_code = request.getParameter("college_code");
        String college_address = request.getParameter("college_address");
        String college_city = request.getParameter("college_city");
        int college_pin = Integer.parseInt(request.getParameter("college_pin"));
        
        // for student personal details
//        String student_prn = request.getParameter("student_prn");
        String student_fname = request.getParameter("student_fname");
        String student_lname = request.getParameter("student_lname");
        String student_gender = request.getParameter("student_gender");
        String student_dob_str = request.getParameter("student_dob");
        java.sql.Date student_dob = java.sql.Date.valueOf(student_dob_str);

        String student_phone = request.getParameter("student_phone");
        String student_aadhar = request.getParameter("student_aadhar");
        String student_email = request.getParameter("student_email");
        String student_address = request.getParameter("student_address");
        String student_city = request.getParameter("student_city");
        String student_state = request.getParameter("student_state");
        int student_pin = Integer.parseInt(request.getParameter("student_pin"));
        
        // for student academic details
        String school_name = request.getParameter("school_name");
        String school_address = request.getParameter("school_address");
        double school_marks = Double.parseDouble(request.getParameter("school_marks"));
        String school_grade = request.getParameter("school_grade");
        String juniorcollege_name = request.getParameter("juniorcollege_name");
        String juniorcollege_address = request.getParameter("juniorcollege_address");
        double juniorcollege_marks = Double.parseDouble(request.getParameter("juniorcollege_marks"));
        String juniorcollege_grade = request.getParameter("juniorcollege_grade");
        
        // for student course details
        String course_name = request.getParameter("course_name");
        String course_year = request.getParameter("course_year");
        String course_semester = request.getParameter("course_semester");
        String course_admissiondate = request.getParameter("course_admissiondate");
        
        String url ="jdbc:mysql://localhost:3306/collegemanagement";
		String uname="root";
		String pass = "sahil1212";
        
		Connection con=null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection(url,uname, pass);
        	con.setAutoCommit(false);
        	// for student college details
        	PreparedStatement ps = con.prepareStatement(
        		    "INSERT INTO StudentCollegeDetails (student_prn,college_name, college_code, college_address, college_city, college_pin) "
        		  + "VALUES (?, ?, ?, ?, ?, ?)"
        		);
        	
        	ps.setString(1, student_prn);
        	ps.setString(2, college_name);
            ps.setString(3, college_code);
            ps.setString(4, college_address);
            ps.setString(5, college_city);
            ps.setInt(6, college_pin);
            int p1 = ps.executeUpdate();
            
         // for student personal details
            ps = con.prepareStatement(
            	    "INSERT INTO StudentPersonalDetails " +
            	    "(student_prn, student_fname, student_lname, student_gender, student_dob, " +
            	    " student_phone, student_aadhar, student_email, student_address, student_city, " +
            	    " student_state, student_pin) " +
            	    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
            	);

            	ps.setString(1, student_prn);
            	ps.setString(2, student_fname);
            	ps.setString(3, student_lname);
            	ps.setString(4, student_gender);
            	ps.setDate(5, student_dob);
            	ps.setString(6, student_phone);
            	ps.setString(7, student_aadhar);
            	ps.setString(8, student_email);
            	ps.setString(9, student_address);
            	ps.setString(10, student_city);
            	ps.setString(11, student_state);
            	ps.setInt(12, student_pin);

            	int p2 = ps.executeUpdate();
            	
            // for student academic details
            	ps = con.prepareStatement(
            		    "INSERT INTO StudentAcademicDetails " +
            		    "(student_prn, school_name, school_address, school_marks, school_grade, " +
            		    " juniorcollege_name, juniorcollege_address, juniorcollege_marks, juniorcollege_grade) " +
            		    "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)"
            		);
            	
            	ps.setString(1, student_prn);
            	ps.setString(2, school_name);
            	ps.setString(3, school_address);
            	ps.setDouble(4, school_marks);
            	ps.setString(5, school_grade);
            	ps.setString(6, juniorcollege_name);
            	ps.setString(7, juniorcollege_address);
            	ps.setDouble(8, juniorcollege_marks);
            	ps.setString(9, juniorcollege_grade);

            	int p3 = ps.executeUpdate();
            // for student course details	
            ps = con.prepareStatement(
            		   "INSERT INTO StudentCourseDetails " +
            		   "(student_prn, course_name, course_year, course_semester, course_admissiondate) " +
            		   "VALUES (?, ?, ?, ?, ?)"
            	);   
            ps.setString(1, student_prn);
            ps.setString(2, course_name);
            ps.setString(3, course_year);
            ps.setString(4, course_semester);
            ps.setString(5, course_admissiondate);
            
            int p4 = ps.executeUpdate();
            
            if(p1 > 0 && p2 > 0 && p3 > 0 && p4 > 0) {
                con.commit();
                session.setAttribute("prn", student_prn);
                out.println("<script>");
                out.println("var choice = confirm('Save information?');");
                out.println("if(choice){");
                out.println("  window.location='" + request.getContextPath() + "/jsp/dashboard.jsp';");
                out.println("} else {");
                out.println("  window.location='" + request.getContextPath() + "/jsp/newstudent.jsp';");
                out.println("}");
                out.println("</script>");
                
            } else {
            	con.rollback();

                out.println("<script>");
                out.println("alert('Invalid credentials. Failed to save information');");
                out.println("window.location='/jsp/newstudent.jsp';");
                out.println("</script>");   
            }
            ps.close();
        }
        catch(Exception e) {
        	e.printStackTrace();
            try {
                if(con != null) con.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            out.println("<script>");
            out.println("alert('Something went wrong while saving data');");
            out.println("window.location='/jsp/newstudent.jsp';");
            out.println("</script>");
        }
        finally {
        	if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
		}
	}
}
