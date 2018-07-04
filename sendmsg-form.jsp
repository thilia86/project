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

</head>
<body>


	<div class="bg-success text-white text-center">

		<h2>(Si)DreamTeam Chat</h2>

	</div>

	<div>
		<p>Hello:</p>
		
		<p id="username">

		<security:authentication property="principal.username"/>
		</p>
		
		
		<hr>
	</div>

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
			
			<label class="col-sm-offset-2" for="receiverUsername">Receiver:</label>
			
				<form:input type="text" class="form-control col-sm-6"
				id="receiverUsername" path="receiverUsername"
				placeholder="ReceiverUsername" />
			</div>

	

		<div class="form-group">

			
			<label class="col-sm-offset-2" for="message">Message:</label>
		
				<form:textarea class="form-control" id="message" path="message"
				placeholder="Message" />
			</div>
		
		
		<div class="form-group">
			<div class="col-sm-offset-8 col-sm-4">
				<input type="submit" value="Send" class="btn btn-success" />

			</div>
		</div>


	</form:form>

<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
	<p>
		<a href="${pageContext.request.contextPath}">Back to List</a>
	</p>
</div>
</div>
</body>

</html>