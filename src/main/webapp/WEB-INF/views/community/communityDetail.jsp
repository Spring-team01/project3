<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>

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

<style>
.dropbtn {
	background-color: #f9f9f9;
	color: white;
	padding: 0px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 0px 0px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>

<script>
	
	function viewReplyComment(i) {
		let communityBoardId= $("#communityBoardId").val();
		
		$.ajax({
			url : "/myapp/community/getreplycomment/",
			type : "GET",
			datatype : "html",
			data : {communityCommentMasterNumber : i, communityBoardId : communityBoardId},
			success : function(data) {
				$('#replyComment'+i).toggle()
				$('#replyComment'+i).html(data);
				/* 토글show hide 확인*/
			}
		});
	}
	
	function deleteReplyComment(i){
		let communityBoardId= $("#communityBoardId").val();
		let communityCommentMasterNumber = i;
		$.ajax({
			url : "/myapp/community/reply/delete",
			type : "POST",
			data : {communityCommentMasterNumber : i , communityBoardId : communityBoardId},
			success : function(data){
				if(data==0) {
			           alert("댓글 삭제 실패");
			         } else if(data==1) {
			          alert("댓글 삭제 완료!");       	
			          location.reload();
			       }
			}
		});
	}
	/* 댓글 신고~ */
	function reportComment(i){
		let reportContent = $("#reportContent"+i).val();
		console.log(i);
		console.log(reportContent);
		$.ajax({
			 type : 'POST',
	         url : "/myapp/community/comment/report",
	         data : {communityCommentContent: reportContent, communityCommentNo : i},
	         error : function() {
	            alert('통신실패!');
	         },
	         success : function(data) {
	            if(data==0) {
	               alert("신고 실패하였습니다.");
	            } else if(data==1) {
	            	alert("신고가 접수되었습니다.");       	
	            	location.reload();
	            }
	         }
	      });
	}
	
	
	
	
</script>


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
				<div class="container-fluid" style="background-color: white; margin: 50px; width: 92%; min-height: 600px;">
					<div class="row">
						<!-- Post content-->
						<article>
							<!-- Post header-->
							<header class="mb-4">
								<!-- Post title-->
								<h1 class="fw-bolder mb-1">${community.communityTitle}</h1>
								<!-- Post meta content-->
								<div class="text-muted fst-italic mb-2">Posted on ${community.communityWriteDate}</div>
								<!-- Post categories-->
								<!-- <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
										<a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a> -->
							</header>
							<!-- Preview image figure-->
							<figure class="mb-4">
								<c:if test="${!empty community.communityFileName}">
									<tr>
										<td>
											<c:set var="len" value="${fn:length(community.communityFileName)}" />
											<c:set var="filetype" value="${fn:toUpperCase(fn:substring(community.communityFileName, len-4, len))}" />
											<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
												<img src='<c:url value="/files/${community.communityBoardId}"/>' class="img-fluid rounded">
												<br>
											</c:if>
											<a href='<c:url value="/files/${community.communityBoardId}"/>'>파일 다운로드 : ${community.communityFileName} </a>
										</td>
									</tr>
								</c:if>
								<div class="fs-5 mb-4" style="white-space: pre;">${fn: replace(community.communityContent, replaceChar, "") }</div>
							</figure>
						</article>
						<section class="mb-5">
							<div class="card bg-light">
								<div class="card-body">
									<c:if test="${sessionScope.userId eq 'ADMIN' || sessionScope.userId eq community.usersId}">
										<a type="button" href="<c:url value='/community/communityUpdate/${community.communityBoardId}'/>" class="btn btn-dark shadow"> 글 수정 </a>
										<a type="button" href="<c:url value='/community/delete/${community.communityBoardId}'/>" class="btn btn-dark shadow">글 삭제</a>
										<input type="hidden" name="communityBoardId" value="${community.communityBoardId}">
									</c:if>
									<a type="button" href="<c:url value='/community/communityList/1/1'/>" class="btn btn-dark shadow">글 목록</a>
									<form class="mb-4" action="<c:url value='/community/reply/comment'/>" method="post">
										<textarea name="communityCommentContent" class="form-control" rows="3" placeholder="댓글 작성" required></textarea>
										<input type="submit" class="btn btn-dark shadow" value="댓글 작성" required> <input type="hidden" name="communityBoardId" value="${community.communityBoardId}">
									</form>

									<form>
										<c:if test="${community.communityReplyNumber!=0}">
											<c:forEach var="commentList" items="${commentList}">
												<input type="hidden" id="communityBoardId" name="communityBoardId" value="${commentList.communityBoardId}">
												<div class="d-flex flex-column mb-3">
													<div class="ms-3">
														<div class="d-flex justify-content-around">
															<div>
																<div class="flex-shrink-0">
																	<!-- 유저 프로필 사진 -->
																	<img class="rounded-circle" src='<c:url value="/admin/userdetail/userfile/${commentList.userFileId}"/>' alt="..." style="width: 50px; height: 50px;" />
																</div>
															</div>
															<div class="ms-3">
																<div class="fw-bold">${commentList.userName}</div>
																${commentList.communityCommentContent}
															</div>
															<div class="ms-auto">
																<input id="replyButton${commentList.communityCommentMasterNumber}" type="button" onclick="viewReplyComment(${commentList.communityCommentMasterNumber})" class="btn btn-sm btn-dark shadow" value="댓글 보기">

																<c:if test="${sessionScope.userId eq commentList.userId}">
																	<input id="deleteReplyButton${commentList.communityCommentMasterNumber}" type="submit" onclick="deleteReplyComment(${commentList.communityCommentMasterNumber})" class="btn btn-sm btn-dark shadow" value="댓글 삭제">
																</c:if>
																<input type="hidden" id="userId" name="userId" value="${sessionScope.userId}">
															</div>
															<c:if test="${sessionScope.userId ne commentList.userId}">
																<div class="dropdown">
																	<img src='<c:url value="/images/threedots.svg"/>' class="dropbtn">
																	<div class="dropdown-content">
																		<a type="button" data-toggle="modal" data-target="#reportFun${commentList.communityCommentNo}">신고하기</a>
																	</div>
																</div>
																<!-- 신고용 모달 -->
																<div class="modal fade" id="reportFun${commentList.communityCommentNo}" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="commentModalLabel">댓글 신고</h5>
																				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">
																				<form>
																					<div class="form-group text-left">
																						<h6>신고 내용:</h6>
																						<textarea class="form-control" id="reportContent${commentList.communityCommentNo}"></textarea>
																					</div>
																				</form>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
																				<button type="button" onclick="reportComment(${commentList.communityCommentNo})" class="btn btn-primary">보내기</button>
																			</div>
																		</div>
																	</div>
																</div>

															</c:if>
														</div>
														<div id="replyComment${commentList.communityCommentMasterNumber}"></div>
													</div>
												</div>
											</c:forEach>
										</c:if>
									</form>
								</div>
							</div>
						</section>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/include/footer.jsp" />
			</div>
			<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		</div>
	</div>
</body>
</html>