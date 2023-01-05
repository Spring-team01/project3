<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link href="<c:url value="/static/css/nucleo-icons.css"/>" rel="stylesheet" />
<link href="<c:url value="/static/css/nucleo-svg.css"/>" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"></script>
<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle" href="<c:url value="/static/css/material-dashboard.css"/>" rel='stylesheet' />

<!-- TimePicker -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  
<script>
	$(document).ready(function () {
		$('input.timepicker').timepicker({
	            timeFormat: 'HH:mm',
	            interval: 30,
	            startTime: '00:00',
	            dynamic: false,
	            dropdown: true,
	            scrollbar: true
	        });
	    }
</script>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />

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
			<div class="container-fluid" style="background-color:white; margin:50px; width:92%;">
				<!--템플릿  -->
				<div class="container-fluid p-5">
					<div class="board_content">
						<div class="card my-4">
							<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
								<div class="bg-gradient-success shadow-success border-radius-lg pt-4 pb-3">
									<h6 class="text-white text-capitalize ps-3">휴가 신청</h6>
								</div>
							</div>
						<form action="<c:url value='/subattendance/write/'/>" method="post">
							<div class="card-body px-0 pb-2">
								<div class="m-5">
									<select class="custom-select custom-select" name="category">
										<option selected>휴가신청</option>
										<option value="1">조퇴</option>
										<option value="2">공가</option>
										<option value="3">외출</option>
									</select>
									<div class="input-group-prepend">
										<input class="form-control" name="date" type="date">
									</div>
									<div class="input-group-prepend">
										<input type="text" class="time" name="subAttTime" required>
										<input type="text" class="time" name="subleaveTime" required>
									</div>
									<div class="input-group-prepend">
										<input class="form-control" name="subAttendanceTitle" placeholder="휴가신청 제목"></input>
									</div>
									
									<textarea class="form-control" rows="15" id="boardContent" name="content" placeholder="휴가신청글 입력"></textarea>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="">Upload</span>
										</div>
										<div class="container mt-3">
										  
										    <p>Custom file:</p>
										    <div class="custom-file mb-3">
										      <input type="file" class="custom-file-input" id="customFile" name="file">
										      <label class="custom-file-label" for="customFile">Choose file</label>
										    </div>
										    
										   
										    <div class="mt-3">
											    <button type="submit" class="btn btn-primary">확정</button>
										    </div>
										    
										</div>
									</div>
									
								</div>
							</div>
						</form>
					</div>
					</div>
	    		</div>
	        </div>
        </div>
 <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />       
    </div>
    </div>
<script>
// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
	  var fileName = $(this).val().split("\\").pop();
	  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
	
	$(function() {
	    $(".time").timepicker({
	    	timeFormat: 'HH:mm',
	    	interval: 30,
	        minTime: '9',
	        maxTime: '6:00pm',
	        startTime: '9:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
	});
</script>
 
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>