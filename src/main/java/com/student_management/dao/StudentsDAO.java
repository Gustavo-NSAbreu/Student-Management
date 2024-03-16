package com.student_management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.student_management.connection.ConnectionFactory;
import com.student_management.model.Student;

public class StudentsDAO implements StudentsDAOSchema {
    
    @Override
    public List<Student> findAll() {
        try (Connection connection = ConnectionFactory.connect()) {
            String query = "SELECT id, first_name, last_name, registration FROM students ORDER BY registration;";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            List<Student> students = new ArrayList<>();
            while(resultSet.next()) {
                String id = resultSet.getString("id");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                Long registration = resultSet.getLong("registration");
                students.add(new Student(id, firstName, lastName, registration));
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
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, student.getFirstName());
            statement.setString(2, student.getLastName());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    @Override
    public void update(Student student) {
        try (Connection connection = ConnectionFactory.connect()) {
            String query = "UPDATE students SET first_name = ?, last_name = ? WHERE id = ?::uuid;";
            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, student.getFirstName());
            statement.setString(2, student.getLastName());
            statement.setString(3, student.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

    @Override
    public void delete(String id) {
        try (Connection connection = ConnectionFactory.connect()) {
            String query = "DELETE FROM students WHERE id = ?::uuid;";
            PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
}
