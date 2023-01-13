<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="sidebar">
            <ul>
            <c:if test="${sessionScope.userType eq 'ADMIN'}">
            	<li>
                    <a href="<c:url value='/admin/adminhome'/>" type="button" class="homebtn">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">관리자페이지</span>
                    </a>
                    
                </li>
                <li>
                    <a href="<c:url value='/report/list'/>" type="button" class="homebtn">
                        <span class="icon"><i class="fa fa-exclamation-triangle"></i></i></span>
                        <span class="item">게시글 신고 목록</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${sessionScope.userType eq 'USER'}">
                <li>
                    <a href="<c:url value='/home'/>" type="button" class="homebtn">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                    
                </li>
             </c:if>
             <c:if test="${sessionScope.userType eq 'USER'}">
                <li>
               		<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">출결관리</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="<c:url value='/attendance/list'/>">출결 확인</a>
					    <a href="<c:url value='/subattendance/1'/>">공결 관리</a>
                    </div>
                </li>
                 </c:if>
                <li>
                	<a href="#" type="button" class="dropdown-btn" >
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">강의게시판</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="<c:url value='/boardlist/1'/>">전체강의게시판</a>
                    	<a href="<c:url value='/board/1/1'/>">공지사항</a>
					    <a href="<c:url value='/board/2/1'/>">강의게시판</a>
					  	<a href="<c:url value='/board/3/1'/>">과제제출</a>
					    <a href="<c:url value='/board/4/1'/>">질문게시판</a>
                    </div>
                </li>
                <li>
                	<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">커뮤니티</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="<c:url value='/community/communityList/1/1'/>">커뮤니티 게시판</a>
                    </div>
                </li>
                <li>
               		<a href="<c:url value='/user/logout'/>" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">로그아웃</span>
                    </a>
                </li>
                
            </ul>
        </div>
        
      <script type="text/javascript" src="<c:url value="/static/js/sidebar.js"/>"></script>
        