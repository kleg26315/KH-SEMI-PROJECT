<%@page import="cosmetic.model.vo.Cosmetic"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style>
* {
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
} /* 리셋 */
body {
	background: white;
}

button {
	border: 1px solid #ccccce;
	border-radius: 6px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	cursor: pointer;
	font-size: 12px;
	padding: 5px;
}

select {
	border: 1px solid #ccccce;
	border-radius: 5px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	font-size: 12px;
	padding: 3px;
	font-size: 13px; 
}

input, textarea {
	border: 0;
    width: 500px;
    outline: none;
    resize: none;
    padding-left: 4px;
}

table {
	margin: 0 auto;
}

input#title {
	height: 40px;
}

textarea#content {
	margin-top: 5px;
	font-size: 14px;
}
td{
	border: 1px solid;
}

#button-area {
	text-align: center;
	margin-top: 20px;
}

</style>
</head>
<body>
	<div>
		<h3>1:1 문의하기</h3>
		<hr />
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객님께 불편을 드려서 죄송합니다.</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 질문사항을 자세히 적어주세요.</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 보다 빠르게 문제를 해결하도록 노력하겠습니다.</p>
		<br> 
	</div>
	<section>
		<form action="<%= request.getContextPath() %>/sendQnA.me" method="get">
			<table>
				<tr>
					<td>
						<input id="title" name="title" type="text" placeholder=" 제목을 입력해주세요(문의사항)" maxlength="40" required="required"/>
					</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td>
						<textarea id="content" name="content" id="" cols="30" rows="10" placeholder=" 문의내용을 입력해주세요" required="required"></textarea>
					</td>
				</tr>
			</table>
			<div id="button-area">
				<button id="sendQnA" type="submit">문의하기</button>
				<button id="cencel" type="button">취소</button>
			</div>
		</form>
	</section>
	
	<script>
		$('#cencel').on('click', function(){
			self.close()
		})
	</script>
</body>
</html>