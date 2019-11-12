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
<title>Edit Profile | My Interests</title>

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

	<div class="container">

		<!-- Timeline
      ================================================= -->
		<div class="timeline">
			<div class="timeline-cover">

				<!--Timeline Menu for Large Screens-->
				<div class="timeline-nav-bar hidden-sm hidden-xs">
					<div class="row">
						<div class="col-md-3">
							<div class="profile-info">
								<img src="http://placehold.it/300x300" alt=""
									class="img-responsive profile-photo" />
								<h3>Sarah Cruiz</h3>
								<p class="text-muted">Creative Director</p>
							</div>
						</div>
						<div class="col-md-9">
							<ul class="list-inline profile-menu">
								<li><a href="timeline.html">Timeline</a></li>
								<li><a href="timeline-about.html" class="active">About</a></li>
								<li><a href="timeline-album.html">Album</a></li>
								<li><a href="timeline-friends.html">Friends</a></li>
							</ul>
							<ul class="follow-me list-inline">
								<li>1,299 people following her</li>
								<li><button class="btn-primary">Add Friend</button></li>
							</ul>
						</div>
					</div>
				</div>
				<!--Timeline Menu for Large Screens End-->

				<!--Timeline Menu for Small Screens-->
				<div class="navbar-mobile hidden-lg hidden-md">
					<div class="profile-info">
						<img src="http://placehold.it/300x300" alt=""
							class="img-responsive profile-photo" />
						<h4>Sarah Cruiz</h4>
						<p class="text-muted">Creative Director</p>
					</div>
					<div class="mobile-menu">
						<ul class="list-inline">
							<li><a href="timline.html">Timeline</a></li>
							<li><a href="timeline-about.html" class="active">About</a></li>
							<li><a href="timeline-album.html">Album</a></li>
							<li><a href="timeline-friends.html">Friends</a></li>
						</ul>
						<button class="btn-primary">Add Friend</button>
					</div>
				</div>
				<!--Timeline Menu for Small Screens End-->

			</div>
			<div id="page-contents">
				<div class="row">
					<div class="col-md-3">

						<!--Edit Profile Menu-->
						<ul class="edit-menu">
							<li><i class="icon ion-ios-information-outline"></i><a
								href="edit-profile-basic.html">Basic Information</a></li>
							<li><i class="icon ion-ios-briefcase-outline"></i><a
								href="edit-profile-work-edu.html">Education and Work</a></li>
							<li class="active"><i class="icon ion-ios-heart-outline"></i><a
								href="edit-profile-interests.html">My Interests</a></li>
							<li><i class="icon ion-ios-settings"></i><a
								href="edit-profile-settings.html">Account Settings</a></li>
							<li><i class="icon ion-ios-locked-outline"></i><a
								href="edit-profile-password.html">Change Password</a></li>
						</ul>
					</div>
					<div class="col-md-7">

						<!-- Edit Interests
              ================================================= -->
						<div class="edit-profile-container">
							<div class="block-title">
								<h4 class="grey">
									<i class="icon ion-ios-heart-outline"></i>My Interests
								</h4>
								<div class="line"></div>
								<p>At vero eos et accusamus et iusto odio dignissimos
									ducimus qui blanditiis praesentium voluptatum deleniti atque
									corrupti quos dolores et quas molestias excepturi sint
									occaecati cupiditate</p>
								<div class="line"></div>
							</div>
							<div class="edit-block">
								<ul class="list-inline interests">
									<li><a href=""><i class="icon ion-android-bicycle"></i>
											Bycicle</a></li>
									<li><a href=""><i class="icon ion-ios-camera"></i>
											Photgraphy</a></li>
									<li><a href=""><i class="icon ion-android-cart"></i>
											Shopping</a></li>
									<li><a href=""><i class="icon ion-android-plane"></i>
											Traveling</a></li>
									<li><a href=""><i class="icon ion-android-restaurant"></i>
											Eating</a></li>
								</ul>
								<div class="line"></div>
								<div class="row">
									<p class="custom-label">
										<strong>Add interests</strong>
									</p>
									<div class="form-group col-sm-8">
										<input id="add-interest" class="form-control input-group-lg"
											type="text" name="interest" title="Choose Interest"
											placeholder="Interests. For example, photography" />
									</div>
									<div class="form-group col-sm-4">
										<button class="btn btn-primary">Add</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-2 static">

						<!--Sticky Timeline Activity Sidebar-->
						<div id="sticky-sidebar">
							<h4 class="grey">Sarah's activity</h4>
							<div class="feed-item">
								<div class="live-activity">
									<p>
										<a href="#" class="profile-link">Sarah</a> Commended on a
										Photo
									</p>
									<p class="text-muted">5 mins ago</p>
								</div>
							</div>
							<div class="feed-item">
								<div class="live-activity">
									<p>
										<a href="#" class="profile-link">Sarah</a> Has posted a photo
									</p>
									<p class="text-muted">an hour ago</p>
								</div>
							</div>
							<div class="feed-item">
								<div class="live-activity">
									<p>
										<a href="#" class="profile-link">Sarah</a> Liked her friend's
										post
									</p>
									<p class="text-muted">4 hours ago</p>
								</div>
							</div>
							<div class="feed-item">
								<div class="live-activity">
									<p>
										<a href="#" class="profile-link">Sarah</a> has shared an album
									</p>
									<p class="text-muted">a day ago</p>
								</div>
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
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.sticky-kit.min.js"></script>
	<script src="js/jquery.scrollbar.min.js"></script>
	<script src="js/script.js"></script>

</body>
</html>
