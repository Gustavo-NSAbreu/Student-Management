package com.student_management.dao;

import java.util.List;
import java.util.UUID;

import com.student_management.model.Student;

public interface StudentsDAOSchema {
    List<Student> findAll();
    void create(Student student);
    Student update(Student student);
    void delete(UUID id);
}
