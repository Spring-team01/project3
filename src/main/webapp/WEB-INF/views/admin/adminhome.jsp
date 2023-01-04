<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/adminstaticFiles.jsp" />

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
				<div class="welcome1 d-flex align-items-center">
					<div class="profile p-2 m-5">
						<img
							src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg"
							alt="profile_picture">
					</div>
					<div class="p-2 m-4" id="userInfo">
						<h1>이연희 관리자님</h1>
						<p>경영학과 2학년 1학기</p>
					</div>
				</div>
				<div class="container-fluid"
					style="background-color: white; margin: 50px; width: 92%;">
					<div>각자 작성할 부분</div>
					<div class="row-lg-9">
						<jsp:include page="/WEB-INF/views/admin/alist.jsp" />
					</div>

				</div>
			</div>

			<jsp:include page="/WEB-INF/views/include/adminsidebar.jsp" />
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>