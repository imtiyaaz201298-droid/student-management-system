package com.sms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sms.model.User;
import com.sms.util.DBConnection;

public class UserDAO {
	
    public User loginUser(String username, String password) throws Exception {

        User user = null;

        Connection con = DBConnection.getConnection();

        String sql = "select * from users where username=? and password=?";
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            user = new User(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("password")
            );
        }

        con.close();
        return user;
    }
}