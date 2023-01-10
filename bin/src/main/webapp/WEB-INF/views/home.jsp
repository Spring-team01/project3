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
           
            
            <div class="welcome d-flex align-items-center">
     			<div class="profile px-5 m-5" >
                	<img src="<c:url value="/static/images/profile2.jpeg"/>" alt="profile_picture">
                </div>
                <div class="p-2 m-4 align-self-center"id="userInfo">
                	<h1>${userName}님 환영합니다.</h1>
                	<p>${major} ${grade}학년  <a href="/user/update"><i class="material-icons">settings</i></a> </p>
                </div>
     		</div>
     		<div class="mainview d-flex">
           	 welcome 필요없는 사람은 이거 살리고 Welcome은 지우기 
            </div>
               <div class="container-fluid" style="background-color:white; margin:50px; width:92%; min-height: 600px;">
					<div>
					각자 작성할 부분
					</div>
					<div class="row-lg-9">
					<jsp:include page="/WEB-INF/views/calendar.jsp" />
					</div>
	    		</div>
	        </div>
        
 <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />       
    </div>
    </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>