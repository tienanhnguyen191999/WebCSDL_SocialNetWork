<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.controller.MyUtils"%>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="This is social network html5 template available in themeforest......" />
<meta name="keywords"
	content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
<meta name="robots" content="index, follow" />
<title>Nearby People | Find Local People</title>

<!-- Stylesheets
    ================================================= -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />

<!--Google Font-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700,700i"
	rel="stylesheet">

<!--Favicon-->
<link rel="shortcut icon" type="image/png" href="images/fav.png" />
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<jsp:include page="template/header.jsp"></jsp:include>

	<div id="page-contents">
		<div class="container">
			<div class="row">
				<jsp:include page="template/leftSideBarNewsFeed.jsp"></jsp:include>

				<div class="col-md-7">
					<!-- Nearby People List
            ================================================= -->
					<%
						ResultSet rs = MyUtils.getUnknowFriend(request.getSession().getAttribute("user_id").toString(),100); 
						while(rs.next()){
					%>
					<div class="people-nearby">
						<div class="nearby-user">
							<div class="row">
								<div class="col-md-2 col-sm-2">
									<img src="images/user/<%= rs.getString("avatar") %>" alt="user"
										class="profile-photo-lg" />
								</div>
								<div class="col-md-7 col-sm-7">
									<h5>
										<a href="timeline?id=<%= rs.getInt("user_id") %>" class="profile-link"><%= rs.getString("fname") %></a>
									</h5>
									<p><%= rs.getString("work") == null ? "" : rs.getString("work") %></p>
									<!-- <p class="text-muted">500m away</p> -->
								</div>
								
								<div class="col-md-3 col-sm-3">
									<% if (!MyUtils.hasSendRequestYet(request.getSession().getAttribute("user_id").toString(),rs.getInt("user_id") + "")){ %>
									<button class="btn btn-primary pull-right" id="addFriend<%= rs.getInt("user_id")%>">Thêm bạn</button>
									<% }else{ %>
									<p>Đã gửi lời mời kết bạn</p>
									<% } %>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
					$(document).ready(()=>{
						$('#addFriend<%= rs.getInt("user_id")%>').click(function(){
							$.ajax({
								url: "handleAddFriend",
								method: "post",
								data: { user_get_noti : <%= rs.getInt("user_id")%> },
								success: function(data){
									$('#addFriend<%= rs.getInt("user_id")%>').html("Đã gửi lời mời kết bạn");
									$('#addFriend<%= rs.getInt("user_id")%>').removeAttr("id");
								}
							})
						})
					})
					</script>
					<% } %>
				</div>
				

			</div>
		</div>
	</div>

	<jsp:include page="template/footer.jsp"></jsp:include>

	<!--preloader-->
	<div id="spinner-wrapper">
		<div class="spinner"></div>
	</div>

	<!-- Scripts
    ================================================= -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ&callback=initMap"></script>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.sticky-kit.min.js"></script>
	<script src="js/jquery.scrollbar.min.js"></script>
	<script src="js/script.js"></script>

</body>
</html>
