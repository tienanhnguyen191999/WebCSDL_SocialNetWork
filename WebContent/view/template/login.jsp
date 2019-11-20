
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--Login-->
<div class="tab-pane" id="login">
	<h3>Đăng nhập</h3>
	<p class="text-muted">Đăng nhập vào tài khoản của bạn</p>

	<!--Login Form-->
	<form name="Login_form" id='Login_form' action="login" method="post">
		<div class="row">
			<div class="form-group col-xs-12">
				<label for="my-email" class="sr-only">Email</label> <input
					id="email" class="form-control input-group-lg" type="text"
					name="email" title="Enter Email" placeholder="Email" />
			</div>
		</div>
		<div class="row">
			<div class="form-group col-xs-12">
				<label for="my-password" class="sr-only">Mật khẩu</label> <input
					id="my-password" class="form-control input-group-lg"
					type="password" name="password" title="Enter password"
					placeholder="Mật khẩu" />
			</div>
		</div>
		<p>
			<a href="#">Quên mật khẩu</a>
		</p>
		<button class="btn btn-primary">Đăng nhập</button>
	</form>
	<!--Login Form Ends-->

</div>
