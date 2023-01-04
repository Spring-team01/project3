<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
      				<div class="container-fluid">
						<div class="row">
							<div class="row-lg-3">
							각자 작성할 부분
							</div>
							<div class="row-lg-9">
							<jsp:include page="/WEB-INF/views/calendar.jsp" />
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
