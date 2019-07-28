<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/member/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<main>
	<div class="reset_pass_container">
		<div class="reset_pass_title">
			비밀번호 재설정 <i class="fas fa-utensils"></i>
		</div>

		<form id="resetPass" method="post" action="repass.do">
			<div class="reset_pass_input">
				<div class="pass_reset">
					<div class="pass-content">*영어, 숫자 특수문자 합쳐서 8자리 이상 입력해주세요.</div>
					<input type="password" name="memPass" id="memPass" placeholder="새로운 비밀번호">
				</div>
				<div class="pass_reset">
					<input type="password" name="checkmemPass" id="checkmemPass" placeholder="비밀번호 확인">
				</div>
			</div>
			
			<!-- 앞에서는 이메일을 받아오는데 여기서 이메일을 안받으면 null 에러발생 -->
			<input type="hidden" id="iemail" value="${email}" name="memEmail">
			<input type="hidden" id="iphone" value="${memPhone}" name="memPhone">
			
			<div class="reset_pass_button">
				<button id="reset_pass_btn">비밀번호 재설정</button>
			</div>
			
		</form>
	</div>
	</main>
	<script src="<c:url value="/resources/js/member/resetpass.js"/>"></script>
</body>
</html>