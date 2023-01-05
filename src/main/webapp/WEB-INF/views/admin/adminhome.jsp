<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
					style="background-color: white; margin: 50px; width: 92%; min-height: 600px;">

					<div class="row-lg-9">
						<div class="container-fluid py-4">
							<div class="row">
								<div class="col-12">

									<div class="card my-4">
										<div
											class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
											<div
												class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
												<h6 class="text-white text-capitalize ps-3">일별 요약</h6>
											</div>
										</div>
										<div class="card-body px-0 pb-2">
											<div class="table-responsive p-0">
												<table
													class="table align-items-center justify-content-center mb-0">
													<thead>
														<tr>
															<td>과목</td>
															<td>출석</td>
															<td>지각</td>
															<td>결석</td>
															<td>미처리</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>c언어</td>
															<td>20</td>
															<td>0</td>
															<td>0</td>
															<td>4</td>
														</tr>
														<tr>
															<td>python</td>
															<td>20</td>
															<td>0</td>
															<td>0</td>
															<td>4</td>
														</tr>
														<tr>
															<td>java</td>
															<td>20</td>
															<td>0</td>
															<td>0</td>
															<td>4</td>
														</tr>

													</tbody>
												</table>
											</div>
										</div>

									</div>
									<div class="m-2" style="height: 100px"></div>
									<div class="card my-4">
										<div
											class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
											<div
												class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
												<h6 class="text-white text-capitalize ps-3">휴가 신청 목록</h6>
											</div>
										</div>
										<div class="card-body px-0 pb-2">
											<div class="table-responsive p-0">
												<table
													class="table align-items-center justify-content-center mb-0">
													<thead>
														<tr>
															<td>이름</td>
															<td>학번</td>
															<td>학년</td>
															<td>과목</td>

														</tr>
													</thead>
													<tbody>
														<tr>
															<td>이연희</td>
															<td>2016680001</td>
															<td>4</td>
															<td>c언어</td>

														</tr>
														<tr>
															<td>김태희</td>
															<td>2016680003</td>
															<td>4</td>
															<td>java</td>

														</tr>
														<tr>
															<td>김희률</td>
															<td>2016680004</td>
															<td>4</td>
															<td>c언어</td>

														</tr>
														<tr>
															<td>강지성</td>
															<td>2016680007</td>
															<td>4</td>
															<td>java</td>

														</tr>

													</tbody>
												</table>
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