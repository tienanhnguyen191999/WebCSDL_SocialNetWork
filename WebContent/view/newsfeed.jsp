<!DOCTYPE html>
<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model.User,com.controller.MyUtils"%>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="This is social network html5 template available in themeforest......" />
<meta name="keywords"
	content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page" />
<meta name="robots" content="index, follow" />
<title>News Feed | Check what your friends are doing</title>

<!-- Stylesheets
    ================================================= -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link href="css/emoji.css" rel="stylesheet">

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
		request.setCharacterEncoding("UTF-8");
	%>

	<div id="page-contents">
		<div class="container">
			<div class="row">



				<jsp:include page="template/leftSideBarNewsFeed.jsp"></jsp:include>
				<% request.getSession().setAttribute("url", "newsfeed");%>
				<div class="col-md-7">

					<!-- Post Create Box
            ================================================= -->
					<div class="create-post">
						<form action="postUpload" enctype="multipart/form-data"
							method="POST">
							<div class="row">
								<div class="col-md-7 col-sm-7">
									<div class="form-group">
										<img
											src="images/user/<%=request.getSession().getAttribute("avatar")%>"
											alt="userImage" class="profile-photo-md" />
										<textarea name="content" id="exampleTextarea" cols="30"
											rows="1" class="form-control"
											placeholder="Write what you wish" required></textarea>
									</div>
								</div>
								<div class="col-md-5 col-sm-5">
									<div class="tools">
										<ul class="publishing-tools list-inline">
											<li><a href="#"><i class="ion-compose"></i></a></li>
											<li class="iconImage"><a href="#"><i class="ion-images"></i></a></li>
											<input id="uploadImage" type="file" name="image" required>
											<li class="iconImage"><a href="#"><i class="ion-ios-videocam"></i></a></li>
											<li class="iconImage"s><a href="#"><i class="ion-map"></i></a></li>
										</ul>
										<button type="submit" class="btn btn-primary pull-right">Đăng
											tin</button>
									</div>
								</div>
								<script type="text/javascript">
									// Hide default UGLY input file uploads
									$(document).ready(function() {
										$('#uploadImage').hide();
										$('.iconImage').click(function() {
											$('#uploadImage').trigger('click');
										});
									});
								</script>
							</div>
						</form>
					</div>
					<!-- Post Create Box End-->

					<!-- Loop the Post Content -->
					<%
						ResultSet rs = (ResultSet) request.getAttribute("newsfeeds");
						int i = 1;
						while (rs.next()) {
							out.print(rs.getInt("post_id"));
							User user = User.getUser(rs.getInt("user_id"));
					%>

					<div class="post-content" id="post<%=rs.getInt("post_id")%>">
						<%
							if (rs.getInt("type") == 2) {
						%>
						<img src="images/post/<%=rs.getString("link")%>" alt="post-image"
							class="img-responsive post-image" />
						<%
							} else {
						%>
						<video class="post-video" controls>
							<source src="videos/<%=rs.getString("link")%>" type="video/mp4">
						</video>
						<%
							}
						%>
						<div class="post-container" >
							<img src="images/user/<%=user.getAvatar()%>" alt="user"
								class="profile-photo-md pull-left" />
							<div class="post-detail">
								<div class="user-info">
									<h5>
										<a href="timeline?id=<%= rs.getInt("user_id") %>" class="profile-link"><%=user.getFname()%></a>
										<span class="following">following</span>
									</h5>
									<p class="text-muted">
										Đã cập nhật trạng thái
										<%=MyUtils.convertTimeStamp(rs.getTimestamp("post_at"))%>
										trước
									</p>
								</div>

								<!-- Like module -->
								<div class="reaction">
									<a id="<%=rs.getInt("post_id")%>"
										class="btn text-green likeBtn"> <i
										class="icon ion-thumbsup"></i>13
									</a> <a id="dislike<%=rs.getInt("post_id")%>"
										class="btn text-red dislikeBtn"> <i
										class="fa fa-thumbs-down"></i>0
									</a>
									<script type="text/javascript">
										$(document).ready(function(){
											// remove all event Listener
											$(".likeBtn").off();
											$(".dislikeBtn").off();
											
											// Render When load
											var str = "<%=MyUtils.getLikeAndDislike(rs.getInt("post_id"))%>"
											var arr = str.split("|");
											$("#" + arr[2]).html('<i class="icon ion-thumbsup"></i>' + arr[0]);
											$("#dislike" + arr[2] ).html('<i class="fa fa-thumbs-down"></i>' + arr[1]); 
											// Find which post is react -> css border (PENDING)
											<%-- $.ajax({
												url: "handleGetAllPostReact",
												method: "post",
												data: { user_id : <%= request.getSession().getAttribute("user_id") %>}
												success: function(data){
													
												}
											}) --%>
												
											
		
											// handleClick
											$(".likeBtn").on('click',function(){
												$.ajax({
													url: "handleLikeModule",
													method: "POST",
													data: { value : "1" , post_id : $(this).attr("id")},
													success: function(data){
														var arr = data.split("|");
														console.log(arr);
														$("#" + arr[2]).html('<i class="icon ion-thumbsup"></i>' + arr[0]);
														$("#" + arr[2]).css('border','1px solid');
														$("#dislike" + arr[2] ).html('<i class="fa fa-thumbs-down"></i>' + arr[1]);
														$("#dislike" + arr[2]).css('border','none');
													}
												})
												
											})
											$(".dislikeBtn").on('click',function(){
												$.ajax({
													url: "handleLikeModule",
													method: "POST",
													data: { value : "-1" , post_id : $(this).attr("id").substr(7)},
													success: function(data){
														var arr = data.split("|");
														console.log(arr);
														$("#" + arr[2]).html('<i class="icon ion-thumbsup"></i>' + arr[0]);
														$("#" + arr[2]).css('border','none');
														$("#dislike" + arr[2]).html('<i class="fa fa-thumbs-down"></i>' + arr[1]);
														$("#dislike" + arr[2]).css('border','1px solid');
													}
												})
												
											})
										})
									</script>
								</div>
								<!-- End like module -->
								<div class="line-divider"></div>
								<div class="post-text">
									<p>
										<%=rs.getString("content")%>
									</p>
								</div>
								<div class="line-divider"></div>
								<div class="allComment" id="commentContainer<%=i%>">
									<%
										ResultSet comment = MyUtils.getAllComment(rs.getInt("post_id"));
											while (comment.next()) {
												User userComment = User.getUser(comment.getInt("user_id"));
									%>
									<div class="post-comment">
										<img src="images/user/<%=userComment.getAvatar()%>" alt=""
											class="profile-photo-sm" /> 
										<p>
										<a href="timeline?id=<%= comment.getInt("user_id") %>"
											class="profile-link"><%=userComment.getFname()%></a>
											&nbsp;<%=comment.getString("content")%>
										</p>
										<small><%=MyUtils.convertTimeStamp(comment.getTimestamp("comment_at"))%></small>


									</div>
									<%
										}
										comment.close();
									%>

								</div>

								<!-- Form comment -->
								<div class="post-comment">
									<img src="images/user/<%=request.getSession().getAttribute("avatar")%>" alt="userImage"
										class="profile-photo-sm" /> <input type="text"
										id="commentContent<%=i%>" class="form-control"
										placeholder="Post a comment"> <i id="submitIcon<%=i%>"
										class="fa fa-arrow-up iconSend" aria-hidden="true"></i>

								</div>

								<script type="text/javascript">
									// Use Ajax to handle Comment
									$(document).ready(function(){
										$('#submitIcon<%=i%>').off();
										$('#submitIcon<%=i%>').click(function() {
											var val = $("#commentContent<%=i%>").val();
											if ( val !== ""){
												$.ajax({
													url: "handleComment",
													method: "post",
													data: { content: val, user_id:<%=rs.getInt("user_id")%> , post_id: <%=rs.getInt("post_id")%>},
													success: function(data){
														var arr = data.split("|");
														$("#commentContent<%=i%>").val("");
														$("#commentContainer<%=i%>").append('<div class="post-comment"><img src="images/user/' + arr[2] + '" alt="" class="profile-photo-sm" /><p><a href="timeline.jsp" class="profile-link">' + arr[1]+ '</a>&nbsp;' + arr[0] + '</p></div>');
													}
												})
											}	
										});
											// enter key press event (PENDING)
											// Register event
											$('#submitIcon<%=i%>').bind("enterKey",function(){
												var val = $("#commentContent<%=i%>").val();
												if ( val !== ""){
													$.ajax({
														url: "handleComment",
														method: "post",
														data: { content: val, user_id:<%=rs.getInt("user_id")%> , post_id: <%=rs.getInt("post_id")%>},
														async: false,
														success: function(data){
															var arr = data.split("|");
															
															$(".allComment").append('<div class="post-comment"><img src="images/user/' + arr[2] + '" alt="" class="profile-photo-sm" /><p><a href="timeline.jsp" class="profile-link">' + arr[1]+ '</a>&nbsp;' + $("#commentContent<%=i%>").val() + '</p></div>');
															$("#commentContent<%=i%>").val("");
														}
													})
												}	
											});
											
											// Trigger new event by hit enter
											$("#commentContent<%=i%>").keyup(function(e){ 
												if(e.keyCode == 13) // Smash enter
											    {
											    	$('#submitIcon<%=i%>').trigger("enterKey");
											    }
											});
											
										});
								</script>

							</div>
						</div>
					
					</div>

					<%
						i++;
						}
						rs.close();
					%>
					<!-- End loop content -->

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
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTMXfmDn0VlqWIyoOxK8997L-amWbUPiQ&callback=initMap"></script>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.sticky-kit.min.js"></script>
	<script src="js/jquery.scrollbar.min.js"></script>
	<script src="js/script.js"></script>
</body>
</html>
