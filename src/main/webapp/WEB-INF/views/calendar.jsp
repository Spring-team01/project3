<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>


<head>
<link href="<c:url value="/static/css/calendar.css"/>" rel='stylesheet' />
<script type="text/javascript" src="<c:url value="/static/js/calendar.js"/>" ></script>

 
	<script type="text/javascript">

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
	
</head>
<body>
<h1>
	calendar is not found 
</h1>
 <div id='calendar'></div>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>