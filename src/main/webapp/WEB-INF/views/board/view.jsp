<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
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

  
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />


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
              <div class="container-fluid" style="background-color:white; margin:50px; width:92%;">
				${message}
				<div class="container-fluid py-4">
					<div class="board_content">
						<form class="form-inline m-2 justify-content-end" action="<c:url value='/board/search'/>" method="get">
							<input type="text" name="keyword" class="form-control" placeholder="Search" style="border: 1px solid gray; width:200px; height:35px; padding:0px 10px;">
							<input type="submit" class="btn btn-warning m-1" value="<fmt:message key="SEARCH"/>">
						</form>
					    <div class="pg-opt">
					        <div class="row">
					            <div class="col-md-6 pc">
					                <h2><fmt:message key="CONTENT"/></h2>
					            </div>
					            <div class="col-md-6">
					                <ol class="breadcrumb">
					                    <li><fmt:message key="BOARD"/></li>
					                    <li class="active"><fmt:message key="CONTENT"/></li>
					                </ol>
					            </div>
					        </div>
					    </div>
				<div class="content">
					<table class="table table-bordered">
						<tr>
							<td width="20%"><fmt:message key="BOARD_ID"/></td>
							<td>${board.boardId}</td>
						</tr>
						<tr>
							<td width="20%"><fmt:message key="WRITER"/></td>
							<td>${board.writer}</td>
						</tr>
						<tr>
							<td width="20%"><fmt:message key="WRITE_DATE"/></td>
							<td><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<td><fmt:message key="SUBJECT"/> </td>
							<td>${board.title}</td>
						</tr>
						<tr>
							<td><fmt:message key="CONTENT"/></td>
							<td class="board_content">${board.content}</td>
						</tr>
						<c:if test="${!empty board.BFileName}">
						<tr>
							<td><fmt:message key="FILE"/></td>
							<td>
							<c:set var="len" value="${fn:length(board.BFileName)}"/>
							<c:set var="filetype" value="${fn:toUpperCase(fn:substring(board.BFileName, len-4, len))}"/>
							<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}"><img src='<c:url value="/file/${board.BFileId}"/>' class="img-thumbnail"><br></c:if>
							<a href='<c:url value="/file/${board.BFileId}"/>'>${board.BFileName} (<fmt:formatNumber>${board.BFileSize}</fmt:formatNumber>byte)</a>
							</td>
						</tr>
						</c:if>
						<tr>
							<td colspan=2 align="right">
							<a href='<c:url value="/board/cat/${categoryId}/${page}"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
							<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
							<a href='<c:url value="/board/reply/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="REPLY"/></button></a>
							<a href='<c:url value="/board/update/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="UPDATE"/></button></a>
							<a href='<c:url value="/board/delete/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="DELETE"/></button></a>
							</td>
						</tr>
						</table>
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