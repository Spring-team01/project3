<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<fmt:setBundle basename="i18n/header" />

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/colorlib.jsp" />

<!-- Favicon -->
	<link rel="icon" type="image/png" sizes="18x18"  href="../resources/images/univlogo.png">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="theme-color" content="#ffffff">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    

<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/95401d2f49.js" crossorigin="anonymous"></script>

<!-- header css -->
<link href="<c:url value="/static/css/header.css"/>" rel='stylesheet' />

<!-- sidebar+navbar css -->
<link href="<c:url value="/static/css/common.css"/>" rel='stylesheet' />

<!-- footer css -->
<link href="<c:url value="/static/css/footer.css"/>" rel='stylesheet'/>

<!-- Clock css -->
<link href="<c:url value="/static/css/clock.css"/>" rel='stylesheet' />
<script type="text/javascript" src="<c:url value="/static/js/clock.js"/>"></script>


<!-- calendar -->
<link href="<c:url value="/static/css/calendar.css"/>" rel='stylesheet' />
<script type="text/javascript" src="<c:url value="/static/js/calendar.js"/>"></script>
<style>
@font-face {
font-family: Poppins-Regular;
src: url('../fonts/poppins/Poppins-Regular.ttf');
}
@font-face {
font-family: Poppins-Bold;
src: url('../fonts/poppins/Poppins-Bold.ttf');
}
/
/*//////////////////////////////////////////////////////////////////
[ Table ]*/
.limiter {
width: 100%;
margin: 0 auto;
}
.container-table100 {
width: 100%;
background: #c4d3f6;
display: -webkit-box;
display: -webkit-flex;
display: -moz-box;
display: -ms-flexbox;
display: flex;
align-items: stretch;
justify-content: center;
flex-wrap: wrap;
padding: 33px 30px;
}
.wrap-table100 {
width: 960px;
border-radius: 10px;
overflow: hidden;
}
.table {
width: 100%;
display: table;
margin: 0;
}
@media screen and (max-width: 768px) {
.table {
display: block;
}
}
.row .ad {
display: table-row ad;
background: #fff;
}
.row .ad.header {
color: #ffffff;
background: #6c7ae0;
}
@media screen and (max-width: 768px) {
.row .ad {
display: block;
}
.row .ad.header {
padding: 0;
height: 0px;
}
.row .ad.header .cell {
display: none;
}
.row .ad .cell:before {
font-family: Poppins-Bold;
font-size: 12px;
color: #808080;
line-height: 1.2;
text-transform: uppercase;
font-weight: unset !important;
margin-bottom: 13px;
content: attr(data-title);
min-width: 98px;
display: block;
}
}
.cell {
display: table-cell;
}
@media screen and (max-width: 768px) {
.cell {
display: block;
}
}
.row .ad .cell {
font-family: Poppins-Regular;
font-size: 15px;
color: #666666;
line-height: 1.2;
font-weight: unset !important;
padding-top: 20px;
padding-bottom: 20px;
border-bottom: 1px solid #f2f2f2;
}
.row .ad.header .cell {
font-family: Poppins-Regular;
font-size: 18px;
color: #fff;
line-height: 1.2;
font-weight: unset !important;
padding-top: 19px;
padding-bottom: 19px;
}
.row .ad .cell:nth-child(1) {
width: 360px;
padding-left: 40px;
}
.row .ad .cell:nth-child(2) {
width: 160px;
}
.row .ad .cell:nth-child(3) {
width: 250px;
}
.row .ad .cell:nth-child(4) {
width: 190px;
}
.table, .row ad {
width: 100% !important;
}
.row .ad:hover {
background-color: #ececff;
cursor: pointer;
}
@media (max-width: 768px) {
.row .ad {
border-bottom: 1px solid #f2f2f2;
padding-bottom: 18px;
padding-top: 30px;
padding-right: 15px;
margin: 0;
}
.row .ad .cell {
border: none;
padding-left: 30px;
padding-top: 16px;
padding-bottom: 16px;
}
.row .ad .cell:nth-child(1) {
padding-left: 30px;
}
.row .ad .cell {
font-family: Poppins-Regular;
font-size: 18px;
color: #555555;
line-height: 1.2;
font-weight: unset !important;
}
.table, .row .ad, .cell {
width: 100% !important;
}
}
</style>
</head>