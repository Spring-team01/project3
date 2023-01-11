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
				<div class="ms-3  flex-fill">
					<div class="d-flex "> 
						<div class="fw-bold">${reply.userId}&nbsp;&nbsp;</div>
						<span class=" ms-auto small text-muted"><fmt:formatDate value="${reply.bcWriteDate}" pattern="yyyy.MM.dd"/></span> 
					</div>
					<div class="d-flex">
						<div style="text-align: left">
						${reply.bcContent}
						</div>
						<!-- three dots -->
	                   	<div class="ms-auto">
					    	<img src='<c:url value="/images/threedots.svg"/>' class="dropbtn icons btn-right showLeft m-2" onclick="showDropdown(${reply.bcReplyNo})">
					    </div>
	                 	<div class="dropdown">
						    <!-- menu -->
						    <div id="myDropdown${reply.bcReplyNo}" class="dropdown-content">
						    <c:if test="${reply.userId eq sessionScope.userId}">
						    	<a onclick="deleteNestedComment(${reply.bcReplyNo})">삭제하기</a>
						    </c:if>
						    <c:if test="${reply.userId ne sessionScope.userId}">
						    	<a href="<c:url value='/board/nestedcomment/report/${reply.bcReplyNo}'/>">신고하기</a>
						    </c:if> 
						    </div>
						 </div>
					</div>
				</div>
			</div>
			</c:forEach>
			<!-- Comment form-->
			
		</div>
	</div>
</section>


