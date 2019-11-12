package com.controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/view/login")
public class HandleLogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Dao db = new Dao();
			String qr = "select * from user where `email`= ? and `password`= ?";
			PreparedStatement st = db.con.prepareStatement(qr);
			System.out.println(req.getParameter("email") + " " + req.getParameter("password"));
			st.setString(1,req.getParameter("email"));
			st.setString(2,req.getParameter("password"));
			ResultSet rs = st.executeQuery();
			if ( rs.next() ) {
				ResultSet root = rs;
				req.getSession().setAttribute("user_id",root.getInt("user_id"));
				req.getSession().setAttribute("lname",root.getString("lname"));
				req.getSession().setAttribute("fname",root.getString("fname"));
				req.getSession().setAttribute("email",root.getString("email"));
				req.getSession().setAttribute("avatar",root.getString("avatar"));
				System.out.println("Login: user_id" + req.getSession().getAttribute("user_id"));
				resp.sendRedirect("newsfeed");
				//req.getRequestDispatcher("newsfeed").forward(req, resp);
				return;
			}else {
				req.getRequestDispatcher("index-register.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
