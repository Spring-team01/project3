<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<style>
html, body {
	width: 100%; height: 100%;
}
</style>


<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<script>
		$(document).ready(function() {
			$.ajax({
				url : "/myapp/community/communityMiniView",
				type : "GET",
				datatype : "html",
				success : function(data) {
					$('#communityMiniView').html(data);
				}
			});
		});
		
		$(document).ready(function() {
			$.ajax({
				url : "/myapp/attendance/attendanceMiniView",
				type : "GET",
				datatype : "html",
				success : function(data) {
					$('#attendanceMiniView').html(data);
				}
			});
		});
	</script>


	<div class="main">
		<div class="wrapper">
			<div class="section">
				<div class="top_navbar">
					<div class="hamburger">
						<a href="#"> <i class="fa-solid fa-bars"></i>
						</a>
					</div>
				</div>


				<div class="welcome d-flex align-items-center">
					<div class="profile px-5 m-5">
						<img src="<c:url value="/static/images/profile2.jpeg"/>" alt="profile_picture">
					</div>
					<div class="p-2 m-4 align-self-center" id="userInfo">
						<h1>${userName}님환영합니다.</h1>
						<p>${major}
							${grade}학년 <a href="/user/update"><i class="material-icons">settings</i></a>
						</p>
					</div>
				</div>
				<div class="container row" style="width: 100%; height: 100%">
					<div class="col-6">
						<div id="attendanceMiniView" style="width:100%; height:100%">
						
						</div>
					</div>
					<div class="col-6 col-md">
						게시판 추가
						<div class="column" >
							<div class="col-6">공지사항 게시판 view</div>
							<div id="communityMiniViewDiv" class="col-6 col-md" style="width: 100%; height: 100%">
								커뮤니티 게시판 조회수 순위
								<div id="communityMiniView"></div>
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