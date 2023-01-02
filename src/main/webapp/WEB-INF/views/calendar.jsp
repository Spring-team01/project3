<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link href="<c:url value="/static/css/main.css"/>" rel='stylesheet' />
<script type="text/javascript" src="<c:url value="/static/js/main.js"/>"></script>

 
	<title>Home</title>
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