package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view/handleSeenNotification")
public class HandleSeenNotification extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			if (req.getParameter("type") == null) {
				Connection con = new Dao().con;
				String qr = "update notification set seen = 1 where noti_id = " + req.getParameter("noti_id");
				PreparedStatement st = con.prepareStatement(qr);
				st.executeUpdate();
				con.close();
			} else {
				Connection con = new Dao().con;
				if (req.getParameter("value").toString().equals("1")) {
					String qr = "select * from notification where noti_id = " + req.getParameter("noti_id");
					PreparedStatement st = con.prepareStatement(qr);
					ResultSet rs = st.executeQuery();
					rs.next();
					
					qr = "insert into friend(per1,per2) values( ?,?)";
					st = con.prepareStatement(qr);
					st.setString(1, rs.getInt("user_get_noti") + "");
					st.setString(2, rs.getInt("user_action") + "") ;
					st.executeUpdate();
				}
				String qr = "delete from notification where noti_id = " + req.getParameter("noti_id");
				PreparedStatement st = con.prepareStatement(qr);
				st.executeUpdate();
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
