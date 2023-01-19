<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<style>
.tab_menu_article {
	position: relative;
}

.tab_menu_article .list_article {
	overflow: hidden;
	margin: auto;
	display: table;
}

.tab_menu_article .list_article li {
	float: left;
}

.tab_menu_article .list_article li.is_on .btn {
	font-weight: bold;
	color: black;
	background-color: 
}

.tab_menu_article .list_article .btn {
	font-size: 13px; . tab_menu .cont_area .cont{display : none;
	position: absolute;
	top: 25px;
	left: 0;
	background: #555;
	color: black;
	text-align: center;
	width: 250px;
	height: 90px;
	line-height: 100px;
}
}
</style>
<script>
	const tabList_article = document.querySelectorAll('.tab_menu_article .list_article li');
	const contents_article = document.querySelectorAll('.tab_menu_article .cont_area_article .cont')
	let activeCont_article = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

	for (var i = 0; i < tabList_article.length; i++) {
		tabList_article[i].querySelector('.btn').addEventListener('click', function(e) {
			e.preventDefault();
			for (var j = 0; j < tabList_article.length; j++) {
				// 나머지 버튼 클래스 제거
				tabList_article[j].classList.remove('is_on');

				// 나머지 컨텐츠 display:none 처리
				contents_article[j].style.display = 'none';
			}

			// 버튼 관련 이벤트
			this.parentNode.classList.add('is_on');
			
			// 버튼 클릭시 컨텐츠 전환
			activeCont_article = this.getAttribute('href');
			document.querySelector(activeCont_article).style.display = 'block';
			
		});
	}
	
	
</script>


	<div class="welcome d-flex justify-content-around align-items-center pt-2 shadow" style="background:#eeeeee; border-radius:10px; margin-top:0px; width:100%; height:100%">
			<div class="p-2 " style="text-align:center; width:100%; height:100%;">
				<img src="<c:url value="/static/images/cardNews.png"/>" style="width:100%; height:100%;  border-radius:10px;">
			</div>
			<div class="p-2 " style="text-align:center; width:100%; height:100%">
				<div class="tab_menu_article" >
					<ul class="list_article" id="articleButton" style="border: 1px solid gray; padding:5px 30px; border-radius:5px;">
						<li class="is_on">
							<a href="#article_tab1" class="btn mx-1">
								<FONT color="black">기관/학과 소식</FONT>
							</a>
						</li>
						<li>
							<a href="#article_tab2" class="btn mx-1">
								<FONT color="black">정보 공개</FONT>
							</a>
						</li>
					</ul>
					<div class="card-body px-0 pb-2 pt-0">
						<div class="table-responsive p-0">
							<div class="cont_area_article" id="articleContent">
								<div id="article_tab1" class="cont">
									<table class="table align-items-center mb-0 text-center">
									<tr>
									<td><h4> 공공기관 청년인턴 모집 </h4><br/>
									<h6>컴퓨터 공학부 1학기 공공기관 청년인턴을 모집합니다. 2023년 1월 19일부터 학부사무실에서 접수 가능합니다. 많은 관심부탁드립니다. </h6>
									<br>
									<h6>Tel: 02-1234-1234 담당자: 이화영 </h6></td>
									</tr>	
									</table>
								</div>
								<div id="article_tab2" class="cont" style="display: none;">
									<table class="table align-items-center mb-0 text-center">
									<tr>
									<td><h4> 2022년 4분기 정보공개공시  </h4><br/><h6>컴퓨터 공학부 2022년 4분기 정보 공개 공시를 공지게시판에 게시하였습니다.</h6><br><h6> Tel: 02-1234-1234 담당자: 이지혁 </h6></td>
									</tr>		
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>
	</div>