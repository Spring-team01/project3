<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/header" />

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	<div class="main">
		<div class="wrapper">
			<div class="section">
				<div class="top_navbar">
					<div class="hamburger">
						<a href="#">
							<i class="fa-solid fa-bars"></i>
						</a>
					</div>
				</div>
				<div class="welcome d-flex align-items-center">
				</div>
				<div class="container">
				
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />       
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
