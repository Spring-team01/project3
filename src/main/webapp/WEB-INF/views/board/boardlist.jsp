<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:setBundle basename="i18n/board"/>
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>

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

  
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp" />


<div class="main">
    <div class="wrapper">
        <div class="section">
            <div class="top_navbar">
                <div class="hamburger">
                    <a href="#">
                        <i class="fa-solid fa-bars"></i>
                    </a>
                </div>
            </div>
     		<div class="mainview d-flex">
           
            </div>
              <div class="container">
      				
					${message}
					<div class="board_content">
						<form class="d-flex align-items-center" action="<c:url value='/board/search'/>" method="get">
							<div class="pull-right" style="margin-bottom: 5px;">
								<div class="col-xs-9">
									<input type="text" name="keyword" class="form-control">
								</div>
							</div>	
							<input type="submit" class="btn btn-warning btn-sm m-1" value="<fmt:message key="SEARCH"/>">
						</form>
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<td><fmt:message key="BOARD_ID"/></td>
									<td class="pc"><fmt:message key="WRITER"/></td>
									<td><fmt:message key="SUBJECT"/></td>
									<td class="pc"><fmt:message key="WRITE_DATE"/></td>
									<td class="pc"><fmt:message key="READ_COUNT"/></td>
								</tr>
							</thead>
							<c:set var="seq" value="${(page-1)*10}" scope="page"/>
							<c:forEach var="board" items="${boardList}">
								<tr>
									<c:set var="seq" value="${seq+1}" scope="page"/>
									<td>${board.boardId}</td>
									<td class="pc">${board.writer}</td>
									<td>
										<a href='<c:url value="board/${board.boardId}"/>'>${board.title}</a>
									</td>
									<td class="pc"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></td>
									<td class="pc">${board.readCount}</td>
								</tr>
							</c:forEach>
						</table>
						<!--템플릿  -->
						<div class="container-fluid py-4">
					      <div class="row">
					        <div class="col-12">
					          <div class="card my-4">
					            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
					              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
					                <h6 class="text-white text-capitalize ps-3">Authors table</h6>
					              </div>
					            </div>
					            <div class="card-body px-0 pb-2">
					              <div class="table-responsive p-0">
					                <table class="table align-items-center mb-0">
					                  <thead>
					                    <tr>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Author</th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Function</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
					                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Employed</th>
					                      <th class="text-secondary opacity-7"></th>
					                    </tr>
					                  </thead>
					                  <tbody>
					                    <tr>
					                      <td>
					                        <div class="d-flex px-2 py-1">
					                          <div>
					                            <img src="../assets/img/team-2.jpg" class="avatar avatar-sm me-3 border-radius-lg" alt="user1">
					                          </div>
					                          <div class="d-flex flex-column justify-content-center">
					                            <h6 class="mb-0 text-sm">John Michael</h6>
					                            <p class="text-xs text-secondary mb-0">john@creative-tim.com</p>
					                          </div>
					                        </div>
					                      </td>
					                      <td>
					                        <p class="text-xs font-weight-bold mb-0">Manager</p>
					                        <p class="text-xs text-secondary mb-0">Organization</p>
					                      </td>
					                      <td class="align-middle text-center text-sm">
					                        <span class="badge badge-sm bg-gradient-success">Online</span>
					                      </td>
					                      <td class="align-middle text-center">
					                        <span class="text-secondary text-xs font-weight-bold">23/04/18</span>
					                      </td>
					                      <td class="align-middle">
					                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
					                          Edit
					                        </a>
					                      </td>
					                    </tr>
					                  </tbody>
					                </table>
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					      <div class="row">
					        <div class="col-12">
					          <div class="card my-4">
					            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
					              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
					                <h6 class="text-white text-capitalize ps-3">Projects table</h6>
					              </div>
					            </div>
					            <div class="card-body px-0 pb-2">
					              <div class="table-responsive p-0">
					                <table class="table align-items-center justify-content-center mb-0">
					                  <thead>
					                    <tr>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Project</th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Budget</th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Status</th>
					                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder text-center opacity-7 ps-2">Completion</th>
					                      <th></th>
					                    </tr>
					                  </thead>
					                  <tbody>
					                    <tr>
					                      <td>
					                        <div class="d-flex px-2">
					                          <div>
					                            <img src="../assets/img/small-logos/logo-asana.svg" class="avatar avatar-sm rounded-circle me-2" alt="spotify">
					                          </div>
					                          <div class="my-auto">
					                            <h6 class="mb-0 text-sm">Asana</h6>
					                          </div>
					                        </div>
					                      </td>
					                      <td>
					                        <p class="text-sm font-weight-bold mb-0">$2,500</p>
					                      </td>
					                      <td>
					                        <span class="text-xs font-weight-bold">working</span>
					                      </td>
					                      <td class="align-middle text-center">
					                        <div class="d-flex align-items-center justify-content-center">
					                          <span class="me-2 text-xs font-weight-bold">60%</span>
					                          <div>
					                            <div class="progress">
					                              <div class="progress-bar bg-gradient-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
					                            </div>
					                          </div>
					                        </div>
					                      </td>
					                      <td class="align-middle">
					                        <button class="btn btn-link text-secondary mb-0">
					                          <i class="fa fa-ellipsis-v text-xs"></i>
					                        </button>
					                      </td>
					                    </tr>
					                    
					                  </tbody>
					                </table>
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					      
					      <!-- 템플릿 끝! -->
						<table class="table">
							<tr>
								<td align="left">
									
								</td>
								<td align="right">
									<a href='<c:url value="/board/write/${categoryId}"/>'>
									<button><fmt:message key="WRITE_NEW_ARTICLE"/>
									</button>
									</a>
								</td>
							</tr>
						</table>
					</div>
	    		</div>
	        </div>
        </div>
 <jsp:include page="/WEB-INF/views/include/sidebar.jsp" />       
    </div>
    </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>