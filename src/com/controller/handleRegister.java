package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.User;
@WebServlet("/view/register")
public class handleRegister extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		System.out.println(req.getParameter("fname"));
		user.setFname(req.getParameter("fname"));
		user.setLname(req.getParameter("lname"));
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		user.setDay(req.getParameter("day"));
		user.setMonth(req.getParameter("month"));
		user.setYear(req.getParameter("year"));
		user.setGender(req.getParameter("gender"));
		user.setCity(req.getParameter("city"));
		user.setCountry(req.getParameter("country"));
		try {
			ResultSet root = user.save();
			req.getSession().setAttribute("user_id",root.getInt("user_id"));
			req.getSession().setAttribute("lname",root.getString("lname"));
			req.getSession().setAttribute("fname",root.getString("fname"));
			req.getSession().setAttribute("email",root.getString("email"));
			req.getSession().setAttribute("avatar",root.getString("avatar"));
			System.out.println("register: user_id" + req.getSession().getAttribute("user_id"));
			resp.sendRedirect("newsfeed");
			
			// Can not use requestDispatcher because it retains method of request.
			// So u cant send POST request to servler only handle GET request 
			//req.getRequestDispatcher("newsfeed").forward(req, resp);
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("index-register.jsp").forward(req, resp);
	}
}
