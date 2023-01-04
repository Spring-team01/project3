<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/member"/>
<!DOCTYPE html>
<html>
<head>
	<title>Login V3</title>
	<meta charset="UTF-8">
	<jsp:include page="/WEB-INF/views/include/colorlib.jsp" />
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('<c:url value='/images/bg.jpg'/>');">
			<div class="wrap-login100">
				
				<form action="<c:url value='/user/login'/>" method="post" class="login100-form validate-form">
					<span class="login100-form-logo">
						<img  src="<c:url value='/images/logo1.png'/>" width="170px" >
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
						한국대학교 lms
					</span>

					<small style="color:red"> <fmt:message key="${not empty message ? message : 'BLANK'}"/></small>
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="userid" id="id" placeholder="Username">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password" id="pw" placeholder="Password">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>


					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							Login
						</button>
					</div>

				
				</form>
			</div>
		</div>
	</div>

</body>
</html>