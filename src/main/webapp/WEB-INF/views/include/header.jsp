<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/header"/>

<script type="text/javascript">
	var message = "<c:out value='${message}'/>";
	if(message) {
		$(window).on('load',function(){
			$('#modal').modal('show');
		});
	}
</script>

<div id="modal" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" style="color: #000;">Error message</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>${message}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<div class="header" id="header-bar">
	<div class="row" >
		<div class="col-1">
			<div id="image-box">
			<a href="<c:url value="/home"/>">
				<img id="image-content" src="<c:url value="/static/images/univlogo.png"/>"/>
			</a>
			</div>
		</div>
		<div class="col-3">
			<div id="name-box">
				<img id="name-content" src="<c:url value="/static/images/univname.png"/>"/>
			</div>
		</div>
		<div class="col-3" id="clock-box">
		<div class="clock-sub-box">
		<span id="date" class="date"></span><span id="time" class="time"></span>
		</div>
		</div>
		<div class="col-5" id="button-box">
			<div class="button-sub-box">
				<form action="<c:url value='/attendance'/>" method="post" enctype="multipart/form-data">
					<button class="btn btn-lg btn-dark mt-4" style="white-space:nowrap;">
						출근
					</button>
				</form>
			</div>
			<div class="time-sub-box">
				<p class="time-text">
					<c:if test="${attTime == null}">
						-- : -- : --
					</c:if>
					<c:if test="${attTime != null}">
						${attTime}
					</c:if>
				</p>
			</div>
			<div class="button-sub-box">
				<form action="<c:url value='/leave'/>" method="post" enctype="multipart/form-data">
					<button class="btn btn-lg btn-dark mt-4" style="white-space:nowrap;">
						퇴근
					</button>
				</form>
			</div>
			<div class="time-sub-box">
				<p class="time-text">
					<c:if test="${leaveTime == null}">
						-- : -- : --
					</c:if>
					<c:if test="${leaveTime != null}">
						${leaveTime}
					</c:if>
				</p>
			</div>
		</div>
	</div>
	<div id="black-bar">
		
	</div>
</div>
