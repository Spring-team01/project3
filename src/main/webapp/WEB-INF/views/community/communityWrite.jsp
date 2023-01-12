<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>

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
						<a href="#"> <i class="fa-solid fa-bars"></i>
						</a>
					</div>
				</div>
				<div class="mainview d-flex"></div>
				<div class="container-fluid" style="background-color:white; margin:50px; width:92%; min-height: 600px;">
					<div class="card my-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
							<div class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3">
								<h6 class="text-white text-capitalize ps-3">커뮤니티 게시글 작성</h6>
							</div>
						</div>
						<form id="write" name="write" action="<c:url value='/community/write'/>" method="post" enctype="multipart/form-data">
							<div class="card-body px-0 pb-2">

								<div class="input-group-prepend">
									<textarea  class="form-control bg-gray-100 border-0 border-radius-lg" rows="2" id="communityTitle" name="communityTitle" placeholder="게시글 제목" required></textarea>
								</div>
								<div class="input-group-prepend">
									<textarea class="form-control" rows="3" id="communityPassword" name="communityPassword" placeholder="게시글 비밀번호" required></textarea>
								</div>
								<textarea class="form-control" rows="15" id="communityContent" name="communityContent" placeholder="게시글 입력" wrap="hard" required></textarea>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="">Upload</span>
									</div>
									<div class="custom-file">
										<input type="file" id="i_file" name="file"><span id="droparea" class="help-block"></span>

									</div>
								</div>
							</div>
							<div align="center">
							<input type="submit" class="btn btn-dark shadow" value="작성"> 
							<a type="button" href="<c:url value='/community/communityList//1/1'/>" class="btn btn-dark shadow">글 목록</a>
							</div>
						</form>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>