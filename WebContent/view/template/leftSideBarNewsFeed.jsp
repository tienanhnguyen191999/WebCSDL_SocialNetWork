<%@page import="java.sql.ResultSet"%>
<%@page import="com.controller.MyUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Newsfeed Common Side Bar Left
          ================================================= -->

<div class="col-md-3 static">
	<div class="profile-card">
		<img
			src="images/user/<%=request.getSession().getAttribute("avatar")%>"
			alt="user" class="profile-photo" />
		<h5>
			<a href="timeline?id=<%=request.getSession().getAttribute("user_id")%> " class="text-white"><%=request.getSession().getAttribute("fname")%></a>
		</h5>
		<a href="#" class="text-white"><i
			class="ion ion-android-person-add">&nbsp;</i><%=MyUtils.totalFriend(Integer.parseInt(request.getSession().getAttribute("user_id").toString()))%>
			người theo dõi</a>
	</div>
	<!--profile card ends-->
	<ul class="nav-news-feed">
		<li><i class="icon ion-ios-paper"></i>
			<div>
				<a href="newsfeed">Tin mới của tôi</a>
			</div></li>
		<li><i class="icon ion-ios-people"></i>
			<div>
				<a href="newsfeed-people-nearby.jsp">Gợi ý kết bạn</a>
			</div></li>
		<li><i class="icon ion-ios-people-outline"></i>
			<div>
				<a href="newsfeed-friends.jsp">Bạn bè</a>
			</div></li>
		<li><i class="icon ion-chatboxes"></i>
			<div>
				<a href="newsfeed-messages.jsp">Tin nhắn</a>
			</div></li>
		<li><i class="icon ion-images"></i>
			<div>
				<a href="newsfeed-images">Ảnh</a>
			</div></li>
		<li><i class="icon ion-ios-videocam"></i>
			<div>
				<a href="newsfeed-videos">Videos</a>
			</div></li>
	</ul>
	<!--news-feed links ends-->
	<div id="chat-block">
		<div class="title">Chat online</div>
		<ul class="online-users list-inline">
			<%
				ResultSet rs = MyUtils.getAllFriend(request.getSession().getAttribute("user_id").toString(),9);
				while (rs.next()) {
			%>
			<li><a href="newsfeed-messages" title="<%= rs.getString("fname")%>"> <img
					src="images/user/<%=rs.getString("avatar") %>" alt="user"
					class="img-responsive profile-photo" /> <span class="online-dot"></span>
			</a></li>
			<%
				}
			%>
		</ul>
	</div>
	<!--chat block ends-->
</div>


