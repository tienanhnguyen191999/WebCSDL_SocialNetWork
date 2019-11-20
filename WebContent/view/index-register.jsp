<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta contentType="text/html" charset="UTF-8">
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
<script src="js/jquery-3.1.1.min.js"></script>
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
	<script type="text/javascript">
		$('#newfeed_nav').hide();
		$('#timeline_nav').hide();
		$('#search_nav').hide();
	</script>
	<!-- Landing Page Contents
    ================================================= -->
	<div id="lp-register">
		<div class="container wrapper">
			<div class="row">
				<div class="col-sm-5">
					<div class="intro-texts">
						<h1 class="text-white">Gặp gỡ những người bạn tuyệt vời!!!</h1>
						<p>Friend Hub là 1 nền tảng mạng xã hội mà ở đó mọi người
							kết nối với nhau. Freind Hub cung cấp cho bạn không gian để
							giao lưu, kết bạn, chia sẻ những cảm xúc tuyệt vời. Hãy đăng kí
							ngay hôm nay để trở thành thành của Friend Hub</p>
						<button class="btn btn-primary">Tìm hiểu thêm</button>
					</div>
				</div>
				<div class="col-sm-6 col-sm-offset-1">
					<div class="reg-form-container">

						<!-- Register/Login Tabs-->
						<div class="reg-options">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#register" data-toggle="tab">Đăng kí</a></li>
								<li><a href="#login" data-toggle="tab">Đăng nhập</a></li>
							</ul>
							<!--Tabs End-->
						</div>

						<!--Registration Form Contents-->
						<div class="tab-content">
							<div class="tab-pane active" id="register">
								<jsp:include page="template/register.jsp"></jsp:include>
								<jsp:include page="template/login.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-6">

						<!--Social Icons-->
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

		<!--preloader-->
		<div id="spinner-wrapper">
			<div class="spinner"></div>
		</div>

		<!-- Scripts
    ================================================= -->
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.appear.min.js"></script>
		<script src="js/jquery.incremental-counter.js"></script>
		<script src="js/script.js"></script>
</body>
</html>
