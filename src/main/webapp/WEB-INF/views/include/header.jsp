<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/header"/>

<div class="container-fluid" id="header-bar">
	<div class="row">
		<div class="col-1">
			<div id="image-box">
				<img id="image-content" src="<c:url value="/static/images/univlogo.png"/>"/>
			</div>
		</div>
		<div class="col-3">
			<div id="name-box">
				<img id="name-content" src="<c:url value="/static/images/univname.png"/>"/>
			</div>
		</div>
		<div class="col-3" id="clock-box">
			<div id="date" class="date"></div>
			<div id="time" class="time"></div>
		</div>
		<div class="col-5" id="button-box">
			<div class="button-sub-box">
				<form action="<c:url value='/attendance/list'/>" method="post" enctype="multipart/form-data">
					<button class="btn btn-lg btn-dark mt-4">
						출근
					</button>
				</form>
			</div>
			<div class="time-sub-box">
				<a class="time-text">
					-- : -- : --
				</a>
			</div>
			<div class="button-sub-box">
				<form action="<c:url value='/leave/list'/>" method="post" enctype="multipart/form-data">
					<button class="btn btn-lg btn-dark mt-4">
						퇴근
					</button>
				</form>
			</div>
			<div class="time-sub-box">
				<a class="time-text">
					-- : -- : --
				</a>
			</div>
		</div>
	</div>
</div>
<div id="black-bar">
		
</div>