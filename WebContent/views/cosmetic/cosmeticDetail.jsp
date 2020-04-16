<%@page import="cosmetic.model.vo.CosmeticReviewList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cosmetic.model.vo.Cosmetic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<%= request.getContextPath()%>/resources/css/filter.css" rel="stylesheet">
<%@ include file="/views/layout/import.jsp"%>

<style>

#cos-section{
    display: inline-flex;
    margin-top: 100px;
    margin-bottom: 100px;
}

#cos-img {
    width: 280px;
    height: 280px;
}

#input-img{
	/* width: 500px; */
    min-height: 200px;
}

#cos-detail-wrap{
	margin-left: 30px;
}

#cos-detail{

}

#brand-product-name{
	margin-bottom: 40px;
}
#brand-product-name>span{
	color: #936890;
    font-size: 15px;
}
#brand-product-name>h3{
	font-weight: 900;
/*     font-size: 35px; */
}

#product-volume-price{
    display: inline;
}

#product-volume-price>span:first-child{
	color: #936890;
}

#score-count{
	display: inline;
    float: right;
}

#cos-brand{
	margin-top: 30px;
}

#brand-img {
	width: 100px;
	height: 50px;
}

#cos-category {
	margin-top: 30px;
	color: #936890;
	font-size: 13px;
}
#cos-category>span {
	margin-left: 15px;
	font-size: 13px;
	color: black;
}

#cos-contents {
	margin-top: 30px;
	display: flex;
}

#cos-contents>div:first-child {
	display: inline-block;
/* 	width: 120px; */
	width:13%;
	margin-right: 23px;
}

/* #cos-contents>p { */
/* 	width:500px; */
/* } */

#brandHomeBtn {
	float: right;
	border: 1px solid red;
    background: white;
    font-size: 11px;
    border-radius: 3px;
    padding: 5px;
}

#cosRankHomeBtn {
	margin-left: 20px; 
	border: 1px solid red;
    background: white;
    font-size: 11px;
    border-radius: 3px;
    padding: 5px;
}

#td-contents {
	width: 67px; 
	vertical-align: top;
	color: #936890;
}

.userInfo>div>img { 
	width:50px;
	height: 50px;
	border-radius: 20px;
}

.userDetail, .userProfile_name {
	margin-bottom: 10px;
}
.userDetail>span {
	font-size: 14px;
    margin-left: 10px;
}

.userDetail>span>img {
	width: 15px;
	height: 15px;
}

div>.wDate {
	float: right;
    margin-top: 13px;
}

/* 리뷰크기  */
.review_ta {
	width:850px;
	min-height:32px;
	overflow-y:hidden;
	border: 0;
	resize: none;
	font-size: 16px;
}

/* 리뷰 클릭시 나오는 아웃라인 제거 */
.review_ta:focus {
	outline: none;
}

/* 리뷰 전체 글씨크기  및 리뷰사이의 거리*/
.userReview {
	font-size: 28px;
}

.userReview>h3 {
	margin-bottom: 20px;
}

.wName {
    margin-left: 20px;
    font-size: 20px;
}

/* 리뷰아래 밑줄 */
.review_list {
	border-bottom: 1px solid #ebd3d3;
    margin-bottom: 40px;
}

span.star-prototype, span.star-prototype > * {
		height: 16px; 
		background: url(<%= request.getContextPath()%>/resources/images/heartAvg.png) 0 -16px repeat-x;
		width: 80px;
		display: inline-block;
}

span.star-prototype > * {
	background-position: 0 0;
	max-width:80px; 
}

.heartPosition {
	display: inline-block;
	vertical-align: middle;
}

</style>
<%
	Cosmetic c = (Cosmetic) request.getAttribute("cosmeticInform");
	String bImg = (String) request.getAttribute("bImg");
	String middleName = (String) request.getAttribute("middleName");
	ArrayList<CosmeticReviewList> rList = (ArrayList<CosmeticReviewList>) request.getAttribute("rList");
	double[] rca = (double[]) request.getAttribute("rca");
	System.out.println(rca[0]);
	System.out.println(rca[1]);
%>
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<section id="cos-section">
			<div id="input-img"><img id="cos-img" src="<%=c.getCosmetic_img() %>" alt="화장품이미지" /></div>
			<div id="cos-detail-wrap">
				<section id="cos-detail">
					<div id="brand-product-name">
						<span><%= c.getBrand_name() %></span><br>
						<h3><%= c.getCosmetic_name() %></h3>
					</div>
					<div id="product-volume-price">
						<span><%= c.getVolume() %></span> /
						<span><%= c.getPrice() %></span>
						<div id="score-count">
							<span><%= rca[1] %></span>
							<div class="heartPosition">
								<span class="star-prototype"><%= rca[1] %></span>
							</div>
							<span>(<%= (int) rca[0] %>)</span>
						</div>
					</div>
					<div id="cos-brand">
						<span><img id="brand-img" src="<%= bImg %>" alt="" /></span>
						<span><%= c.getBrand_name() %></span>
						<button id="brandHomeBtn" class="" type="button" onclick="brandHome()">브랜드홈</button>
					</div>
					<div id="cos-category">
						카테고리 <span><%= middleName %></span>
						<button id="cosRankHomeBtn" class="" type="button" onclick="cosRankHome()">랭킹확인</button>
					</div>
					<div id="cos-contents">
						<table>
							<tr>
								<td id="td-contents">설명</td>
								<td style="width: 75%;"><%= c.getCosmetic_about() %></td>
								<td style="width: 180px"></td>
							</tr>
						</table>
					</div>
				</section>
			</div>
		</section>
		<hr>
		<section id="cosReview_section">
			<form id="filter-form" action="#" onsubmit="return false">
				<section id="cosmetic-filter">
					<div id="cosmetic-beauty-filter">
						<div id="cosmetic-beauty-filter-header">
							<h3>필터</h3>
							<button id="reset-btn" type="reset">초기화</button>
						</div>
						<br>
						<div id="cosmetic-beauty-filter-select">
							<fieldset id="sex-fieldset">
								<legend>
									<h4>성별</h4>
								</legend>
								<input type="radio" id="filter-sex-all" class="radioChkActive" name="filter-sex" value="filter-sex-all" checked="checked"/> <label for="filter-sex-all">전체</label>
								<input type="radio" id="filter-sex-female" class="radioChk" name="filter-sex" value="filter-sex-female"/> <label for="filter-sex-female">여자</label>
								<input type="radio" id="filter-sex-male" class="radioChk" name="filter-sex" value="filter-sex-male"/> <label for="filter-sex-male">남자</label>						
							</fieldset>
							<br>
							<fieldset>
								<legend>
									<h4>연령대</h4>
								</legend>
								<input type="checkbox" id="filter-age-all" class="chkboxChkActive" name="filter-age-all" value="filter-age-all" checked="checked" /> <label for="filter-age-all">전체</label>
								<input type="checkbox" id="filter-age-10" class="chkboxChk" name="filter-age" value="filter-age-10" /> <label for="filter-age-10">10대</label>
								<input type="checkbox" id="filter-age-20u" class="chkboxChk" name="filter-age" value="filter-age-20u" /> <label for="filter-age-20u">20대 초반</label>	
								<br><br>
								<input type="checkbox" id="filter-age-20d" class="chkboxChk" name="filter-age" value="filter-age-20d" /> <label for="filter-age-20d">20대 후반</label>	
								<input type="checkbox" id="filter-age-30" class="chkboxChk" name="filter-age" value="filter-age-30" /> <label for="filter-age-30">30대 초반</label>	
								<input type="checkbox" id="filter-age-30u" class="chkboxChk" name="filter-age" value="filter-age-30u" /> <label for="filter-age-30u">30대 후반</label>	
							</fieldset>
							<br>
							<fieldset>
								<legend>
									<h4>피부타입</h4>
								</legend>
								<input type="checkbox" id="filter-skinType-all" class="chkboxChkActive" name="filter-skinType-all" value="filter-skinType-all"/> <label for="filter-skinType-all">전체</label>
								<input type="checkbox" id="filter-skinType-dry" class="chkboxChk" name="filter-skinType" value="filter-skinType-dry"/> <label for="filter-skinType-dry">건성</label>
								<input type="checkbox" id="filter-skinType-oily" class="chkboxChk" name="filter-skinType" value="filter-skinType-oily"/> <label for="filter-skinType-oily">지성</label>	
								<br><br>
								<input type="checkbox" id="filter-skinType-neutral" class="chkboxChk" name="filter-skinType" value="filter-skinType-neutral"/> <label for="filter-skinType-neutral">중성</label>	
								<input type="checkbox" id="filter-skinType-combi" class="chkboxChk" name="filter-skinType" value="filter-skinType-combi"/> <label for="filter-skinType-combi">복합성</label>	
								<input type="checkbox" id="filter-skinType-sensitive" class="chkboxChk" name="filter-skinType" value="filter-skinType-sensitive"/> <label for="filter-skinType-sensitive">민감성</label>	
							</fieldset>
								<br><br>
							<div id="select-btn-center">
								<button id="select-btn" type="submit">필터적용</button>
							</div>
							<br><br><br>
							<h1 id="keyword_search">키워드 검색</h1>
							<input id="search_input" type="search" placeholder="리뷰 키워드를 입력하세요" />
							<button id="search_btn_span">
								<img src="<%= request.getContextPath()%>/resources/images/search_icon.png">
							</button>
						</div>
						<br><br>
					</div>
				</section>
				<section id="cosmetic-category" >
					<h2>리뷰</h2>
					<br><br>
					<section>
						<ul>
						<% for (int i = 0; i < rList.size(); i++ ) {%>
							<li class="review_list">
								<div class="userInfo">
									<div class="userProfile_name">
									<% if(rList.get(i).getProfile_image() == null) { %>
										<img src="<%= request.getContextPath() %>/member_images/icon.png" alt="" />								
									<% } else { %>								
										<img src="<%= request.getContextPath() %>/member_images/<%= rList.get(i).getProfile_image() %>" alt="" />
									<% } %>
										<span class="wName"><%= rList.get(i).getUser_name() %></span>									
										<span class="wDate"><%= rList.get(i).getBoard_date() %></span>
									</div>
								<div class="userDetail">
									<span>
										<%= rList.get(i).getAge() %>세 ㆍ <%= rList.get(i).getSkinType() %> ㆍ <% if(rList.get(i).getGender().equalsIgnoreCase("남성")) { %> 
											<img src="<%= request.getContextPath() %>/resources/images/male.png" alt="남자" /> 
										<% } else { %> 
											<img src="<%= request.getContextPath() %>/resources/images/female.png" alt="여자" /> 
										<% } %>   
									</span>
								</div>
								</div>
								<div class="userReview">
									<h3><%= rList.get(i).getBoard_title() %></h3>
									<textarea class="review_ta" ><%= rList.get(i).getBoard_content() %></textarea>
								</div>
							</li>
						<% } %>
						</ul>
					</section>
				</section>
			</form>
		</section>
	</div>
	

	<%@ include file="/views/layout/footer.jsp"%>
		<script> 
		$.fn.generateStars = function() {
			return this.each(function(i,e){
				$(e).html($('<span/>').width($(e).text()*16));
			});
		};
		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();
		
		$(function(){
			function xSize(e) {
				var t;
				e.select = function(){
					t = setInterval(
						function()
						{
							e.style.height = '1px';
							e.style.height = (e.scrollHeight + 12) + 'px';
						}, 100);
				}
				e.onblur = function(){
					clearInterval(t);
				}
			}
			var ttt = <%= rList.size() %>
			for(var tt = 0; tt < ttt; tt++){ 
				xSize(document.getElementsByClassName('review_ta')[tt]);	
				console.log(document.getElementsByClassName('review_ta')[tt]);
				document.getElementsByClassName('review_ta')[tt].select(); 
			}
		})
		function brandHome() {
			location.href = '<%= request.getContextPath()%>/detail.br?bname=' + '<%= c.getBrand_name()%>';
		}
		
		function cosRankHome() {
			location.href = '<%= request.getContextPath()%>/cosmetic.li?cos_middle_no=' + '<%= c.getMiddle_no()%>';
		}

		$('input[name=filter-sex]').click(function() {
			if ($(this)[0].value == "filter-sex-all") {
				$('input[name=filter-sex]').addClass('radioChk')
				$('input[name=filter-sex]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "filter-sex-female") {
				$('input[name=filter-sex]').addClass('radioChk')
				$('input[name=filter-sex]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "filter-sex-male") {
				$('input[name=filter-sex]').addClass('radioChk')
				$('input[name=filter-sex]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			}
		})
		
		$('#filter-age-all').click(function(){
			if ($(this)[0].value == "filter-age-all") {
				console.log($(this)[0].value)
				$('#filter-age-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
				$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			}
		})
	
		$('input[name=filter-age]').click(function(){
			var chk = document.getElementsByName('filter-age');
			var chkAll = document.getElementById('filter-age-all');
			var count = 0;
			$('#filter-age-all').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			for (var i = 0; i < chk.length; i++) {
				if (chk[i].checked) {
					chk[i].classList.add("chkboxChkActive")
					count++;
				} 		
				if(!chk[i].checked) {
					chk[i].classList.remove("chkboxChkActive")
					chk[i].classList.add("chkboxChk")
				}
			}
			if (count == chk.length) {
				$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive")
				$('#filter-age-all').prop("checked", true).addClass("chkboxChkActive");
			} else if (count == 0) {
				$('#filter-age-all').prop("checked", true).addClass("chkboxChkActive");
			}
		})
		
		$('#filter-skinType-all').click(function(){
			if ($(this)[0].value == "filter-skinType-all") {
				console.log($(this)[0].value)
				$('#filter-skinType-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
				$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			}
		})
	
		$('input[name=filter-skinType]').click(function(){
			var chk = document.getElementsByName('filter-skinType');
			var chkAll = document.getElementById('filter-skinType-all');
			var count = 0;
			$('#filter-skinType-all').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			for (var i = 0; i < chk.length; i++) {
				if (chk[i].checked) {
					chk[i].classList.add("chkboxChkActive")
					count++;
				} if(!chk[i].checked) {
					chk[i].classList.remove("chkboxChkActive")
					chk[i].classList.add("chkboxChk")
				}
			}
			if (count == chk.length) {
				$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive")
				$('#filter-skinType-all').prop("checked", true).addClass("chkboxChkActive");
			} else if (count == 0) {
				$('#filter-skinType-all').prop("checked", true).addClass("chkboxChkActive");
			}
		})
		
		$('#reset-btn').click(function(){
			$('input[name=filter-sex]').addClass('radioChk').removeClass("radioChkActive")
			$("#filter-sex-all").prop("checked", true).addClass("radioChkActive")
			$('#filter-age-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
			$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			$('#filter-skinType-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
			$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
		})
	</script>


	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/filter.js"></script>
</body>
</html>