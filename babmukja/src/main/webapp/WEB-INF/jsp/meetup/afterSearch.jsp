<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    
    <link href="<c:url value="/resources/css/meetup/meetup_afterSearch.css"/>" rel="stylesheet" type="text/css">
    

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
        integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    
    
    

    
    <script src='<c:url value="/resources/js/jquery-3.1.1.min.js"/>'> </script>
    <script src='<c:url value="/resources/js/meetup/meetup_afterSearch.js"/>'> </script>
   


</head>
<body>
<!-- 쿠킹 모임 메인 컨테이너 -->
    <div class="main_container">
        <!-- 쿠킹 모임 헤더  -->
        <div class=main_header>
            <span class="header_cooking_meetup">쿠킹모임</span>

        </div>
        <!--검색 클릭시 세부내용처리 -->
         <form method="POST" action="<c:url value='/meetup/afterSearch.do'/>" enctype="multipart/form-data">
           <span class="header_search">
                <input type="text" placeholder="검색" name="search">
                <i class="fas fa-search fa-2x"></i>

            </span>
            <div class="after_click">
                <div class="location_container">
                    <!--지역설정 -->
                    <div class="location_title_container">
                        <span></span>
                        <span class="location_title">지역</span>
                        <span class="location_add_minus"><i class="fas fa-plus-circle" id="main_add_location"></i>
                            &nbsp; <i class="fas fa-minus-circle" id="main_substract_location"></i>


                        </span>
                    </div>
                    <div class=" location_position" id="location_position">


                    </div>
                </div>

                <div class="food_type_container">
                    <div class="food_type_title">카테고리</div>
                    <div class="food_type_position">

                        <input type="checkbox" name="category" value="전체"> 전체</input>
                        <input type="checkbox" name="category" value="한식"> 한식</input>
                        <input type="checkbox" name="category" value="중식">중식</input>
                        <input type="checkbox" name="category" value="일식">일식</input>
                        <input type="checkbox" name="category" value="양식">양식</input>
                        <input type="checkbox" name="category" value="동남아시아">동남아시아</input>
                        <input type="checkbox" name="category" value="기타">기타</input>
                    </div>
                </div>
                <div class="monthly_fee_container">
                    <div class="monthly_fee_title">월 회비</div>
                    <div class="monthly_fee_position">

                        <input type="checkbox" name="fee" value="all" />무관</input>
                        <input type="checkbox" name="fee" value="10000" />만원 이하</input>
                        <input type="checkbox" name="fee" value="30000" />3만원 이하</input>
                        <input type="checkbox" name="fee" value="50000" />5만원 이하</input>
                        <input type="checkbox" name="fee" value="100000" />10만원 이하</input>
                    </div>
                </div>
                <!--클릭 후  끝 -->


        </form>
    </div><!-- 쿠킹 모임 메인 컨테이너 -->
 
    <!-- 추천모임 박스 -->
    <div class="info_block_container">
        <!--1 추천모임 박스 복사시작 -->
        <c:forEach var="meetup" items="${meetupList}">
        <div class="info_block">
            <div class="info_pic"><img src="<c:url value='/meetup/download.do' />?path=${meetup.fileDir}" width="384px" height="190px">
            </div>
            <div class="info_line">${meetup.title}</div>
            <div class="info_monthly_fee">
                <span>${meetup.fee}</span>
                	<!-- hidden으로 번호값 넘겨주기 -->
	                            		 <input type="hidden"  name="afterMeetNo" class="afterMeetNo" value="${meetup.meetNo}">
            </div>

            <div class="info_bottom">
                <div class="bottom_location"><span><i class="fas fa-map-marker-alt "></i>&nbsp; ${meetup.location}</span>
                </div>
                <div class="border_line"></div>

                <div class="bottom_view_count">
                	<span><i class="fas fa-eye"></i>&nbsp; ${meetup.viewCnt}</span>

                </div>
            </div>
        </div>
         </c:forEach>
        
        <!-- 추천모임 박스 복사끝 -->
        
    </div>
    <!--회원 번호 가져오기  -->
   <input type="hidden"  name="memNo" id="hiddenmemNo" value="${sessionScope.user.memNo}">
    
    <!-- 추천모임 박스 복사끝 -->
<div class="page">
	    <c:if test="${pageResult.count != 0}">
	    	<jsp:include page="/WEB-INF/jsp/include/meetupPage.jsp">
				<jsp:param name="link" value="afterSearch.do"/>        	
	    	</jsp:include>
	    </c:if>
    </div>
    


      <script src='<c:url value="/resources/js/meetup/meetup_afterSearch.js"/>'> </script>
      <script src='<c:url value="/resources/js/meetup/meetup_main_search_address.js"/>'> </script>



</body>
</html>