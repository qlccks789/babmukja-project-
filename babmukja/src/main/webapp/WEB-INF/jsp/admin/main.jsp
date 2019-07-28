<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/adminmain.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<!-- <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css"/>"></script> -->
<title>관리자 페이지</title>
</head>
<body>
	<div id="main">
		<div id="graph-container">
			<div id="graph">
				<h2>통계 그래프</h2>
				<canvas></canvas>
			</div>
		</div>
		<div id="info-container">
			<div id="today-sales">
				<div>
					<div>오늘 총 매출</div>
					<div>
						<i class="fas fa-won-sign"></i> 1,150,232원
					</div>
				</div>
			</div>
			<div id="today-signup">
				<div>
					<div>오늘 가입자 수</div>
					<div>
						<i class="fas fa-user-check"></i> 11명
					</div>
				</div>
				<div>
					<div>총 가입자 수</div>
					<div>
						<i class="fas fa-users"></i> 1250명
					</div>
				</div>
			</div>
			<div id="today-signin">
				<div>
					<div>오늘 접속자 수</div>
					<div>
						<i class="fas fa-sign-in-alt"></i> 11명
					</div>
				</div>
			</div>
			<div id="today-cs">
				<div>
					<div>
						고객 문의 처리 현황<b id="to"></b>
					</div>
					<div></div>
				</div>
			</div>
		</div>
	</div>
	<script>
//     var myLineChart = new Chart(ctx, {
//         type: 'line',
//         data: data,
//         options: options
//     });
	</script>
</body>
</html>