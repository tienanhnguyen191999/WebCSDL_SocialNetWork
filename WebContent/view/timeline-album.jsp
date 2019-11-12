<!DOCTYPE html>
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
<title>Photo Album | My Photo Gallery</title>

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
		<%
			String id = request.getQueryString().substring(3);
		%>
		<div class="timeline">
			<jsp:include page="template/timelineCover.jsp?id=<%=id%>"></jsp:include>

			<div id="page-contents">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-7">

						<!-- Photo Album
              ================================================= -->
						<ul class="album-photos">
							<%
								ResultSet rs = (ResultSet) request.getAttribute("post");
								int i = 1;
								while (rs.next()) {
							%>
							<li>
								<%
									if (rs.getInt("type") == 2) {
								%>
								<div class="img-wrapper" data-toggle="modal"
									data-target=".photo-<%=i%>">
									<img src="images/post/<%=rs.getString("link")%>" alt="photo" />
								</div>
								<div class="modal fade photo-<%=i%>" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<img src="images/post/<%=rs.getString("link")%>" alt="photo" />
										</div>
									</div>
								</div> <%
									 	} else {
									 %>
								<div class="img-wrapper" data-toggle="modal"
									data-target=".photo-<%=i%>">
									<video controls>
										<source src="videos/<%=rs.getString("link")%>">
									</video>
								</div>
								<div class="modal fade photo-<%=i%>" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<div class="modal-content">
											<video controls>
												<source src="videos/<%=rs.getString("link")%>">
											</video>
										</div>
									</div>
								</div> <%
 	}
 %>
							</li>
							<%
								i++;
								}
							%>

						</ul>
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
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.sticky-kit.min.js"></script>
	<script src="js/jquery.scrollbar.min.js"></script>
	<script src="js/script.js"></script>

</body>
</html>
