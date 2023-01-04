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
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle" href="<c:url value="/static/css/material-dashboard.css"/>" rel='stylesheet' />

<body>
	<jsp:include page="/WEB-INF/views/include/adminheader.jsp" />


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

				<div class="container-fluid" style="background-color: white; margin: 50px; width: 92%;">

					<div class="card my-4">
						<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
							<div class="bg-gradient-secondary shadow-primary border-radius-lg pt-4 pb-3">
								<h6 class="text-white text-capitalize ps-3">학생 목록</h6>
							</div>
						</div>
						<div class="card-body px-0 pb-2">
							<div class="table-responsive p-0">
								<table class="table align-items-center mb-0">
									<thead>
										<tr>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">학번</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이름</th>
											<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">학과</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">학년</th>
											<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">과목</th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${userList}">
											<tr>
												<td>
													<h3 align="center" class="text-xs font-weight-bold mb-0">${user.uId}</h3>
												</td>
												<td>
													<h3 align="center" class="text-xs font-weight-bold mb-0">${user.uName}</h3>
													
												</td>
												<td>
													<h3 align="center" class="text-xs font-weight-bold mb-0">${user.uName}</h3>
												</td>
												<td>
													<h3 align="center" class="text-xs font-weight-bold mb-0">${user.major}</h3>
												</td>
												<td>
													<h3 align="center" class="text-xs font-weight-bold mb-0">c언어</h3>
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
									
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="m-2" style="height: 100px"></div>
			<jsp:include page="/WEB-INF/views/include/adminsidebar.jsp" />
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>