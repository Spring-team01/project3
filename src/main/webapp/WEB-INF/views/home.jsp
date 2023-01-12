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
		
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar : {
		            left : 'prev,next today',
		            center : 'title',
		            right : 'dayGridMonth'
		         },
		        locale: "ko",
				initialView: 'dayGridMonth',
				events: [
							{
								title : '예시',
								start : '2023-01-01',
								backgroundColor : '#ffc107',
								borderColor : '#ffc107'
							},
							// end 에는 끝 시간을 넣으면 그 시간까지 일정이 잡힘
							{
								title : '예시',
								start : '2023-01-02',
								end : '2023-01-05',
								backgroundColor : '#ffc107',
								borderColor : '#ffc107',
								display : 'auto'
							},
							// display 타입 종류 
							{
								title : '예시',
								start : '2023-01-09',
								backgroundColor : '#ffc107',
								borderColor : '#ffc107',
								display : 'auto'
							},
							{
								title : '예시',
								start : '2023-01-10',
								backgroundColor : '#ffc107',
								borderColor : '#ffc107',
								display : 'block'
							},
							{
								title : '예시',
								start : '2023-01-11',
								backgroundColor : '#ffc107',
								borderColor : '#ffc107',
								display : 'list-item'
							},
							{
								title : '예시',
								start : '2023-01-12',
								backgroundColor : '#ffc107',
								borderColor : '#ffc107',
								display : 'background'
							},
							{
								title : '예시',
								start : '2023-01-13',
								backgroundColor : '#ffc107',
								borderColor : '#ffc107',
								display : 'none'
							}
				]
			});
			calendar.render();
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
						<div id="attendanceMiniView" style="width:100%; height:25%">
						</div>
						<div class="card mb-5">
							<div
								class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
								<div
									class="bg-gradient-dark shadow-success border-radius-lg pt-4 pb-3">
									<h6 class="text-white text-capitalize ps-3">나의 출석</h6>
								</div>
							</div>
							<div class="card-body px-0 pb-2">
								<div class="table-responsive p-0">
									<table class="table align-items-center mb-0 text-center">
									</table>
									<div style="padding:0px 50px; margin-bottom:20px">
										<div id="calendar"></div>
									</div>
								</div>
							</div>
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