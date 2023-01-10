<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<%-- <c:if test="${empty nestedCommentList}">
	<div id="noReplyDiv${commentOne.bcReplyNo}" style="display:block;  ">작성된 댓글이 없습니다!</div>
</c:if> --%>


	
<!-- Comments section-->
<section class="mb-5" style="width:100%">
	<div class="card bg-light">
		<div class="card-body" style="word-wrap: wordwrap;">
			<c:forEach var="reply" items="${nestedCommentList}">
			<!-- Comment with nested comments-->
			<div class="d-flex mb-4">
				<!-- Parent comment-->
				<div class="flex-shrink-0">
					<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
				</div>
				<div class="ms-3">
					<div class="fw-bold">${reply.userId}&nbsp;&nbsp;</div>
					 <span class="small text-muted"><fmt:formatDate value="${reply.bcWriteDate}" pattern="yyyy.MM.dd"/></span> 
					${reply.bcContent}
							
				</div>
			</div>
			</c:forEach>
			<!-- Comment form-->
			
		</div>
	</div>
</section>


