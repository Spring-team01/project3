<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<!-- 마이페이지_사이드바 -->
			<div id="mypage_sidebar"  class="text-center">		
				 <div class="m-3">
					<i class="bi bi-person-circle"></i><span class="ml-2">${loginId} 님</span>
				</div>
				 <div class="" id="mypageDiv" style="height:45px; text-align:center; padding-top:10px; ">
					 <a class="h5" style="color: black; text-decoration: none;"><b>마이 페이지</b></a>
				 </div>
				<div id="mypage_sidemenu">
					 <a href="${pageContext.request.contextPath}/mypage/MainController?userId=${loginId}" class="list-group-item text-center h7">나의 정보</a>
					 <a href="${pageContext.request.contextPath}/mypage/MyOrderController" role="button" class="list-group-item text-center h7">주문 내역</a>
					 <a href="${pageContext.request.contextPath}/mypage/MyReviewController" role="button"  class="list-group-item text-center h7">나의 리뷰</a>
					 <a href="#" role="button"  class="list-group-item text-center h7">나의 QnA</a>
					 <a href="${pageContext.request.contextPath}/mypage/MyWithdrawController" class="list-group-item text-center h7">회원 탈퇴</a>
				 </div>
			</div>