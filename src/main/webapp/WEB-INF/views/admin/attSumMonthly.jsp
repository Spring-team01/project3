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
                        <div class="form-inline m-2 justify-content-start "> 
                           <button onclick = "location.href = '<c:url value='/admin/attsummary/1'/>'" class="badge badge-sm bg-gradient-success">c언어</button>
                           <button onclick = "location.href = '<c:url value='/admin/attsummary/2'/>'" class="badge badge-sm bg-gradient-danger">python</button>
                           <button onclick = "location.href = '<c:url value='/admin/attsummary/3'/>'" class="badge badge-sm bg-gradient-info">java</button>
                           </div>
                        <div class="col-12">

                           <div class="card my-4">
                              <div
                                 class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                 <div
                                    class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
                                    <h6 class="text-white text-capitalize ps-3">월별 요약</h6>
                                 </div>
                              </div>
                              <div class="card-body px-0 pb-2">
                                 <div class="table-responsive p-0">
                                    <table
                                       class="table align-items-center justify-content-center mb-0">
                                       <thead>
                                          <tr>
                                             <td>출근</td>
                                             <td>지각</td>
                                             <td>결근</td>
                                             <td>휴가</td>
                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>${attSummaryVo.attendanceSum}</td>
                                             <td>${attSummaryVo.lateSum}</td>
                                             <td>${attSummaryVo.absenceSum}</td>
                                             <td>${attSummaryVo.leaveSum}</td>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </div>

                           </div>
                           <div class="m-2" style="height: 50px"></div>
                           <div class="card my-4">
                              <div
                                 class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                 <div
                                    class="bg-gradient-info shadow-success border-radius-lg pt-4 pb-3">
                                    <h6 class="text-white text-capitalize ps-3">학생 근태 조회</h6>
                                 </div>
                              </div>
                              <div class="card-body px-0 pb-2">
                                 <div class="table-responsive p-0">
                                    <table
                                       class="table align-items-center justify-content-center mb-0">
                                       <thead>
                                          <tr>
                                             <td>이름</td>
                                             <td>지각</td>
                                             <td>결근</td>
                                             <td>휴가</td>
                                             <td>과목</td>

                                          </tr>
                                       </thead>
                                       <tbody>
                                          <tr>
                                             <td>이연희</td>
                                             <td>0</td>
                                             <td>0</td>
                                             <td>0</td>
                                             <td>c언어</td>

                                          </tr>
                                          <tr>
                                             <td>김태희</td>
                                             <td>0</td>
                                             <td>0</td>
                                             <td>0</td>
                                             <td>c언어</td>

                                          </tr>
                                          <tr>
                                             <td>이예승</td>
                                             <td>0</td>
                                             <td>0</td>
                                             <td>0</td>
                                             <td>c언어</td>

                                          </tr>
                                          <tr>
                                             <td>강지성</td>
                                             <td>0</td>
                                             <td>0</td>
                                             <td>0</td>
                                             <td>c언어</td>

                                          </tr>

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