package com.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/view/timeline")
public class HandlerRenderTimeLine extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id = req.getQueryString().substring(3);
			String qr = "select * from post where user_id = " + id + " order by post_id desc";
			PreparedStatement st;
			st = new Dao().con.prepareStatement(qr);
			ResultSet rs = st.executeQuery();
			req.setAttribute("post", rs);

			req.getRequestDispatcher("timeline.jsp").forward(req,resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
