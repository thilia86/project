<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


<style>

.user {text-align: left;
		font-weight: bold;
		color:black;
		font-size: 15px;
		margin-top:450;
		border-style: solid;
    	border-color: black;}
		
.bttn {
	margin-top:-80;
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
    color: #31708f; 
   
}

.bttn:hover {
    background-color: grey;
    color: #31708f;
    opacity: 1.6;
}


.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: black;
   color: white;
   text-align: center;
   opacity: 0.8;
}
body {background-image: url("http://avante.biz/wp-content/uploads/Earth-From-Space/Earth-From-Space88.jpg");
   }
</style>


</head>


<body>

	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
		<div class="container">
			<a href="index.html" class="navbar-brand" style="font-size: 30px; text-shadow: 0px 0px 5px #fff;">(si)Dream Team</a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">

					<security:authorize access="hasRole('ADMIN')">

						<li class="nav-item active"><a class="nav-link"
							href="user/list">Users list</a></li>
						<li class="nav-item"><a class="nav-link"
							href="user/showFormForAdd">Register new user</a></li>


						<li class="nav-item">
						<li class="nav-item"><a class="nav-link" href="message/list">Messages list</a></li>

					</security:authorize>

					<security:authorize access="hasRole('GOD')">
						<li class="nav-item"><a class="nav-link" href="message/list">Messages list</a></li>
						<li class="nav-item"><a href="blog.html" class="nav-link">About us</a>
					</security:authorize>


					<security:authorize access="hasRole('SIMPLEUSER')">
						<!-- Add link to point /simpleusers... this is for simpleusers -->
						<li class="nav-item"><a class="nav-link"
							href="message/showFormForSendingMsg">Send message</a></li>
						<li class="nav-item"><a href="#" class="nav-link disabled">About us</a></li>
					</security:authorize>


				</ul>

			</div>
		</div>
	</nav>


	<!-- display user name and role  -->
	<div class="user col-md-4">		
			User:
			<security:authentication property="principal.username" />
			<br/> Role(s):
			<security:authentication property="principal.authorities" />		
	</div>

	 
	<div align="right" class="button5">
		<form:form action="${pageContext.request.contextPath }/logout"
			method="POST">			
			<input type="submit" class="bttn bttn" value="Logout" />
		</form:form>
	</div>
	
	
	<div class="footer" style="text-shadow: 0px 0px 5px #fff;">
  <p><b>Send a message anywhere in the galaxy</b></p>
</div>

</body>

</html>