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
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle" href="<c:url value="/static/css/material-dashboard.css"/>" rel='stylesheet' />

  
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
      				
					${message}
						
						
						<!--템플릿  -->
						<div class="container-fluid p-5">
						<div class="board_content">
						<form class="form-inline m-2 justify-content-end" action="<c:url value='/board/search'/>" method="get">
							<input type="text" name="keyword" class="form-control" placeholder="Search" style="border: 1px solid gray; width:200px; height:35px; padding:0px 10px;">
							<input type="submit" class="btn btn-warning m-1" value="<fmt:message key="SEARCH"/>">
						</form>
					      <div class="card my-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
							<div class="bg-gradient-success shadow-success border-radius-lg pt-4 pb-3">
								<h6 class="text-white text-capitalize ps-3">강의 게시판</h6>
							</div>
						</div>
						<form action="<c:url value='/board/write/'/>" method="post">
							<div class="card-body px-0 pb-2">
								<div class="m-5">
								 	<select class="custom-select custom-select">
										<option selected>카테고리</option>
										<option value="1">공지사항</option>
										<option value="2">강의게시판</option>
										<option value="3">과제제출</option>
										<option value="4">질문게시판</option>
									</select>
									
									<div class="input-group-prepend">
										<input class="form-control" id="boardTitle" name="boardTitle" placeholder="게시글 제목"></input>
									</div>

									<div class="col-8 p-0">
										<div class="input-group-prepend">
											<input class="form-control" id="boardPassword" name="boardPassword" placeholder="게시글 비밀번호"></input>
										</div>
									</div>
									<textarea class="form-control" rows="15" id="boardContent" name="boardContent" placeholder="게시글 입력"></textarea>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="">Upload</span>
										</div>
										<div class="container mt-3">
										  
										    <p>Custom file:</p>
										    <div class="custom-file mb-3">
										      <input type="file" class="custom-file-input" id="customFile" name="filename">
										      <label class="custom-file-label" for="customFile">Choose file</label>
										    </div>
										    
										   
										    <div class="mt-3">
											    <button type="submit" class="btn btn-primary">Submit</button>
											    <button id="write" class="btn btn-sm btn-info" type="submit">작성</button>
												<button id="back" class="btn btn-sm btn-warning" type="reset">취소</button>
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
</script>
 
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>