<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<%-- <c:if test="${empty nestedCommentList}">
	<div id="noReplyDiv${commentOne.bcReplyNo}" style="display:block;  ">작성된 댓글이 없습니다!</div>
</c:if> --%>

<c:forEach var="reply" items="${nestedCommentList}">
	<div class="md-3 d-flex" >
	<div>${reply.bcContent}</div>
		 <span class="small text-success font-weight-bold">${reply.userId}&nbsp;&nbsp;</span>
         <span class="small text-muted"><fmt:formatDate value="${reply.bcWriteDate}" pattern="yyyy.MM.dd"/></span> 
	</div>
	<!-- Comments section-->
	<section class="mb-5" style="width:100%">
		<div class="card bg-light">
			<div class="card-body" style="word-wrap: wordwrap;">
				
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
						<div id="more_btn_div" align="center">
						<br>
						<a id="more_btn_a" href="javascript:moreContent('more_list', 10);">
							더보기(More)
						</a>		
						<br>					
						</div>			
					</div>
				</div>
				<!-- Comment form-->
				<form class="mb-4">
					<textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
				</form>
			</div>
		</div>
	</section>
</c:forEach>

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
						<div id="more_btn_div" align="center">
						<br>
						<a id="more_btn_a" href="javascript:moreContent('more_list', 10);">
							더보기(More)
						</a>		
						<br>					
						</div>			
					</div>
				</div>
				<!-- Comment form-->
				<form class="mb-4">
					<textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
				</form>
			</div>
		</div>
	</section>