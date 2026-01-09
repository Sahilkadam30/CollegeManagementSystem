package com.college.gallery;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadGalleryServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,   // 1mb
    maxFileSize = 1024 * 1024 * 16,     // 16mb
    maxRequestSize = 1024 * 1024 * 20   // 20mb
)
public class UploadGalleryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prn = (String) request.getSession().getAttribute("prn");
        String name = (String) request.getSession().getAttribute("name");
        String message = request.getParameter("message");

        Part photoPart = request.getPart("photo");

        if (prn == null || name == null) {
            response.sendRedirect("loginpage.jsp");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/collegemanagement",
                "root",
                "sahil1212"
            );

            String sql = "INSERT INTO gallery1 (prn, name, message, image) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, prn);
            ps.setString(2, name);
            ps.setString(3, message);

            InputStream is = photoPart.getInputStream();
            ps.setBlob(4, is);

            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect(request.getContextPath() + "/GalleryView"); 

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Upload failed");
        }
	}

}
