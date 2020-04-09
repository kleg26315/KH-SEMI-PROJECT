<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/views/layout/import.jsp" %>
<style>
hr {
    margin-top: 15px;
    margin-bottom: 15px;
    border: 0;
    border-top: 5px solid #eee;
}

div>section#nav-tab {
   display: inline-block;
    background-color: #f8f8fb;
    width: 180px;
    min-height: 100px;
    color: black;
   /* position: relative; */
}

#nav-tab>ul>li {
   text-align: center; 
   padding: 25px;
   cursor: pointer;
   font-size: 15px;
}

#nav-tab>ul>li:hover {
   background-color: #f2d0e0;
}

div>section.tab-adminpage {
   display: inline-block;
    /* position: absolute; */
    padding-left: 100px;
    padding-top: 20px;
}

#tab-title {
   width: 170px;
    font-size: 25px;
    font-weight: 900;
    display: inline-block;
}

#tab-title-detail {
   display: inline-block; 
   min-width: 500px;
}

#btn-category {
   margin: auto;
    width: 50%;
    margin-top: 20px; 
}

#btn-category>form>button {
   margin-right: 15px;
}
#main-div{
   display: inline-flex;
}

#adminCustomer{
	text-align: center;
	border-top: 1px solid #444444;
}
#adminCustomer>thead>tr>th {
	height: 48px;
    font-size: 16px;
    border-block-end: 1px solid black;
    text-align: center;
    width:150px;
}
#adminCustomer>tbody>tr>td {
   height: 45px;
}


.detail, .grant{color: blue; cursor: pointer;}
.quit, .refuse, .remove, #answerStatus{color: red; cursor: pointer;}
.detail:hover, .quit:hover, .grant:hover, .refuse:hover, .remove:hover,
#answerStatus:hover{
	text-decoration:underline;
}

#adminHospital {
   text-align: center;
}
#adminHospital>thead>tr>th {
    height: 48px;
    font-size: 16px;
    border-block-end: 1px solid black;
    text-align: center;
    width:90px;
}
#adminHospital>thead>tr>th#title2 {
   width:420px;
}
#adminHospital>tbody>tr>td {
   height: 45px;
}

#adminEnrollHospital {
   text-align: center;
}
#adminEnrollHospital>thead>tr>th {
    height: 48px;
    font-size: 16px;
    border-block-end: 1px solid black;
    text-align: center;
    width:90px;
}
table#adminEnrollHospital>thead>tr>th#title2 {
   width:420px;
}
table#adminEnrollHospital>tbody>tr>td{
   height: 45px;
}

#myReservation {
   text-align: center;
}
#myReservation>thead>tr>th {
    width: 99px;
    text-align: center;
    font-size: 16px;
    border-block-end: 1px solid black;
    height: 48px;
}
#myReservation>tbody>tr>td {
   height: 45px;
}

#myQnA-writer {
   text-align: center;
}

#myQnA-writer {
   text-align: center;
}

#myQnA-writer {
   text-align: center;
}

.paging .hide {display:block;height:0;width:0;font-size:0;line-height:0;margin:0;padding:0;overflow:hidden;}
.paging{padding:19px;text-align:center;}
.paging a{display:inline-block;width:23px;height:23px;padding-top:2px;vertical-align:middle;}
.paging a:hover{text-decoration:underline;}
.paging .btn_arr{text-decoration:none;}
.paging .btn_arr, .paging .on{margin:0 3px;padding-top:0;border:1px solid #ddd; border-radius:30px;
/* background:url(/front/img/com/btn_paging.png) no-repeat; */}
.paging .on{padding-top:1px;height:22px;color:#fff;font-weight:bold;background:#000;}
.paging .on:hover{text-decoration:none;}

</style>
</head>
<body>
   <div class="contents">
      <%@ include file="/views/layout/header.jsp"%>
      <hr>
      <section id="page-name">
         <h2>관리자 페이지</h2>
      </section>
      <hr>
      <div id="main-div">
         <section id="nav-tab">
            <ul id="nav-tab-ul">
               <li onclick="location.href = '<%= request.getContextPath()%>/user.admin'">회원 관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/views/admin/adminHospital.jsp'">병원 관리</li>
               <li style="background: #f2d0e0" onclick="location.href = '<%= request.getContextPath()%>/views/admin/adminHospitalJoin.jsp'">병원 가입 관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/views/admin/adminCosReq.jsp'">제품 등록 관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/views/admin/adminReview.jsp'">리뷰 관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/views/admin/adminBoard.jsp'">게시판 관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/views/admin/adminInq.jsp'">1대1문의 관리</li>
            </ul>
         </section>
         <section id="tab-adminEnrollHospital" class="tab-adminpage">
            <div id="tab-title">병원 가입 관리</div>
            <div id="tab-title-detail"></div>
            <br><br>
            <table id="adminCustomer" class="table-standard">
                <thead>
                  <tr>
                     <th>요청번호</th>
                     <th>회원이름</th>
                     <th>가입일자</th>
                     <th>상세</th>     
                     <th>승인</th>                
                     <th>거절처리</th>                     
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>34</td>
                     <td>KH피부과</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
                  <tr>
                     <td>33</td>
                     <td>제일피부과</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
                  <tr>
                     <td>32</td>
                     <td>감동피부과</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
               </tbody>
            </table>
            <br><br>
            <div class="paging">
			  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
			  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
			  <a href="#" class="on">1</a>
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
			  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
			</div>
         </section>
         </div>
         </div>
           <%@ include file="/views/layout/footer.jsp"%>
   
   <script>
	$('.detail').click(function(){
		var popup = window.open("adminUserDetail.jsp", "detailPopUp", "width=500, height=300");
		

	});
	$('.grant').click(function(){
		var result = window.confirm('회원가입요청을 승인처리 하시겠습니까?');
		
		if(result){
			alert('승인 처리 완료!');
		} else{
			alert('취소!');
		}
	});
	$('.refuse').click(function(){
		var result = window.confirm('회원가입요청을 거절처리 하시겠습니까?');
		
		if(result){
			alert('거절 처리 완료!');
		} else{
			alert('취소!');
		}
	});
   </script>
   <script src="../../resources/js/main.js"></script>
   
</body>
</html>