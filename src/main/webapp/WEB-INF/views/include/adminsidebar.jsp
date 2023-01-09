<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>

<div class="sidebar">
            <ul>                
                <li>
               		<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">학생조회</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="<c:url value='/admin/userlist/1/1'/>">c언어</a>
					    <a href="<c:url value='/admin/userlist/2/1'/>">python</a>
					    <a href="<c:url value='/admin/userlist/3/1'/>">java</a>
                    </div>
                </li>
                <li>
                	<a href="#" type="button" class="dropdown-btn" >
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">휴가신청목록</span>
                        <i class="fa fa-caret-down"></i>
                    </a>    
                        <div class="dropdown-container">
                    	<a href="<c:url value='/admin/reasonlist/1/1'/>">미처리 목록</a>
					    <a href="<c:url value='/admin/reasonlist/2/1'/>">처리 목록</a>					   
                    </div>
                    
                  
                 
                </li>
                <li>
                	<a href="#" type="button" class="dropdown-btn" >
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">출석현황</span>
                        <i class="fa fa-caret-down"></i>
                    </a>    
                        <div class="dropdown-container">
                    	<a href="<c:url value='/admin/reasonlist/1/1'/>">월별</a>
					    <a href="<c:url value='/admin/reasonlist/2/1'/>">일별</a>					   
                    </div>
                    
                  
                 
                </li>
                 
                <li>
                	<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">게시판 관리</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="#">공지사항</a>
					    <a href="#">자유게시판</a>
					    <a href="#">자료실</a>
                    </div>
                </li>
                
            </ul>
        </div>