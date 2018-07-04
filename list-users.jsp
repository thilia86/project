<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>
<title>List of Users</title>

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

	<div class="control-label col-sm-1"></div>
			<!-- put a new button : Add User -->
			<div class="control-label col-sm-4">
			<input type="button" value="Add User"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button" /></div>
				

			<form:form action="search" method="POST" class="form-group row">
			
			<label for="ex1"></label><input type="submit" value="Search" class="btn btn-success text-right" />
			 <div class="col-xs-4">
			<input type="text" name="theSearchName" class="form-control text-rigth" id="ex1" placeholder="Search User" /> 
			
		</div>
		
	</form:form>
	

			<!--  add our html table here -->
			<div class="control-label col-sm-1"></div>
			<div class="control-label col-sm-11">
			<table class="table table-hover">
		<tr>
			<th>First name</th>
			<th>Last name</th>
			<th>Email address</th>
			<th>Action</th>
		</tr>
				<!-- loop over and print our users -->
				<c:forEach var="tempUser" items="${users}">
				
		
					<!-- construct an "update: link with user id -->
					<c:url var="updateLink" value="/user/showFormForUpdate">

						<c:param name="userId" value="${tempUser.username}"></c:param>

					</c:url>

					<!-- construct an "delete: link with user id -->
					<c:url var="deleteLink" value="/user/delete">

						<c:param name="userId" value="${tempUser.username}"></c:param>

					</c:url>

					<tr>
						<td>${tempUser.firstName}</td>
						<td>${tempUser.lastName}</td>

						<td>${tempUser.email}</td>

						<!-- display the update link -->
						<td><a href="${updateLink}">Update</a> | <a
							href="${deleteLink}"
							onclick="if(!(confirm('Are you sure you want to delete this user?!'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
	
			</table>
		
		</div>
		
</body>

</html>


