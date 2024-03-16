package com.student_management;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student_management.dao.StudentsDAO;
import com.student_management.model.Student;

public class StudentServlet extends HttpServlet {

    private static final String METHOD_DELETE = "DELETE";
    private static final String METHOD_GET = "GET";
    private static final String METHOD_POST = "POST";
    private static final String METHOD_PUT = "PUT";

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        String method = req.getParameter("method");
        if (method.equals(METHOD_GET)) {
            get(req, resp);
        } else if (method.equals(METHOD_POST)) {
            post(req, resp);
        } else if (method.equals(METHOD_PUT)) {
            put(req, resp);
        } else if (method.equals(METHOD_DELETE)) {
            delete(req, resp);
        }
    }

    protected void post(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
            
            Student student = new Student(
                req.getParameter("firstName"),
                req.getParameter("lastName")
            );
            
            new StudentsDAO().create(student);

            req.getRequestDispatcher("student?method=GET").forward(req, resp);
        }

        protected void get(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

            List<Student> students = new StudentsDAO().findAll();

            req.setAttribute("students", students);
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }

        protected void put(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
            Student student = new Student(
                req.getParameter("id"),
                req.getParameter("firstName"),
                req.getParameter("lastName"),
                Long.parseLong(req.getParameter("registration"))
            );
            new StudentsDAO().update(student);

            req.getRequestDispatcher("student?method=GET").forward(req, resp);
        }
        
        protected void delete(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
            new StudentsDAO().delete(req.getParameter("id"));
            req.getRequestDispatcher("student?method=GET").forward(req, resp);
        }
}
