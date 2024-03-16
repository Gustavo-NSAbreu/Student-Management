package com.student_management.dao;

import java.util.List;

import com.student_management.model.Student;

public interface StudentsDAOSchema {
    List<Student> findAll();
    void create(Student student);
    void update(Student student);
    void delete(String id);
}
