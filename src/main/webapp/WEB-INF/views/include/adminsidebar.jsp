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
                    	<a href="<c:url value='/admin/userList/1/1'/>">c언어</a>
					    <a href="#">python</a>
					    <a href="#">java</a>
                    </div>
                </li>
                <li>
                	<a href="<c:url value='/admin/register'/>" type="button" class="dropdown-btn" >
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">사용자 등록</span>
                    
                    </a>
                 
                </li>
                <li>
                	<a href="boardlist" type="button" class="dropdown-btn" >
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">휴가신청목록</span>
                    
                    </a>
                 
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