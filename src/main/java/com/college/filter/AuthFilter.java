package com.college.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

@WebFilter(urlPatterns = {
        "/jsp/*",
        "/DashboardServlet",
        "/Newlogin",
        "/Updateinformation"
})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();

        // Allow public pages
        if (uri.endsWith("Loginpage.jsp")
                || uri.endsWith("Signup.jsp")
                || uri.endsWith("LoginServlet")
                || uri.endsWith("SignupServlet")) {

            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("prn") != null) {
            // Logged in
            chain.doFilter(request, response);
        } else {
            // Not logged in
            res.sendRedirect(req.getContextPath() + "/jsp/Loginpage.jsp");
        }
    }
}

