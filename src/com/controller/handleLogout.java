package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/view/logout")
public class handleLogout extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().removeAttribute("user_id");
		req.getSession().removeAttribute("fname");
		req.getSession().removeAttribute("lname");
		req.getSession().removeAttribute("email");
		req.getRequestDispatcher("index.jsp").forward(req, resp);;
	}
}
