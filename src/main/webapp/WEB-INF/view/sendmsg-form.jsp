<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Send a Message</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
	var user = $("#username").text();
	$("#senderUsername").val(user.trim());
	});
	
	</script>


<style>
body {
	font-family: 'Ropa Sans', sans-serif;
	margin-top: 30px;
	text-align: center;
	color: black;
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




	<p id="username" style="visibility: hidden">

		<security:authentication property="principal.username" />
	</p>


	<h3 class="text-center">Send a Message</h3>

	<form:form action="saveMessage" modelAttribute="message" method="POST">

		<!-- need to associate this data with message id-->
		<form:hidden path="id" />


		<div style="visibility: hidden" class="form-group row">

			<label class="col-sm-offset-1" for="senderUsername">Sender:</label>

			<form:input type="text" class="form-control col-sm-4"
				id="senderUsername" path="senderUsername"
				placeholder="SenderUsername" />

		</div>

		<div class="form-group row">

			<label class="col-sm-offset-1 col-sm-2" for="receiverUsername">Receiver:</label>

			<form:input type="text" class="col-sm-4" id="receiverUsername"
				path="receiverUsername" placeholder="ReceiverUsername" />
		</div>



		<div class="form-group">


			<label class="col-sm-offset-1 col-sm-2" for="message">Message:</label>

			<form:textarea class="col-sm-6" id="message" path="message"
				placeholder="Message" />
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10" style="margin-top: 20px;">
				<input type="submit" value="Save" class="bttn bttn" /> 
				
				<input type="button" class="bttn bttn" value="Back Home"
					onclick="window.location.href='${pageContext.request.contextPath }/'; return false;"
					class="add-button" />

			</div>
		</div>



	</form:form>

</body>

</html>