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
	function changeCategory(){
	    var langSelect = document.getElementById("categoryList");
	    var selectValue = langSelect.options[langSelect.selectedIndex].value;
	    console.log(selectValue);
	    
	    if(selectValue == '조퇴') {
	    		$("#subAttTimeName").css("display", "none");
	    		$("#subAttTime").css("display", "none");
	    		$("#subLeaveTime").css("display", "");
	    		$("#subLeaveTimeName").css("display", "");
	    	} else if(selectValue == '공가') {
	    		$("#subAttTimeName").css("display", "none");
	    		$("#subAttTime").css("display", "none");
	    		$("#subLeaveTime").css("display", "none");
	    		$("#subLeaveTimeName").css("display", "none");
	    	} else if(selectValue == '외출') {
	    		$("#subAttTimeName").css("display", "");
	    		$("#subAttTime").css("display", "");
	    		$("#subLeaveTime").css("display", "");
	    		$("#subLeaveTimeName").css("display", "");
	    	} else if(selectValue == '경조사') {
	    		$("#subAttTimeName").css("display", "none");
	    		$("#subAttTime").css("display", "none");
	    		$("#subLeaveTime").css("display", "none");
	    		$("#subLeaveTimeName").css("display", "none");
	    	}
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
						<form action="<c:url value='/subattendance/update'/>" method="post" enctype="multipart/form-data">
							<div class="card-body px-0 pb-2">
								<div class="m-5">
									<select id="categoryList" class="custom-select custom-select" name="subStatus" onchange="changeCategory()">
										<option selected value="조퇴">조퇴</option>
										<option value="공가">공가</option>
										<option value="외출">외출</option>
										<option value="경조사">경조사</option>
									</select>
									<div class="input-group-prepend">
										<div>날짜 : <fmt:formatDate pattern="yyyy-MM-dd" value="${subAttendance.subAttTime}"/></div>
									</div>
									<div class="input-group-prepend">
										<div class="input-group-prepend" style="margin:auto">
											<div id="subAttTimeName" class="time" style="margin:auto 100px; display:none;">start</div>
											<input id="subAttTime" type="text" class="time" name="subAttTime" autocomplete="off" value="09:00" style="display:none">
											<div id="subLeaveTimeName" class="time" style="margin:auto 100px">end</div>
											<input id="subLeaveTime" type="text" class="time" name="subLeaveTime" autocomplete="off" value="18:00">
										</div>
									</div>
									<div class="input-group-prepend">
										<input class="form-control" name="subAttendanceTitle" placeholder="휴가신청 제목" value="${subAttendance.subAttendanceTitle}">
									</div>
									
									<textarea class="form-control" rows="15" name="content" placeholder="휴가신청글 입력">${subAttendance.content}</textarea>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="">Upload</span>
										</div>
										
										<div class="container mt-3">
											<p>Custom file:</p>
											<div class="mb-3">
												${subAttendance.fileName}
											</div>
											<div class="custom-file mb-3">
												<input type="file" class="custom-file-input" id="customFile" name="file">
												<label class="custom-file-label" for="customFile">Choose file</label>
											</div>
											<input type="hidden" name="subAttNo" value="${subAttendance.subAttNo}">
											<input type="hidden" name="date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${subAttendance.subAttTime}"/>">
											<input type="hidden" name="fileId" value="${subAttendance.fileId}">
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
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
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
 
</body>
</html>