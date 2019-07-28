<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>">
<link rel="stylesheet"
	  href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	  integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	  crossorigin="anonymous">
</head>
<body>
	<main>
	<div class="change_pass_container">
		<div class="change_pass_title">
			비밀번호 변경 <i class="fas fa-utensils"></i>
		</div>

		<form id="changepass" method="POST" action="loginform.do">
		<div class="change_pass_input">
			<div class="change_pass">
				<div class="change_pass_content">*영어, 숫자 특수문자 합쳐서 8자리 이상 입력해주세요.</div>
				<input type="password" name="memPass" id="memPass" placeholder="변경할 비밀번호" />
			</div>
			<div class="change_pass">
				<input type="password" name="checkmemPass" id="checkmemPass" placeholder="비밀번호 확인" />
				<input type="hidden" id="iemail" value="${email}" name="memEmail">
			</div>
		</div>
		</form>

		<div class="change_pass_button">
			<button id="change_pass_btn">비밀번호 변경</button>
		</div>
	</div>
	</main>
</body>
</html>