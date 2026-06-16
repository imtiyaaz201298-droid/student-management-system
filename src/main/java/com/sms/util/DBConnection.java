package com.sms.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static final String URL = "jdbc:mysql://localhost:3306/sms_db";
	private static final String USER = "root";
	private static final String PASSWORD = "Mohd@123";

	private static Connection connection = null;

	public static Connection getConnection() {

		try {
			if (connection == null || connection.isClosed()) {

				Class.forName("com.mysql.cj.jdbc.Driver");

				connection = DriverManager.getConnection(URL, USER, PASSWORD);
				System.out.println("Database Connected Successfully...");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return connection;
	}
}