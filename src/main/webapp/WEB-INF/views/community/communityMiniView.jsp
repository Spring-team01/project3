<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html>
<html>

<style>
.tab_menu {
	position: relative;
}

.tab_menu .list {
	overflow: hidden;
	margin: auto;
	display: table;
}

.tab_menu .list li {
	float: left;
}

.tab_menu .list li.is_on .btn {
	font-weight: bold;
	color: green;
}

.tab_menu .list .btn {
	font-size: 13px; . tab_menu .cont_area .cont{display : none;
	position: absolute;
	top: 25px;
	left: 0;
	background: #555;
	color: #fff;
	text-align: center;
	width: 250px;
	height: 100px;
	line-height: 100px;
}
}
</style>
<script>
	const tabList = document.querySelectorAll('.tab_menu .list li');
	const contents = document.querySelectorAll('.tab_menu .cont_area .cont')
	let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

	for (var i = 0; i < tabList.length; i++) {
		tabList[i].querySelector('.btn').addEventListener('click', function(e) {
			e.preventDefault();
			for (var j = 0; j < tabList.length; j++) {
				// 나머지 버튼 클래스 제거
				tabList[j].classList.remove('is_on');

				// 나머지 컨텐츠 display:none 처리
				contents[j].style.display = 'none';
			}

			// 버튼 관련 이벤트
			this.parentNode.classList.add('is_on');
			
			// 버튼 클릭시 컨텐츠 전환
			activeCont = this.getAttribute('href');
			document.querySelector(activeCont).style.display = 'block';
			
		});
	}
	
	
</script>
<div class="card my-4">
	<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
		<div class="bg-gradient-dark shadow-success border-radius-lg pt-4 pb-3">
			<h6 class="text-white text-capitalize ps-3">커뮤니티 게시판</h6>
		</div>
	</div>
	<div class="container" style="margin: 0em; padding: 0em; ">
		<div class="tab_menu" >
			<ul class="list" >
				<li class="is_on"><a href="#tab1" class="btn">조회수 높은 순</a></li>
				<li><a href="#tab2" class="btn">댓글 많은 순</a></li>
				<li><a href="#tab3" class="btn">최신 순</a></li>
			</ul>
			<div class="card-body px-0 pb-2 pt-0">
				<div class="table-responsive p-0">
					<div class="cont_area">
						<div id="tab1" class="cont">
							<table class="table align-items-center mb-0 text-center">
								<thead>
									<tr align="center">
										<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글번호</th>
										<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">게시글 제목</th>
										<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">조회수</th>
										<th class="text-secondary opacity-7"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="community" items="${communityListTab1}">
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
						<div id="tab2" class="cont" style="display: none;">
							<table class="table align-items-center mb-0 text-center">
								<thead>
									<tr align="center">
										<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글번호</th>
										<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">게시글 제목</th>
										<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">조회수</th>
										<th class="text-secondary opacity-7"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="community2" items="${communityListTab2}">
										<tr>
											<td>
												<h3 align="center" class="text-xs font-weight-bold mb-0">${community2.communityBoardId}</h3>
											</td>
											<td>
												<a href="<c:url value='/community/communityDetail/${community2.communityBoardId}'/>" class="mb-0 text-sm">${community2.communityTitle} [${community2.communityReplyNumber}]</a>
											</td>
											<td class="align-middle text-center text-sm">
												<span class="text-secondary text-xs font-weight-bold">${community2.communityReadCount}</span>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="tab3" class="cont" style="display: none;">
							<table class="table align-items-center mb-0 text-center" >
								<thead>
									<tr align="center">
										<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글번호</th>
										<th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">게시글 제목</th>
										<th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">조회수</th>
										<th class="text-secondary opacity-7"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="community3" items="${communityListTab3}">
										<tr>
											<td>
												<h3 align="center" class="text-xs font-weight-bold mb-0">${community3.communityBoardId}</h3>
											</td>
											<td>
												<a href="<c:url value='/community/communityDetail/${community3.communityBoardId}'/>" class="mb-0 text-sm">${community3.communityTitle} [${community3.communityReplyNumber}]</a>
											</td>
											<td class="align-middle text-center text-sm">
												<span class="text-secondary text-xs font-weight-bold">${community3.communityReadCount}</span>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>