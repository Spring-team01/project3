<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:forEach var="articleOne" items="${boardMiniList}">
	<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4 ">
   <div class="card ">
     <div class="card-header bg-gradient-info p-1">
       <div class="text-end d-flex">
       	<h6 class="text-sm m-1" style="color:#f0f0f0">학과 공지</h6>
       	<p class="text-sm m-1 ms-auto" style="color:#f0f0f0"><fmt:formatDate value="${articleOne.writeDate}" pattern="YYYY-MM-DD"></fmt:formatDate></p>
       </div>
     </div>
     <div class="card-footer p-2 mx-1">
     <div>
      <h5 id="cardNewsHead" class="mb-0">${articleOne.title}</h5>
     </div>
     	<h6 id="cardNewsbody">${articleOne.content}</h6>
     	<hr class="dark horizontal my-0">
       	<a class="mb-0 mx-1 text-right" href="/myapp/board/view/${articleOne.boardId}/1"><span class="text-success text-sm font-weight-bolder"> >더보기 </span></a>
     </div>
   </div>
 </div>
</c:forEach>

