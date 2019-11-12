package com.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view/newsfeed")
public class handleRenderNewsFeed extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Get all friends
			String qr = "select * from friend where per1=? or per2=?" ;
			PreparedStatement st = new Dao().con.prepareStatement(qr);
			st.setString(1, req.getSession().getAttribute("user_id").toString());
			st.setString(2, req.getSession().getAttribute("user_id").toString());
			ResultSet rs = st.executeQuery();
			ArrayList<String> arr = new ArrayList<>();
			arr.add(req.getSession().getAttribute("user_id").toString());
			while(rs.next()) {
				if ( rs.getString("per1").equals(req.getSession().getAttribute("user_id").toString()))
					arr.add(rs.getString("per2"));
				else arr.add(rs.getString("per1"));
			}
			System.out.println(String.join(",",arr));
			
			// Get all relative post
			
			qr = "select * from post where user_id in(" + String.join(",",arr) + ") order by post_id desc";
			st = new Dao().con.prepareStatement(qr);
			rs = st.executeQuery();
			req.setAttribute("newsfeeds", rs);
			req.getRequestDispatcher("newsfeed.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
}
