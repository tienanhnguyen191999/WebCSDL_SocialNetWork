<%@page import="java.sql.ResultSet"%>
<%@page import="com.controller.MyUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Newsfeed Common Side Bar Right
          ================================================= -->
<div class="col-md-2 static">
	<div class="suggestions" id="sticky-sidebar">
		<h4 class="grey">Gợi ý kết bạn</h4>
		<%
			ResultSet rs = MyUtils.getUnknowFriend(request.getSession().getAttribute("user_id").toString(),6);
			while(rs.next())
			{
		%>
		<div class="follow-user">
			<img src="images/user/<%= rs.getString("avatar") %>" alt="UserAvatar"
				class="profile-photo-sm pull-left" />
			<div>
				<h5>
					<a href="timeline?id=<%=rs.getInt("user_id") %>"><%= rs.getString("fname") %></a>
				</h5>
				<% if (MyUtils.hasSendRequestYet(request.getSession().getAttribute("user_id").toString(),rs.getInt("user_id") + "")){ %>
				<p class="text-green addFriend"">Đã gửi lời mời kết bạn</p>
				<% }else{ %>
				<p class="text-green addFriend" id="addFriend<%= rs.getInt("user_id")%>">Thêm bạn</p>
				<% } %>
			</div>
		</div>
			<script type="text/javascript">
				$(document).ready(()=>{
					$('#addFriend<%= rs.getInt("user_id")%>').click(function(){
						$.ajax({
							url: "handleAddFriend",
							method: "post",
							data: { user_get_noti : <%= rs.getInt("user_id")%> },
							success: function(data){
								$('#addFriend<%= rs.getInt("user_id")%>').html("Đã gửi lời mời kết bạn");
								$('#addFriend<%= rs.getInt("user_id")%>').removeAttr("id");
							}
						})
					})
				})
			</script>
		<%
			}
		%>
	</div>
</div>
