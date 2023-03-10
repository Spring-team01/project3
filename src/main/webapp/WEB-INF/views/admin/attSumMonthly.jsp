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
                                    <h6 class="text-white text-capitalize ps-3">${subjectName} 학생 월별 근태 조회</h6>
                                 </div>
                              </div>
                              <div class="card-body px-0 pb-2">
                                 
                                 <div class="table-responsive px-5 text-center">
                                    <table
                                       class="table align-items-center justify-content-center mb-0">
                                       <thead class="table-dark">
                                          <tr>
                                             <td><b>이름</b></td>
                                             <td><b>지각</b></td>
                                             <td><b>결근</b></td>
                                             <td><b>휴가</b></td>
                                          </tr>
                                       </thead>
                                       <tbody >
                                       <c:forEach var="sumMonthlyVo" items="${sumMonthlyVo}">
                                          <tr>
                                             <td>${sumMonthlyVo.userName}</td>
                                            
                                             <td  <c:if test="${sumMonthlyVo.lateSum>0}">class="text-warning font-weight-bold"</c:if>>${sumMonthlyVo.lateSum}회</td>
                                             <td  <c:if test="${sumMonthlyVo.absenceSum>0}">class="text-danger font-weight-bold"</c:if>>${sumMonthlyVo.absenceSum}회</td>
                                             <td  <c:if test="${sumMonthlyVo.leaveSum>0}">class="text-info font-weight-bold"</c:if>>${sumMonthlyVo.leaveSum}회</td>
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