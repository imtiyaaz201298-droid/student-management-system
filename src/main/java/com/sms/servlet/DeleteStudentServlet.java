package com.sms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sms.dao.StudentDAO;

public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            int id = Integer.parseInt(request.getParameter("id"));

            studentDAO.deleteStudent(id);

            response.sendRedirect("list-students.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("list-students?error=1");
        }
    }
}