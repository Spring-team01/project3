<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link href="<c:url value="/static/css/nucleo-icons.css"/>" rel="stylesheet" />
<link href="<c:url value="/static/css/nucleo-svg.css"/>" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"></script>
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
						<a href="#"> <i class="fa-solid fa-bars"></i>
						</a>
					</div>
				</div>
				<div class="mainview d-flex"></div>

				<div class="container-fluid" style="background-color: white; margin: 50px; width: 92%; min-height: 600px;">
					<div class="card my-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
							<div class="bg-gradient-secondary shadow-secondary border-radius-lg pt-4 pb-3">
								<h6 class="text-white text-capitalize ps-3">휴가신청 목록</h6>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr align="center">
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글번호</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">휴가 종류</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">제목</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">휴가 날짜</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">휴가 신청 날</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="subAttendance" items="${subAttendanceList}">
											<tr>
												<td>
													<p class="text-xs font-weight-bold mb-0 text-center">${subAttendance.subAttNo}</p>
												</td>
												<td class="text-center">
													<c:choose>
													<c:when test="${subAttendance.subStatus eq '조퇴'}"><span class="badge badge-sm bg-gradient-success">조퇴</span></c:when>
													<c:when test="${subAttendance.subStatus eq '공가'}"><span class="badge badge-sm bg-gradient-info">공가</span></c:when>
													<c:when test="${subAttendance.subStatus eq '외출'}"><span class="badge badge-sm bg-gradient-warning">외출</span></c:when>
													<c:when test="${subAttendance.subStatus eq '경조사'}"><span class="badge badge-sm bg-gradient-secondary">경조사</span></c:when>
													</c:choose>
												</td>
												<td class="pc text-center">
													<h6 class="text-secondary text-xs font-weight-bold">
														<a href='<c:url value="/subAttendance/view/${subAttendance.subAttNo}"/>'>${subAttendance.subAttendanceTitle}</a>
													</h6>
												</td>
												<td class="pc text-center">
													<h6 class="text-secondary text-xs font-weight-bold">
														<a href='<c:url value="/subAttendance/view/${subAttendance.subAttNo}"/>'>
															<fmt:formatDate pattern="yyyy-MM-dd" value="${subAttendance.subAttTime}"/>
														</a>
													</h6>
												</td>
												<td class="pc text-center">
													<h6 class="text-secondary text-xs font-weight-bold">
														<a href='<c:url value="/subAttendance/view/${subAttendance.subAttNo}"/>'>
															<fmt:formatDate pattern="yyyy-MM-dd" value="${subAttendance.subAttDate}"/>
														</a>
													</h6>
												</td>
												<td class="pc text-center">
													<h6 class="text-secondary text-xs font-weight-bold">
														<a href='<c:url value="/subAttendance/view/${subAttendance.subAttNo}"/>'>${subAttendance.result}</a>
													</h6>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
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
									<a type="button" href="<c:url value='/subattendance/write'/>" class="btn btn-muted shadow">글 작성</a>
								</div>
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