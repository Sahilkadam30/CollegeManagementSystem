package com.college.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);

	        if (session == null || session.getAttribute("prn") == null) {
	            response.sendRedirect("/jsp/Loginpage.jsp");
	            return;
	        }

	        RequestDispatcher rd = request.getRequestDispatcher("/jsp/dashboard.jsp");
	        rd.forward(request, response);
	}

}
