<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>First page on chat</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-success navbar-dark">

		<a class="navbar-brand" href="#">Logo</a>
		<ul class="navbar-nav">

			<security:authorize access="hasRole('ADMIN')">

				<!-- Add link to point /supervisor... this is for the admin -->
				<li class="nav-item"><a class="nav-link" href="user/list">Λιστα
						των Users</a></li>

				<li class="nav-item">
				<li class="nav-item"><a class="nav-link"
					href="user/showFormForAdd">Εγγραφή νέου Χρήστη</a></li>

				<!-- Add link to point /GOD... this is for the admin and god-->
				<li class="nav-item"><a class="nav-link" href="message/list">Λιστα
						των Messages</a></li>

			</security:authorize>

			<security:authorize access="hasRole('GOD')">
				<!-- Add link to point /GOD... this is for the admin and god-->
				<li class="nav-item"><a class="nav-link" href="message/list">Λιστα
						των Messages</a></li>
			</security:authorize>


			<security:authorize access="hasRole('SIMPLEUSER')">
				<!-- Add link to point /simpleusers... this is for simpleusers -->
				<li class="nav-item"><a class="nav-link"
					href="message/showFormForSendingMsg">Send a Message</a></li>


				<!-- Add link to point /allusers... this is for all -->
				<li class="nav-item"><a class="nav-link disabled"
					href="${pageContext.request.contextPath }/simpleusers">About Us</a></li>

				<li class="nav-item"><a class="nav-link disabled"
					href="${pageContext.request.contextPath }/simpleusers">Επικοινωνία</a>
				</li>
			</security:authorize>


		</ul>
	</nav>

	<hr>
	<!-- display user name and role  -->
	<div>
		<p>
			User:
			<security:authentication property="principal.username" />
			<br /> <br /> Role(s):
			<security:authentication property="principal.authorities" />
		</p>
		<hr>
	</div>

	<div align="right">
		<form:form action="${pageContext.request.contextPath }/logout"
			method="POST">
			<input type="submit" value="Logout" />
		</form:form>
	</div>

</body>


</html>