<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<script>
	const tabList = document.querySelectorAll('.tab_menu .list li');
	const contents = document.querySelectorAll('.tab_menu .cont_area .cont')
	let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

	for (var i = 0; i < tabList.length; i++) {
		tabList[i].querySelector('.btn').addEventListener('click', function(e) {
			e.preventDefault();
			for (var j = 0; j < tabList.length; j++) {
				// 나머지 버튼 클래스 제거
				tabList[j].classList.remove('is_on');

				// 나머지 컨텐츠 display:none 처리
				contents[j].style.display = 'none';
			}

			// 버튼 관련 이벤트
			this.parentNode.classList.add('is_on');
			
			// 버튼 클릭시 컨텐츠 전환
			activeCont = this.getAttribute('href');
			document.querySelector(activeCont).style.display = 'block';
			
		});
	}
	
	
</script>
	<div class="welcome d-flex justify-content-around align-items-center pt-2" style="background:#1c2326; margin-top:0px; width:100%; height:100%">
			<div class="p-2 " style="text-align:center; width:100%; height:100%">
				<img src="<c:url value="/static/images/ex.PNG"/>" style="width:100%; height:100%">
			</div>
			<div class="p-2 " style="text-align:center; width:100%; height:100%">
				<div class="tab_menu" >
					<ul class="list" >
						<li class="is_on">
							<a href="#tab1" class="btn">
								<FONT color="#f0f0f0">기관/학과 소식</FONT>
							</a>
						</li>
						<li>
							<a href="#tab2" class="btn">
								<FONT color="#f0f0f0">정보 공개</FONT>
							</a>
						</li>
					</ul>
					<div class="card-body px-0 pb-2 pt-0">
						<div class="table-responsive p-0">
							<div class="cont_area">
								<div id="tab1" class="cont">
									<table class="table align-items-center mb-0 text-center">
										<h6> 내용 1 </h6>
									</table>
								</div>
								<div id="tab2" class="cont" style="display: none;">
									<table class="table align-items-center mb-0 text-center">
										<h6> 내용 2 </h6>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>
	</div>