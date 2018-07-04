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
	background-color: #F0CA00;
	background-color: #F3661C;
	text-align: center;
	color: #fff;
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
	color: #F3661C;
	text-shadow: 0px 0px 5px #fff;
}
</style>

</head>
<body>
	<div class="error-main">
		<h1>NOOOOOO! WHAT HAVE YOU DONE?!?!?!?</h1>
		<div class="error-heading">403</div>
		<p>
			You do not have permission to access the document that you requested!<br>
			POLICE ARE ON THEIR WAY TO YOUR HOME!!!
		</p>
	</div>
</body>

<!-- put a new button : Back Home -->
<div class="control-label col-sm-4">
	<input type="button" value="Back Home"
		onclick="window.location.href='${pageContext.request.contextPath }/'; return false;"
		class="add-button" />
</div>

</html>
