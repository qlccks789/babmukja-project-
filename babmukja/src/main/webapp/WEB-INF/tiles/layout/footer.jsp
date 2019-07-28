<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value="/resources/css/footer.css"/>">
    <title>Document</title>
</head>
<body>
<footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>About</h6>
            <p class="text-justify">
				밥먹자 컴퍼니는 쉽게 레시피를 관리하고 레시피에 맞는 재료를 손쉽게 구매할 수 있는 서비스를 제공하고자 만들어졌습니다.
				<br>
				<b style="font-size: 15px; color:white;">BABMUKJA COMPANY</b>
				<br>밥먹자컴퍼니(주)
				<br>대표 : <b style="color:gold;">데이비드빛찬황</b>
				<br>이메일 : kwj3682@naver.com
				<br>서울특별시 마포구 서울특별시 마포구 백범로 23 구프라자 3층 2호
			</p>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Categories</h6>
            <ul class="footer-links">
              <li><a href="<c:url value="/babmukja/recipe/main.do"/>">레시피 메인</a></li>
              <li><a href="<c:url value="/babmukja/store/mainpb.do"/>">스토어 메인</a></li>
              <li><a href="<c:url value="/babmukja/meetup/main.do"/>">쿠킹미팅 메인</a></li>
            </ul>
          </div>

        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Copyright &copy; 2019 All Rights Reserved by 
         <a href="#">BABMUKJA</a>.
            </p>
          </div>

          <div class="col-md-4 col-sm-6 col-xs-12">
            <ul class="social-icons">
              <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
              <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>   
            </ul>
          </div>
        </div>
      </div>
</footer>
</body>
</html>