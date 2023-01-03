<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/header" />

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div class="container-fluid">
		<c:forEach var="attendance" items="${attendanceList}">
			<tr>
				<td>${attendance.attNo}</td>
			</tr>
		</c:forEach>
	</div>
</body>
</html>
