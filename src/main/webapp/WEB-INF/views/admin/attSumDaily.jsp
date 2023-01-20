<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/include/adminstaticFiles.jsp" />
<link id="pagestyle" href="<c:url value="/static/css/material-dashboard.css"/>" rel='stylesheet' />	
</head>

<body>
   <jsp:include page="/WEB-INF/views/include/adminheader.jsp" />
   <div class="main">
      <div class="wrapper">
         <div class="section">
            <div class="top_navbar">
               <div class="hamburger">
                  <a href="#"> <i class="fa-solid fa-bars"></i>
                  </a>
               </div>
            </div>
            <div class="mainview d-flex">
           
            </div>
            <div class="container-fluid"
               style="background-color: white; margin: 50px; width: 92%; min-height: 600px;">

               <div class="row-lg-9">
                  <div class="container-fluid py-4">
                     <div class="row">
                       
                        <div class="col-12">
                           <div class="card my-4">
                              <div
                                 class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                 <div
                                    class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
                                    <h6 class="text-white text-capitalize ps-3">${subjectName} 학생 일별 근태 조회</h6>
                                 </div>
                              </div>
                              <div class="card-body px-0 pb-2">
                                 <div class="table-responsive p-0">
                                    <table
                                       class="table align-items-center justify-content-center mb-0 text-center" >
                                       <thead>
                                          <tr class="table-dark">
                                             <td>이름</td>
                                             <td>IN</td>
                                             <td>OUT</td>
                                             <td>상태</td>

                                          </tr>
                                       </thead>
                                       <tbody>
                                       <c:forEach var="sumDailyVo" items="${sumDailyVo}">
                                          <tr>
                                             <td>${sumDailyVo.userName}</td>
                                             <td>
                                             <c:if test="${empty sumDailyVo.attTime}">-</c:if>
                                             ${sumDailyVo.attTime}</td>
                                             <td>
                                             	<c:if test="${empty sumDailyVo.leaveTime}">-</c:if>
                                             	${sumDailyVo.leaveTime}
                                             </td>
                                            	 <c:choose>
													<c:when test="${sumDailyVo.status eq '출근'}"><td class="text-success">${sumDailyVo.status}</td></c:when>
													<c:when test="${sumDailyVo.status eq '결근'}"><td class="text-danger">${sumDailyVo.status}</td></c:when>
													<c:when test="${sumDailyVo.status eq '지각'}"><td class="text-warning">${sumDailyVo.status}</td></c:when>
													<c:when test="${sumDailyVo.status eq '휴가'}"><td class="text-info">${sumDailyVo.status}</td></c:when>
													<c:when test="${sumDailyVo.status eq '미출근'}"><td class="text-dark">${sumDailyVo.status}</td></c:when>
													<c:when test="${sumDailyVo.status eq '미출석'}"><td class="text-dark">미출근</td></c:when>
												</c:choose>

                                          </tr>
                                          </c:forEach>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>

                           </div>


                        </div>
                     </div>

                  </div>
               </div>

            </div>
         </div>

         <jsp:include page="/WEB-INF/views/include/adminsidebar.jsp" />
      </div>
   </div>

   <jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>