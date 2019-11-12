<!DOCTYPE html>
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
<title>My Timeline | This is My Coolest Profile</title>

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

	<div class="google-maps">
		<div id="map" class="map contact-map"></div>
	</div>
	<div id="page-contents">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="contact-us">
						<div class="row">
							<div class="col-md-8 col-sm-7">
								<h4 class="grey">Leave a Message</h4>
								<form class="contact-form">
									<div class="form-group">
										<i class="icon ion-person"></i> <input id="contact-name"
											type="text" name="name" class="form-control"
											placeholder="Enter your name *" required="required"
											data-error="Name is required.">
									</div>
									<div class="form-group">
										<i class="icon ion-email"></i> <input id="contact-email"
											type="text" name="email" class="form-control"
											placeholder="Enter your email *" required="required"
											data-error="Email is required.">
									</div>
									<div class="form-group">
										<i class="icon ion-android-call"></i> <input
											id="contact-phone" type="text" name="phone"
											class="form-control" placeholder="Enter your phone *"
											required="required" data-error="Phone is required.">
									</div>
									<div class="form-group">
										<textarea id="form-message" name="message"
											class="form-control" placeholder="Leave a message for us *"
											rows="4" required="required"
											data-error="Please,leave us a message."></textarea>
									</div>
								</form>
								<button class="btn-primary">Send a Message</button>
							</div>
							<div class="col-md-4 col-sm-5">
								<h4 class="grey">Reach Us</h4>
								<div class="reach">
									<span class="phone-icon"><i
										class="icon ion-android-call"></i></span>
									<p>+1 (234) 222 0754</p>
								</div>
								<div class="reach">
									<span class="phone-icon"><i class="icon ion-email"></i></span>
									<p>info@thunder-team.com</p>
								</div>
								<div class="reach">
									<span class="phone-icon"><i
										class="icon ion-ios-location"></i></span>
									<p>228 Park Ave S NY, USA</p>
								</div>
								<ul class="list-inline social-icons">
									<li><a href="#"><i class="icon ion-social-facebook"></i></a></li>
									<li><a href="#"><i class="icon ion-social-twitter"></i></a></li>
									<li><a href="#"><i class="icon ion-social-googleplus"></i></a></li>
									<li><a href="#"><i class="icon ion-social-pinterest"></i></a></li>
									<li><a href="#"><i class="icon ion-social-linkedin"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
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
	<script src="js/script.js"></script>

</body>
</html>
