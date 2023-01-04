<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
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
              <div class="container">
      				
					${message}
					<div class="board_content">
						<form class="d-flex align-items-center" action="<c:url value='/board/search'/>" method="get">
							<div class="pull-right" style="margin-bottom: 5px;">
								<div class="col-xs-9">
									<input type="text" name="keyword" class="form-control">
								</div>
							</div>	
							<input type="submit" class="btn btn-warning btn-sm m-1" value="<fmt:message key="SEARCH"/>">
						</form>
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<td><fmt:message key="BOARD_ID"/></td>
									<td class="pc"><fmt:message key="WRITER"/></td>
									<td><fmt:message key="SUBJECT"/></td>
									<td class="pc"><fmt:message key="WRITE_DATE"/></td>
									<td class="pc"><fmt:message key="READ_COUNT"/></td>
								</tr>
							</thead>
							<c:set var="seq" value="${(page-1)*10}" scope="page"/>
							<c:forEach var="board" items="${boardList}">
								<tr>
									<c:set var="seq" value="${seq+1}" scope="page"/>
									<td>${board.boardId}</td>
									<td class="pc">${board.writer}</td>
									<td>
										<a href='<c:url value="board/${board.boardId}"/>'>${board.title}</a>
									</td>
									<td class="pc"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></td>
									<td class="pc">${board.readCount}</td>
								</tr>
							</c:forEach>
						</table>
						<table class="table">
							<tr>
								<td align="left">
									
								</td>
								<td align="right">
									<a href='<c:url value="/board/write/${categoryId}"/>'>
									<button><fmt:message key="WRITE_NEW_ARTICLE"/>
									</button>
									</a>
								</td>
							</tr>
						</table>
					</div>
	    		</div>
	        </div>
        
 <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />       
    </div>
    </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>