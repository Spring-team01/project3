<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>공지사항 게시글 작성</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->

</head>
<link href="<c:url value="/static/css/communityDetail.css"/>" rel='stylesheet' />

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- Page content-->
	<div class="container mt-5">
		<div class="row">
			<div class="col-lg">
				<!-- Post header-->
				<section class="mb-5">
					<!-- 게시글 카테고리 -->
					<div class="container">
						<div class="row">
							<div class="col-2">
								<select class="custom-select custom-select">
									<option selected>카테고리</option>
									<option value="1">공지사항</option>
									<option value="2">자유게시판</option>
									<option value="3">강의게시판</option>
								</select>
							</div>
							<!-- 게시글 제목 입력 -->
							<div class="col-10">
								<div class="input-group-prepend">
									<textarea class="form-control" rows="2" placeholder="게시글 제목"></textarea>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Post content-->
				<article>
					<!-- Post content-->
					<section class="mb-5">
						<textarea class="form-control" rows="15" placeholder="게시글 입력"></textarea>
					</section>

					<!-- file input -->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"> <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
						</div>
					</div>
				</article>
				
				<button id="write" class="btn btn-sm btn-dark">작성</button>
				<button id="back" class="btn btn-sm btn-dark">취소</button>
				

			</div>
		</div>
	</div>
</body>
</html>
