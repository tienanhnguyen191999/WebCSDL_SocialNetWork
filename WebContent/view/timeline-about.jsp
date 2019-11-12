<!DOCTYPE html>
<%@page import="com.model.User"%>
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
<title>About Me | Learn Detail About Me</title>

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
	<%
		String id = request.getQueryString().substring(3);
	%>
	<div class="container">

		<!-- Timeline
      ================================================= -->
		<div class="timeline">

			<jsp:include page="template/timelineCover.jsp?id=<%= id %>"></jsp:include>

			<div id="page-contents">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-7">
						<%
							User user = User.getUser(Integer.parseInt(request.getQueryString().substring(3).toString()));
						%>
						<!-- About
              ================================================= -->
						<div class="about-profile">
							<div class="about-content-block">
								<h4 class="grey">
									<i class="ion-ios-information-outline icon-in-title"></i>Personal
									Information
								</h4>
								<p><%= user.getAbout() %></p>
							</div>
							<div class="about-content-block">
								<h4 class="grey">
									<i class="ion-ios-briefcase-outline icon-in-title"></i>Work
									Experiences
								</h4>
								<div class="organization">
									<img src="images/envato.png" alt="" class="pull-left img-org" />
									<div class="work-info">
										<h5><%= user.getWork() %></h5>
									</div>
								</div>
								
							</div>
							<div class="about-content-block">
								<h4 class="grey">
									<i class="ion-ios-location-outline icon-in-title"></i>Location
								</h4>
								<p><%= user.getCity() + ", " + user.getCountry() %></p>
								<!-- <div class="google-maps">
									<div id="map" class="map"></div>
								</div>-->							
							</div>
							<div class="about-content-block">
								<h4 class="grey">
									<i class="ion-ios-heart-outline icon-in-title"></i>Interests
								</h4>
								<ul class="interests list-inline">
									<li><span class="int-icons" title="Bycycle riding"><i
											class="icon ion-android-bicycle"></i></span></li>
									<li><span class="int-icons" title="Photography"><i
											class="icon ion-ios-camera"></i></span></li>
									<li><span class="int-icons" title="Shopping"><i
											class="icon ion-android-cart"></i></span></li>
									<li><span class="int-icons" title="Traveling"><i
											class="icon ion-android-plane"></i></span></li>
									<li><span class="int-icons" title="Eating"><i
											class="icon ion-android-restaurant"></i></span></li>
								</ul>
							</div>
							<div class="about-content-block">
								<h4 class="grey">
									<i class="ion-ios-chatbubble-outline icon-in-title"></i>Language
								</h4>
								<ul>
									<li><a href="">Vietnamese</a></li>
								</ul>
							</div>
						</div>
					</div>
					<jsp:include page="template/timelineActivity.jsp"></jsp:include>
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
