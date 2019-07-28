<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Babmukja</title>
<link rel="stylesheet" href="<c:url value="/resources/css/member/style.css"/>">
<link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/images/favicon.png'/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<main>
	<div class="singUp__container">
		<div class="signUp__logo">
			밥먹자 ~ <i class="fas fa-utensils"></i>
		</div>

		<div class="signUp__title">회원가입</div>

		<div class="signUp__content">
			<p>간편하게 SNS를 이용하여 로그인 하세요!</p>


			<div class="signUp__social-login">
				<div class="facebook__icon">
					<a href="#"><img id="facebook"
						src="<c:url value="/resources/images/facebook.jpg"/>"></a>
				</div>

				<div class="kakao__icon">
					<a href="#"><img id="kakao"
						src="<c:url value="/resources/images/kakao.jpg"/>"></a>
				</div>

				<div class="naver__icon">
					<a href="#"><img id="naver"
						src="<c:url value="/resources/images/naver.jpg"/>"></a>
				</div>
			</div>
		</div>

		<form id="signupform" action="signup.do" method="post" onsubmit="return doSignUp();">
			<div class="signUp__content">
				<div class="signUp-name">
					이름
					<div class="name-input">
						<input type="text" name="memName" id="memName">
					</div>
				</div>
 
				<div class="signUp-email">
					<span>이메일</span>
					<div class="email-input">
						<input type="text" placeholder="ex) babmukja@gmail.com" name="memEmail" id="memEmail"><button type="button" class="email-check-button">중복체크</button>
						<input type="hidden" id="hEmail" value="0" />
					</div>
					
					<div class="email-result">
						<span class="email-check"></span>
					</div>
				</div>

				<div class="signUp-phone">
					전화번호
					<div class="phone-input">
						<input type="text" placeholder="ex) 010-1111-1111" name="memPhone" id="memPhone">
					</div>
				</div>

				<div class="signUp-nickName">
					닉네임
					<div class="nickname-input">
						<input type="text" name="memNickname" id="memNickname"><button type="button" class="Nickname-check-button">중복체크</button>
						<input type="hidden" id="hNickname" value="0" />
					</div>
					
					<div class="nickName-result">
						<span class="nickName-check"></span>
					</div>
				</div>

				<div class="signUp-passWord">
					비밀번호
					<div class="password-input">
						<div class="pass-content">영어, 숫자 특수문자 합쳐서 8자리 이상 입력해주세요.</div>
						<input type="password" name="memPass" id="memPass">
					</div>
				</div>

				<div class="signUp-checkePass">
					비밀번호 확인
					<div class="checkePass">
						<input type="password" name="checkePass" id="checkePass">
					</div>
				</div>

				<div class="signUp-post">
					우편번호
					<div class="post-input">
						<input type="text" name="postNo"  id="postNo" readonly="readonly"><button type="button" onclick="goPopup();">우편번호 검색</button>
					</div>
				</div>

				<div class="default-addr">
					기본주소<input type="text" name="addrDefault" readonly="readonly">
				</div>

				<div class="detaile-addr">
					상세주소<input type="text"  id="addrDetail" name="addrDetail">
				</div>
			</div>

			<div class="signUp__button">
				<button id="signUp-button">회원가입 하기</button>
			</div>
		</form>

		<div class="member__login">
			이미 밥먹자~ <i class="fas fa-utensils"></i> 회원이신가요? 
			<a href="<c:url value="/member/loginform.do"/>">로그인</a>
		</div>
	</div>
	</main>
	<script>
	
		let jusoUrl = "<c:url value='/member/jusopopup.do'/>"; 
 	
 		
	</script>
	<script src="<c:url value="/resources/js/member/signupform.js"/>"></script>
</body>
</html>