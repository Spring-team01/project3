<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminstaticFiles.jsp" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
body {
	background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}

.emp-profile {
	padding: 3%;
	margin-top: 3%;
	margin-bottom: 3%;
	border-radius: 0.5rem;
	background: #fff;
}

.profile-img {
	text-align: center;
}

.profile-img img {
	width: 70%;
	height: 100%;
}

.profile-img .file {
	position: relative;
	overflow: hidden;
	margin-top: -20%;
	width: 70%;
	border: none;
	border-radius: 0;
	font-size: 15px;
	background: #212529b8;
}

.profile-img .file input {
	position: absolute;
	opacity: 0;
	right: 0;
	top: 0;
}

.profile-head h5 {
	color: #333;
}

.profile-head h6 {
	color: #0062cc;
}

.profile-edit-btn {
	border: none;
	border-radius: 1.5rem;
	width: 70%;
	padding: 2%;
	font-weight: 600;
	color: #6c757d;
	cursor: pointer;
}

.proile-rating {
	font-size: 12px;
	color: #818182;
	margin-top: 5%;
}

.proile-rating span {
	color: #495057;
	font-size: 15px;
	font-weight: 600;
}

.profile-head .nav-tabs {
	margin-bottom: 5%;
}

.profile-head .nav-tabs .nav-link {
	font-weight: 600;
	border: none;
}

.profile-head .nav-tabs .nav-link.active {
	border: none;
	border-bottom: 2px solid #0062cc;
}

.profile-work {
	padding: 14%;
	margin-top: -15%;
}

.profile-work p {
	font-size: 12px;
	color: #818182;
	font-weight: 600;
	margin-top: 10%;
}

.profile-work a {
	text-decoration: none;
	color: #495057;
	font-weight: 600;
	font-size: 14px;
}

.profile-work ul {
	list-style: none;
}

.profile-tab label {
	font-weight: 600;
}

.profile-tab p {
	font-weight: 600;
	color: #0062cc;
}
</style>
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
				<div class="mainview d-flex"></div>

				<div class="container-fluid"
					style="background-color: white; margin: 50px; width: 92%; min-height: 600px;">
					<div class="container emp-profile">
						<form method="post">
							<div class="row">
								<div  class="col-md-4 align-self-center">
									<div class="profile-img ">
										<c:if test="${!empty user.boardFileName}">
						<tr>
							<td><fmt:message key="FILE"/></td>
							<td>
							<c:set var="len" value="${fn:length(board.boardFileName)}"/>
							<c:set var="filetype" value="${fn:toUpperCase(fn:substring(board.boardFileName, len-4, len))}"/>
							<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}"><img src='<c:url value="/boardfile/${board.boardFileId}"/>' class="img-thumbnail"><br></c:if>
							<a href='<c:url value="/boardfile/${board.boardFileId}"/>'>${board.boardFileName} (<fmt:formatNumber>${board.boardFileSize}</fmt:formatNumber>byte)</a>
							</td>
						</tr>
						</c:if>
									</div>
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-8">
											<div class="profile-head">
												<h5>${user.userName}</h5>
												<h6>${user.major}</h6>

												<ul class="nav nav-tabs" id="myTab" role="tablist">
													<li class="nav-item"><a class="nav-link active"
														id="home-tab" data-toggle="tab" href="#home" role="tab"
														aria-controls="home" aria-selected="true">About</a></li>
													<li class="nav-item"><a class="nav-link"
														id="profile-tab" data-toggle="tab" href="#profile"
														role="tab" aria-controls="profile" aria-selected="false">출결요약</a>
													</li>
												</ul>
											</div>
										</div>

										<div class="col-md-4">

											<input type="submit" class="profile-edit-btn"
												name="btnAddMore" value="Edit Profile" />
										</div>
									</div>
									<div class="row">
								
									<div class="tab-content profile-tab" id="myTabContent">
										<div class="tab-pane fade show active" id="home"
											role="tabpanel" aria-labelledby="home-tab">
											<div class="row">
												<div class="col-md-6">
													<label>학번</label>
												</div>
												<div class="col-md-6">
													<p>${user.userId}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>학년</label>
												</div>
												<div class="col-md-6">
													<p>${user.grade}학년</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>Email</label>
												</div>
												<div class="col-md-6">
													<p>${user.email}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>Phone</label>
												</div>
												<div class="col-md-6">
													<p>${user.phone}</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>수강과목</label>
												</div>
												<div class="col-md-6">
													<p>${user.subjectName}</p>
												</div>
											</div>
										</div>
										<div class="tab-pane fade" id="profile" role="tabpanel"
											aria-labelledby="profile-tab">
											<div class="row">
												<div class="col-md-6">
													<label>Experience</label>
												</div>
												<div class="col-md-6">
													<p>Expert</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>Hourly Rate</label>
												</div>
												<div class="col-md-6">
													<p>10$/hr</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>Total Projects</label>
												</div>
												<div class="col-md-6">
													<p>230</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>English Level</label>
												</div>
												<div class="col-md-6">
													<p>Expert</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<label>Availability</label>
												</div>
												<div class="col-md-6">
													<p>6 months</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<label>Your Bio</label><br />
													<p>Your detail description</p>
												</div>
											</div>
										</div>
									</div>
								
							</div>
								</div>



							</div>
							
						</form>
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