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
						<form class="form-inline m-2 justify-content-end" action="<c:url value='/admin/search'/>" method="get">
							<input type="text" name="keyword" class="form-control" placeholder="Search" style="border: 1px solid gray; width:200px; height:35px; padding:0px 10px;">
							<input type="submit" class="btn btn-warning m-1" value="<fmt:message key="SEARCH"/>">
						</form>
					      <div class="row">
					        <div class="col-12">
					          <div class="card my-4">
					            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
					              <div class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
					                <h6 class="text-white text-capitalize ps-3">휴가 신청 목록</h6>
					              </div>
					            </div>
					            <div class="card-body px-0 pb-2">
					              <div class="table-responsive p-0">
					                <table class="table align-items-center justify-content-center mb-0">
					                  <thead>
					                    <tr>
					                      <th class="text-center text-secondary text-xxs font-weight-bolder opacity-7 text-center">글번호</th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">작성자</th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">제목</th>
					                      <th class="text-uppercase text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성날짜</th>
					                      <th class="text-uppercase text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">처리결과</th>
					                     
					                    </tr>
					                  </thead>
					                  <tbody>
										<c:forEach var="reason" items="${reasonList}">
											<tr>
												<c:set var="seq" value="${seq+1}" scope="page"/>
												<td><p class="text-xs font-weight-bold mb-0 text-center">${reason.subAttNo}</p></td>
												
												<td class="pc">
												<div class="d-flex flex-column justify-content-center">
													<h6 class="mb-0 text-sm">${reason.userName}</h6>
													<p class="text-xs text-secondary mb-0">${reason.userId}</p>
												</div>
												</td>
												<td class="pc"><h6 class="text-secondary text-xs font-weight-bold">${reason.title}</h6></td>
												<td class="pc"><h6 class="text-secondary text-xs font-weight-bold"></h6>${reason.writeDate}</td>
												<td>
													<c:choose>
													<c:when test="${reason.result eq '미처리'}"><span class="badge badge-sm bg-gradient-success">${reason.result}</span></c:when>
													<c:when test="${reason.result eq '처리'}"><span class="badge badge-sm bg-gradient-info">${reason.result}</span></c:when>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
					                  </tbody>
					                </table>
					              </div>
					              
					              <div class="pager d-flex justify-content-center my-3">
								<div class="flex-fulfill"></div>
								<div class="pagingButtonSet d-flex justify-content-center">
									<c:if test="${pager.pageNo > 1}">
										<a href="1" type="button" class="btn btn-muted shadow">◀◀</a>
									</c:if>
	
									<c:if test="${pager.groupNo > 1}">
										<a href="${pager.startPageNo-1}" type="button" class="btn btn-muted shadow">◀</a>
									</c:if>
	
									<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
										<c:if test="${pager.pageNo != i}">
											<a href="${i}" type="button" class="btn btn-white shadow">${i}</a>
										</c:if>
										<c:if test="${pager.pageNo == i}">
											<a href="${i}" type="button" class="btn btn-dark shadow">${i}</a>
										</c:if>
									</c:forEach>
	
									<c:if test="${pager.groupNo < pager.totalGroupNo }">
										<a href="${pager.endPageNo+1}" type="button" class="btn btn-muted shadow">▶</a>
	
									</c:if>
									<a href="${pager.totalPageNo}" type="button" class="btn btn-muted shadow">▶▶</a>
								</div>
								<div class="flex-fulfill"></div>
								<div class="d-flex justify-content-end">  
							      <a type="button" href="<c:url value="/board/write/${board.categoryId}"/>" class="btn btn-muted shadow">글 작성</a>
							      </div>
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