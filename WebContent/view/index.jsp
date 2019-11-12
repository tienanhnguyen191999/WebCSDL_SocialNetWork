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
<title>Friend Finder | A Complete Social Network Template</title>

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

	<!--preloader-->
	<div id="spinner-wrapper">
		<div class="spinner"></div>
	</div>
		
	<jsp:include page="template/header.jsp"></jsp:include>
	<script type="text/javascript">
		$('#header').addClass("lazy-load");
		$('#newfeed_nav').hide();
		$('#timeline_nav').hide();
		$('#search_nav').hide();
	</script>
	<!-- Top Banner
    ================================================= -->
	<section id="banner">
		<div class="container">

			<!-- Sign Up Form
        ================================================= -->
			<div class="sign-up-form">
				<a href="index.jsp" class="logo"><img src="images/logo.png"
					alt="Friend Finder" /></a>
				<h2 class="text-white">Find My Friends</h2>
				<div class="line-divider"></div>
				<div class="form-wrapper">
					<p class="signup-text">Signup now and meet awesome people
						around the world</p>
					<form action="#">
						<fieldset class="form-group">
							<input type="text" class="form-control" id="example-name"
								placeholder="Enter name">
						</fieldset>
						<fieldset class="form-group">
							<input type="email" class="form-control" id="example-email"
								placeholder="Enter email">
						</fieldset>
						<fieldset class="form-group">
							<input type="password" class="form-control" id="example-password"
								placeholder="Enter a password">
						</fieldset>
					</form>
					<p>By signning up you agree to the terms</p>
					<button class="btn-secondary">Signup</button>
				</div>
				<a href="#">Already have an account?</a> <img class="form-shadow"
					src="images/bottom-shadow.png" alt="" />
			</div>
			<!-- Sign Up Form End -->

			<svg class="arrows hidden-xs hidden-sm">
          <path class="a1" d="M0 0 L30 32 L60 0"></path>
          <path class="a2" d="M0 20 L30 52 L60 20"></path>
          <path class="a3" d="M0 40 L30 72 L60 40"></path>
        </svg>
		</div>
	</section>

	<!-- Features Section
    ================================================= -->
	<section id="features">
		<div class="container wrapper">
			<h1 class="section-title slideDown">social herd</h1>
			<div class="row slideUp">
				<div class="feature-item col-md-2 col-sm-6 col-xs-6 col-md-offset-2">
					<div class="feature-icon">
						<i class="icon ion-person-add"></i>
					</div>
					<h3>Make Friends</h3>
				</div>
				<div class="feature-item col-md-2 col-sm-6 col-xs-6">
					<div class="feature-icon">
						<i class="icon ion-images"></i>
					</div>
					<h3>Publish Posts</h3>
				</div>
				<div class="feature-item col-md-2 col-sm-6 col-xs-6">
					<div class="feature-icon">
						<i class="icon ion-chatbox-working"></i>
					</div>
					<h3>Private Chats</h3>
				</div>
				<div class="feature-item col-md-2 col-sm-6 col-xs-6">
					<div class="feature-icon">
						<i class="icon ion-compose"></i>
					</div>
					<h3>Create Polls</h3>
				</div>
			</div>
			<h2 class="sub-title">find awesome people like you</h2>
			<div id="incremental-counter" data-value="5560"></div>
			<p>People Already Signed Up</p>
			<img src="images/face-map.png" alt=""
				class="img-responsive face-map slideUp hidden-sm hidden-xs" />
		</div>

	</section>


	<!-- Image Divider
    ================================================= -->
	<div class="img-divider hidden-sm hidden-xs"></div>

	<!-- Facts Section
    ================================================= -->
	<section id="site-facts">
		<div class="container wrapper">
			<div class="circle">
				<ul class="facts-list">
					<li>
						<div class="fact-icon">
							<i class="icon ion-ios-people-outline"></i>
						</div>
						<h3 class="text-white">1,01,242</h3>
						<p>People registered</p>
					</li>
					<li>
						<div class="fact-icon">
							<i class="icon ion-images"></i>
						</div>
						<h3 class="text-white">21,01,242</h3>
						<p>Posts published</p>
					</li>
					<li>
						<div class="fact-icon">
							<i class="icon ion-checkmark-round"></i>
						</div>
						<h3 class="text-white">41,242</h3>
						<p>People online</p>
					</li>
				</ul>
			</div>
		</div>
	</section>

	<!-- Live Feed Section
    ================================================= -->
	<section id="live-feed">
		<div class="container wrapper">
			<h1 class="section-title slideDown">live feed</h1>
			<ul class="online-users list-inline slideUp">
				<li><a href="#" title="Alexis Clark"><img
						src="http://placehold.it/300x300" alt=""
						class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
				<li><a href="#" title="James Carter"><img
						src="http://placehold.it/300x300" alt=""
						class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
				<li><a href="#" title="Robert Cook"><img
						src="http://placehold.it/300x300" alt=""
						class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
				<li><a href="#" title="Richard Bell"><img
						src="http://placehold.it/300x300" alt=""
						class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
				<li><a href="#" title="Anna Young"><img
						src="http://placehold.it/300x300" alt=""
						class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
				<li><a href="#" title="Julia Cox"><img
						src="http://placehold.it/300x300" alt=""
						class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
			</ul>
			<h2 class="sub-title">see what's happening now</h2>
			<div class="row">
				<div class="col-md-4 col-sm-6 col-md-offset-2">
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Sarah</a> just posted a photo
								from Moscow
							</p>
							<p class="text-muted">20 Secs ago</p>
						</div>
					</div>
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">John</a> Published a post from
								Sydney
							</p>
							<p class="text-muted">1 min ago</p>
						</div>
					</div>
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Julia</a> Updated her status
								from London
							</p>
							<p class="text-muted">5 mins ago</p>
						</div>
					</div>
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Sophia</a> Share a photo from
								Virginia
							</p>
							<p class="text-muted">10 mins ago</p>
						</div>
					</div>
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Linda</a> just posted a photo
								from Toronto
							</p>
							<p class="text-muted">20 mins ago</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Nora</a> Shared an article from
								Ohio
							</p>
							<p class="text-muted">22 mins ago</p>
						</div>
					</div>
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Addison</a> Created a poll from
								Barcelona
							</p>
							<p class="text-muted">23 mins ago</p>
						</div>
					</div>
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Diana</a> Posted a video from
								Captown
							</p>
							<p class="text-muted">27 mins ago</p>
						</div>
					</div>
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Sarah</a> Shared friend's post
								from Moscow
							</p>
							<p class="text-muted">30 mins ago</p>
						</div>
					</div>
					<div class="feed-item">
						<img src="http://placehold.it/300x300" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="#" class="profile-link">Emma</a> Started a new job at
								Torronto
							</p>
							<p class="text-muted">33 mins ago</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="template/footer.jsp"></jsp:include>

	<!-- Scripts
    ================================================= -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.appear.min.js"></script>
	<script src="js/jquery.incremental-counter.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
