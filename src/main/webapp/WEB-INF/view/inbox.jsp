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
	
	<style>
	.table{
	font-weight: strong;
	color:#337ab7;
	background-color: white;
	opacity: 0.8;	
	}
	
	.header{
	font-size: 100px;
	margin: 0px;
	color: white;
	text-shadow: 0px 0px 5px #fff;
	text-align: center;	
	opacity:0.8;
	
	}
	
	.bttn {
	margin-top:310;
	margin-right:120;
    background-color: black;
    text-align: center;
    font-weight: bold;
    display: inline-block;
     border-radius: 4px;
    -webkit-transition-duration: 0.4s; 
    transition-duration: 0.4s;
    cursor: pointer;
    opacity: 0.4;
    padding: 20px 22px;
}

.bttn {
    background-color: white; 
    color: #337ab7; 
   
}

.bttn:hover {
    background-color: grey;
    color: #337ab7;
    opacity: 1.6;
}



</style>
</head>


<body>

	<div class="header">

		<h2>(Si)DreamTeam Chat</h2>

	</div>

	<h3 class="text-center">Inbox</h3>

	
		<!-- put a new button : Send a Message -->
		
		<input type="button" value="Send Message" class="bttn bttn"
			onclick="window.location.href='showFormForSendingMsg'; return false;"
			class="add-button" />
	

<p id="username">

		<security:authentication property="principal.username"/>
		</p>
		

	<!-- add a search box -->
	<form:form action="inbox" method="POST" class="form-group row" align="right">

		<label for="ex1"></label>
		<input type="submit" value="inbox" class="bttn bttn" />
		<div style="visibility: hidden" class="col-xs-11">
			<input type="text" name="theSearchKey"
				class="form-control text-right" id="ex1"
				placeholder="Search a message" />


		</div>
	</form:form>

	<!--  add our html table here -->

	<table class="table table-hover" style="table-layout:fixed">
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
	
	<input type="button" class="bttn bttn" value="Back Home"
					onclick="window.location.href='${pageContext.request.contextPath }/'; return false;"
					class="add-button" />


<style> 
body {
background-image: url("http://avante.biz/wp-content/uploads/Earth-From-Space/Earth-From-Space88.jpg");
   }
</style>

</body>

</html>


