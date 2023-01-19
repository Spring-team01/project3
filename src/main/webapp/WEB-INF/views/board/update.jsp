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
              <div class="container-fluid" style="background-color:white; margin:50px; width:92%; min-height: 600px;">
      				
					${message}
						
						
						<!--템플릿  -->
						<div class="container-fluid p-5">
						<div class="board_content">
						<form class="form-inline m-2 justify-content-end" action="<c:url value='/board/search/1'/>" method="get">
							<input type="text" name="keyword" class="form-control" placeholder="Search" style="border: 1px solid gray; width:200px; height:35px; padding:0px 10px;">
							<input type="submit" class="btn btn-warning m-1" value="<fmt:message key="SEARCH"/>">
						</form>
					      <div class="card my-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
							<div class="bg-gradient-success shadow-success border-radius-lg pt-4 pb-3">
								<h6 class="text-white text-capitalize ps-3">강의 게시판</h6>
							</div>
						</div>
						<form action="<c:url value='/board/update/'/>" method="post" enctype="multipart/form-data" class="form-horizontal">
							<div class="card-body px-0 pb-2">
								<div class="m-5">
									<div class="form-group">
									<label class="control-label col-sm-1" for="categoryId"><fmt:message key="CATEGORY"/></label>	
								 	<select class="custom-select" name="categoryId" style="width:15%;">
										<option value="1">공지사항</option>
										<option value="2">강의게시판</option>
										<option value="3">과제제출</option>
										<option value="4">질문게시판</option>
									</select>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-1" for="name"><fmt:message key="WRITER"/></label>
										<input type="text" name="writer" id="name" 
										style="color:gray; background-color:#f0f0f0; border:1px solid gray;"
										value="${board.writer}" readonly>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-1" for="email"><fmt:message key="EMAIL"/></label>
										<input type="text" name="email" id="email"
										style="color:gray; background-color:#f0f0f0; border:1px solid gray;" 
										value="${board.email}" required readonly>
									</div>
									 <div class="form-group" style="display:none;">
										<label class="control-label col-sm-1" for="password">게시글 비밀번호</label>
										<input type="password" name="password" id="password" 
										value="${sessionScope.password}" ${!empty sessionScope.password ? "readonly" : "" } 
										class="form-control" placeholder="게시글 비밀번호" required>
									</div>	
									<div class="form-group">
								      <label class="control-label  col-sm-1" for="title"><b><fmt:message key="TITLE"/></b></label>
								       <input type="text" name="title" id="title" style="width:85%; border:1px solid gray;"placeholder="게시글 제목" value="${board.title}" required>
								    </div>
								    <div class="form-group px-3">
								     <label class="control-label" for="content"><b><fmt:message key="CONTENT"/></b></label>
								      <div class="m-1 p-0">
								        <textarea name="content" rows="15" cols="200" class="form-control" placeholder="게시글 입력" required>${fn: replace(board.content, "<br>","") }</textarea>
								      </div>
								    </div>
								    <div class="form-group"> 
								      <label class="control-label col-sm-2" for="photo"><fmt:message key="FILE"/><fmt:message key="FILESIZE_ERROR"/></label>
								      <div class="col-sm-8">
								      	<input type="hidden" name="boardFileId" value="${board.boardFileId}">
								        <input type="file" name="file"> 
								        <c:if test="${!empty board.boardFileName}"> <p><b>기존 파일: ${board.boardFileName}</b></p></c:if> 
								      </div>
								    </div>
									<div class="form-group">
								    	<div class="col-sm-offset-2 col-sm-8">
											<input type="hidden" name="boardId" value="${board.boardId}">
											<input type="submit" id="i_submit" class="btn btn-info" value="<fmt:message key="UPDATE"/>"> 
											<input type="reset" class="btn btn-info" onClick="history.go(-1)" value="<fmt:message key="CANCEL"/>">
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
/* $(".custom-file-input").on("change", function() {
  var boardFileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(boardFileName);
}); */
</script>
 
</body>
</html>