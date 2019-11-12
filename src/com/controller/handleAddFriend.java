package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view/handleAddFriend")
public class handleAddFriend extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Connection con = new Dao().con;
			String qr = "insert into notification(user_get_noti, user_action, link , type,noti_at) values (?,?,?,?,curtime())";
			PreparedStatement st = con.prepareStatement(qr);
			st.setString(1, req.getParameter("user_get_noti"));
			st.setString(2, req.getSession().getAttribute("user_id") + "");
			st.setString(3, "#");
			st.setString(4, "3");
			st.executeUpdate();
			con.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
	}
}
