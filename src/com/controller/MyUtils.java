package com.controller;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import com.sun.corba.se.pept.transport.Connection;

public class MyUtils {
	private static java.sql.Connection con;

	// Timestamp to Long will take 6 more digit. Assume 8minutes ~ 480.
	// But the result will be 480xxx because Timestamp take 3 more digits
	// by default.
	public static String convertTimeStamp(Timestamp time) {
		Timestamp timestamp = Timestamp.valueOf(LocalDateTime.now());
		System.out.println(timestamp + "|||| " + time);
		String rs = "";
		long theRest = (timestamp.getTime() - time.getTime()) / 1000;
		if (theRest < 3600) {
			rs += theRest / 60 + " phút";
		} else if (theRest < 86400) {
			rs += theRest / 3600 + " giờ";
		} else if (theRest < 604800) {
			rs += theRest / 86400 + " ngày";
		}
		return rs;
	}

	public static String totalFriend(int id) throws Exception {
		con = new Dao().con;
		try {
			String qr = "select count(*) from friend where per1=? or per2=?";
			PreparedStatement st = con.prepareStatement(qr);
			st.setString(1, id + "");
			st.setString(2, id + "");
			ResultSet rs = st.executeQuery();
			return rs.next() ? rs.getInt("count(*)") + "" : "0";
		} finally {
			con.close();
		}

	}

	public static ResultSet getAllFriend(String id, int limit) throws Exception {
		// Get all ID friends

		con = new Dao().con;
		String qr = "select * from friend where per1=? or per2=?";
		PreparedStatement st = con.prepareStatement(qr);
		st.setString(1, id);
		st.setString(2, id);
		ResultSet rs = st.executeQuery();
		ArrayList<String> arr = new ArrayList<>();
		//arr.add(id);
		while (rs.next()) {
			if (rs.getString("per1").equals(id))
				arr.add(rs.getString("per2"));
			else
				arr.add(rs.getString("per1"));
		}
		// get All friend's details
		if (arr.size() == 0) qr = "select * from user limit " + 0;
		else qr = "select * from user where user_id in(" + String.join(",", arr) + ") order by user_id desc limit " + limit;
		st = new Dao().con.prepareStatement(qr);
		rs = st.executeQuery();
		return rs;

		// get All friend's details

	}

	public static ResultSet getUnknowFriend(String id, int limit) throws Exception {
		con = new Dao().con;
		try {
			String qr = "select * from friend where per1=? or per2=?";
			PreparedStatement st = con.prepareStatement(qr);
			st.setString(1, id);
			st.setString(2, id);
			ResultSet rs = st.executeQuery();
			ArrayList<String> arr = new ArrayList<>();
			arr.add(id);
			while (rs.next()) {
				if (rs.getString("per1").equals(id))
					arr.add(rs.getString("per2"));
				else
					arr.add(rs.getString("per1"));
			}
			// get All friend's details
			qr = "select * from user where user_id NOT in(" + String.join(",", arr) + ") order by user_id desc limit " + limit;
			st = new Dao().con.prepareStatement(qr);
			rs = st.executeQuery();
			return rs;
		} finally {
		}
	}

	public static String getLikeAndDislike(int post_id) throws Exception {
		con = new Dao().con;
		try {
			String qr = "select * from `like` where post_id = ?";
			PreparedStatement st = con.prepareStatement(qr);
			st.setString(1, post_id + "");
			ResultSet rs = st.executeQuery();
			int like = 0, dislike = 0;
			while (rs.next()) {
				if (rs.getInt("value") == 1)
					like++;
				else
					dislike++;
			}
			return like + "|" + dislike + "|" + post_id;
		} finally {
			con.close();
		}
	}

	public static ArrayList<String> getAllPostLikedByUser(int user_id) throws Exception {
		con = new Dao().con;
		try {
			String qr = "select * from `like` where user_id = ?";
			PreparedStatement st = con.prepareStatement(qr);
			st.setString(1, user_id + "");
			ResultSet rs = st.executeQuery();
			ArrayList<String> data = new ArrayList<>();
			while (rs.next()) {
				String tmp = "";
				tmp += rs.getInt("post_id") + "|" + rs.getInt("value");
				data.add(tmp);
			}
			return data;
		} finally {
			con.close();
		}
	}

	public static ResultSet getAllComment(int post_id) throws Exception {
		con = new Dao().con;
		try {
			String qr = "select * from comment where post_id = ?";
			PreparedStatement st = new Dao().con.prepareStatement(qr);
			st.setString(1, post_id + "");
			ResultSet rs = st.executeQuery();
			return rs;
		} finally {
			// con.close();
		}
	}

	public static ResultSet getUserFormPostId(String postId) throws Exception {
		con = new Dao().con;
		try {
			String qr = "select * from post where post_id = " + postId;
			PreparedStatement st = con.prepareStatement(qr);
			ResultSet rs = st.executeQuery();
			return rs;
		} finally {
			// con.close();
		}
	}

	public static ResultSet getAllNotification(String userId) throws Exception {
		con = new Dao().con;
		try {
			String qr = "select * from notification where user_get_noti = " + userId + " order by noti_at desc";
			PreparedStatement st = con.prepareStatement(qr);
			ResultSet rs = st.executeQuery();
			return rs;
		} finally {

		}
	}

	public static boolean hasSendRequestYet(String user_action, String user_get_request) throws Exception {
		java.sql.Connection con = new Dao().con;
		String qr = "select * from notification where user_action = ? and user_get_noti =  ? and type = 3";
		PreparedStatement st = con.prepareStatement(qr);
		st.setString(1, user_action);
		st.setString(2, user_get_request);
		ResultSet rs = st.executeQuery();
		if (rs.next()) {
			con.close();
			return true;
		} else {
			con.close();
			return false;
		}

	}
}
