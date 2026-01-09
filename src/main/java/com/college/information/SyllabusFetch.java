package com.college.information;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SyllabusFetch")
public class SyllabusFetch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url ="jdbc:mysql://localhost:3306/collegemanagement";
		String uname="root";
		String pass = "sahil1212";
	    
	    String deptname = request.getParameter("dept");
	    String semesterStr = request.getParameter("semester");
	    int semester = Integer.parseInt(semesterStr);
	    
	    ArrayList<String> syllabusarray = new ArrayList<>();
		
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
    		con = DriverManager.getConnection(url,uname, pass);
        	con.setAutoCommit(false);
        	
        	String sql = "SELECT subject_1, subject_2, subject_3, subject_4, subject_5 " +
                    "FROM studentsyllabus WHERE semester_no = ? AND dept_name = ?";
        	
        	ps=con.prepareStatement(sql);
        	ps.setInt(1, semester);
        	ps.setString(2, deptname);
        	
        	rs=ps.executeQuery();
        	
        	if (rs.next()) {
        		syllabusarray.add(rs.getString("subject_1"));
        		syllabusarray.add(rs.getString("subject_2"));
        		syllabusarray.add(rs.getString("subject_3"));
        		syllabusarray.add(rs.getString("subject_4"));
        		syllabusarray.add(rs.getString("subject_5"));
            }
        	
        	request.setAttribute("syllabusList", syllabusarray);
        	request.setAttribute("semester_name", semester);
    	    request.setAttribute("dept_name", deptname);
        	
    	    request.getRequestDispatcher("/jsp/academicdetails/syllabus.jsp")
    	       .forward(request, response);

		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
