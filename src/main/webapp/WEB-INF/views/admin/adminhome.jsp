<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
<body>
<jsp:include page="/WEB-INF/views/include/adminheader.jsp" />
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
            <div class="welcome d-flex align-items-center">
     			<div class="profile p-2 m-5">
                	<img src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg" alt="profile_picture">
                </div>
                <div class="p-2 m-4"id="userInfo">
                	<h1>이연희 관리자님 </h1>
                	<p>경영학과 2학년 1학기 </p>
                </div>
                
            	
     		</div>
              <div class="container">
      				<div class="container-fluid">
						<div class="row">
							<div class="row-lg-3">
							
							</div>
										
							<div class="row-lg-9">
							<jsp:include page="/WEB-INF/views/calendar.jsp" />
							</div>
						</div>
					</div>
	    		</div>
	        </div>
        
 <jsp:include page="/WEB-INF/views/include/adminsidebar.jsp" />       
    </div>
    </div>
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
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>