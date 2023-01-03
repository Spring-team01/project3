<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>

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
        <div class="sidebar close">
		    <div class="logo-details">
		      <i class='bx bxl-c-plus-plus'></i>
		      <span class="logo_name">CodingLab</span>
		    </div>
		    <ul class="nav-links">
		      <li>
		        <a href="#">
		          <i class='bx bx-grid-alt' ></i>
		          <span class="link_name">Dashboard</span>
		        </a>
		        <ul class="sub-menu blank">
		          <li><a class="link_name" href="#">Category</a></li>
		        </ul>
		      </li>
		      <li>
		        <div class="iocn-link">
		          <a href="#">
		            <i class='bx bx-collection' ></i>
		            <span class="link_name">Category</span>
		          </a>
		          <i class='bx bxs-chevron-down arrow' ></i>
		        </div>
		        <ul class="sub-menu">
		          <li><a class="link_name" href="#">Category</a></li>
		          <li><a href="#">HTML & CSS</a></li>
		          <li><a href="#">JavaScript</a></li>
		          <li><a href="#">PHP & MySQL</a></li>
		        </ul>
		      </li>
		      <li>
		        <div class="iocn-link">
		          <a href="#">
		            <i class='bx bx-book-alt' ></i>
		            <span class="link_name">Posts</span>
		          </a>
		          <i class='bx bxs-chevron-down arrow' ></i>
		        </div>
		        <ul class="sub-menu">
		          <li><a class="link_name" href="#">Posts</a></li>
		          <li><a href="#">Web Design</a></li>
		          <li><a href="#">Login Form</a></li>
		          <li><a href="#">Card Design</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">
		          <i class='bx bx-pie-chart-alt-2' ></i>
		          <span class="link_name">Analytics</span>
		        </a>
		        <ul class="sub-menu blank">
		          <li><a class="link_name" href="#">Analytics</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">
		          <i class='bx bx-line-chart' ></i>
		          <span class="link_name">Chart</span>
		        </a>
		        <ul class="sub-menu blank">
		          <li><a class="link_name" href="#">Chart</a></li>
		        </ul>
		      </li>
		      <li>
		        <div class="iocn-link">
		          <a href="#">
		            <i class='bx bx-plug' ></i>
		            <span class="link_name">Plugins</span>
		          </a>
		          <i class='bx bxs-chevron-down arrow' ></i>
		        </div>
		        <ul class="sub-menu">
		          <li><a class="link_name" href="#">Plugins</a></li>
		          <li><a href="#">UI Face</a></li>
		          <li><a href="#">Pigments</a></li>
		          <li><a href="#">Box Icons</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">
		          <i class='bx bx-compass' ></i>
		          <span class="link_name">Explore</span>
		        </a>
		        <ul class="sub-menu blank">
		          <li><a class="link_name" href="#">Explore</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">
		          <i class='bx bx-history'></i>
		          <span class="link_name">History</span>
		        </a>
		        <ul class="sub-menu blank">
		          <li><a class="link_name" href="#">History</a></li>
		        </ul>
		      </li>
		      <li>
		        <a href="#">
		          <i class='bx bx-cog' ></i>
		          <span class="link_name">Setting</span>
		        </a>
		        <ul class="sub-menu blank">
		          <li><a class="link_name" href="#">Setting</a></li>
		        </ul>
		      </li>
		      <li>
		    <div class="profile-details">
		      <div class="profile-content">
		        <img src="image/profile.jpg" alt="profileImg">
		      </div>
		      <div class="name-job">
		        <div class="profile_name">Prem Shahi</div>
		        <div class="job">Web Desginer</div>
		      </div>
		      <i class='bx bx-log-out' ></i>
		    </div>
		  </li>
		</ul>
		  </div>
		  <section class="home-section">
		    <div class="home-content">
		      <i class='bx bx-menu' ></i>
		      <span class="text">Drop Down Sidebar</span>
		    </div>
		  </section>

    </div>
   </div>
  <script>
	  let arrow = document.querySelectorAll(".arrow");
	  for (var i = 0; i < arrow.length; i++) {
	    arrow[i].addEventListener("click", (e) => {
	   let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
	   arrowParent.classList.toggle("showMenu");
	    });
	  }
	
	  let sidebar = document.querySelector(".sidebar");
	  let sidebarBtn = document.querySelector(".bx-menu");
	  console.log(sidebarBtn);
	  sidebarBtn.addEventListener("click", () => {
	    sidebar.classList.toggle("close");
	  });

  </script>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>