<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/header" />


<div class="header" id="header-bar">
	<div class="d-flex justify-content-between align-items-center" >
		<div>
			<div class="ml-4">
			<a href="<c:url value="/home"/>">
				<img id="logo" src="<c:url value="/static/images/univLogoFinal.png"/>"/>
			</a>
			</div>
		</div>
		<div id="clock-box">
			<div class="clock-sub-box">
			<span id="date" class="date"></span><span id="time" class="time"></span>
			</div>
		</div>
	</div>
	<div class="shadow"id="black-bar">
	</div>
</div>
