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
              <div class="container-fluid" style="background-color:white; margin:50px; width:92%; min-height: 600px;">
      				
					${message}
					<div class="pg-opt">
			        <div class="row">
			            <div class="col-md-6 pc">
			                <h2><fmt:message key="DELETE_ARTICLE"/></h2>
			            </div>
			            <div class="col-md-6">
			                <ol class="breadcrumb">
			                    <li><fmt:message key="BOARD"/></li>
			                    <li class="active"><fmt:message key="DELETE_ARTICLE"/></li>
			                </ol>
			            </div>
			        </div>
			    </div>
				<div class="content">
					<h3><fmt:message key="DELETE_MSG"/></h3>
						<form action='<c:url value="/board/delete"/>' class="form-inline" method="post">
							<input type="hidden" name="boardId" value="${boardId}">
							<%-- <input type="hidden" name="replyNumber" value="${replyNumber}"> --%>
							<input type="hidden" name="categoryId" value="${categoryId}">
							<div class="form-group">
							<div class="col-sm-8">
							<input type="password" name="password" class="form-control" required>
							</div>
							<div class="col-sm-2">
							<input type="submit" class="btn btn-danger" value="<fmt:message key="DELETE_ARTICLE"/>">
							</div>
							</div>
						</form>
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