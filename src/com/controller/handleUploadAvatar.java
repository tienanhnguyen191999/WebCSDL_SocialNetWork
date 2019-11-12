package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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

import jdk.nashorn.internal.ir.SetSplitState;

@WebServlet("/view/uploadAvatar")
@MultipartConfig
public class handleUploadAvatar extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Delete old version
		String qr;
		PreparedStatement st;
		try {
			qr = "select * from user where user_id = ?";
			st = new Dao().con.prepareStatement(qr);
			st.setString(1, req.getSession().getAttribute("user_id").toString());
			ResultSet rs1 =  st.executeQuery();
			rs1.next();
			if ( !rs1.getString("avatar").equals("user.png")) {
				File f = new File("E:\\JavaWeb\\WebCSDL\\WebContent\\view\\images\\user\\" + rs1.getString("avatar"));
				if (f.delete()) System.out.println("Delete Success"); else System.out.println("Faild to delete");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// Save file to Hard Drive
		Part filePart = req.getPart("avatar");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		String fileExtension = fileName.substring(fileName.length() - 4, fileName.length());
		String fileNameWithoutExtension = fileName.substring(0, fileName.length() - 4);
		if (fileNameWithoutExtension.length() < 3)
			fileNameWithoutExtension += "new";
		File uploads = new File("E:\\JavaWeb\\WebCSDL\\WebContent\\view\\images\\user");
		File file = File.createTempFile(fileNameWithoutExtension, fileExtension, uploads);
		InputStream fileContent = filePart.getInputStream();
		try (InputStream input = fileContent) {
			Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
		}
		
		try {
			qr = "update user set avatar= ? where user_id = ?";
			st = new Dao().con.prepareStatement(qr);
			st.setString(1, file.getName());
			st.setString(2, req.getSession().getAttribute("user_id").toString());
			int rs =  st.executeUpdate();
			req.getSession().setAttribute("avatar",file.getName());
			Thread.sleep(2000);
			resp.sendRedirect("timeline?id=" + req.getSession().getAttribute("user_id").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
