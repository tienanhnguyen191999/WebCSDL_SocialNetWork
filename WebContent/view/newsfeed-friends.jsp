<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.controller.MyUtils"%>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="This is social network html5 template available in themeforest......" />
<meta name="keywords"
	content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
<meta name="robots" content="index, follow" />
<title>Friend List | Your Friend List</title>

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

					<!-- Friend List
            ================================================= -->
					<div class="friend-list">
						<div class="row">
							<%
								ResultSet rs = MyUtils.getAllFriend(request.getSession().getAttribute("user_id").toString(),100);
								while (rs.next()){
							%>
							<div class="col-md-6 col-sm-6">
								<div class="friend-card">
									<img src="images/user/<%= rs.getString("poster") %>" alt="profile-cover"
										class="img-responsive cover" />
									<div class="card-info">
										<img src="images/user/<%= rs.getString("avatar") %>" alt="userImage"
											class="profile-photo-lg" />
										<div class="friend-info">
											<a href="#" class="pull-right text-green">Bạn bè</a>
											<h5>
												<a href="timeline?id=<%= rs.getInt("user_id") %>" class="profile-link"><%= rs.getString("fname") %></a>
											</h5>
											<p><%= rs.getString("work")  == null ? ""  : rs.getString("work") %></p>
										</div>
									</div>
								</div>
							</div>
							<%									
								}
							%>

						</div>
					</div>
				</div>

				<jsp:include page="template/rightSideBarNewsFeed.jsp"></jsp:include>


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
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.sticky-kit.min.js"></script>
	<script src="js/jquery.scrollbar.min.js"></script>
	<script src="js/script.js"></script>

</body>
</html>
