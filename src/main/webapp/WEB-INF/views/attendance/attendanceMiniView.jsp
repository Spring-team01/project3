<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
	<div class="card my-4">
		<div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
			<div
				class="bg-gradient-success shadow-success border-radius-lg pt-4 pb-3">
				<h6 class="text-white text-capitalize ps-3">수업 출석 요약(${subjectName})</h6>
			</div>
		</div>
		<div class="card-body px-0 pb-2">
			<div class="table-responsive p-0">
				<table class="table align-items-center mb-0 text-center">
					<thead>
						<tr>
							<td>출석</td>
							<td>지각</td>
							<td>결석</td>
							<td>미처리</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${attendanceCount}</td>
							<td>${lateCount}</td>
							<td>${vacationCount}</td>
							<td>${AbsenteeismCount}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	
	</div>