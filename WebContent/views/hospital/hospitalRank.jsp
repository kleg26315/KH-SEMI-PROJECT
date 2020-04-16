<%@page import="hospital.model.vo.Hospital"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/layout/import.jsp"%>
<style>
#page-name>h1 {
	font-size: 40px;
	font-weight: 900;
	margin-left: 70px;
    margin-top: 60px;
}

#cosmetic-beauty-filter {
	display: inline-block;
    border: 1px solid #ccc;
    padding-left: 18px;
    background-color: #F8F8F8;
    height: 396px;
    width: 350px;
}

#cosmetic-beauty-filter-header>h3 {
	display: inline-block;
}

input {
	position: relative;
}

.radioChk+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 13px;
	background-color: white;
	border: 1px solid #ccc;
	font-size: 13px !important;
	width: 94px	;
	text-align: center;
	position: relative;
	left: -14px;
}

.radioChkActive+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 13px;
	background-color: white;
	border: 1px solid red;
	font-size: 13px !important;
	width: 94px;
	text-align: center;
	position: relative;
	left: -14px;
}


#select-btn-center {
	margin-right: 15px;
    text-align: center;
}

#reset-btn {
    margin-left: 218px;
    border: 0;
    background-color: #F8F8F8;
}

#select-btn {
    width: 144px;
    height: 58px;
    background: red;
    color: white;
    font-size: 16px;
    font-weight: 900;
    border-radius: 6px;
    border: 1px solid red;
}
/* #test {
	display: inline-flex;
	width: 500px;
} */

#filter-form {
	display: inline-flex;
	margin-top: 50px;
}

#filter-form>section#cosmetic-filter {
	display: inline-flex;
}


/* 여기부터 리스트 css */
.ranking-list {
	display: inline-flex;
    border-block-end: 1px solid #ccc;
    margin-left: 30px;
}

.ranking-list div {
	display: inline-block;
	height: 170px;
	text-align: center;
}

.ranking-list>.cos-rank {
	width: 80px;
    padding-top: 30px;
}
.ranking-list>.cos-img {
	width: 150px;
}
.ranking-list>.cos-detail {
	text-align: left;
	width: 270px;
}
.ranking-list>.cos-score {
	width: 200px;
	padding-top: 70px;
}

.cos-img>img{
	width: 100px;
    height: 100px;
    margin-top: 30px;
}

.cos-detail-link {
	cursor: pointer;
	font-weight: 700;
	display:inline-block;
}

.hospital-detail-link{
	cursor: pointer;
}

.cos-rank h3{
	margin-top: 35px;
}


#filter-form>section#cosmetic-category {
	display: block;
	font-size: 12px;
	margin-right: 225px;
}

#cosmetic-category #cosmetic-big-category, #cosmetic-middle-category, #category-btn, .middle-category{
	float: left;
}

#cosmetic-category #cosmetic-big-category {
	border: 1px solid #ccc;
    background: white;
    border-radius: 5px;
    width: 150px;
    height: 30px;
    margin-left: 30px;
}

#cosmetic-category .middle-category {
	border: 1px solid #ccc;
    background: white;
    border-radius: 5px;
    width: 150px;
    height: 30px;
    margin-left: 4px;
} 

#category-btn {    
	border: 1px solid #ccc;
    background: white;
    border-radius: 5px;
    width: 70px;
    height: 30px;
    margin-left: 4px;
    float: right;
}

.srch-select, .input-text{
	float: right;
}
</style>

<% 
	ArrayList<Hospital> list = (ArrayList<Hospital>) request.getAttribute("list"); 
	
%>
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<section id="page-name">
			<h1>병원 랭킹</h1>
		</section>
		
		<form id="filter-form">
			<section id="cosmetic-filter">
				<div id="cosmetic-beauty-filter">
					<div id="cosmetic-beauty-filter-header">
						<h3>필터</h3>
						<button id="reset-btn" type="reset">초기화</button>
					</div>
					<br>
					<div id="cosmetic-beauty-filter-select">
					<fieldset id="hospital-fieldset">
						<legend>
							<h4>기준</h4>
						</legend>
							<input type="radio" id="ranking" class="radioChkActive" name="hospital_filter" value="랭킹순" checked="checked"/> <label for="ranking">랭킹순</label>
							<input type="radio" id="reviewH" class="radioChk" name="hospital_filter" value="리뷰 많은 순"/> <label for="reviewH">리뷰 많은 순</label>
							<input type="radio" id="reviewL" class="radioChk" name="hospital_filter" value="리뷰 적은 순"/> <label for="reviewL">리뷰 적은 순</label><br><br>					
							<input type="radio" id="heartH" class="radioChk" name="hospital_filter" value="평점 높은 순"/> <label for="heartH">평점 높은 순</label>						
							<input type="radio" id="heartL" class="radioChk" name="hospital_filter" value="평점 낮은 순"/> <label for="heartL">평점 낮은 순</label>						
							<input type="radio" id="replyH" class="radioChk" name="hospital_filter" value="답변 많은 순"/> <label for="replyH">답변 많은 순</label><br><br>						
							<input type="radio" id="replyL" class="radioChk" name="hospital_filter" value="답변 적은 순"/> <label for="replyL">답변 적은 순</label>						
					</fieldset>
					<br><br>
					<div id="select-btn-center">
						<button id="select-btn" type="button" onclick="filter_apply()">필터적용</button>
					</div>
					<br>
					</div>
				</div>
			</section>
			<section id="cosmetic-category" >
				<button id="category-btn" type="submit">검색</button>
				<input type="text" id="yadmNm" name="yadmNm" style="ime-mode: active;" value="읍/면/동 또는 도로명을 입력해주세요" title="도로명 입력" class="input-text" />
				<select name="sgguCd" id="sgguCd" title="시/군/구 선택" class="srch-select" style="width: 111px;">
				    <option value="">시/군/구 선택</option>
				</select>
				<select name="sidoCd" id="sidoCd" title="시/도 선택" class="srch-select" style="width: 93px;">
				    <option value="">시/도 선택</option>
				    <option value="서울">서울</option>
				    <option value="부산">부산</option>
				    <option value="인천">인천</option>
				    <option value="대구">대구</option>
				    <option value="광주">광주</option>
				    <option value="대전">대전</option>
				    <option value="울산">울산</option>
				    <option value="경기">경기</option>
				    <option value="강원">강원</option>
				    <option value="충북">충북</option>
				    <option value="충남">충남</option>
				    <option value="전북">전북</option>
				    <option value="전남">전남</option>
				    <option value="경북">경북</option>
				    <option value="경남">경남</option>
				    <option value="제주">제주</option>
				    <option value="세종">세종</option>
				</select>
			<section>
				<ul id='ul-area'>
				<% for (int i = 0; i < list.size(); i++) { %>
					<li>
						<div class="ranking-list">
							<div class="cos-rank">
								<h3><%= i+1 %></h3>
							</div>
							<div class="cos-img">
									<span><%= list.get(i).getHospital_img() %></span>
									<%-- <img src="<%= request.getContextPath() %>/hospital_images/<%= list.get(i).getHospital_img() %>"/> --%>
							</div>
							<div class="cos-detail hospital-detail-link">
								<br>
								<h6><%= list.get(i).getUser_name() %></h6>
								<h5><%= list.get(i).getHospital_about() %></h5><br><br>
							</div>
							<div class="cos-score">
								<span><%= list.get(i).getHospital_heart()%></span>
								<span>imgimgimgimg</span>
								<span>(<%= (int)list.get(i).getReview_count() %>)</span>
							</div>
						</div>
					</li>
				<% } %>
				</ul>
				</section>
			</section>
		</form>
		
	</div>
	<%@ include file="/views/layout/footer.jsp"%>

	<script>
		$('.hospital-detail-link').click(function(){
			location.href="<%= request.getContextPath()%>/detail.hos?hosName=" + encodeURIComponent($(this).children('h6').text());
		})
		
		$('input[name=hospital_filter]').click(function() {
			if ($(this)[0].value == "랭킹순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "리뷰 많은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "리뷰 적은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "평점 높은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "평점 낮은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "답변 많은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "답변 적은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			}
		})
		
		$('#reset-btn').click(function() {
			$('input[name=hospital_filter]').addClass('radioChk').removeClass("radioChkActive");
			$("#ranking").prop("checked", true).addClass("radioChkActive");
		})
		
		function filter_apply() {
			var hospital_filter = $('#hospital-fieldset>input[name]:checked').val();
			$.ajax({
				url: 'hospital.li',
				data: {hospital_filter:hospital_filter},
				success: function(data){
					var count = 0;
					$('#ul-area').html("");
					for(var i in data){
						count += 1;
						var $div1 = $('<div class="ranking-list"></div>');
						var $div2 = $('<div class="cos-rank"></div>');
						var $h3 = $('<h3></h3>').text(count);
						var $div3 = $('<div class="cos-img"></div>');
						var $img = $('<img>')						
						$img.attr('src', "<%= request.getContextPath() %>/hospital_images/" + data[i].hospital_img);														
						var $div4 = $('<div class="cos-detail hospital-detail-link"></div>');
						var $br = $('<br>');
						var $h6 = $('<h6></h6>').text(data[i].user_name);
						var $h5 = $('<h5></h5>').text(data[i].hospital_about);
						var $div5 = $('<div class="cos-score"></div>');
						var $span1 = $('<span></span>').text(data[i].hospital_heart);
						var $span2 = $('<span></span>').text('imgimgimgimg');
						var $span3 = $('<span></span>').text('('+data[i].review_count+')');
						
						$div2.append($h3);
						$div3.append($img);
						$div4.append($br);
						$div4.append($h6);
						$div4.append($h5);
						$div5.append($span1);
						$div5.append($span2);
						$div5.append($span3);
						
						$div1.append($div2);
						$div1.append($div3);
						$div1.append($div4);
						$div1.append($div5);
						
						$('#ul-area').append($div1);
					}
				}
			})
		}
		
	</script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>