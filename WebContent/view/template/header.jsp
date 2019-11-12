
<%@page import="com.model.User"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.controller.MyUtils"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Header
    ================================================= -->
<header id="header">
	<nav class="navbar navbar-default navbar-fixed-top menu">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%= request.getSession().getAttribute("user_id") == null ? "index.jsp" : "newsfeed" %>"><img
					src="images/logo.png" alt="logo" /></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-menu">
					<%
						if (request.getSession().getAttribute("user_id") == null) {
					%>
					<li class="dropdown" id="register_nav"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">Tham gia <span><img
								src="images/down-arrow.png" alt="" /></span></a>
						<ul class="dropdown-menu newsfeed-home">
							<!--  <li><a href="index.jsp">Landing Page 1</a></li> -->
							<li><a href="index-register.jsp">Đăng kí/ Đăng nhập</a></li>
						</ul></li>
					<%
						} else {
					%>
					<li class="dropdown" id="newfeed_nav"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">Tin mới <span><img
								src="images/down-arrow.png" alt="" /></span></a>
						<ul class="dropdown-menu newsfeed-home">
							<li><a href="newsfeed">Tin mới</a></li>
							<li><a href="newsfeed-people-nearby.jsp">Bạn bè xung
									quanh</a></li>
							<li><a href="newsfeed-friends.jsp">Bạn bè</a></li>
							<li><a href="newsfeed-messages.jsp">Phòng chat</a></li>
							<li><a href="newsfeed-images.jsp">Ảnh</a></li>
							<li><a href="newsfeed-videos.jsp">Videos</a></li>
						</ul></li>
					<li class="dropdown" id="timeline_nav"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">Dòng thời gian <span><img
								src="images/down-arrow.png" alt="" /></span></a>
						<ul class="dropdown-menu login">
							<li><a
								href="timeline?id=<%=request.getSession().getAttribute("user_id")%>">Dòng
									thời gian</a></li>
							<li><a
								href="timeline-about.jsp?id=<%=request.getSession().getAttribute("user_id")%>">Thông
									tin</a></li>
							<li><a
								href="timeline-album?id=<%=request.getSession().getAttribute("user_id")%>">Album</a></li>
							<li><a
								href="timeline-friends.jsp?id=<%=request.getSession().getAttribute("user_id")%>">Bạn
									bè</a></li>


						</ul></li>

					<!-- Notificate here -->
					<li class="dropdown" id="nav_notification"><a href="#"
						class="dropdown-toggle pages" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">Thông báo<span>
						<img src="images/down-arrow.png" alt="" /></span></a>
						
						<ul class="dropdown-menu page-list">
							<%
								ResultSet rs = MyUtils.getAllNotification(request.getSession().getAttribute("user_id") + "");
									HashMap<String, String> mapp = new HashMap<String, String>();
									mapp.put("1", "đã comment bài viết ");
									mapp.put("21", "đã like bài viết ");
									mapp.put("22", "đã dislike bài viết ");
									mapp.put("3", "đã gửi lời mới kết bạn");
									int i = 0;
									while (rs.next()) {
										User user = User.getUser(rs.getInt("user_action"));
										if (rs.getInt("seen") == 0 ) i++; 
							%>
							<li id="noti<%= rs.getInt("noti_id") %>" class="row" <%= rs.getInt("seen") == 0 ? "style='background: gray'" : ""  %>>
							<a href="<%=rs.getString("link")%>">
									<div class="col-8">
										<span class="userNameNotification"><%=user.getFname()%></span>&nbsp;<%=mapp.get(rs.getInt("type") + "")%>
									</div>
									<div class="col-2">
										<small class="timeStampNotification"><%=MyUtils.convertTimeStamp(rs.getTimestamp("noti_at"))%>&nbsp;trước</small>
										<%  if ( rs.getInt("type") == 3){ %>
										<button id="accept<%= rs.getInt("noti_id") %>">Đồng ý</button>
										<button id="deny<%= rs.getInt("noti_id") %>">Từ chối</button>
										<% } %>
									</div>
							</a>
							</li>
							<%
								if ( rs.getInt("type") != 3 ){
							%>
							<script>
								$(document).ready(function(){
									$('#noti<%= rs.getInt("noti_id")%>').click(function(){
										$.ajax({
											url: "handleSeenNotification",
											method: "post",
											data: {noti_id : <%= rs.getInt("noti_id")%> },
											success: function(data){
												$('#noti<%= rs.getInt("noti_id")%>').css('background','black');
												$('#boxCountNotiUnSeen').html($('#boxCountNotiUnSeen').html() - 1);
											}
										})							
									})
								})
							</script>
							<%
							}else{
							%>
							<script>
							$(document).ready(function(){
								$('#accept<%= rs.getInt("noti_id") %>').click(()=>{
									console.log('acceptClick')
									$.ajax({
										url: "handleSeenNotification",
										method: "post",
										data: {noti_id : <%= rs.getInt("noti_id")%>, type: 3 , value: 1 },
										success: function(data){
											$('#boxCountNotiUnSeen').html($('#boxCountNotiUnSeen').html() - 1);
										}
									})
									 location.reload();
								});
								$('#deny<%= rs.getInt("noti_id") %>').click(()=>{
									console.log('denyClick')
									$.ajax({
										url: "handleSeenNotification",
										method: "post",
										data: {noti_id : <%= rs.getInt("noti_id")%>, type: 3 , value: -1 },
										success: function(data){
											$('#boxCountNotiUnSeen').html($('#boxCountNotiUnSeen').html() - 1);
										}
									})
									location.reload();
								});
							});
							</script>
							<%
								}
							}
							rs.close();
							%>
							
						</ul>
						<div id="boxCountNotiUnSeen">
							<%=i %>
						</div>
						</li>
					<!-- End notificate -->

					<li class="dropdown"><a href="#" class="dropdown-toggle pages"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Tài khoản<span><img
								src="images/down-arrow.png" alt="" /></span></a>
						<ul class="dropdown-menu page-list">
							<li><a href="edit-profile-basic.jsp">Chỉnh sửa: Thông
									tin cơ bản</a></li>
							<li><a href="edit-profile-work-edu.jsp">Chỉnh sửa: Công
									việc</a></li>
							<li><a href="edit-profile-interests.jsp">Chỉnh sửa: Sở
									thích</a></li>
							<li><a href="edit-profile-settings.jsp">Cài đặt tài
									khoản</a></li>
							<li><a href="edit-profile-password.jsp">Thay đổi mật
									khẩu</a></li>
							<li><a href="logout">Đăng xuất</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-right hidden-sm" id="search_nav">
					<div class="form-group">
						<i class="icon ion-android-search"></i> <input type="text"
							class="form-control" placeholder="Search friends, photos, videos">
					</div>
				</form>
				<%
					}
				%>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
</header>
<!--Header End-->
