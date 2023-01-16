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
#boardcontent{
width: 300px;
overflow: hidden;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 1;
-webkit-box-orient: vertical;
}	
</style>
  </head>
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
						<!--템플릿  -->
						<div class="container-fluid py-4">
						<div class="board_content">
						<form class="form-inline m-2 justify-content-end" action="<c:url value='/board/search/1'/>" method="get">
							<input type="text" name="keyword" class="form-control" placeholder="Search" style="border: 1px solid gray; width:200px; height:35px; padding:0px 10px;">
							<input type="submit" class="btn btn-warning m-1" value="<fmt:message key="SEARCH"/>">
						</form>
					      <div class="row">
					        <div class="col-12">
					          <div class="card my-4">
					            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
					              <div class="bg-gradient-success shadow-success border-radius-lg pt-4 pb-3">
					                <h6 class="text-white text-capitalize ps-3">강의 게시판 ( ${subjectName} ) </h6>
					              </div>
					            </div>
					            <div class="card-body px-0 pb-2">
					              <div class="table-responsive p-0">
					                <table class="table align-items-center justify-content-center mb-0">
					                  <thead>
					                    <tr>
					                      <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 text-center"><fmt:message key="BOARD_ID"/></th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"><fmt:message key="CATEGORY"/></th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"><fmt:message key="WRITER"/></th>
					                      <th class="text-uppercase text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="SUBJECT"/></th>
					                      <th class="text-uppercase text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="CONTENT"/></th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="WRITE_DATE"/></th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="READ_COUNT"/></th>
					                    </tr>
					                  </thead>
					                  <tbody>
										<c:forEach var="board" items="${boardList}">
											<tr>
												<c:set var="seq" value="${seq+1}" scope="page"/>
												<td><p class="text-xs font-weight-bold mb-0 text-center">${board.boardId}</p></td>
												<td>
													<c:choose>
													<c:when test="${board.categoryId eq 1}"><span class="badge badge-sm bg-gradient-success">공지사항</span></c:when>
													<c:when test="${board.categoryId eq 2}"><span class="badge badge-sm bg-gradient-info">강의게시판</span></c:when>
													<c:when test="${board.categoryId eq 3}"><span class="badge badge-sm bg-gradient-warning">과제제출</span></c:when>
													<c:when test="${board.categoryId eq 4}"><span class="badge badge-sm bg-gradient-secondary">질문게시판</span></c:when>
													</c:choose>
												</td>
												<td class="pc">
												<div class="d-flex flex-column justify-content-center">
													<h6 class="mb-0 text-sm">${board.writer}</h6>
													<p class="text-xs text-secondary mb-0">${board.email}</p>
												</div>
												</td>
												<td class="pc"><h6 class="text-secondary text-xs font-weight-bold" style="width: 100px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"><a href='<c:url value="/board/view/${board.boardId}/${seq}"/>'>${board.title}</a></h6></td>
												<td class="pc"><h6 class="text-secondary text-xs font-weight-bold" id="boardcontent"><a href='<c:url value="/board/view/${board.boardId}/${seq}"/>'>${board.content}</a></h6></td>
												<td class="pc"><h6 class="text-secondary text-xs font-weight-bold"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></h6></td>
												<td class="pc text-center"><span class="text-secondary text-xs font-weight-bold">${board.readCount}</span></td>
											</tr>
										</c:forEach>
					                  </tbody>
					                </table>
					              </div>
					              <div class="pager d-flex justify-content-center my-3">
								<div class="flex-fulfill"></div>
								<div class="pagingButtonSet d-flex justify-content-center">
									<c:if test="${pager.pageNo > 1}">
										<a href="1?keyword=${keyword}" type="button" class="btn btn-muted shadow">◀◀</a>
									</c:if>
	
									<c:if test="${pager.groupNo > 1}">
										<a href="${pager.startPageNo-1}?keyword=${keyword}" type="button" class="btn btn-muted shadow">◀</a>
									</c:if>
	
									<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
										<c:if test="${pager.pageNo != i}">
											<a href="${i}?keyword=${keyword}" type="button" class="btn btn-white shadow">${i}</a>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<a href="${i}?keyword=${keyword}" type="button" class="btn btn-dark shadow">${i}</a>
										</c:if>
									</c:forEach>
	
									<c:if test="${pager.groupNo < pager.totalGroupNo }">
										<a href="${pager.endPageNo+1}?keyword=${keyword}" type="button" class="btn btn-muted shadow">▶</a>
									</c:if>
									<c:if test="${pager.pageNo < pager.totalPageNo}">
                                 		<a href="${pager.totalPageNo}?keyword=${keyword}" type="button" class="btn btn-muted shadow">▶▶</a>
                              		</c:if>
								</div>
								<div class="flex-fulfill"></div>
								<div class="d-flex justify-content-end">  
							      <a type="button" href="<c:url value="/board/write/1/"/>" class="btn btn-muted shadow">글 작성</a>
							      </div>
					            </div>
								</div>
					          </div>
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