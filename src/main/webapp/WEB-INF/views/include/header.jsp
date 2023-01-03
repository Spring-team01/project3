<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/header"/>

<div class="header" id="header-bar">
	<div class="row" >
		<div class="col-1">
			<div id="image-box">
				<img id="image-content" src="<c:url value="/static/images/univlogo.png"/>"/>
			</div>
		</div>
		<div class="col-2" id="title">
			<h3> 한국대학교 LMS </h3>
		</div>
		<div class="col-9" id="button-box">
			<div class="button-sub-box">
				<button class="btn btn-lg btn-dark mt-4">
					출근
				</button>
			</div>
			<div class="time-sub-box">
				<a class="time-text">
					-- : -- : --
				</a>
			</div>
			<div class="button-sub-box">
				<button class="btn btn-lg btn-dark mt-4">
					퇴근
				</button>
			</div>
			<div class="time-sub-box">
				<a class="time-text">
					-- : -- : --
				</a>
			</div>
		</div>
	</div>
	<div id="black-bar">
		
	</div>
</div>
