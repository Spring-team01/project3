<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>

<script>
	
</script>


<body>
<%-- 
	<!-- 대댓글 반복 -->
	<c:if test="${community.communityReplyNumber!=0}">
		<c:forEach var="commentList" items="${commentList}">

			<div class="d-flex mb-5 ml-5">
				<!-- Parent comment-->
				<div class="flex-shrink-0 fix-comment-hidden" >
					<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
				</div>
				<div class="ms-3 fix-comment-hidden" >
					<div class="fw-bold">Commenter Name</div>
					If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
				</div>
			</div>
		</c:forEach>
	</c:if>

 --%>

	<!-- Comments section-->
	<section class="mb-5">
		<div class="card bg-light">
			<div class="card-body">

				<!-- Comment with nested comments-->
				<div class="d-flex mb-4">
					<!-- Parent comment-->
					<div class="flex-shrink-0">
						<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
					</div>
					<div class="ms-3">
						<div class="fw-bold">Commenter Name</div>
						If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
						<!-- Child comment 1-->
					</div>
				</div>
				<!-- Comment form-->
				<form class="mb-4">
					<textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
				</form>
			</div>
		</div>
	</section>
</body>