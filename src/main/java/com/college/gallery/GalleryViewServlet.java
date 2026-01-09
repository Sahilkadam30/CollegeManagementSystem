package com.college.gallery;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GalleryView")
public class GalleryViewServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> posts = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/collegemanagement",
                "root", "sahil1212"
            );

            PreparedStatement ps = con.prepareStatement(
                "SELECT id, prn, name, message, image, created_at FROM gallery1 ORDER BY id DESC"
            );

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, Object> post = new HashMap<>();
                post.put("id", rs.getInt("id"));
                post.put("prn", rs.getString("prn"));
                post.put("name", rs.getString("name"));
                post.put("message", rs.getString("message"));
                post.put("image", rs.getBytes("image"));
                post.put("time", rs.getTimestamp("created_at"));
                posts.add(post);
                
                PreparedStatement psLike = con.prepareStatement( "SELECT COUNT(*) FROM gallery_likes WHERE post_id=?" ); 
                psLike.setInt(1, rs.getInt("id")); 
                ResultSet rsLike = psLike.executeQuery(); 
                if (rsLike.next()) 
                { 
                	post.put("likes", rsLike.getInt(1)); 
                }
                
                PreparedStatement psComment = con.prepareStatement(
                	    "SELECT name, comment FROM gallery_comments WHERE post_id=? ORDER BY created_at"
                	);
                	psComment.setInt(1, rs.getInt("id"));
                	ResultSet rsComment = psComment.executeQuery();

                	List<Map<String, Object>> comments = new ArrayList<>();

                	while (rsComment.next()) {
                	    Map<String, Object> c = new HashMap<>();
                	    c.put("name", rsComment.getString("name"));
                	    c.put("comment", rsComment.getString("comment"));
                	    comments.add(c);
                	}

                	post.put("comments", comments);
            }
      
            con.close();

            request.setAttribute("posts", posts);
            request.getRequestDispatcher("/jsp/galleryView.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();   
        }
    }
}

