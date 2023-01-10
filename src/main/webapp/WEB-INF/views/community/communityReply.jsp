<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<!-- Nucleo Icons -->
<link href="<c:url value="/static/css/nucleo-icons.css"/>" rel="stylesheet" />
<link href="<c:url value="/static/css/nucleo-svg.css"/>" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<!-- CSS Files -->
<link id="pagestyle" href="<c:url value="/static/css/material-dashboard.css"/>" rel='stylesheet' />

<script>
	function moreContent(id, cnt){
		var list_length =$("#"+id+" tr").length -1;
		var aname = id+"_btn";
		var callLength = list_length;
		
		$("#startCount").val(callLength);
		$("#vieCount").val(cnt);
		
		$.ajax({
			type : "post",
			url : "/getMoreContents_ajax.do",
			data : $("#searchTxtForm").serialize(),
			dataType : "josn",
			success : function(result){
				if(result.resultCnt > 0) {
					var list = result.resultList;
					if(resultVO.title != '') {
						$('#' + aname).attr('href',"javascript:moreContent('"+ id + "', "+cnt+");");
						getMoreList(list);
					} else {
						$("#"+id+"_div").remove();
					}
				} else {
					
				}
			} , 
			error : function (request, status, error) {
				alert("code = " + request.status + " messgae = " + request.responseText + "error = " + error);
			}
		});
		
		
		
	}
</script>


<body>
	<!-- Comments section-->
	<section class="mb-5">
		<div class="card bg-light">
			<div class="card-body">
				
				<!-- Comment with nested comments-->
				<div class="d-flex mb-4">
					<!-- Parent comment-->
					<div class="flex-shrink-0">
						<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
					</div>
					<div class="ms-3">
						<div class="fw-bold">Commenter Name</div>
						If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
						<!-- Child comment 1-->
					</div>
				</div>
				<!-- Comment form-->
				<form class="mb-4">
					<textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
				</form>
			</div>
		</div>
	</section>
</body>