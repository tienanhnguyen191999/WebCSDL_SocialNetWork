package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view/handleComment")
public class handleComment extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String qr = "insert into comment(user_id, post_id, content,comment_at) values (?,?,?,curtime())";
			PreparedStatement st = new Dao().con.prepareStatement(qr);
			st.setString(1, req.getSession().getAttribute("user_id")+"");
			st.setString(2, req.getParameter("post_id"));
			st.setString(3, req.getParameter("content"));
			st.executeUpdate();
			PrintWriter out = resp.getWriter();
			out.print(req.getParameter("content") + "|" + req.getSession().getAttribute("fname") +"|" + req.getSession().getAttribute("avatar")); 

			
			// Get id of user_get_noti
			qr = "select * from post where post_id = " + req.getParameter("post_id");
			st = new Dao().con.prepareStatement(qr);
			ResultSet rs = st.executeQuery();
			rs.next();
			
			
			String id_user_action = req.getSession().getAttribute("user_id") + "";
			String id_user_get_noti = rs.getInt("user_id") + "";
			String link = "newsfeed#post" + req.getParameter("post_id");
			if (!id_user_action.equals(id_user_get_noti)) {
				// Delete if has notification
				qr = "delete from notification where user_action = ? and user_get_noti = ? and link = ? and type = 1";
				st = new Dao().con.prepareStatement(qr);
				st.setString(1, id_user_action);
				st.setString(2, id_user_get_noti);
				st.setString(3, link);
				st.executeUpdate();
				
				// Update to notification			
				qr = "insert into notification(user_get_noti, user_action, link,noti_at,type) values(?,?,?,curtime(),1)";
				st = new Dao().con.prepareStatement(qr);
				st.setString(1, id_user_get_noti);
				st.setString(2, id_user_action);
				st.setString(3, link);
				int tmp1 = st.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
