package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.User;

@WebServlet("/view/handleLikeModule")
public class handleLikeModule extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String qr = "select * from `like` where user_id = ? and post_id = ? ";
			PreparedStatement st = new Dao().con.prepareStatement(qr);
			st.setString(1,req.getSession().getAttribute("user_id").toString() );
			st.setString(2, req.getParameter("post_id"));
			ResultSet rs = st.executeQuery();
			if ( rs.next() ) {
				System.out.println("in Update");
				qr = "update `like` set `value` = ? where user_id = ? and post_id = ? ";
				st = new Dao().con.prepareStatement(qr);
				st.setString(2,req.getSession().getAttribute("user_id").toString() );
				st.setString(3, req.getParameter("post_id"));
				st.setString(1, req.getParameter("value"));
				int tmp = st.executeUpdate();
			}
			else {
				System.out.println("in Insert");
				qr = "insert into `like`(user_id, post_id, value) values(?,?,?)";
				st = new Dao().con.prepareStatement(qr);
				st.setString(1,req.getSession().getAttribute("user_id").toString() );
				st.setString(2, req.getParameter("post_id"));
				st.setString(3, req.getParameter("value"));
				int tmp = st.executeUpdate();
			}
			
			qr = "select * from `like` where post_id = ? ";
			st = new Dao().con.prepareStatement(qr);
			st.setString(1,req.getParameter("post_id"));
			rs = st.executeQuery();
			int like = 0, dislike = 0;
			while(rs.next()) {
				if ( rs.getInt("value") == 1) like++;
				else dislike++;
			}
			
			PrintWriter out = resp.getWriter();
			out.print(like + "|" + dislike + "|" + req.getParameter("post_id"));
			
			
			ResultSet tmp3 = MyUtils.getUserFormPostId(req.getParameter("post_id")); tmp3.next();
			String user_get_noti = tmp3.getInt("user_id") + "";
			String user_action = req.getSession().getAttribute("user_id").toString();
			String link = "newsfeed#post" + req.getParameter("post_id");
			if (!user_get_noti.equals(user_action)) {
				// Delete if has notification
				qr = "delete from notification where user_action = ? and user_get_noti = ? and link = ? and type in(21,22)";
				st = new Dao().con.prepareStatement(qr);
				st.setString(1, user_action);
				st.setString(2, user_get_noti);
				st.setString(3, link);
				st.executeUpdate();
			
				// Update notification
				int type = req.getParameter("value").toString().equals("1") ? 21 : 22; 
				qr = "insert into notification(user_get_noti,user_action,link,type,noti_at) values(?,?,?,?,curtime())";
				st = new Dao().con.prepareStatement(qr);
				st.setString(1, user_get_noti);
				st.setString(2, user_action);
				st.setString(3, link);
				st.setString(4, type + "");
				int tmp = st.executeUpdate(); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
