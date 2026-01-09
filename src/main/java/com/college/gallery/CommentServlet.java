package com.college.gallery;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String prn = (String) session.getAttribute("prn");
        String name = (String) session.getAttribute("name");

        if (prn == null) {
            response.sendRedirect("loginpage.jsp");
            return;
        }

        int postId = Integer.parseInt(request.getParameter("postId"));
        String comment = request.getParameter("comment");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/collegemanagement",
                "root", "sahil1212"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO gallery_comments (post_id, prn, name, comment) VALUES (?, ?, ?, ?)"
            );

            ps.setInt(1, postId);
            ps.setString(2, prn);
            ps.setString(3, name);
            ps.setString(4, comment);

            ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/GalleryView");
    }
}
