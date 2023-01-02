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
          headerToolbar: {
        	left: 'prev,next today',
        	center: 'title',
        	right : 'dayGridMonth,timeGridDay'
          },
          initialView: 'dayGridMonth',
        navLinks : true,
		editable : true,
		allDaySlot : false,
		minTime: '10:00:00',
		maxTime: '24:00:00'
        
        });
        calendar.render();
      });
	
    </script>
	<style>
	body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
	</style>
</head>
<body>

 <div id='calendar'></div>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>