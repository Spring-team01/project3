<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

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
	            alert('????????????!');
	         },
	         success : function(data) {
	            if(data==0) {
	               alert("?????? ????????? ?????????????????????");
	            } else if(data==1) {     	
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
	         data : {replyId: i, bcContent: replyContent},
	         error : function() {
	            alert('????????????!');
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
				alert('?????? ?????? ');
			},
			success: function(data){
				if(data==1){
					alert("????????? ????????????????????? ")
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
				alert('?????? ?????? ');
			},
			success: function(data){
				if(data==1){
					alert("???????????? ????????????????????? ")
					location.reload();
				}
			}
			
		})
	}
	/* ?????? ??????~ */
	function reportComment(i,j){
		let repoortContent = $("#reportContent"+i).val();
		let rpTarget=$("#bcContent"+i).val();
		
		console.log(rpTarget);
		$.ajax({
			 type : 'POST',
	         url : "/myapp/board/comment/report",
	         data : {rpBoardId: j,rpCommentNo: i, rpContent: repoortContent, rpMasterNo: i, rpType: '??????', rpTarget: rpTarget},
	         error : function() {
	            alert('????????????!');
	         },
	         success : function(data) {
	            if(data==0) {
	               alert("?????? ?????????????????????.");
	            } else if(data==1) {
	            	alert("????????? ?????????????????????.");       	
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
                    <a href="#">
                        <i class="fa-solid fa-bars"></i>
                    </a>
                </div>
            </div>
<div class="mainview d-flex">
    
</div>
<div class="container-fluid" style="background-color:white; margin:50px; width:92%; min-height: 800px;">
${message}
<!--?????????  -->
	<div class="container-fluid p-4">
		<div class="board_content p-4">
			<form class="form-inline m-2 justify-content-end" action="<c:url value='/board/search/1'/>" method="get">
				<input type="text" name="keyword" class="form-control" placeholder="Search" style="border: 1px solid gray; width:200px; height:35px; padding:0px 10px;">
				<input type="submit" class="btn btn-warning m-1" value="<fmt:message key="SEARCH"/>">
			</form>
	      <div class="row">
	        <div class="col-12">
	        
	        
	          <div class="card my-4">
	            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
	              <div class="bg-gradient-success shadow-success border-radius-lg pt-4 pb-3">
	                <c:if test="${board.categoryId == '1'}"><h6 class="text-white text-capitalize ps-3"> ?????? ????????? > ???????????? > ${board.boardId}</h6></c:if>
	                <c:if test="${board.categoryId == '2'}"><h6 class="text-white text-capitalize ps-3"> ?????? ????????? > ??????????????? > ${board.boardId}</h6></c:if>
	                <c:if test="${board.categoryId == '3'}"><h6 class="text-white text-capitalize ps-3"> ?????? ????????? > ???????????? > ${board.boardId}</h6></c:if>
	                <c:if test="${board.categoryId == '4'}"><h6 class="text-white text-capitalize ps-3"> ?????? ????????? > ??????????????? > ${board.boardId}</h6></c:if>
	              </div>
	            </div>
	        	<div class="card-body pb-2">
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
						<td class="board_content" >${fn: replace(board.content, replaceChar, "") }</td>
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
					
					</td>
					</tr>
					
					</table>
					</div>
					<section class="mb-5">
						<div class="card bg-light">
							<div class="card-body">
								<form class="d-flex mb-4" action="<c:url value='/board/comment'/>" method="post">
									<textarea name="bcContent" class="form-control mx-2" rows="3" placeholder="?????? ??????" required></textarea>
									<input type="submit" class="btn btn-dark shadow" value="??????"> 
									<input type="hidden" name="boardId" value="${board.boardId}"> 
								</form>
									<c:if test="${!empty commentList}">
										<c:forEach var="commentOne" items="${commentList}">
											<div class="d-flex flex-column mb-5" >
												<div class="ms-3">
													<div class="d-flex align-items-center mb-3">
														<div>
															<div class="flex-shrink-0">
															
																<img class="rounded-circle" 
																src='<c:url value="/admin/userdetail/userfile/${commentOne.userFileId}"/>' 
																alt="..."  style="width: 50px; height: 50px;"/>
															</div>
														</div>
														<div class="flex-fill mx-3 text-left">
															<div class="fw-bold">${commentOne.userName}</div>
															<input type="hidden" id="bcContent${commentOne.bcReplyNo}" value="${commentOne.bcContent}">${commentOne.bcContent}
														</div>
														<div class="ms-auto">
															<div class="d-flex flex-column text-right">
											                    <!-- three dots -->
											                    	<div>
																    	<img src='<c:url value="/images/threedots.svg"/>' class="dropbtn icons btn-right showLeft m-2" onclick="showDropdown(${commentOne.bcReplyNo})">
																    </div>
											                 	<div class="dropdown">
																    <!-- menu -->
																    <div id="myDropdown${commentOne.bcReplyNo}" class="dropdown-content">
																    <c:if test="${commentOne.userId eq sessionScope.userId}">
																    	<a onclick="deleteComment(${commentOne.bcReplyNo})">????????????</a>
																    </c:if>
																    <c:if test="${commentOne.userId ne sessionScope.userId}">
																    	<a type="button" data-toggle="modal" 
																    	data-target="#reportFun${commentOne.bcReplyNo}">????????????</a>
																    </c:if> 
																    </div>
																    
																    <!-- ????????? ?????? -->
																	<div class="modal fade" id="reportFun${commentOne.bcReplyNo}" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
																	  <div class="modal-dialog">
																	    <div class="modal-content">
																	      <div class="modal-header">
																	        <h5 class="modal-title" id="commentModalLabel">?????? ??????</h5>
																	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	          <span aria-hidden="true">&times;</span>
																	        </button>
																	      </div>
																	      <div class="modal-body">
																	        <form>
																	          <div class="form-group text-left">
																	            <h6>?????? ??????:</h6>
																	            <textarea class="form-control" id="reportContent${commentOne.bcReplyNo}"></textarea>
																	          </div>
																	        </form>
																	      </div>
																	      <div class="modal-footer">
																	        <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
																	        <button type="button"  onclick="reportComment(${commentOne.bcReplyNo},${commentOne.boardId})"class="btn btn-primary">?????????</button>
																	      </div>
																	    </div>
																	  </div>
																	</div>
																	
																 </div>
																<button type="button" onclick="viewReReply(${commentOne.bcReplyNo})" class="btn btn-sm btn-dark shadow">??????</button>
												             </div>
														</div>
													</div>
												
												<!-- ????????? ?????? -->
													<div id="reCommentForm${commentOne.bcReplyNo}"style="display:none;">
														<form class="mb-4 d-flex" id="writeReReplyForm" name="writeReReplyForm" >
															<label class="font-weight-bold" for="writeReReply${commentOne.bcReplyNo}"></label>
															<textarea id="writeReReply${commentOne.bcReplyNo}" class="form-control m-1" name="bcContent" placeholder="????????? ??????????????????" required></textarea>
															<input type="submit" onclick="writeReReplyFun(${commentOne.bcReplyNo}, ${commentOne.boardId})" class="btn btn-dark shadow m-1" value="??????"> 
														</form>
													</div>
													<!-- ?????????????????? -->
													<div id="viewReReply${commentOne.bcReplyNo}" style="display:none">
													</div>
											</div>
											</div>
										</c:forEach>
									</c:if>
								
							</div>
						</div>
					</section>
					</div>
						<div id="buttons" class="m-5 text-right">
							<c:if test="${sessionScope.userType!='ADMIN' && board.userId==sessionScope.userId}">
								<a href='<c:url value="/board/${categoryId}}/1"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
								<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
								<a href='<c:url value="/board/update/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="UPDATE"/></button></a>
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#deleteFun"><fmt:message key="DELETE"/></button>
							</c:if>
							<c:if test="${sessionScope.userType!='ADMIN' && board.userId!=sessionScope.userId}">
								<a href='<c:url value="/board/${categoryId}}/1"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
								<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
							</c:if>
							<c:if test="${sessionScope.userType =='ADMIN'}">
								<a href='<c:url value="/board/${categoryId}}/1"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
								<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>

								<!-- Button trigger modal -->
								<button type="button" class="btn btn-info" data-toggle="modal" data-target="#deleteFun"><fmt:message key="DELETE"/></button>
							</c:if>
							
							<!-- Modal -->
							<div class="modal fade" id="deleteFun" tabindex="-1" aria-labelledby="deleteFunLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="deleteFunLabel">????????? ??????</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body text-left">
							       ?????? ????????????????????????? 
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
							        <a type="button" class="btn btn-primary" href= '<c:url value="/board/delete/${board.boardId}"/>'>??????</a>
							      </div>
							    </div>
							  </div>
							</div>
							
						</div>
					</div>  
					
					<!-- Card end -->
				</div>
    		</div>
   		</div>
	</div>
</div>
 <jsp:include page="/WEB-INF/views/include/footer.jsp" />   
</div>
 <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />    
</div>
</div>

</body>
</html>