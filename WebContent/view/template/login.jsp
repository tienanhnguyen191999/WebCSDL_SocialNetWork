<!--Login-->
<div class="tab-pane" id="login">
	<h3>Login</h3>
	<p class="text-muted">Log into your account</p>

	<!--Login Form-->
	<form name="Login_form" id='Login_form' action="login" method="post">
		<div class="row">
			<div class="form-group col-xs-12">
				<label for="my-email" class="sr-only">Email</label> <input
					id="email" class="form-control input-group-lg" type="text"
					name="email" title="Enter Email" placeholder="Your Email" />
			</div>
		</div>
		<div class="row">
			<div class="form-group col-xs-12">
				<label for="my-password" class="sr-only">Password</label> <input
					id="my-password" class="form-control input-group-lg"
					type="password" name="password" title="Enter password"
					placeholder="Password" />
			</div>
		</div>
		<p>
			<a href="#">Forgot Password?</a>
		</p>
		<button class="btn btn-primary">Login Now</button>
	</form>
	<!--Login Form Ends-->

</div>
