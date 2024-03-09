package com.student_management;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student_management.dao.StudentsDAO;
import com.student_management.model.Student;

public class StudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
            
            Student student = new Student(
                req.getParameter("firstName"),
                req.getParameter("lastName")
            );
            
            new StudentsDAO().create(student);

            resp.sendRedirect("http://localhost:8080/student-management/index.jsp");
        }

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
            
        }

        @Override
        protected void doPut(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        }

        @Override
        protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        }
}
