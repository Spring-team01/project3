<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="sidebar">
            <ul>
                <li>
                    <a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="#">Link 1</a>
					    <a href="#">Link 2</a>
					    <a href="#">Link 3</a>
                    </div>
                </li>
                <li>
               		<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">출결관리</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="#">출결 확인</a>
					    <a href="#">공결 관리</a>
                    </div>
                </li>
                <li>
                	<a href="boardlist" type="button" class="dropdown-btn" >
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">강의게시판</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="board/cat/1">공지사항</a>
					    <a href="board/cat/2">강의게시판</a>
					    <a href="board/cat/3">과제제출</a>
					    <a href="board/cat/4">질문게시판</a>
                    </div>
                </li>
                <li>
                	<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">커뮤니티</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="community/communityList/1">커뮤니티 게시판</a>
					    <a href="community/write/1">글 작성</a>
					    <a href="community/write/3">Link 3</a>
                    </div>
                </li>
                
            </ul>
        </div>