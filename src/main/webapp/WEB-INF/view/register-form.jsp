<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Save User</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {
	font-family: 'Ropa Sans', sans-serif;
	margin-top: 30px;
	text-align: center;
	color: #fff;
	background-image:
		url("http://avante.biz/wp-content/uploads/Earth-From-Space/Earth-From-Space88.jpg");
}

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

h2 {
	font-size: 60px;
	margin: 0px;
	color: white;
	text-shadow: 0px 0px 5px #fff;
}
</style>

</head>
<body>

	<h2>(Si)DreamTeam Chat</h2>

	<h3 class="text-center">Register a new User</h3>

	<form:form action="saveUser" modelAttribute="user" method="POST"
		class="form-horizontal">



		<div class="form-group">

			<label class="control-label col-sm-2" for="username">Username:</label>
			<div class="col-sm-6">
				<form:input type="text" class="form-control" id="username"
					path="username" placeholder="username" />
			</div>

		</div>


		<div class="form-group">

			<label class="control-label col-sm-2" for="password">Password:</label>
			<div class="col-sm-6">
				<form:input type="password" class="form-control" id="password"
					path="password" placeholder="Password" />
			</div>

		</div>

		<div style="visibility: hidden" class="form-group">

			<label class="control-label col-sm-2" for="enabled">Enabled:</label>
			<div class="col-sm-6">
				<form:input type="text" class="form-control" id="enabled"
					path="enabled" placeholder="Enabled" value="1" />
			</div>

		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="firstName">First
				Name:</label>
			<div class="col-sm-6">
				<form:input type="text" class="form-control" id="firstname"
					path="firstName" placeholder="FirtsName" />
			</div>
		</div>

		<div class="form-group">

			<label class="control-label col-sm-2" for="lastName">Last
				Name:</label>
			<div class="col-sm-6">
				<form:input type="text" class="form-control" id="lastname"
					path="lastName" placeholder="LastName" />
			</div>

		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="email">Email
				Address:</label>
			<div class="col-sm-6">
				<form:input type="text" class="form-control" id="email" path="email"
					placeholder="Email Address" />
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" value="Save" class="bttn bttn" /> 
				
				<input type="button" class="bttn bttn" value="Back Home"
					onclick="window.location.href='${pageContext.request.contextPath }/'; return false;"
					class="add-button" />

			</div>
		</div>

	</form:form>

</body>

</html>