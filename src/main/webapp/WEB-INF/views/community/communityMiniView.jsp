<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
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
	<div class="card my-4">
	<div class="card-body px-0 pb-2">
		<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
			<div class="bg-gradient-dark shadow-success border-radius-lg pt-4 pb-3">
				<h6 class="text-white text-capitalize ps-3">커뮤니티 게시판</h6>
			</div>

			<div class="table-responsive p-0">
				<table class="table align-items-center mb-0">
					<thead>
						<tr align="center">
							<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글번호</th>
							<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">게시글 제목</th>
							<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">조회수</th>
							<th class="text-secondary opacity-7"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="community" items="${communityList}">
							<tr>
								<td>
									<h3 align="center" class="text-xs font-weight-bold mb-0">${community.communityBoardId}</h3>
								</td>
								<td>
									<a href="<c:url value='/community/communityDetail/${community.communityBoardId}'/>" class="mb-0 text-sm">${community.communityTitle} [${community.communityReplyNumber}]</a>
								</td>
								<td class="align-middle text-center text-sm">
									<span class="text-secondary text-xs font-weight-bold">${community.communityReadCount}</span>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		</div>
	</div>
</body>
</html>