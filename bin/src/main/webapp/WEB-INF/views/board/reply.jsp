<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<%-- <c:if test="${empty nestedCommentList}">
	<div id="noReplyDiv${commentOne.bcReplyNo}" style="display:block;  ">작성된 댓글이 없습니다!</div>
</c:if> --%>

<c:forEach var="reply" items="${nestedCommentList}">
	<div class="md-3 d-flex" >
	<div>${reply.bcContent}</div>
		 <span class="small text-success font-weight-bold">${reply.userId}&nbsp;&nbsp;</span>
         <span class="small text-muted"><fmt:formatDate value="${reply.bcWriteDate}" pattern="yyyy.MM.dd"/></span> 
	</div>
</c:forEach>

