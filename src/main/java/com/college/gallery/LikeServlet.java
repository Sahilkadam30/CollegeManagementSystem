package com.college.gallery;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String prn = (String) session.getAttribute("prn");

        if (prn == null) {
            response.sendRedirect("loginpage.jsp");
            return;
        }

        int postId = Integer.parseInt(request.getParameter("postId"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/collegemanagement",
                "root", "sahil1212"
            );

            // Prevent duplicate likes
            PreparedStatement ps = con.prepareStatement(
                "INSERT IGNORE INTO gallery_likes (post_id, prn) VALUES (?, ?)");

            ps.setInt(1, postId);
            ps.setString(2, prn);
            ps.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/GalleryView");

    }
}
