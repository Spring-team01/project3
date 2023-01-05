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
	<section class="mb-5">
		<div class="card bg-light">
			<div class="card-body">
				<!-- Comment form-->
				<form class="mb-4" action="<c:url value='/community/reply/comment'/>" method="post">
					<textarea name ="communityCommentContent" class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
					<input type="submit" class="btn btn-dark shadow" value="작성"> 
					<%-- <a type="button" href="<c:url value='/community/communityList//1/1'/>" class="btn btn-dark shadow">글 목록</a> --%>
					<%-- 
					<input type="hidden" name="communityBoardId" value="${community.communityBoardId}"> 
					<input type="hidden" name="communityCommentReplyNumber" value="${community.communityReplyNumber}"> 
					 --%>
					<input type="hidden" name="communityBoardId" value="1231231313"> 
					<input type="hidden" name="communityCommentReplyNumber" value="45454545"> 
				
				</form>
				<!-- Comment with nested comments-->
				<form action="<c:url value='/community/reply/comment'/>" method="post">
					<div class="d-flex mb-4">
						<!-- Parent comment-->
						<div class="flex-shrink-0">
							<!-- <img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /> -->
						</div>

						<!-- 1번 답글(+ 대댓글 출력) -->
						<!-- 답글 먼저 하고 대댓글을 추가 -->

						<div class="ms-3">
							<div class="fw-bold">Commenter Name</div>
							If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
							<!-- Child comment 1-->
							<div class="d-flex mt-4">
								<div class="flex-shrink-0">
									<!-- <img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /> -->
								</div>
								<div class="ms-3">
									<div class="fw-bold">Commenter Name</div>
									And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
								</div>
							</div>
							<!-- Child comment 2-->
							<div class="d-flex mt-4">
								<div class="flex-shrink-0">
									<!-- <img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /> -->
								</div>
								<div class="ms-3">
									<div class="fw-bold">Commenter Name</div>
									When you put money directly to a problem, it makes a good headline.
								</div>
							</div>
						</div>
					</div>
					<!-- Single comment-->
					<div class="d-flex">
						<div class="flex-shrink-0">
							<!-- <img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /> -->
						</div>
						<div class="ms-3">
							<div class="fw-bold">Commenter Name</div>
							When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

</body>