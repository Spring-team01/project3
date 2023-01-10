<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

<script src="fullcalendar/lib/locales-all.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar : {
            left : 'prev,next today',
            center : 'title',
            right : 'dayGridMonth,listWeek'
         },
        locale: "ko",
		initialView: 'dayGridMonth',
		events: [
			<c:forEach items = "${attendanceList}" var="list">
				<c:if test="${list.status ne '미출석'}">
					<c:if test="${list.status eq '휴가' || ((fn:substring(list.leaveTime,0,2) - fn:substring(list.attTime,0,2)) * 60) + (fn:substring(list.leaveTime,3,5) - fn:substring(list.attTime,3,5)) > 240}">	
						{
							title : '${list.attTime} [${list.status}]',
							start : '${list.attDate}',
							<c:if test="${list.status eq '지각'}">
								backgroundColor : '#ffc107',
								borderColor : '#ffc107'
							</c:if>
							<c:if test="${list.status eq '출근'}">
								backgroundColor : '#49a3f1',
								borderColor : '#49a3f1'
							</c:if>
							<c:if test="${list.status eq '휴가'}">
								backgroundColor : '#66BB6A',
								borderColor : '#66BB6A'
							</c:if>
						},
						<c:if test="${list.leaveTime != null}">
						{
							title : '${list.leaveTime}',
							start : '${list.attDate}',
								<c:if test="${list.status eq '지각'}">
									backgroundColor : '#ffc107',
									borderColor : '#ffc107'
								</c:if>
								<c:if test="${list.status eq '출근'}">
									backgroundColor : '#49a3f1',
									borderColor : '#49a3f1'
								</c:if>
								<c:if test="${list.status eq '휴가'}">
									backgroundColor : '#66BB6A',
									borderColor : '#66BB6A'
								</c:if>
						},
						</c:if>
					</c:if>
				</c:if>
			</c:forEach>
		]
	});
	calendar.render();
});
</script>
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
	     		<div class="mainview d-flex">
	     		</div>
	     			<div class="container-fluid" style="background-color:white; margin:50px; width:92%; min-height: 600px;">
	     				<div>
	     					<h1>나의 출석</h1>
	     					<c:forEach items = "${attendanceList}" var="list">
	     							<c:if test="${((fn:substring(list.leaveTime,0,2) - fn:substring(list.attTime,0,2)) * 60) + (fn:substring(list.leaveTime,3,5) - fn:substring(list.attTime,3,5)) > 240}">
	     							 </c:if>
	     					</c:forEach>
	     				<div id="calendar">
	     				</div>
	     			</div>
	     		</div>
	     	</div>
	    	<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />       
	    </div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
