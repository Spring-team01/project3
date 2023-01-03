<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- FOOTER -->
<footer class="footer" style="width:100%;">
    <div class="footer_container d-flex">
            <div class="p-2">
                <div class="col">
                   
                 </div>
            </div>
            
            <div class="p-2">
                <div class="col">
                   <h5>[ Contact us ]</h5>
                   <ul>
                        <li>Phone: 010 1234 5678</li>
                        <li>Email: <a href="mailto:xxx@yyy.com" title="Email Us">xxx@yyy.com</a></li>
                        <li><a href="http://www.yourhost.com">http://www.yourhost.com</a></li>
                   </ul>
                 </div>
            </div>
            
            <div class="p-2">
                <div class="col">
                    <h5>[ Mailing list ]</h5>
                    <p>Sign up if you would like to receive</p>
                    <form action='#' method="post" class="form-horizontal form-light">
                        <div class="input-group">
                            <input type="email" name="email" class="form-control" placeholder="Your email address..." required>
                            <span class="input-group-btn">
                                <input type="submit" class="btn btn-base" value="GO!">
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="p-2">
                <div class="col col-social-icons">
                    <h5>[ Follow us ]</h5>
                    <li> <a href="#"><i class="fa fa-facebook"></i>페이스북 </a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i>구글 </a></li>
                    <li>  <a href="#"><i class="fa fa-linkedin"></i>링크드인 </a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i>트위터 </a></li>
                   
                    
                  
                    
                
                </div>
			</div>

			<div class="p-2">
                <div class="col">
                    <h5>[ About us ]</h5>
                    <p class="no-margin">
                    Java developer specialist group community. It something special for your.
                    <a href="<c:url value="/"/>" class="btn btn-block btn-base btn-icon fa-check"><span>Try it now</span></a>
                    </p>
                </div>
            </div>
        </div>
</footer>
