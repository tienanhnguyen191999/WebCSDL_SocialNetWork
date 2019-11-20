<!DOCTYPE html>
<%@page import="com.controller.MyUtils"%>
<%@page import="com.model.User"%>
<%@page import="java.sql.ResultSet"%>
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
<title>Images | Cool Images</title>

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

	<div id="page-contents">
		<div class="container">
			<div class="row">


				<jsp:include page="template/leftSideBarNewsFeed.jsp"></jsp:include>
				<div class="col-md-7">
					<!-- Media
            ================================================= -->
					<div class="media">
						<div class="row js-masonry"
							data-masonry='{ "itemSelector": ".grid-item", "columnWidth": ".grid-sizer", "percentPosition": true }'>
							<div class="grid-sizer col-md-6 col-sm-6"></div>
							<%
								ResultSet rs = (ResultSet) request.getAttribute("newsfeeds");
								int i = 1;
								while (rs.next()) {
									User user = User.getUser(Integer.parseInt(request.getSession().getAttribute("user_id").toString()));
							%>

							<div class="grid-item col-md-6 col-sm-6">
								<div class="media-grid">
									<div class="img-wrapper" data-toggle="modal"
										data-target=".modal-<%=i%>">
										<img src="images/post/<%=rs.getString("link")%>"
											alt="postImage" class="img-responsive post-image" />
									</div>
									<div class="media-info">
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
										<div class="user-info">
											<img src="images/user/<%=user.getAvatar()%>" alt=""
												class="profile-photo-sm pull-left" />
											<div class="user">
												<h6>
													<a href="#" class="profile-link"><%=user.getFname()%></a>
												</h6>
												<a class="text-green" href="#">Friend</a>
											</div>
										</div>
									</div>

									<!--Popup-->
									<div class="modal fade modal-<%=i%>" tabindex="-1"
										role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="post-content">
													<img src="images/post/<%=rs.getString("link")%>"
														alt="post-image" class="img-responsive post-image" />
													<div class="post-container">
														<img src="images/user/<%=user.getAvatar()%>" alt="user"
															class="profile-photo-md pull-left" />
														<div class="post-detail">
															<div class="user-info">
																<h5>
																	<a href="timeline.html" class="profile-link"><%=user.getFname()%></a>
																	<span class="following">following</span>
																</h5>
																<p class="text-muted">Published a photo about 3 mins
																	ago</p>
															</div>
															<!-- Like module -->
															<div class="reaction">
																<a id="1<%=rs.getInt("post_id")%>"
																	class="btn text-green likeBtn1"> <i
																	class="icon ion-thumbsup"></i>13
																</a> <a id="1dislike<%=rs.getInt("post_id")%>"
																	class="btn text-red dislikeBtn1"> <i
																	class="fa fa-thumbs-down"></i>0
																</a>
																<script type="text/javascript">
																	$(document).ready(function(){
																		// remove all event Listener
																		$(".likeBtn1").off();
																		$(".dislikeBtn1").off();
																		
																		// Render When load
																		var str = "<%=MyUtils.getLikeAndDislike(rs.getInt("post_id"))%>"
																		var arr = str.split("|");
																		$("#1" + arr[2]).html('<i class="icon ion-thumbsup"></i>' + arr[0]);
																		$("#1dislike" + arr[2] ).html('<i class="fa fa-thumbs-down"></i>' + arr[1]); 
																		// Find which post is react -> css border (PENDING)
																		<%-- $.ajax({
																			url: "handleGetAllPostReact",
																			method: "post",
																			data: { user_id : <%= request.getSession().getAttribute("user_id") %>}
																			success: function(data){
																				
																			}
																		}) --%>
																			
																		
									
																		// handleClick
																		$(".likeBtn1").on('click',function(){
																			$.ajax({
																				url: "handleLikeModule",
																				method: "POST",
																				data: { value : "1" , post_id : $(this).attr("id").substr(1)},
																				success: function(data){
																					var arr = data.split("|");
																					console.log(arr);
																					$("#1" + arr[2]).html('<i class="icon ion-thumbsup"></i>' + arr[0]);
																					$("#1" + arr[2]).css('border','1px solid');
																					$("#1dislike" + arr[2] ).html('<i class="fa fa-thumbs-down"></i>' + arr[1]);
																					$("#1dislike" + arr[2]).css('border','none');
																				}
																			});
																			
																		});
																		$(".dislikeBtn1").on('click',function(){
																			$.ajax({
																				url: "handleLikeModule",
																				method: "POST",
																				data: { value : "-1" , post_id : $(this).attr("id").substr(8)},
																				success: function(data){
																					var arr = data.split("|");
																					console.log(arr);
																					$("#1" + arr[2]).html('<i class="icon ion-thumbsup"></i>' + arr[0]);
																					$("#1" + arr[2]).css('border','none');
																					$("#1dislike" + arr[2]).html('<i class="fa fa-thumbs-down"></i>' + arr[1]);
																					$("#1dislike" + arr[2]).css('border','1px solid');
																				}
																			});
																			
																		});
																	});
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
																	<img src="images/user/<%=userComment.getAvatar()%>"
																		alt="" class="profile-photo-sm" />
																	<p>
																		<a href="timeline.jsp" class="profile-link"><%=userComment.getFname()%></a>&nbsp;
																		<%=comment.getString("content")%>
																	</p>
																	<small><%=MyUtils.convertTimeStamp(comment.getTimestamp("comment_at"))%></small>
																</div>
																<%
																	}
																%>

															</div>

															<!-- Form comment -->
															<div class="post-comment">
																<img src="images/user/<%=user.getAvatar()%>"
																	alt="userImage" class="profile-photo-sm" /> <input
																	type="text" id="commentContent<%=i%>"
																	class="form-control" placeholder="Post a comment">
																<i id="submitIcon<%=i%>" class="fa fa-arrow-up iconSend"
																	aria-hidden="true"></i>

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
														$(".allComment").append('<div class="post-comment"><img src="images/user/<%= request.getSession().getAttribute("avatar") %>" alt="" class="profile-photo-sm" /><p><a href="timeline.jsp" class="profile-link"><%= request.getSession().getAttribute("fname") %></a>&nbsp;' + $("#commentContent<%=i%>").val() + '</p></div>');
														$("#commentContent<%=i%>").val("");
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
														success: function(data){
															var arr = data.split("|");
															$(".allComment").append('<div class="post-comment"><img src="images/user/<%= request.getSession().getAttribute("avatar") %>" alt="" class="profile-photo-sm" /><p><a href="timeline.jsp" class="profile-link"><%= request.getSession().getAttribute("fname") %></a>&nbsp;' + $("#commentContent<%=i%>").val() + '</p></div>');
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
											</div>
										</div>
									</div>
									<!--Popup End-->

								</div>
							</div>


							<%
								i++;
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
	<script src="js/masonry.pkgd.min.js"></script>
	<script src="js/jquery.sticky-kit.min.js"></script>
	<script src="js/jquery.scrollbar.min.js"></script>
	<script src="js/script.js"></script>

</body>
</html>
