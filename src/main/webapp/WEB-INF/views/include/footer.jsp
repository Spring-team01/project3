<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- sidebar script -->
  <script>
   var hamburger = document.querySelector(".hamburger");
		hamburger.addEventListener("click", function(){
		document.querySelector(".main").classList.toggle("active");
	})
	
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
	    
	    var dropdownContent = this.nextElementSibling;
	    if (dropdownContent.style.display === "block") {
	      dropdownContent.style.display = "none";
	    } else {
	      dropdownContent.style.display = "block";
	    }
	  });
	}
  </script>
<!-- FOOTER -->
<footer class="footer" style="width: 100%; position: relative;">
	<div class="footer_container d-flex">
		<div style="width:100%" class="row">
			<div class="col-3 p-2" style="text-align:center">
				<h4><FONT color="white">대학정보공시</FONT></h4>
			</div>
			<div class="col-3 p-2" style="text-align:center">
				<h4><FONT color="white">정보공개</FONT></h4>
			</div>
			<div class="col-3 p-2" style="text-align:center">
				<h4><FONT color="white">개인정보처리방침</FONT></h4>
			</div>
			<div class="col-3 p-2" style="text-align:center">
				<h4><FONT color="white">사이트맵</FONT></h4>
			</div>
		</div>
	</div>
	<div class="footer_container d-flex">
		<div style="width:100%" class="row">
			<div id="image-box" class="col-2">
				<a href="<c:url value="/home"/>">
					<img id="image-content" src="<c:url value="/static/images/univlogo.png"/>"/>
				</a>
			</div>
			<div class="col-3">
				<div id="name-box">
					<img id="name-content" src="<c:url value="/static/images/univname.png"/>"/>
				</div>
			</div>
			<div class="col-3">
			</div>
			<div class="col-5" style="padding-top:20px">
				<h5><FONT color="white">서울특별시 송파구 가락동 중대로 135 한국 대학교 T.02-1234-1234</FONT></h5>
				<h6><FONT color="#949494">COPYIGHT BY HANGUG UNIVERSITY ALL RIGHTS RESERVED.</FONT></h6>
			</div>
		</div>
	</div>
</footer>
