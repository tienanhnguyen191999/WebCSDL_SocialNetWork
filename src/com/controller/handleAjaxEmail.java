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


@WebServlet("/view/AjaxEmail")
public class handleAjaxEmail extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		try {
			Dao db = new Dao();
			String query = "select * from user where email = ?";
			PreparedStatement st = db.con.prepareStatement(query);
			st.setString(1, req.getParameter("email"));
			ResultSet rs = st.executeQuery();
			if ( rs.next() ) {
				out.print("0");
			}
			else {
				out.print("1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
