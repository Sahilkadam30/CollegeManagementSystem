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

@WebServlet("/Updateinformation")
public class Updateinformation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String url ="jdbc:mysql://localhost:3306/collegemanagement";
		String uname="root";
		String pass = "sahil1212";
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection(url,uname, pass);
        	con.setAutoCommit(false);
        	
        	String sqlPersonal =
        		    "UPDATE StudentPersonalDetails SET " +
        		    "student_phone = ?, " +
        		    "student_address = ?, " +
        		    "student_aadhar = ?, " +
        		    "student_city = ? " +
        		    "WHERE student_prn = ?";
        	
        	PreparedStatement ps1 = con.prepareStatement(sqlPersonal);

        	ps1.setString(1, request.getParameter("mobile"));
        	ps1.setString(2, request.getParameter("address"));
        	ps1.setString(3, request.getParameter("aadhar"));
        	ps1.setString(4, request.getParameter("city"));
        	ps1.setInt(5, Integer.parseInt(session.getAttribute("prn").toString()));

        	int p1=ps1.executeUpdate();
        	
        	String sqlCourse =
        		    "UPDATE StudentCourseDetails SET " +
        		    "course_name = ?, " +
        		    "course_admissiondate = ? " +
        		    "WHERE student_prn = ?";
        	
        	PreparedStatement ps2 = con.prepareStatement(sqlCourse);

        	ps2.setString(1, request.getParameter("course"));
        	ps2.setDate(2, java.sql.Date.valueOf(
        	        request.getParameter("admissionDate")));
        	ps2.setInt(3, Integer.parseInt(session.getAttribute("prn").toString()));

        	int p2=ps2.executeUpdate();
        	
        	if(p1 > 0 && p2 > 0) {
                con.commit();
                out.println("<script>");
                out.println("var choice = confirm('Save information?');");
                out.println("if(choice){");
                out.println("  window.location='" + request.getContextPath() + "/jsp/dashboard.jsp';");
                out.println("} else {");
                out.println("  window.location='" + request.getContextPath() + "/jsp/Myprofile.jsp';");
                out.println("}");
                out.println("</script>");
                
            } else {
            	con.rollback();

                out.println("<script>");
                out.println("alert('Invalid credentials. Failed to save information');");
                out.println("window.location='\" + request.getContextPath() + \"/jsp/Myprofile.jsp';");
                out.println("</script>");   
            }
        	session.setAttribute("mobile", request.getParameter("mobile"));
        	session.setAttribute("address", request.getParameter("address"));
        	session.setAttribute("aadhar", request.getParameter("aadhar"));
        	session.setAttribute("city", request.getParameter("city"));
        	session.setAttribute("course", request.getParameter("course"));
        	session.setAttribute("admissiondate", request.getParameter("admissionDate"));

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
            out.println("window.location='/jsp/dashboard.jsp';");
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
