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
	function viewReplyComment() {

		$.ajax({
			url : "/myapp/community/example",
			type : "GET",
			datatype : "html",
			success : function(data) {
				$('#load').html(data);
			}
		});
	}
</script>


<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />


	<div class="main">
		<div class="wrapper">
			<div class="section">
				<div class="top_navbar">
					<div class="hamburger">
						<a href="#"> <i class="fa-solid fa-bars"></i>
						</a>
					</div>
				</div>
				<div class="mainview d-flex"></div>
				<div class="container-fluid" style="background-color: white; margin: 50px; width: 92%; min-height: 600px;">
					<div class="row">
						<!-- Post content-->
						<article>
							<!-- Post header-->
							<header class="mb-4">
								<!-- Post title-->
								<h1 class="fw-bolder mb-1">${community.communityTitle}</h1>
								<!-- Post meta content-->
								<div class="text-muted fst-italic mb-2">Posted on ${community.communityWriteDate}</div>
								<!-- Post categories-->
								<!-- <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
										<a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a> -->
							</header>
							<!-- Preview image figure-->
							<figure class="mb-4">
								<c:if test="${!empty community.communityFileName}">
									<tr>
										<td>
											<c:set var="len" value="${fn:length(community.communityFileName)}" />
											<c:set var="filetype" value="${fn:toUpperCase(fn:substring(community.communityFileName, len-4, len))}" />
											<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
												<img src='<c:url value="/files/${community.communityBoardId}"/>' class="img-fluid rounded">
												<br>
											</c:if>
											<a href='<c:url value="/files/${community.communityBoardId}"/>'>${community.communityFileName} </a>
										</td>
									</tr>
								</c:if>
								<p class="fs-5 mb-4">${community.communityContent}</p>
							</figure>
						</article>
						<section class="mb-5">
							<div class="card bg-light">
								<c:set var="userId" value="${sessionUserId}" />



								<div class="card-body">
									<c:if test="${userId eq community.usersId}">
										<a type="button" href="<c:url value='/community/communityUpdate/${community.communityBoardId}'/>" class="btn btn-dark shadow"> 글 수정 </a>
										<a type="button" href="<c:url value='/community/delete/${community.communityBoardId}'/>" class="btn btn-dark shadow">글 삭제</a>
										<a type="button" href="<c:url value='/community/communityList/1/1'/>" class="btn btn-dark shadow">글 목록</a>
										<input type="hidden" name="communityBoardId" value="${community.communityBoardId}">
									</c:if>
									<form class="mb-4" action="<c:url value='/community/reply/comment'/>" method="post">
										<textarea name="communityCommentContent" class="form-control" rows="3" placeholder="댓글 작성"></textarea>
										<a type="submit" class="btn btn-dark shadow"> 댓글 작성 </a>
									</form>

									<form>
										<c:if test="${community.communityReplyNumber!=0}">
											<c:forEach var="commentList" items="${commentList}" varStatus="status">
												<div class="d-flex flex-column mb-3">
													<div class="ms-3">
														<div class="d-flex justify-content-around">
															<div>
																<div class="flex-shrink-0">
																	<img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
																</div>
															</div>
															<div class="ms-3">
																<div class="fw-bold">${commentList.userId}</div>
																${commentList.communityCommentContent}
															</div>
															<div class="ms-auto">
																<input type="button" onclick="viewReplyComment()" class="btn btn-sm btn-dark shadow" value="답글">
															</div>
														</div>
														<div id="load"></div>
													</div>
												</div>
											</c:forEach>
										</c:if>
									</form>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/sidebar.jsp" />
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>