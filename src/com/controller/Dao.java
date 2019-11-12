package com.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;

public class Dao {
	private String dbUser = "root", dbPass = "mrcool99";
	private String URL = "jdbc:mysql://localhost:3306/socialnetwork?useUnicode=yes&characterEncoding=UTF-8";
	public Connection con;
	public Dao() throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(URL,dbUser,dbPass);
	}
	
	public boolean checkLogin(String username, String password) throws SQLException{
		String query = " select * from user where email=" + username + " and password="+password;
		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();
		if ( rs.next()) {
			return true;
		}
		return false;
	}
	

}