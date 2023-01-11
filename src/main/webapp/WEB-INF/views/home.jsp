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
				<div class="container-fluid" style="background-color:white; margin:20px; width:95%; min-height: 800px;">
				<div class="container-fluid py-4">
			      <div class="row">
			        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4 ">
			          <div class="card ">
			            <div class="card-header bg-gradient-info p-1">
			              <div class="text-end d-flex">
			              	<h6 class="text-sm m-1" style="color:#f0f0f0">학과 공지</h6>
			              	<p class="text-sm m-1 ms-auto" style="color:#f0f0f0">2023.01.10</p>
			              </div>
			            </div>
			            <div class="card-footer p-2 mx-1">
			            <div>
				            <h5 id="cardNewsHead" class="mb-0">2023.01.10일자 점검 완료 </h5>
			            </div>
			            	<h6 id="cardNewsbody">오늘의 공지사항입니다. 점검이 이르게 종료되었습니다. 그래서 반차를 씁니다. 감사합니다.</h6>
			            	<hr class="dark horizontal my-0">
			              	<p class="mb-0 mx-1 text-right"><span class="text-success text-sm font-weight-bolder"> >더보기 </span></p>
			            </div>
			          </div>
			        </div>
			        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4 ">
			          <div class="card ">
			            <div class="card-header bg-gradient-info p-1">
			              <div class="text-end d-flex">
			              	<h6 class="text-sm m-1" style="color:#f0f0f0">학과 공지</h6>
			              	<p class="text-sm m-1 ms-auto" style="color:#f0f0f0">2023.01.10</p>
			              </div>
			            </div>
			            <div class="card-footer p-2 mx-1">
			            <div>
				            <h5 id="cardNewsHead" class="mb-0">2023.01.10일자 점검 완료 </h5>
			            </div>
			            	<h6 id="cardNewsbody">오늘의 공지사항입니다. 점검이 이르게 종료되었습니다. 그래서 반차를 씁니다. 감사합니다.</h6>
			            	<hr class="dark horizontal my-0">
			              	<p class="mb-0 mx-1 text-right"><span class="text-success text-sm font-weight-bolder"> >더보기 </span></p>
			            </div>
			          </div>
			        </div>
			        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4 ">
			          <div class="card ">
			            <div class="card-header bg-gradient-info p-1">
			              <div class="text-end d-flex">
			              	<h6 class="text-sm m-1" style="color:#f0f0f0">학과 공지</h6>
			              	<p class="text-sm m-1 ms-auto" style="color:#f0f0f0">2023.01.10</p>
			              </div>
			            </div>
			            <div class="card-footer p-2 mx-1">
			            <div>
				            <h5 id="cardNewsHead" class="mb-0">2023.01.10일자 점검 완료 </h5>
			            </div>
			            	<h6 id="cardNewsbody">오늘의 공지사항입니다. 점검이 이르게 종료되었습니다. 그래서 반차를 씁니다. 감사합니다.</h6>
			            	<hr class="dark horizontal my-0">
			              	<p class="mb-0 mx-1 text-right"><span class="text-success text-sm font-weight-bolder"> >더보기 </span></p>
			            </div>
			          </div>
			        </div>
			        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4 ">
			          <div class="card ">
			            <div class="card-header bg-gradient-info p-1">
			              <div class="text-end d-flex">
			              	<h6 class="text-sm m-1" style="color:#f0f0f0">학과 공지</h6>
			              	<p class="text-sm m-1 ms-auto" style="color:#f0f0f0">2023.01.10</p>
			              </div>
			            </div>
			            <div class="card-footer p-2 mx-1">
			            <div>
				            <h5 id="cardNewsHead" class="mb-0">2023.01.10일자 점검 완료 </h5>
			            </div>
			            	<h6 id="cardNewsbody">오늘의 공지사항입니다. 점검이 이르게 종료되었습니다. 그래서 반차를 씁니다. 감사합니다.</h6>
			            	<hr class="dark horizontal my-0">
			              	<p class="mb-0 mx-1 text-right"><span class="text-success text-sm font-weight-bolder"> >더보기 </span></p>
			            </div>
			          </div>
			        </div>
			        </div>
			        </div>
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