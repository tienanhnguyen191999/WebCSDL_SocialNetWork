package com.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.controller.Dao;

public class User {
	private String fname,lname,email,password,day,month,year,gender,city,country;
	private String avatar,poster,work,about;
	
	public User(String fname, String lname, String email, String password, String day, String month, String year,
			String gender, String city, String country) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.day = day;
		this.month = month;
		this.year = year;
		this.gender = gender;
		this.city = city;
		this.country = country;
		
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public User() {
		
	}
	
	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getDay() {
		return day;
	}


	public void setDay(String day) {
		this.day = day;
	}


	public String getMonth() {
		return month;
	}


	public void setMonth(String month) {
		this.month = month;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	// Email must be unique
	public ResultSet save() throws Exception{
		String qr = "INSERT INTO user ( fname, lname, email, password, gender, day, month, year, country, city) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement st = new Dao().con.prepareStatement(qr);
		st.setString(1,fname);
		st.setString(2,lname);
		st.setString(3,email);
		st.setString(4,password);
		st.setString(5,gender);
		st.setString(6,day);
		st.setString(7,month);
		st.setString(8,year);
		st.setString(9,country);
		st.setString(10,city);
		st.executeUpdate(); // Save
		st = new Dao().con.prepareStatement("select * from user order by `user_id` desc limit 1");
		ResultSet rs = st.executeQuery();
		rs.next();
		return rs;
	}
	
	public  static User getUser(int id) throws Exception {
		String qr = "Select * from user where user_id = " + id;
		PreparedStatement st = new Dao().con.prepareStatement(qr);
		ResultSet rs = st.executeQuery();
		User tmp = new User();
		rs.next();
		tmp.setAbout(rs.getString("about"));
		tmp.setAvatar(rs.getString("avatar"));
		tmp.setCity(rs.getString("city"));
		tmp.setCountry(rs.getString("country"));
		tmp.setDay(rs.getString("day"));
		tmp.setEmail(rs.getString("email"));
		tmp.setFname(rs.getString("fname"));
		tmp.setGender(rs.getString("gender"));
		tmp.setLname(rs.getString("lname"));
		tmp.setMonth(rs.getString("month"));
		tmp.setPoster(rs.getString("poster"));
		tmp.setWork(rs.getString("work"));
		tmp.setYear(rs.getString("year"));
		return tmp;
	}
}
