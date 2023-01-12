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
		let userId = $("#userId").val();
		
		$.ajax({
			url : "/myapp/community/writereplycomment/",
			type : "POST",
			datatype : "html",
			data : {communityCommentMasterNumber : i, communityCommentContent : replyContent, 
				communityBoardId : communityBoardId, userId : userId},
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
	
	
	function deleteReReplyButton(i){
		let communityBoardId= $("#communityBoardId").val();
		let communityCommentReplyNumber = $("#communityCommentReplyNumber").val();
		
		console.log(communityBoardId);
		console.log(communityCommentReplyNumber);
		/* 
		$.ajax({
			url : "/myapp/community/reply/delete/",
			type : "POST",
			data : {communityCommentMasterNumber : i , communityBoardId : communityBoardId, communityCommentReplyNumber : communityCommentReplyNumber},
			success : function(data){
				if(data==0) {
			           alert("댓글 삭제 실패");
			         } else if(data==1) {
			          alert("댓글 삭제 완료!");
			          location.reload();
			       }
			}
		});
		 */
		
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
						<%-- 유저 프로필 사진
							<img class="rounded-circle" src='<c:url value="/admin/userdetail/userfile/${replyCommentList.userFileId}"/>' alt="..." style="width: 50px; height: 50px;" />
						 --%>
						</div>
						<div class="ms-3 fix-comment-hidden">
							<div class="fw-bold">${replyCommentList.userName}</div>
							${replyCommentList.communityCommentContent}
						</div>
						<div class="ms-auto">
						<c:set var="userId" value="${sessionUserId}" />
						<c:if test="${userId eq commentList.userId}">
							<input id="deleteReReplyButton${commentList.communityCommentMasterNumber}" 
							type="button" onclick="deleteReplyComment(${commentList.communityCommentMasterNumber}, ${communityCommentReplyNumber})" 
							class="btn btn-sm btn-dark shadow" value="대댓글 삭제">
							<input type="hidden" id="communityCommentReplyNumber" name="communityCommentReplyNumber" 
							value="${commentList.communityBoardId}">
						</c:if>
						</div>
					</div>
				</c:forEach>


				<!-- Comment form-->
				<form class="mb-4">
					<textarea id="writeReReply" class="form-control" rows="3" placeholder="답글 작성하기"></textarea>
					<input id="replyButton${commentList.communityCommentMasterNumber}" type="submit" onclick="writeReplyComment(${communityCommentMasterNumber})" class="btn btn-sm btn-dark shadow" value="댓글 작성"> <input type="hidden" name="communityCommentMasterNumber" value="${communityCommentMasterNumber}">
				</form>
			</div>
		</div>
	</section>
</body>