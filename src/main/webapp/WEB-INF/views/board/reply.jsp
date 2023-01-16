<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<script>
/* 대댓글 신고~ */

function reportNestedComment(i,j,k){
	let repoortContent = $("#reportNestedContent"+i).val();
	let rpTarget =$("#rpTarget"+i).val();
	console.log(i);
	$.ajax({
		 type : 'POST',
         url : "/myapp/board/comment/report",
         data : {rpBoardId: j,rpCommentNo: i, rpContent: repoortContent, rpMasterNo: k, rpType: '대댓글', rpTarget: rpTarget},
         error : function() {
            alert('통신실패!');
         },
         success : function(data) {
            if(data==0) {
            JQ
               alert("신고 실패하였습니다.");
            } else if(data==1) {
            	alert("신고가 접수되었습니다.");       	
            	location.reload();
            }
         }
      });
}
</script>
<!-- Comments section-->
<section class="mb-1" style="width:100%">
	<div class="bg-light">
	<c:if test="${empty nestedCommentList}">
		<div class="card-body" style="word-wrap: wordwrap; display:none;">
	</c:if>
	<c:if test="${!empty nestedCommentList}">
		<div class="card-body" style="word-wrap: wordwrap;">
	</c:if>
			<c:forEach var="reply" items="${nestedCommentList}">
			<!-- Comment with nested comments-->
			<div class="d-flex mb-4">
				<!-- Parent comment-->
				<div class="flex-shrink-0">
					<img class="rounded-circle" 
					src='<c:url value="/admin/userdetail/userfile/${reply.userFileId}"/>' 
					alt="..."  style="width: 50px; height: 50px;"/>
				</div>
				<div class="ms-3  flex-fill">
					<div class="d-flex "> 
						<div class="fw-bold">${reply.userName}&nbsp;&nbsp;</div>
						<span class=" ms-auto small text-muted"><fmt:formatDate value="${reply.bcWriteDate}" pattern="yyyy.MM.dd"/></span> 
					</div>
					<div class="d-flex">
						<div style="text-align: left">
						<input type="hidden" id="rpTarget${reply.bcReplyNo}" value="${reply.bcContent}">
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
						    	 <a type="button" data-toggle="modal" data-target="#nestedModal${reply.bcReplyNo}">신고하기</a>
						    </c:if> 
						  	</div>
						  </div>
						    
						   
							<!-- 신고용 모달 -->
						    <div class="modal fade" id="nestedModal${reply.bcReplyNo}" tabindex="-1" aria-labelledby="nestedModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="nestedModalLabel">댓글 신고</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body">
							        <form>
							          <div class="form-group">
							            <label for="message-text" class="col-form-label">신고 내용:</label>
							            <textarea class="form-control" id="reportNestedContent${reply.bcReplyNo}"></textarea>
							          </div>
							        </form>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							        <button type="button" onclick="reportNestedComment(${reply.bcReplyNo},${reply.boardId},${reply.bcMasterNo})"class="btn btn-primary">보내기</button>
							      </div>
							    </div>
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


