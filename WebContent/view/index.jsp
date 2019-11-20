<!DOCTYPE html>
<%@page import="com.model.User"%>
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
<title>Friend Hub | A Complete Social Network Template</title>

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
				<a href="index.jsp" class="logo"><img style="width: 190px;" src="images/logo.png"
					alt="Friend Finder" /></a>
				<h2 class="text-white">Tìm kiếm bạn bè</h2>
				<div class="line-divider"></div>
				<div class="form-wrapper">
					<a href="index-register.jsp">
					<p class="signup-text">Đăng kí ngay để gặp gỡ hàng ngàn người bạn quanh thế giới</p>
					<!-- <form action="#">
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
					</form> -->
					<p>Friend Finder - Nền tảng mạng xã hội kết nối mọi người</p>
					<button class="btn-secondary">Đăng kí ngay</button>
					</a>
				</div>
				<a href="index-register.jsp">Đã có tài khoản ? Đăng nhập ngay</a> <img class="form-shadow"
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
					<h3>Tìm kiếm bạn bè</h3>
				</div>
				<div class="feature-item col-md-2 col-sm-6 col-xs-6">
					<div class="feature-icon">
						<i class="icon ion-images"></i>
					</div>
					<h3>Đăng bài viết</h3>
				</div>
				<div class="feature-item col-md-2 col-sm-6 col-xs-6">
					<div class="feature-icon">
						<i class="icon ion-chatbox-working"></i>
					</div>
					<h3>Chat riêng tư</h3>
				</div>
				<div class="feature-item col-md-2 col-sm-6 col-xs-6">
					<div class="feature-icon">
						<i class="icon ion-compose"></i>
					</div>
					<h3>Thăm dò ý kiến</h3>
				</div>
			</div>
			<h2 class="sub-title">Tìm kiếm những người bạn tuyệt vời</h2>
			<div id="incremental-counter" data-value="<%= MyUtils.getTotalUser()%>"></div>
			<p>người đã đăng kí</p>
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
						<h3 class="text-white"><%= MyUtils.getTotalUser() %></h3>
						<p>người đăng kí</p>
					</li>
					<li>
						<div class="fact-icon">
							<i class="icon ion-images"></i>
						</div>
						<h3 class="text-white"><%= MyUtils.getTotalPost() %></h3>
						<p>bài viết</p>
					</li>
					<li>
						<div class="fact-icon">
							<i class="icon ion-checkmark-round"></i>
						</div>
						<h3 class="text-white">2</h3>
						<p>người đang online</p>
					</li>
				</ul>
			</div>
		</div>
	</section>

	<!-- Live Feed Section
    ================================================= -->
	<section id="live-feed">
		<div class="container wrapper">
			<h1 class="section-title slideDown">Bài viết mới</h1>
			<ul class="online-users list-inline slideUp">
				<%
					ResultSet rs = MyUtils.getAvatarIndexPage();
					while (rs.next()) {
				%>
				<li><a href="#"
					title="<%=rs.getString("fname")%>"><img
						src="images/user/<%=rs.getString("avatar")%>" alt=""
						class="img-responsive profile-photo" /><span class="online-dot"></span></a></li>
				<%
					}
					rs.close();
				%>
			</ul>
			<h2 class="sub-title">Khám phá</h2>
			<div class="row">
				<div class="col-md-4 col-sm-6 col-md-offset-2">
					<%
						ResultSet rs1 = MyUtils.getPostInfoIndexPage();
						int i = 0;
						while (rs1.next()) {
							i++;
							User user = User.getUser(rs1.getInt("user_id"));
					%>
					<div class="feed-item">
						<img src="images/user/<%=user.getAvatar()%>" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="" class="profile-link"><%=user.getFname()%></a> vừa
								đăng 1
								<%=rs1.getInt("type") == 2 ? " ảnh" : " videos"%>
							</p>
							<p class="text-muted"><%=MyUtils.convertTimeStamp(rs1.getTimestamp("post_at"))%></p>
						</div>
					</div>
					<%
						if (i > 4)
								break;
						}
					%>
				</div>
				<div class="col-md-4 col-sm-6">
					<%
						while (rs1.next()) {
							User user = User.getUser(rs1.getInt("user_id"));
					%>
					<div class="feed-item">
						<img src="images/user/<%=user.getAvatar()%>" alt="user"
							class="img-responsive profile-photo-sm" />
						<div class="live-activity">
							<p>
								<a href="" class="profile-link"><%=user.getFname()%></a> vừa
								đăng 1
								<%=rs1.getInt("type") == 2 ? " ảnh" : " videos"%>
							</p>
							<p class="text-muted"><%=MyUtils.convertTimeStamp(rs1.getTimestamp("post_at"))%></p>
						</div>
					</div>
					<%
						}rs1.close();
					%>
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
