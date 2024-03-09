package com.student_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.student_management.connection.ConnectionFactory;
import com.student_management.model.Student;

public class StudentsDAO implements StudentsDAOSchema {
    
    @Override
    public List<Student> findAll() {
        try (Connection connection = ConnectionFactory.connect()) {
            String query = "SELECT id, first_name fistName, last_name lastName, student_id studentId FROM students;";

            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            
            List<Student> students = new ArrayList<>();
            
            while(resultSet.next()) {
                
            }


            return students;

        } catch (SQLException e) {
            throw new RuntimeException();
        }

    }
    @Override
    public void create(Student student) {
        try (Connection connection = ConnectionFactory.connect()) {
            String query = "INSERT INTO students (first_name, last_name) VALUES (?, ?);";

            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, student.getFirstName());
            statement.setString(2, student.getLastName());

            statement.executeUpdate();

            ResultSet resultSet = statement.getGeneratedKeys();
            resultSet.next();

            student.setId(UUID.nameUUIDFromBytes(resultSet.getString("id").getBytes()));
            student.setStudentId(resultSet.getLong("student_id"));

        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
    @Override
    public Student update(Student student) {
        return student;
    }
    @Override
    public void delete(UUID id) {
        
    }
}
