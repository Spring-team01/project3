<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
    <style>
    	@import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

		*{
		  list-style: none;
		  text-decoration: none;
		  margin: 0;
		  padding: 0;
		  box-sizing: border-box;
		  font-family: 'Open Sans', sans-serif;
		}
		
		.main{
		  background: #f5f6fa;
		}
		
		.wrapper .sidebar{
		  background: #0f3443;
		  position: fixed;
		  top: 125px;
		  left: 0;
		  width: 225px;
		  height: 100%;
		  padding: 20px 0;
		  transition: all 0.5s ease;
		}
		
		.wrapper .profile{
		  margin-bottom: 30px;
		  text-align: center;
		}
		
		.wrapper .profile img{
		  display: block;
		  width: 150px;
		  height: 150px;
		  border-radius: 50%;
		  margin: 0 auto;
		}
		
		.wrapper h1, h2{
		  color: #ffffff;
		  margin: 10px 0 5px;
		}
		
		.wrapper p{
		  color: rgb(206, 240, 253);
		  font-size: 14px;
		}
		
		.wrapper .sidebar ul li a{
		  display: block;
		  padding: 13px 30px;
		  border-bottom: 1px solid #0f3443;
		  color: rgb(241, 237, 237);
		  font-size: 16px;
		  position: relative;
		}
		
		.wrapper .sidebar ul li a .icon{
		  color: #dee4ec;
		  width: 30px;
		  display: inline-block;
		}
		
		 
		
		.wrapper .sidebar ul li a:hover,
		.wrapper .sidebar ul li a.active{
		  color: #546041;
		
		  background:white;
		    border-right: 2px solid rgb(5, 68, 104);
		}
		
		.wrapper .sidebar ul li a:hover .icon,
		.wrapper .sidebar ul li a.active .icon{
		  color: #546041;
		}
		
		.wrapper .sidebar ul li a:hover:before,
		.wrapper .sidebar ul li a.active:before{
		  display: block;
		}
		
		.wrapper .section{
		  width: calc(100% - 225px);
		  margin-left: 225px;
		  transition: all 0.5s ease;
		}
		
		.wrapper .section .top_navbar{
		  background: #0f3443;
		  height: 50px;
		  position: fixed;
		  top:135px;
		  border-bottom-right-radius:10px;
		  align-items: center;
		  padding: 0 20px;
		
		 
		}
		
		.wrapper .section .top_navbar .hamburger a{
		  font-size: 28px;
		  color: #f4fbff;
		}
		
		.wrapper .section .top_navbar .hamburger a:hover{
		  color: #a2ecff;
		}
		
		 .wrapper .section .container{
		  margin: 30px;
		  background: #fff;
		  padding: 50px;
		  margin-top:30px;
		  line-height: 28px;
		}
		
		.main.active .wrapper .sidebar{
		  left: -225px;
		}
		
		.main.active .wrapper .section{
		  margin-left: 0;
		  width: 100%;
		}
		.sidebar.active {
		  width: 0;
		  padding: 0;
		}
		.welcome {
			height: 200px;
			width:100%;
			background: #0f3443;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to left, #34e89e,#0f3443);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to left, #34e89e,#0f3443); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
			border-radius: 5px;
			margin-top:120px;
		}

    </style>

<jsp:include page="/WEB-INF/views/include/staticFiles.jsp" />
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
            <div class="welcome d-flex align-items-center">
     			<div class="profile p-2 m-5">
                	<img src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg" alt="profile_picture">
                </div>
                <div class="p-2 m-4"id="userInfo">
                	<h1>이연희 님 환영합니다.</h1>
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
        <div class="sidebar">
            
            <ul>
                <li>
                    <a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="#">Link 1</a>
					    <a href="#">Link 2</a>
					    <a href="#">Link 3</a>
                    </div>
                </li>
                <li>
               		<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">출결관리</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="#">Link 1</a>
					    <a href="#">Link 2</a>
					    <a href="#">Link 3</a>
                    </div>
                </li>
                <li>
                	<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">강의게시판</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="#">Link 1</a>
					    <a href="#">Link 2</a>
					    <a href="#">Link 3</a>
                    </div>
                </li>
                <li>
                	<a href="#" type="button" class="dropdown-btn">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">커뮤니티</span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <div class="dropdown-container">
                    	<a href="#">Link 1</a>
					    <a href="#">Link 2</a>
					    <a href="#">Link 3</a>
                    </div>
                </li>
                
            </ul>
        </div>
        
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
	    this.classList.toggle("active");
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