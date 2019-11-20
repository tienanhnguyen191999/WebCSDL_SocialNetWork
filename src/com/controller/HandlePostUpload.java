package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/view/postUpload")
// Handle ImageUpload
@MultipartConfig
public class HandlePostUpload extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		try {
			// Save file to Hard Drive
			Part filePart = req.getPart("image");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			
			String fileExtension = fileName.substring(fileName.length() - 4,fileName.length());
			String fileNameWithoutExtension  = fileName.substring(0,fileName.length() - 4);
			if ( fileNameWithoutExtension.length() < 3 ) fileNameWithoutExtension += "new";
			File uploads;
			if (fileExtension.equals(".mp4") ) {
				uploads = new File("E:\\JavaWeb\\WebCSDL\\WebContent\\view\\videos");
			}else {
				uploads = new File("E:\\JavaWeb\\WebCSDL\\WebContent\\view\\images\\post");
			}
			File file = File.createTempFile(fileNameWithoutExtension,fileExtension, uploads);
			InputStream fileContent = filePart.getInputStream();
			try (InputStream input = fileContent) {
			    Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			}
			
			String qr = "insert into post(user_id,content,post_at,link,type) values (?,?, curtime(),?,?)";
			PreparedStatement st = new Dao().con.prepareStatement(qr);
			st.setString(1,req.getSession().getAttribute("user_id").toString());
			st.setString(2,req.getParameter("content"));
			st.setString(3,file.getName());
			st.setString(4,fileExtension.equals(".mp4") ? "3" : "2");
			int rs = st.executeUpdate();
			
			// get last insert ID
//			qr = "select * from post order by post_id desc limit 1";
//			st = new Dao().con.prepareStatement(qr);
//			rs = st.executeUpdate();
			
			// update Time
			System.out.println(req.getRequestURI());
			// Send to /view/newfeed OR   /view/timeline
			String append = req.getSession().getAttribute("url").toString().equals("timeline") == true? "?id=" + req.getSession().getAttribute("user_id").toString() : "";
			Thread.sleep(2000);
			resp.sendRedirect(req.getSession().getAttribute("url").toString() + append);
		}catch( SQLException ex) {
			ex.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
