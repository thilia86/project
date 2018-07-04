<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>Login Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Reference Bootstrap files -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

.bttn {
	background-color: black;
	text-align: center;
	font-weight: bold;
	display: inline-block;
	border-radius: 4px;
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	cursor: pointer;
	opacity: 0.8;
	padding: 10px 12px;
}

.bttn {
	background-color: black;
	color: #31708f;
}

.bttn:hover {
	background-color: black;
	color: #31708f;
	opacity: 1.6;
}

body {
	background-image:
		url("http://avante.biz/wp-content/uploads/Earth-From-Space/Earth-From-Space88.jpg");
}
</style>


</head>

<body>

	<div style="margin-left: 500px; opacity: 0.8;">

		<div id="loginbox" style="margin-top: 120px;" class="mainbox col-md-5">

			<div class="panel panel-info">

				<div class="panel-heading"
					style="background-color: black; font-weight: bold;">
					<div class="panel-title">Sign In Or Up</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form
						action="${pageContext.request.contextPath}/authenticateTheUser"
						method="POST" class="form-horizontal">

						<!-- Place for messages: error, alert etc ... -->
						<div class="form-group">
							<div class="col-xs-15">
								<div>

									<!-- Check for login error -->

									<c:if test="${param.error != null}">

										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Invalid username and password.</div>

									</c:if>

									<!-- Check for logout -->
									<c:if test="${param.logout != null}">
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.</div>
									</c:if>

								</div>
							</div>
						</div>

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								name="username" placeholder="username" class="form-control">
						</div>

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								name="password" placeholder="password" class="form-control">
						</div>

						<!-- Login/Submit Button -->
						<div style="margin-top: 10px;" class="form-group">
							<div class="col-sm-6 controls">
								<button type="submit" class="bttn bttn">Login</button>
							</div>

							<!-- put a new button : Sign Up -->

							<div class="col-sm-2 controls" style="margin-left: 50px">
								<input type="button" class="bttn bttn" value="Sign Up"
									onclick="window.location.href='user/showFormForAdd'; return false;"
									class="add-button" />
							</div>
						</div>

					</form:form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>