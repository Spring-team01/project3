<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/header" />

<div class="header" id="header-bar">
	<div class="row">
		<div class="col-1">
			<div id="image-box">
				<img id="image-content"
					src="<c:url value="/static/images/univlogo.png"/>" />
			</div>
		</div>
		<div class="col-3">
			<div id="name-box">
				<img id="name-content"
					src="<c:url value="/static/images/univname.png"/>" />
			</div>
		</div>
		<div class="col-3" id="clock-box">
			<div class="clock-sub-box">
				<span id="date" class="date"></span><span id="time" class="time"></span>
			</div>
			
		</div>
	</div>
	<div id="black-bar"></div>
</div>
