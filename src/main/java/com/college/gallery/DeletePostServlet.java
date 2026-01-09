package com.college.gallery;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {

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

            // 🔒 Check owner
            PreparedStatement check = con.prepareStatement(
                "SELECT prn FROM gallery1 WHERE id=?"
            );
            check.setInt(1, postId);

            var rs = check.executeQuery();
            if (!rs.next() || !prn.equals(rs.getString("prn"))) {
                con.close();
                response.sendRedirect(request.getContextPath() + "/GalleryView");
                return;
            }

            // Delete likes
            PreparedStatement psLikes = con.prepareStatement(
                "DELETE FROM gallery_likes WHERE post_id=?"
            );
            psLikes.setInt(1, postId);
            psLikes.executeUpdate();

            // Delete comments
            PreparedStatement psComments = con.prepareStatement(
                "DELETE FROM gallery_comments WHERE post_id=?"
            );
            psComments.setInt(1, postId);
            psComments.executeUpdate();

            // Delete post
            PreparedStatement psPost = con.prepareStatement(
                "DELETE FROM gallery1 WHERE id=?"
            );
            psPost.setInt(1, postId);
            psPost.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/GalleryView");
    }
}
