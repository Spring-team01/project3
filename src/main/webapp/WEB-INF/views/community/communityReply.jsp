<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>

<script>
	function writeReplyComment(i) {
		let replyContent= $("#writeReReply").val();
		let communityBoardId= $("#communityBoardId").val();
		
		$.ajax({
			url : "/myapp/community/writereplycomment/",
			type : "POST",
			datatype : "html",
			data : {communityCommentMasterNumber : i, communityCommentContent : replyContent, communityBoardId : communityBoardId},
			success : function(data) {
				if(data==0) {
		           alert("댓글 작성에 실패하였습니다");
		         } else if(data==1) {
		          alert("댓글 작성 완료!");       	
		          location.reload();
		       }
				
			}
		});
	}
	
</script>


<body>
	<!-- Comments section-->
	<section class="mb-5">
		<div class="card bg-light">
			<div class="card-body">
				<c:forEach var="replyCommentList" items="${replyCommentList}">

					<div class="d-flex mb-3 ml-5">
						<!-- Parent comment-->
						<div class="flex-shrink-0 fix-comment-hidden">
							<img class="rounded-circle" src='<c:url value="/admin/userdetail/userfile/${replyCommentList.userFileId}"/>' alt="..." style="width: 50px; height: 50px;" />
						</div>
						<div class="ms-3 fix-comment-hidden">
							<div class="fw-bold">${replyCommentList.userName}</div>
							${replyCommentList.communityCommentContent}
						</div>
					</div>
				</c:forEach>



				<!-- Comment form-->
				<form class="mb-4">
					<textarea id="writeReReply" class="form-control" rows="3" placeholder="답글 작성하기"></textarea>
					<input id="replyButton${commentList.communityCommentMasterNumber}" type="button" onclick="writeReplyComment(${communityCommentMasterNumber})" class="btn btn-sm btn-dark shadow" value="댓글 보기"> 
					<input type="hidden" name="communityCommentMasterNumber" value="${communityCommentMasterNumber}">
					<input type="hidden" name="communityBoardId" value="${commentList.communityBoardId}">
					
				</form>
			</div>
		</div>
	</section>
</body>