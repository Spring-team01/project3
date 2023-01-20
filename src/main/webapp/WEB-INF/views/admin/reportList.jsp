<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/include/adminstaticFiles.jsp" />
	<script>
	/* delete Comment */
	function deleteAdminComment(i,j) {
		console.log(i);
		$.ajax({
			type:'GET',
			url: "/myapp/board/comment/delete/"+i,
			error: function(){
				console.log('댓글삭제 실패');
			},
			success: function(data){
				if(data==1){
					alert("댓글이 삭제되었습니다 ")
					location.reload();
				}
			}
		})
		$.ajax({
			type:'GET',
			url:"/myapp/admin/report/update/"+j,
			success: function(){
				alert('업데이트 통신 성공');
				
			}
		})
	}
	
	/* delete NestedComment */
	function deleteAdminNestedComment(i,j) {
		console.log(i);
		$.ajax({
			type:'GET',
			url: "/myapp/board/nestedcomment/delete"+i,
			error: function(){
				alert('통신 실패');
				console.log('대댓글삭제 실패');
			},
			success: function(data){
				if(data==1){
					alert("게시글이 삭제되었습니다 ")
					location.reload();
				}
			}
			
		})
		$.ajax({
		type:'GET',
		url:"/myapp/admin/report/update/"+j,
		success: function(){
			alert('업데이트 통신 성공');
			}
		})
	}
	
	/* delete Community Comment */
	function deleteCommunityComment(i,j) {
		console.log(i);
		console.log(j);
		$.ajax({
			type:'GET',
			url: "/myapp/community/admin/reply/delete/"+i,
			error: function(){
				alert('통신 실패 ');
				console.log('댓글삭제 실패');
			},
			success: function(data){
				if(data==1){
					alert("댓글이 삭제되었습니다 ")
					location.reload();
				}
			}
		})
		$.ajax({
			type:'GET',
			url:"/myapp/admin/report/update/"+j,
			success: function(){
				alert('업데이트 통신 성공');
			}
		})
	}
	/* delete Community NestedComment */
	function deleteCommunityReplyComment(i,j) {
		console.log(i);
		console.log(j);
		$.ajax({
			type:'GET',
			url: "/myapp/community/admin/replycomment/delete/"+i,
			error: function(){
				alert('통신 실패 ');
				console.log('댓글삭제 실패');
			},
			success: function(data){
				if(data==1){
					alert("댓글이 삭제되었습니다 ")
					location.reload();
				}
			}
		})
		$.ajax({
			type:'GET',
			url:"/myapp/admin/report/update/"+j,
			success: function(){
				alert('업데이트 통신 성공');
			}
		})
	}
	
	
	
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/adminheader.jsp" />


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
						<!--템플릿  -->
						<div class="container-fluid py-4">
						<div class="board_content">
						

					      <div class="row">
					      <div class="form-inline m-2 justify-content-start ">
									<button onclick = "location.href = '<c:url value='/admin/reportlist/1?resultNumber=1'/>'" class="badge badge-sm bg-gradient-success">처리된 목록</button>
									<button onclick = "location.href = '<c:url value='/admin/reportlist/1?resultNumber=2'/>'" class="badge badge-sm bg-gradient-info">미처리 목록</button>
									<button onclick = "location.href = '<c:url value='/admin/reportlist/1'/>'" class="badge badge-sm bg-gradient-warning">전체 목록</button>
									
								</div>
					        <div class="col-12">
					          <div class="card my-4">
					            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
					              <div class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
					                <h6 class="text-white text-capitalize ps-3">게시글 신고 목록</h6>
					              </div>
					            </div>
					            <div class="card-body px-0 pb-2">
					              <div class="table-responsive p-0">
					                <table class="table align-items-center justify-content-center mb-0">
					                  <thead>
					                    <tr>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">글번호</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">작성자</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">신고대상</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">신고내용</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성날짜</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">신고종류</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">삭제</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">처리결과</th>
					                    </tr>
					                  </thead>
					                  <tbody>
										<c:forEach var="report" items="${reportList}">
											<tr >
												<td class="text-xs font-weight-bold mb-0 text-center">${report.rpReportNo}</td>
												
												<td class="pc">
													<p class="text-xs font-weight-bold mb-0 text-center">${report.userId}</p>
												</td>
												<td class="pc"><h6 class="text-xs font-weight-bold mb-0 text-center">${report.rpTarget}</h6></td>
												<td class="pc"><h6 class="text-xs font-weight-bold mb-0 text-center">${report.rpContent }</h6></td>
												<td class="pc"><h6 class="text-xs font-weight-bold mb-0 text-center">${report.rpWriteDate}</h6></td>
												<td class="text-center">
													<c:choose>
													<c:when test="${report.rpType eq '게시글'}"><span class="badge badge-sm bg-gradient-success">게시글</span></c:when>
													<c:when test="${report.rpType eq '댓글'}"><span class="badge badge-sm bg-gradient-info">댓글</span></c:when>
													<c:when test="${report.rpType eq '대댓글'}"><span class="badge badge-sm bg-gradient-warning">대댓글</span></c:when>
													<c:when test="${report.rpType eq 'C댓글'}"><span class="badge badge-sm bg-gradient-warning">C댓글</span></c:when>
													<c:when test="${report.rpType eq 'C대댓글'}"><span class="badge badge-sm bg-gradient-warning">C대댓글</span></c:when>
													</c:choose>
												</td>
												
												<td>
												<c:choose>
													<c:when test="${report.rpType eq '게시글'}"><a  class="btn btn-sm ml-3">삭제</a></c:when>
													<c:when test="${report.rpType eq '댓글'}"><a onclick="deleteAdminComment(${report.rpCommentNo},${report.rpReportNo})"  class="btn btn-sm ml-3">삭제</a></c:when>
													<c:when test="${report.rpType eq '대댓글'}"><a onclick="deleteAdminNestedComment(${report.rpCommentNo},${report.rpReportNo})"  class="btn btn-sm ml-3">삭제</a></c:when>
													<c:when test="${report.rpType eq 'C댓글'}"><a onclick="deleteCommunityComment(${report.rpCommentNo},${report.rpReportNo})"  class="btn btn-sm ml-3">삭제</a></c:when>
													<c:when test="${report.rpType eq 'C대댓글'}"><a onclick="deleteCommunityReplyComment(${report.rpCommentNo},${report.rpReportNo})"  class="btn btn-sm ml-3">삭제</a></c:when>
													</c:choose>
												</td>
												<td class="text-xs font-weight-bold mb-0 text-center">${report.rpStatus}</td>
											</tr>
											
										</c:forEach>
					                  </tbody>
					                </table>
					              </div>
					              
					              <div class="pager d-flex justify-content-center my-3">
								<div class="flex-fulfill"></div>
								<div class="pagingButtonSet d-flex justify-content-center">
									<c:if test="${pager.pageNo > 1}">
										<a href="1?resultNumber=${resultNumber}" type="button" class="btn btn-muted shadow">◀◀</a>
									</c:if>
	
									<c:if test="${pager.groupNo > 1}">
										<a href="${pager.startPageNo-1}?resultNumber=${resultNumber}" type="button" class="btn btn-muted shadow">◀</a>
									</c:if>
	
									<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
										<c:if test="${pager.pageNo != i}">
											<a href="${i}?resultNumber=${resultNumber}" type="button" class="btn btn-white shadow">${i}</a>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<a href="${i}?resultNumber=${resultNumber}" type="button" class="btn btn-dark shadow">${i}</a>
										</c:if>
									</c:forEach>
	
									<c:if test="${pager.groupNo < pager.totalGroupNo }">
										<a href="${pager.endPageNo+1}?resultNumber=${resultNumber}" type="button" class="btn btn-muted shadow">▶</a>
	
									</c:if>
									<c:if test="${pager.pageNo < pager.totalPageNo}">
									<a href="${pager.totalPageNo}?resultNumber=${resultNumber}" type="button" class="btn btn-muted shadow">▶▶</a>
								</c:if>
								</div>
								<div class="flex-fulfill"></div>
								
					            
								</div>
					          </div>
					        </div>
					      </div>
					        </div>
					</div>
	    		</div>
	        </div>
        </div>
 <jsp:include page="/WEB-INF/views/include/adminsidebar.jsp" />       
    </div>
    </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>