package com.college.officesection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OfficeSectionServlet")
public class OfficeSectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String DB_URL =
            "jdbc:mysql://localhost:3306/collegemanagement";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "sahil1212";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prn = request.getParameter("prn"); // logged-in student PRN

        Map<String, Object> student = new HashMap<>();
        Map<String, Object> fees = new HashMap<>();
        List<Map<String, String>> documents = new ArrayList<>();
        List<String> guidelines = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            /* ================= STUDENT DETAILS ================= */
            PreparedStatement psStudent = con.prepareStatement(
                    "SELECT student_name, admission_scheme FROM students WHERE prn=?");
            psStudent.setString(1, prn);
            ResultSet rsStudent = psStudent.executeQuery();

            if (rsStudent.next()) {
                student.put("prn", prn);
                student.put("name", rsStudent.getString("student_name"));
                student.put("scheme", rsStudent.getString("admission_scheme"));
            }

            /* ================= FEES DETAILS ================= */
            PreparedStatement psFees = con.prepareStatement(
                    "SELECT total_fees, paid_fees, pending_fees, last_paid_date, deadline " +
                    "FROM fees_details WHERE prn=?");
            psFees.setString(1, prn);
            ResultSet rsFees = psFees.executeQuery();

            if (rsFees.next()) {
                fees.put("total", rsFees.getInt("total_fees"));
                fees.put("paid", rsFees.getInt("paid_fees"));
                fees.put("pending", rsFees.getInt("pending_fees"));
                fees.put("lastPaid", rsFees.getTimestamp("last_paid_date"));
                fees.put("deadline", rsFees.getDate("deadline"));
            }

            /* ================= DOCUMENT CHECKLIST ================= */
            PreparedStatement psDocs = con.prepareStatement(
                    "SELECT d.doc_name, sd.status " +
                    "FROM documents d " +
                    "LEFT JOIN student_documents sd ON d.doc_id = sd.doc_id AND sd.prn=?");
            psDocs.setString(1, prn);
            ResultSet rsDocs = psDocs.executeQuery();

            while (rsDocs.next()) {
                Map<String, String> doc = new HashMap<>();
                doc.put("name", rsDocs.getString("doc_name"));
                doc.put("status",
                        rsDocs.getString("status") == null ? "Pending" : rsDocs.getString("status"));
                documents.add(doc);
            }

            /* ================= OFFICE GUIDELINES ================= */
            PreparedStatement psGuide = con.prepareStatement(
                    "SELECT guideline FROM office_guidelines");
            ResultSet rsGuide = psGuide.executeQuery();

            while (rsGuide.next()) {
                guidelines.add(rsGuide.getString("guideline"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        /* ================= SEND DATA TO JSP ================= */
        request.setAttribute("student", student);
        request.setAttribute("fees", fees);
        request.setAttribute("documents", documents);
        request.setAttribute("guidelines", guidelines);

        request.getRequestDispatcher("jsp/officesection/officesection.jsp")
               .forward(request, response);
	}

}
