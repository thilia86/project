<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>

<html>

<head>
<title>Inbox</title>

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
	$("#ex1").val(user.trim());
	});
	
	</script>

</head>


<body>

	<div class="bg-success text-white text-center">

		<h2>(Si)DreamTeam Chat</h2>

	</div>

	<h3 class="text-center">Inbox</h3>

	<div class="control-label col-sm-1"></div>
		<!-- put a new button : Send a Message -->
		<div class="control-label col-sm-4">
		<input type="button" value="Send Message"
			onclick="window.location.href='showFormForSendingMsg'; return false;"
			class="add-button" />
	</div>

<p id="username">

		<security:authentication property="principal.username"/>
		</p>
		

	<!-- add a search box -->
	<form:form action="inbox" method="POST" class="form-group row">

		<label for="ex1"></label>
		<input type="submit" value="inbox" class="btn btn-success text-right" />
		<div style="visibility: hidden" class="col-xs-4">
			<input type="text" name="theSearchKey"
				class="form-control text-right" id="ex1"
				placeholder="Search a message" />


		</div>
	</form:form>

	<!--  add our html table here -->

	<table class="table table-hove" style="table-layout:fixed;">
		<tr>
			<th>Sender Username</th>
			<th>Receiver Username</th>
			<th>Message</th>
			<th>Date</th>
			
		</tr>

		<!-- loop over and print our messages -->
		<c:forEach var="tempMessage" items="${messages}">

			
			<tr>
				<td>${tempMessage.senderUsername}</td>
				<td>${tempMessage.receiverUsername}</td>
				<td style="overflow:hidden; width:100px; data-toggle:collapse;">${tempMessage.message}</td>
				<td>${tempMessage.timestamp}</td>
				
			</tr>
			
		</c:forEach>
	</table>

</body>

</html>


