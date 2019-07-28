<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/store/mainpb.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/js/dist/css/swiper.min.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>
<body>
	<div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
            	<div></div>
	            <p>"BABMUKJA PB STORE"</p>
             	<img src="<c:url value="/resources/images/storemain/main-slide4.png"/>"/>	
            </div>
            <div class="swiper-slide">
            	<div></div>
	            <p>"BABMUKJA PB STORE"</p>
             	<img src="<c:url value="/resources/images/storemain/store-image3.png"/>"/>	
            </div>
            <div class="swiper-slide">
            	<div></div>
	            <p>"BABMUKJA PB STORE"</p>
             	<img src="<c:url value="/resources/images/storemain/store-image1.png"/>"/>	
            </div>
            <div class="swiper-slide">
            	<div></div>
	            <p>"BABMUKJA PB STORE"</p>
             	<img src="<c:url value="/resources/images/storemain/main-slide8.jpg"/>"/>	
            </div>
            <div class="swiper-slide">
            	<div></div>
	            <p>"BABMUKJA PB STORE"</p>
             	<img src="<c:url value="/resources/images/storemain/main-slide3.png"/>"/>	
            </div>
        </div>
        <!-- Add Scrollbar -->
        <div class="swiper-scrollbar"></div>
    </div>
   <div id="threeshin_information"> <img src="<c:url value="/resources/images/store3shin.jpg"/>"> </div>
   <div id="information_about_store">
   		<img src="<c:url value='/resources/images/storemain.jpg'/>">
   </div>
    <div id="kakaopay_information">  <img src="<c:url value="/resources/images/kakaostoremain.jpg"/>"> </div>
    <!-- PB스토어 메인화면 -->
  <div id="pb_store_container"> 
		<div class="new_product_container">
		        <div class="new_product_con">
		            <p class="new_product_header">NEW ITEM</p>
		            <p class="new_product_header_submsg">밥먹자에서 새롭게 선보이는 뉴 아이템 !!</p>
		        </div>
		        
		        <div class="new_product_item">
		        <c:forEach var="storepb" items="${storepb}" begin="0" end="3">
			            <div class="product">
		                    <a class="pb_store_popular_product_img" href="<c:url value="/store/detailpb.do?pbNo=${storepb.pbNo}"/>">
				                <img src="${storepb.thumnail}" onerror="this.src='${pageContext.request.contextPath}/resources/images/foodthumbnail1.jpg'">
				                <div class="product_msg">
					                    <p>
					                        ${storepb.name}
					                    </p>
				                    <p class="product_price"><fmt:formatNumber value="${storepb.price}" groupingUsed="true"/>원</p>
				                </div>
		                    </a>
			            </div>
		        </c:forEach>
		        </div>
		    </div>
    
    <!-- 이미지 픽스하기 -->
    		    <div class="main_image_con">
			        <div class="main_image">
			            <div class="main_image_txt">
			                오늘 하루 소중한 사람들에게
			                <br>
			                맛있고 따듯한 한끼를 대접하세요
			            </div>
			        </div>
			    </div>
    
            <!-- 인기 상품 -->
        
            <div class="product_con">
            <div class="pb_margin_top"></div>
            <div id="pb_store_popular_product_header">
            	<p class="pb_best_text">BEST ITEM</p>
            	<p class="pb_best_text_sub">밥먹자의 최고 인기 상품 !!</p>
             </div>
            <!-- 인기상품 이미지 -->
            <div id="pb_store_popular_product_img">
                <div id="pb_store_popular_product_imges">
                <a class="pb_store_more_product" href="<c:url value='/store/listpb.do'/>">더보기</a>
                    <div id="pb_store_popular_product_imges_grid">
                    <c:forEach var="pbList" items="${storepbBest}" begin="0" end="3">
                        <a class="pb_store_popular_product_img" href="<c:url value="/store/detailpb.do?pbNo=${pbList.pbNo}"/>">
                            <img src="${pbList.thumnail}" onerror="this.src='${pageContext.request.contextPath}/resources/images/foodthumbnail1.jpg'"/>
                            <div class="pb_store_popular_product_text">
                                <div class="pb_store_popular_product_title">
                                    <p>${pbList.name}</p>
                                </div>
                                <div class="pb_store_popular_product_price">
                                    <p><fmt:formatNumber value="${pbList.price}" groupingUsed="true"/>원</p>
                                </div>
		                        <div class="pb_list_product_rating">
		                            <span id="pb_store_popular_product_rating_star"></span>
		                            <span class="pb_store_popular_rating_cnt"><fmt:formatNumber value="${pbList.rating}" pattern="#.##"/></span>
	                            	<img class="likeheart" src="<c:url value='/resources/images/icons/like2.png'/>">
	                            	<span class="likeheartCnt">${pbList.likeCnt}</span>
	                            	<i class="far fa-eye" id="viewCntIcon"><span class="PBviewCnt">${pbList.viewCnt}</span></i>
		                        </div>
                            </div>
                        </a>
                    </c:forEach>
                     </div>
                </div>
            </div>
           </div>
        </div>

       
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/dist/js/swiper.min.js"/>"></script>
	<script src="<c:url value="/resources/js/store/mainpb.js"/>"></script>
</body>
</html>