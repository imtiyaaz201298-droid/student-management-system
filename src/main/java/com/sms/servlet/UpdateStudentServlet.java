package com.sms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sms.util.DBConnection;

public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE students SET name=?, email=?, course=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.setInt(4, id);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            
            if (rows > 0) {
                response.sendRedirect("ListStudentServlet");
            } else {
                response.sendRedirect("ListStudentServlet?error=updatefailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ListStudentServlet?error=server");
        }
    }
}