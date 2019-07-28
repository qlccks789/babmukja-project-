<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>" />
<link rel="stylesheet"
	  href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	  integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	  crossorigin="anonymous" />
<link
	href="<c:url value="https://fonts.googleapis.com/css?family=Jua"/>"
	rel="stylesheet" />
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<main>
	<div class="kakao_login_container">
		<div class="kakao_login_title">
			닉네임 설정 <i class="fas fa-utensils"></i>
		</div>

		<form id="socialsignup" action="socialsignup.do" method="POST">
			<div class="kakao_login_input">
				<div class="kakao_login_reset">
					<input type="text" name="memNickname" id="memNickname" placeholder="닉네임" />
				</div>
				
				<div class="kakao_signup_result">
					<div class="kakao_check"></div>
				</div>
			</div>
			

			<div class="input_hidden">
				<input type="hidden" id="memEmail" name="memEmail" value="${memEmail}"> 
				<input type="hidden" id="memName" name="memName" value="${memName}"> 
				<input type="hidden" id="socialAt" name="socialAt" value="${socialAt}"> 
			</div>

			<div class="kakao_reset_button">
				<button id="kakao_signup_button">확인</button>
			</div>
		</form>
	</div>
	</main>
	<script src="<c:url value="/resources/js/member/socialsignupform.js"/>"></script>
</body>
</html>