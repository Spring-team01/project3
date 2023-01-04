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
				<div class="container">
					<div class="container-fluid py-4">
						<div class="row">
							<div class="col-12">
								<div class="card my-4">
									<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
										<div class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3">
											<h6 class="text-white text-capitalize ps-3">커뮤니티 게시판</h6>
										</div>
									</div>
									<form action="<c:url value='/community/write/'/>" method="post">
									<div class="card-body px-0 pb-2">
										<div class="table-responsive p-0">
											<select class="custom-select custom-select">
												<option selected>카테고리</option>
												<option value="1">공지사항</option>
												<option value="2">자유게시판</option>
												<option value="3">강의게시판</option>
											</select>


											<div class="input-group-prepend">
												<textarea class="form-control" rows="2" id="communityTitle" name="communityTitle" placeholder="게시글 제목"></textarea>
											</div>

											<div class="col-8">
												<div class="input-group-prepend">
													<textarea class="form-control" rows="3" id="communityPassword" name="communityPassword" placeholder="게시글 비밀번호"></textarea>
												</div>
											</div>
											<textarea class="form-control" rows="15" id="communityContent" name="communityContent" placeholder="게시글 입력"></textarea>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text" id="">Upload</span>
												</div>
												<div class="custom-file">
													<input type="file" class="custom-file-input" id="" aria-describedby="inputGroupFileAddon01"> <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
												</div>
											</div>
											<button id="write" class="btn btn-sm btn-dark" type="submit">작성</button>
											<button id="back" class="btn btn-sm btn-dark">취소</button>
										</div>
									</div>
									</form>
									
									
								</div>
							</div>
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