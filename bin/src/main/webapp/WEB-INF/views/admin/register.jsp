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
<jsp:include page="/WEB-INF/views/include/colorlib2.jsp" />
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
				<div class="mainview d-flex "></div>
				<div class="container-fluid" 
					style="background-color: gray; margin:50px 200px; width: 70%; min-height: 600px;">
					<div class="card card-4">
						<div class="card-body">
							<h2 class="title">사용자 등록</h2>
							
							<form method="POST" action="<c:url value='/admin/file'/>" enctype="multipart/form-data">
								<!-- <div class="row row-space">
									<div class="col-6">
										<div class="input-group">
											<label class="label">학번</label> <input class="input--style-4"
												type="text" name="first_name">
										</div>
									</div>
									<div class="col-6">
										<div class="input-group">
											<label class="label">이름</label> <input class="input--style-4"
												type="text" name="last_name">
										</div>
									</div>
								</div>
								<div class="row row-space">
									<div class="col-6">
										<div class="input-group">
											<div>
												<label class="label">학년</label>
												<div
													class="p-t-10 rs-select2 js-select-simple select--no-search">
													<select name="subject">
														<option disabled="disabled" selected="selected">Choose
															option</option>
														<option>1학년</option>
														<option>2학년</option>
														<option>3학년</option>
														<option>4학년</option>
													</select>
													<div class="select-dropdown"></div>
												</div>
											</div>

										</div>
									</div>
									<div class="col-6">
										<div class="input-group">
											<div>
												<label class="label">과목</label>
												<div class="p-t-10">
													<label class="radio-container">c언어 <input
														type="radio" checked="checked" name="gender"> <span
														class="checkmark"></span>
													</label> <label class="radio-container">python <input
														type="radio" name="gender"> <span
														class="checkmark"></span>
													</label> <label class="radio-container">java <input
														type="radio" name="gender"> <span
														class="checkmark"></span>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row row-space">
									<div class="col-6">
										<div class="input-group">
											<label class="label">Email</label> <input
												class="input--style-4" type="email" name="email">
										</div>
									</div>
									<div class="col-6">
										<div class="input-group">
											<label class="label">Phone Number</label> <input
												class="input--style-4" type="text" name="phone">
										</div>
									</div>
								</div> -->

								<div class="row row-space">
									<div class="input-group">
										<div class="p-t-10">
											<label class="label" for="photo">학생 프로필 사진</label>
											<div class="p-t-10">
												<input type="file" id="i_file" name="file"><span
													id="droparea" class="help-block"><fmt:message
														key="FILESIZE_ERROR" /></span>
											</div>
										</div>
									</div>
								</div>
								<div class="p-t-15">
									<button class="btn btn--radius-2 btn--blue" type="submit">등록</button>
								</div>
							</form>
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