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
	margin-left: 100px;
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


.table:hover {
	background-color: black;
	color: #31708f;
	opacity: 1.6;
}

.table{
text-align: center;}
</style>

</head>


<body>



	<h2>(Si)DreamTeam Chat</h2>


	<h3 class="text-center">List of Message</h3>


	<!-- add a search box -->
	<form:form action="search" method="POST" class="form-group row">
		<div>
			<label for="ex1"></label> <input type="submit" value="Search"
				class="bttn bttn col-md-1" />

			<div class="col-xs-4">
				<input type="text" name="theSearchKey"
					class="form-control col-md-6" id="ex1"
					placeholder="Search a message" />
			</div>
		</div>
	</form:form>

	<!--  add our html table here -->

	<table class="table table-hover" style="table-layout: fixed;">
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

				<td style="overflow: hidden; width: 100px; data-toggle: collapse;">${tempMessage.message}</td>


				<!-- display the update link -->
				<td>| <a href="${deleteLink}"
					onclick="if(!(confirm('Are you sure you want to delete this message?!'))) return false">Delete</a>
				</td>
			</tr>

		</c:forEach>
	</table>

	<div>
		<input type="button" class="bttn bttn" value="Back Home"
			onclick="window.location.href='${pageContext.request.contextPath }/'; return false;"
			class="add-button" />


	</div>
</body>

</html>


