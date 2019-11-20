
<%@page import="com.model.User"%>
<%@page import="com.controller.MyUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="timeline-cover" >

	<%
		String id = request.getQueryString().substring(3);
		User user = User.getUser(Integer.parseInt(id));
	%>
	<script type="text/javascript">
		// update poster
		$(document).ready(function(){
			$(".timeline-cover").css('background-image','url(images/user/<%=user.getPoster()%>)');
		})
	</script>
	<%
		if (request.getSession().getAttribute("user_id").toString().equals(id)) {
	%>
	<i data-toggle="modal" data-target="#updatePoster"
		id="iconUpdatePoster" class="fa fa-wrench" aria-hidden="true"></i>
	<%
		}
	%>
	<!-- Modal -->
	<div class="modal fade" id="updatePoster" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<form action="uploadPoster" method="post"
				enctype="multipart/form-data" id="formUploadAvatar">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">CẬP NHẬT
							Poster</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<label>Tải ảnh lên: </label> <i id="uploadPoster"
								class="fa fa-upload" aria-hidden="true"></i> <input type="file"
								id="inputPoster" name="poster" required>
						</div>
						<div>
							<img style="max-width: 570px;" 'src="#" alt="" id="imagePreview1" />
						</div>
					</div>
					<script type="text/javascript">
						$(document)
								.ready(
										function() {
											$('#inputPoster').hide();
											$("#uploadPoster")
													.click(
															function() {
																$(
																		"#inputPoster")
																		.trigger(
																				'click');
															})
											$("#inputPoster")
													.change(
															function() {
																var input = this;
																if (input.files
																		&& input.files[0]) {
																	var reader = new FileReader();
																	reader.onload = function(
																			e) {
																		$(
																				'#imagePreview1')
																				.attr(
																						'src',
																						e.target.result);
																	}
																	reader
																			.readAsDataURL(input.files[0]);
																}
															})

										})
					</script>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Lưu thay
							đổi</button>
					</div>
				</div>
			</form>
		</div>
	</div>


	<!--Timeline Menu for Large Screens-->
	<div class="timeline-nav-bar hidden-sm hidden-xs">
		<div class="row">
			<div class="col-md-3">
				<div class="profile-info">
					<img src="images/user/<%=user.getAvatar()%>" alt=""
						class="img-responsive profile-photo" />
					<%
						if (request.getSession().getAttribute("user_id").toString().equals(id)) {
					%>
					<i data-toggle="modal" data-target="#updateAvatar"
						id="iconUpdateAvatar" class="fa fa-wrench" aria-hidden="true"></i>
					<%
						}
					%>
					<h3 style="position: relative; top: -30px;"><%=user.getFname()%></h3>
					</p>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="updateAvatar" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<form action="uploadAvatar" method="post"
							enctype="multipart/form-data" id="formUploadAvatar">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">CẬP NHẬT
										AVATAR</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="row">
										<label>Tải ảnh lên: </label> <i id="uploadAvatar"
											class="fa fa-upload" aria-hidden="true"></i> <input
											type="file" id="inputAvatar" name="avatar" required>
									</div>
									<img src="#" alt="" id="imagePreview" />
								</div>
								<script type="text/javascript">
									$(document)
											.ready(
													function() {
														$('#inputAvatar')
																.hide();
														$("#uploadAvatar")
																.click(
																		function() {
																			$(
																					"#inputAvatar")
																					.trigger(
																							'click');
																		})
														$("#inputAvatar")
																.change(
																		function() {
																			var input = this;
																			if (input.files
																					&& input.files[0]) {
																				var reader = new FileReader();
																				reader.onload = function(
																						e) {
																					$(
																							'#imagePreview')
																							.attr(
																									'src',
																									e.target.result);
																				}
																				reader
																						.readAsDataURL(input.files[0]);
																			}
																		})

													})
								</script>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">Lưu thay
										đổi</button>
								</div>
							</div>
						</form>
					</div>
				</div>

			</div>
			<div class="col-md-9">
				<ul class="list-inline profile-menu">
					<li><a href="timeline?id=<%=id%>" class="active">Dòng thời
							gian</a></li>
					<li><a href="timeline-about.jsp?id=<%=id%>">About</a></li>
					<li><a href="timeline-album?id=<%=id%>">Album</a></li>
					<li><a href="timeline-friends.jsp?id=<%=id%>">Bạn bè</a></li>
				</ul>
				<ul class="follow-me list-inline">
					<li><%=MyUtils.totalFriend(Integer.parseInt(id))%> người theo
						dõi</li>
					<%
						if (!request.getSession().getAttribute("user_id").toString().equals(id)) {
					%>
					<li><button class="btn-primary">Add Friend</button></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<!--Timeline Menu for Large Screens End-->

	<!--Timeline Menu for Small Screens-->
	<div class="navbar-mobile hidden-lg hidden-md">
		<div class="profile-info">
			<img src="images/user/<%=user.getAvatar()%>" alt=""
				class="img-responsive profile-photo" />
			<h4><%=user.getFname()%></h4>
		</div>
		<div class="mobile-menu">
			<ul class="list-inline">
				<li><a href="timline?id=<%=id%>" class="active">Timeline</a></li>
				<li><a href="timeline-about.jsp?id=<%=id%>">About</a></li>
				<li><a href="timeline-album?id=<%=id%>">Album</a></li>
				<li><a href="timeline-friends.jsp?id=<%=id%>">Friends</a></li>
			</ul>
			<button class="btn-primary">Add Friend</button>
		</div>
	</div>
	<!--Timeline Menu for Small Screens End-->

</div>
