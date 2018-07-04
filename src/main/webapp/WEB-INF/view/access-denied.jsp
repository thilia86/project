<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Ropa+Sans"
	rel="stylesheet">

<style>
body {
	font-family: 'Ropa Sans', sans-serif;
	margin-top: 30px;
	text-align: center;
	color: #fff;
	background-image:
		url("http://avante.biz/wp-content/uploads/Earth-From-Space/Earth-From-Space88.jpg");
}

.error-heading {
	margin: 50px auto;
	width: 250px;
	border: 5px solid #fff;
	font-size: 126px;
	line-height: 126px;
	border-radius: 30px;
	text-shadow: 6px 6px 5px #000;
}

.error-heading img {
	width: 100%;
}

.error-main h1 {
	font-size: 72px;
	margin: 0px;
	color: white;
	text-shadow: 0px 0px 5px #fff;
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
</style>

</head>
<body>
	<div class="error-main">
		<h1>ACCESS DENIED!!!</h1>
		<div class="error-heading">403</div>
	</div>
</body>

<!-- put a new button : Back Home -->
<div class="control-label col-sm-4">
	<input type="button" class="bttn bttn" value="Back Home"
		onclick="window.location.href='${pageContext.request.contextPath }/'; return false;"
		class="add-button" />
</div>

</html>
