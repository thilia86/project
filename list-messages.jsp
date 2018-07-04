<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>
<title>List of Messages</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>


<body>

	<div class="bg-success text-white text-center">

		<h2>(Si)DreamTeam Chat</h2>

	</div>

	<h3 class="text-center">Send a Message</h3>

	<div class="control-label col-sm-1"></div>
		<!-- put a new button : Send a Message -->
		<div class="control-label col-sm-4">
		<input type="button" value="Send Message"
			onclick="window.location.href='showFormForSendingMsg'; return false;"
			class="add-button" />
	</div>

	<!-- add a search box -->
	<form:form action="search" method="POST" class="form-group row">

		<label for="ex1"></label>
		<input type="submit" value="Search" class="btn btn-success text-right" />
		<div class="col-xs-4">
			<input type="text" name="theSearchKey"
				class="form-control text-rigth" id="ex1"
				placeholder="Search a message" />


		</div>
	</form:form>

	<!--  add our html table here -->

	<table class="table table-hove" style="table-layout:fixed;">
		<tr>
			<th>Sender Username</th>
			<th>Receiver Username</th>
			<th>Message</th>
			<th>Action</th>
		</tr>

		<!-- loop over and print our messages -->
		<c:forEach var="tempMessage" items="${messages}">

			<!-- construct an "update: link with message id -->
			<c:url var="updateLink" value="/message/showFormForUpdateMsg">

				<c:param name="messageId" value="${tempMessage.id}"></c:param>

			</c:url>

			<!-- construct a "delete: link with message id -->
			<c:url var="deleteLink" value="/message/delete">

				<c:param name="messageId" value="${tempMessage.id}"></c:param>

			</c:url>

			<tr>
				<td>${tempMessage.senderUsername}</td>
				<td>${tempMessage.receiverUsername}</td>

				<td style="overflow:hidden; width:100px; data-toggle:collapse;">${tempMessage.message}</td>
				

				<!-- display the update link -->
				<td><a href="${updateLink}">Update</a> | 
				<a href="${deleteLink}"
					onclick="if(!(confirm('Are you sure you want to delete this message?!'))) return false">Delete</a>
				</td>
			</tr>
			
		</c:forEach>
	</table>

</body>

</html>


