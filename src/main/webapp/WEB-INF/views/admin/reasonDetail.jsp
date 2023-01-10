<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminstaticFiles.jsp" />

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
</head>

<body>
<jsp:include page="/WEB-INF/views/include/adminheader.jsp" />


<div class="main">
	<div class="wrapper">
		<div class="section">
			<div class="top_navbar">
				<div class="hamburger">
					<a href="#">
						<i class="fa-solid fa-bars"></i>
					</a>
				</div>
			</div>
			<div class="mainview d-flex">
			</div>
			<div class="container-fluid" style="background-color:white; margin:50px; width:92%; min-height: 600px;">
				<div class="container-fluid py-4">
					<div class="board_content">
						<div class="pg-opt">
							<div class="row">
								<div class="col-md-6 pc">
									<h2>${subAttendance.subAttendanceTitle}</h2>
								</div>
					            <div class="col-md-6">
					                <ol class="breadcrumb">
					                	<li>글 번호 : </li>
					                    <li>${subAttendance.subAttNo}</li>
					                </ol>
					            </div>
					        </div>
					    </div>
				<div class="content">
					<table class="table table-bordered">
						<tr>
							<td width="20%">휴가 종류</td>
							<td>
								${subAttendance.subStatus}
							</td>
						</tr>
						<tr>
							<td width="20%">휴가 날짜</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${subAttendance.subAttTime}"/>
							</td>
						</tr>
						<tr>
							<td width="20%">휴가 시간</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${subAttendance.subAttTime}"/>
								~
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${subAttendance.subleaveTime}"/>
							</td>
						</tr>
						<tr>
							<td width="20%">작성일</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${subAttendance.subAttDate}"/>
							</td>
						</tr>
						<tr>
							<td width="20%">제목</td>
							<td>
								${subAttendance.subAttendanceTitle}
							</td>
						</tr>
						<tr>
							<td width="20%">내용</td>
							<td>
								${subAttendance.content}
							</td>
						</tr>
						<tr>
							<td width="20%">승인 결과</td>
							<td>
								${subAttendance.result}
							</td>
						</tr>	
						<c:if test="${subAttendance.fileId != 0}">
							<tr>
								<td>파일</td>
								<td>
									<c:set var="len" value="${fn:length(subAttendance.fileName)}"/>
									<c:set var="filetype" value="${fn:toUpperCase(fn:substring(subAttendance.fileName, len-4, len))}"/>
									<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
										<img src='<c:url value="/SubAttendanceFile/${subAttendance.fileId}"/>' class="img-thumbnail"><br>
									</c:if>
									<a href='<c:url value="/SubAttendanceFile/${subAttendance.fileId}"/>'>
										${subAttendance.fileName} (<fmt:formatNumber>${subAttendance.fileSize}</fmt:formatNumber>byte)
									</a>
								</td>
							</tr>
						</c:if>
						<tr>
							<td colspan=2 align="center">
								
								<c:if test="${subAttendance.result == '미처리'}">
									<a href='<c:url value="/subattendance/update/${subAttendance.subAttNo}/${subAttendance.fileId}"/>'><button type="button" class="btn btn-info">승인</button></a>
								</c:if>
								<a href='<c:url value=""/>'><button type="button" class="btn btn-danger">반려</button></a>
							</td>
						</tr>
						</table>
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