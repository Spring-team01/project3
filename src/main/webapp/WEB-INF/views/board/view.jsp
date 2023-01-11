<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>

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
.btn-left {
     left: 0.4em;
 }

 .btn-right {
     right: 0.4em;
 }

 .btn-left, .btn-right {
/*      position: absolute; */
     top: 0.24em;
 }

 .dropbtn {
     color: white;
     font-size: 16px;
     border: none;
     cursor: pointer;
 }


 .dropdown {
	 position: absolute; 
     display: inline-block;
     right: 0.4em;
 }

 .dropdown-content {
     display: none;
     position: relative;
     margin-top: 27px;
     background-color: #f9f9f9;
     min-width: 108px;
     overflow: auto;
     box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
     z-index: 1;
 }

 .dropdown-content a {
     color: black;
     padding: 12px 16px;
     text-decoration: none;
     display: block;
 }

 .dropdown a:hover {background-color: #f1f1f1}

 .show {display:block;}

</style>

<script>

	
	function viewReReply(i){
		$('#reCommentForm'+i).toggle()
		$('#viewReReply'+i).toggle()
		
		$.ajax({
			type : "GET",
			url : "/myapp/board/reply/",
			data : {bcReplyNo : i},
			success : function(data) {
				console.log(data);
	            $("#viewReReply"+i).html(data);
	         }
			
		});
	}
	function writeReReplyFun(i, j){
		let replyContent= $("#writeReReply"+i).val();
		console.log(replyContent);
		console.log(j);
		$.ajax({
	         type : 'POST',
	         url : "/myapp/board/reply/write",
	         data : {bcMasterNo: i, bcContent: replyContent, bcReplystep: 1, boardId: j},
	         error : function() {
	            alert('통신실패!');
	         },
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
	
	function updateReComment(){
		let html = ' ';
		html+='<input id ="boardComment" name="boardComment" value="">'
		htm += '<button type="button" onclick="updateComment()" >'
		$("#replydiv").after(html);
		
		
	}
	
	function updateComment(){
		let replyContent= $(boardComment).val();
		
		$.ajax({
	         type : 'POST',
	         url : "/myapp/board/comment/update",
	         data : {replyId: i, bcContent: replyContent, },
	         error : function() {
	            alert('통신실패!');
	         }
	         
	      });
		
	}
	/* 3dots menu */
	function showDropdown(i) {
	  document.getElementById("myDropdown"+i).classList.toggle("show");
	}
	
	// Close the dropdown if the user clicks outside of it
	window.onclick = function(event) {
	  if (!event.target.matches(".dropbtn")) {
	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains("show")) {
	        openDropdown.classList.remove("show");
	      }
	    }
	  }
	};
	
	/* delete Comment */
	function deleteComment(i) {
		console.log(i);
		$.ajax({
			type:'GET',
			url: "/myapp/board/comment/delete/"+i,
			error: function(){
				alert('통신 실패 ');
			},
			success: function(data){
				if(data==1){
					alert("게시글이 삭제되었습니다 ")
					location.reload();
				}
			}
			
		})
	}
	
	/* delete NestedComment */
	function deleteNestedComment(i) {
		console.log(i);
		$.ajax({
			type:'GET',
			url: "/myapp/board/nestedcomment/delete/"+i,
			error: function(){
				alert('통신 실패 ');
			},
			success: function(data){
				if(data==1){
					alert("게시글이 삭제되었습니다 ")
					location.reload();
				}
			}
			
		})
	}
</script>

<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />


<div class="main">
    <div class="wrapper">
        <div class="section">
            <div class="top_navbar">
                <div class="hamburger">
                    <a href="#">
                        <i class="fa-solid fa-bars"></i>
                    </a>
                </div>
            </div>
     		<div class="mainview d-flex">
           
            </div>
              <div class="container-fluid" style="background-color:white; margin:50px; width:92%; min-height: 600px;">
				${message}
				<div class="container-fluid py-4">
					<div class="board_content">
						<form class="form-inline m-2 justify-content-end" action="<c:url value='/board/search'/>" method="get">
							<input type="text" name="keyword" class="form-control" placeholder="Search" style="border: 1px solid gray; width:200px; height:35px; padding:0px 10px;">
							<input type="submit" class="btn btn-warning m-1" value="<fmt:message key="SEARCH"/>">
						</form>
					    <div class="pg-opt">
					        <div class="row">
					            <div class="col-md-6 pc">
					                <h2><fmt:message key="CONTENT"/></h2>
					            </div>
					            <div class="col-md-6">
					                <ol class="breadcrumb">
					                    <li><fmt:message key="BOARD"/></li>
					                    <li class="active"><fmt:message key="CONTENT"/></li>
					                </ol>
					            </div>
					        </div>
					    </div>
				<div class="content">
					<table class="table table-bordered">
						<tr>
							<td width="20%"><fmt:message key="BOARD_ID"/></td>
							<td>${board.boardId}</td>
						</tr>
						<tr>
							<td width="20%"><fmt:message key="WRITER"/></td>
							<td>${board.writer}</td>
						</tr>
						<tr>
							<td width="20%"><fmt:message key="WRITE_DATE"/></td>
							<td><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<td><fmt:message key="SUBJECT"/> </td>
							<td>${board.title}</td>
						</tr>
						<tr>
							<td><fmt:message key="CONTENT"/></td>
							<td class="board_content"><p style="white-space: pre-line;"><c:out value="${board.content}"/></p></td>
						</tr>
						<c:if test="${!empty board.boardFileName}">
						<tr>
							<td><fmt:message key="FILE"/></td>
							<td>
							<c:set var="len" value="${fn:length(board.boardFileName)}"/>
							<c:set var="filetype" value="${fn:toUpperCase(fn:substring(board.boardFileName, len-4, len))}"/>
							<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}"><img src='<c:url value="/boardfile/${board.boardFileId}"/>' class="img-thumbnail"><br></c:if>
							<a href='<c:url value="/boardfile/${board.boardFileId}"/>'>${board.boardFileName} (<fmt:formatNumber>${board.boardFileSize}</fmt:formatNumber>byte)</a>
							</td>
						</tr>
						</c:if>
						
						<tr>
						<td colspan=2 align="right">
						<section class="mb-5">
							<div class="card bg-light">
								<div class="card-body">
									<form class="mb-4" action="<c:url value='/board/comment'/>" method="post">
										<textarea name="bcContent" class="form-control" rows="3" placeholder="댓글 작성"></textarea>
										<br> 
										<input type="submit" class="btn btn-dark shadow" value="작성"> 
										<input type="hidden" name="boardId" value="${board.boardId}"> 
									</form>

								
										<c:if test="${!empty commentList}">
											<c:forEach var="commentOne" items="${commentList}">
												<div class="d-flex flex-column mb-3 " >
													<div class="ms-3">
														<div class="d-flex align-items-center">
															<div>
																<div class="flex-shrink-0">
																	<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
																</div>
															</div>
															<div class="flex-fill mx-3 text-left">
																<div class="fw-bold">${commentOne.userId}</div>
																${commentOne.bcContent}
															</div>
															<div class="ms-auto">
																<div class="d-flex flex-column">
												                    <!-- three dots -->
												                    	<div>
																	    	<img src='<c:url value="/images/threedots.svg"/>' class="dropbtn icons btn-right showLeft m-2" onclick="showDropdown(${commentOne.bcReplyNo})">
																	    </div>
												                 	<div class="dropdown">
																	    <!-- menu -->
																	    <div id="myDropdown${commentOne.bcReplyNo}" class="dropdown-content">
																	    <c:if test="${commentOne.userId eq sessionScope.userId}">
																	    	<a onclick="deleteComment(${commentOne.bcReplyNo})">삭제하기</a>
																	    </c:if>
																	    <c:if test="${commentOne.userId ne sessionScope.userId}">
																	    	<a href="#report ">신고하기</a>
																	    </c:if> 
																	    </div>
																	 </div>
																	<button type="button" onclick="viewReReply(${commentOne.bcReplyNo})" class="btn btn-sm btn-dark shadow">답글</button>
													             </div>
															</div>
														</div>
													
													<!-- 대댓글 작성 -->
																
														<div id="reCommentForm${commentOne.bcReplyNo}"style="display:none">
															<form class="mb-4" id="writeReReplyForm" name="writeReReplyForm" class="d-flex">
																<label class="font-weight-bold" for="writeReReply${commentOne.bcReplyNo}"></label>
																<textarea id="writeReReply${commentOne.bcReplyNo}"type="text" class="form-control" name="bcContent" placeholder="댓글을 입력해주세요"></textarea>
																<input type="submit" onclick="writeReReplyFun(${commentOne.bcReplyNo}, ${commentOne.boardId})" class="btn btn-dark shadow" value="작성"> 
															</form>
														</div>
														<!-- 대댓글리스트 -->
														<div id="viewReReply${commentOne.bcReplyNo}" style="display:none">
														</div>
														<!-- 작성한 답글 추가 -->
														<div id="addReply${commentOne.bcReplyNo}">
															
														</div>
												</div>
												</div>
											</c:forEach>
										</c:if>
									
								</div>
							</div>
						</section>
						</td>
						</tr>
						<tr>
							<td colspan=2 align="right">
							<c:if test="${board.userId==sessionScope.userId}">
								<a href='<c:url value="/boardlist/1"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
								<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
								<a href='<c:url value="/board/reply/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="REPLY"/></button></a>
								<a href='<c:url value="/board/update/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="UPDATE"/></button></a>
								<a href='<c:url value="/board/delete/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="DELETE"/></button></a>
							</c:if>
							<c:if test="${board.userId!=sessionScope.userId}">
								<a href='<c:url value="/boardlist/1"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
								<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
								<a href='<c:url value="/board/reply/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="REPLY"/></button></a>
							</c:if>
							</td>
						</tr>
						</table>
					</div>  
					</div>
	    		</div>
	        </div>
        </div>
 <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />       
    </div>
    </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>