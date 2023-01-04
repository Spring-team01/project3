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
              <div class="container-fluid" style="background-color:white; margin:50px; width:92%;">
      				
					${message}
					<div class="board_content">
						<form class="d-flex align-items-center" action="<c:url value='/board/search'/>" method="get">
							<div class="pull-right" style="margin-bottom: 5px;">
								<div class="col-xs-9">
									<input type="text" name="keyword" class="form-control">
								</div>
							</div>	
							<input type="submit" class="btn btn-warning btn-sm m-1" value="<fmt:message key="SEARCH"/>">
						</form>
						
						<!--템플릿  -->
						<div class="container-fluid py-4">
					      <div class="row">
					        <div class="col-12">
					          <div class="card my-4">
					            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
					              <div class="bg-gradient-success shadow-success border-radius-lg pt-4 pb-3">
					                <h6 class="text-white text-capitalize ps-3">강의 게시판</h6>
					              </div>
					            </div>
					            <div class="card-body px-0 pb-2">
					              <div class="table-responsive p-0">
					                <table class="table align-items-center justify-content-center mb-0">
					                  <thead>
					                    <tr>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="BOARD_ID"/></th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"><fmt:message key="CATEGORY"/></th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"><fmt:message key="WRITER"/></th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="SUBJECT"/></th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="CONTENT"/></th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="WRITE_DATE"/></th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"><fmt:message key="READ_COUNT"/></th>
					                    </tr>
					                  </thead>
					                  <tbody>
					                  <c:set var="seq" value="${(page-1)*10}" scope="page"/>
										<c:forEach var="board" items="${boardList}">
											<tr>
												<c:set var="seq" value="${seq+1}" scope="page"/>
												<td><p class="text-xs font-weight-bold mb-0">${board.boardId}</p></td>
												<td>
													<span class="badge badge-sm bg-gradient-success">
													<c:choose>
													<c:when test="${board.categoryId eq 1}">공지사항</c:when>
													<c:when test="${board.categoryId eq 2}">강의게시판</c:when>
													<c:when test="${board.categoryId eq 3}">과제제출</c:when>
													<c:when test="${board.categoryId eq 4}">질문게시판</c:when>
													</c:choose>
													</span>
												</td>
												<td class="pc"><span class="text-secondary text-xs font-weight-bold">${board.writer}</span></td>
												<td class="pc"><span class="text-secondary text-xs font-weight-bold"><a href='<c:url value="board/${board.boardId}"/>'>${board.title}</a></span></td>
												<td class="pc"><span class="text-secondary text-xs font-weight-bold"><a href='<c:url value="board/${board.boardId}"/>'>${board.content}</a></span></td>
												<td class="pc"><span class="text-secondary text-xs font-weight-bold"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></span></td>
												<td class="pc"><span class="text-secondary font-weight-bold text-xs" >${board.readCount}</span></td>
											</tr>
										</c:forEach>
					                  </tbody>
					                </table>
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					      
					      <!-- 템플릿 끝! -->
						<table class="table">
							<tr>
								<td align="left">
									
								</td>
								<td align="right">
									<a href='<c:url value="/board/write/${categoryId}"/>'>
									<button><fmt:message key="WRITE_NEW_ARTICLE"/>
									</button>
									</a>
								</td>
							</tr>
						</table>
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