<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setBundle basename="18n/header"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
		
		body{
		    background: #f5f6fa;
		}
		
		.wrapper .sidebar{
		    background: rgb(5, 68, 104);
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: 225px;
		    height: 100%;
		    padding: 20px 0;
		    transition: all 0.5s ease;
		}
		.wrapper .sidebar .profile{
		    margin-bottom: 30px;
		    text-align: center;
		}
		
		.wrapper .sidebar .profile img{
		    display: block;
		    width: 100px;
		    height: 100px;
		    border-radius: 50%;
		    margin: 0 auto;
		}
		
		.wrapper .sidebar .profile h3{
		    color: #ffffff;
		    margin: 10px 0 5px;
		}
		.wrapper .sidebar ul li a{
		    display: block;
		    padding: 13px 30px;
		    border-bottom: 1px solid #10558d;
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
		    color: #0c7db1;
		
		    background:white;
		    border-right: 2px solid rgb(5, 68, 104);
		}
		
		.wrapper .sidebar ul li a:hover .icon,
		.wrapper .sidebar ul li a.active .icon{
		    color: #0c7db1;
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
		    background: rgb(7, 105, 185);
		    height: 50px;
		    display: flex;
		    align-items: center;
		    padding: 0 30px;
		
		}
		
		.wrapper .section .top_navbar .hamburger a{
		    font-size: 28px;
		    color: #f4fbff;
		}
		
		.wrapper .section .top_navbar .hamburger a:hover{
		    color: #a2ecff;
		}
		body.active .wrapper .sidebar{
		    left: -225px;
		}
		
		body.active .wrapper .section{
		    margin-left: 0;
		    width: 100%;
		}

    </style>
    <script>
	    var hamburger = document.querySelector(".hamburger");
	    hamburger.addEventListener("click", function(){
	        document.querySelector("body").classList.toggle("active");
	    })
    </script>
</head>
<body>


    	<div class="wrapper">
       <div class="section">
    <div class="top_navbar">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>
    <div class="container">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    </div>
  </div>
        <!--Top menu -->
        <div class="sidebar">
	        <div class="profile">
	            <img src="https://1.bp.blogspot.com/-vhmWFWO2r8U/YLjr2A57toI/AAAAAAAACO4/0GBonlEZPmAiQW4uvkCTm5LvlJVd_-l_wCNcBGAsYHQ/s16000/team-1-2.jpg" alt="profile_picture">
	            <h3>Anamika Roy</h3>
	            <p>Designer</p>
	        </div>
           <!--profile image & text-->
           <!--menu item-->
           <div id="menu_items">
            <ul>
                <li>
                    <a href="#" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">My Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">People</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">Perfomance</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">Development</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">Reports</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">Admin</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fas fa-cog"></i></span>
                        <span class="item">Settings</span>
                    </a>
                </li>
            </ul>
        </div>
        </div>
        
        

    </div>
    
  <script>

  </script>
</body>
</html>
