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
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">처리결과</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">글번호</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">작성자</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">제목</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성날짜</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">신고종류</th>
					                     
					                    </tr>
					                  </thead>
					                  <tbody>
										<c:forEach var="report" items="${reportList}">
											<tr>
												<td class="text-xs font-weight-bold mb-0 text-center">${report.result}</td>
												<td class="text-xs font-weight-bold mb-0 text-center">${report.rpBoardId}</td>
												
												<td class="pc">
													<p class="text-xs font-weight-bold mb-0 text-center">${report.userName}</p>
													<p class="text-xs font-weight-bold mb-0 text-center">${report.userId}</p>
												</td>
												<td class="pc"><h6 class="text-xs font-weight-bold mb-0 text-center">
												<a href='<c:url value="/admin/reasondetail/${report.subAttNo}"/>'>${report.title}</a></h6></td>
												<td class="pc"><h6 class="text-xs font-weight-bold mb-0 text-center">${report.writeDate}</h6></td>
												<td class="text-center">
													<c:choose>
													<c:when test="${report.subStatus eq '조퇴'}"><span class="badge badge-sm bg-gradient-success">조퇴</span></c:when>
													<c:when test="${report.subStatus eq '공가'}"><span class="badge badge-sm bg-gradient-info">공가</span></c:when>
													<c:when test="${report.subStatus eq '외출'}"><span class="badge badge-sm bg-gradient-warning">외출</span></c:when>
													<c:when test="${report.subStatus eq '경조사'}"><span class="badge badge-sm bg-gradient-secondary">경조사</span></c:when>
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