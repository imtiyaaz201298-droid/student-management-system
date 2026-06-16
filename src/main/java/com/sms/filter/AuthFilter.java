package com.sms.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        
        if (session != null && session.getAttribute("username") != null) {
            
            chain.doFilter(request, response);
        } else {
           
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}