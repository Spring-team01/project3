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
#cardNewsHead {
	width: 200px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;  /* 말줄임 적용 */
}
#cardNewsbody{
	width: 200px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

</style>


<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<script>
		/* 커뮤니티 */
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
		
		/* 출석 */
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
		
		/* 공지 */
		$(document).ready(function() {
			$.ajax({
				url : "/myapp/board/boardminiview",
				type : "GET",
				datatype : "html",
				success : function(data) {
					$('#boardMiniView').html(data);
				}
			});
		});
	</script>

	<!-- sidebar 토글 -->
	<div class="main">
		<div class="wrapper">
			<div class="section">
				<div class="top_navbar">
					<div class="hamburger">
						<a href="#"> <i class="fa-solid fa-bars"></i>
						</a>
					</div>
				</div>

			<!-- 00님 환영합니다 -->	
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
			<!-- 메인 컨테이너 (메인에 넣을 것은 이 안에 작성) -->
			<div class="container-fluid" style="background-color:white; margin:25px; width:95%; min-height: 800px;">
				
				<!-- 공지사항 4개 -->
				<div class="container-fluid py-4">
			      <div class="row" id="boardMiniView">
			      <!-- 공지사항 forEach  -->
			      </div>
			    </div>
			    <div class="row">
				    <!-- 출석 미니뷰 -->
					<div class="col-6 col-md">
						<div id="attendanceMiniView" style="width:100%; height:100%">
						</div>
					</div>
					
					<!-- 커뮤니티 미니뷰 -->
					<div class="col-6 col-md">
						<div id="communityMiniView" style="width: 100%; height: 100%">
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