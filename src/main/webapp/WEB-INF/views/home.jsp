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
		<div class="row">
			<div class="row-md-3">
			
			사이드바 위치
			</div>
						
			<div class="row-md-9">
			<div id='calendar'></div>
			
			</div>
		</div>
	</div>

<script type="text/javascript">

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>



</body>
</html>
