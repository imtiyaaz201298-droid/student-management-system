package com.sms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sms.model.Student;
import com.sms.util.DBConnection;

public class StudentDAO {

	public void insertStudent(Student student) throws Exception {
		Connection con = DBConnection.getConnection();

		String sql = "insert into students(name,email,course) values(?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, student.getName());
		ps.setString(2, student.getEmail());
		ps.setString(3, student.getCourse());

		ps.executeUpdate();
		con.close();
	}

	public List<Student> getAllStudents() throws Exception {
		List<Student> list = new ArrayList<>();

		Connection con = DBConnection.getConnection();
		String sql = "select * from students";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);

		while (rs.next()) {
		    Student s = new Student(
		        rs.getInt("id"),
		        rs.getString("name"),
		        rs.getString("email"),
		        rs.getString("course")
		    );
		    list.add(s);
		}

		con.close();
		return list;
	}

	public Student getStudentById(int id) throws Exception {
		Student s = null;

		Connection con = DBConnection.getConnection();
		String sql = "select * from students where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);

		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			s = new Student(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("course"));
		}

		con.close();
		return s;
	}

	public void updateStudent(Student student) throws Exception {
		Connection con = DBConnection.getConnection();

		String sql = "update students set name=?, email=?, course=? where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, student.getName());
		ps.setString(2, student.getEmail());
		ps.setString(3, student.getCourse());
		ps.setInt(4, student.getId());

		ps.executeUpdate();
		con.close();
	}

	public void deleteStudent(int id) throws Exception {
	    String sql = "DELETE FROM students WHERE id=?";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setInt(1, id);
	        ps.executeUpdate();
	    }
	}
}