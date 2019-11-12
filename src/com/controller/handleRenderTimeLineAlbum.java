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

@WebServlet("/view/timeline-album")
public class handleRenderTimeLineAlbum extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id = req.getQueryString().substring(3);
			String qr = "select * from post where user_id = " + id + " and type = 2";
			PreparedStatement st = new Dao().con.prepareStatement(qr);
			ResultSet rs = st.executeQuery();
			req.setAttribute("post", rs);
			//rs.next(); 
			//PrintWriter out = resp.getWriter();
			//out.print(rs.getString("content"));
			req.getRequestDispatcher("timeline-album.jsp?id=" + id).forward(req, resp);;
		}catch(Exception ex) {
			ex.printStackTrace();
		}

	}
}
