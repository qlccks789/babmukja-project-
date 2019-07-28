<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>PB STORE CART</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/store/cartpb.css"/>">
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/common/stringUtil.js"/>"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <div class="pb_cart_container">
    <p class="pb_cart_text">SHOPPING BASKET</p>
	      <div class="pb_cart_grid">
	          <div class="pb_cart_con">
	            <input type="hidden" name="memhidden" value="${sessionScope.user.memNo}">
	            <!-- 반복 -->
	            <c:forEach var="cartList" items="${cartList}">
		            <div class="pb_cart_product" id="${cartList.cartNo}">
		            <input type="hidden" name="hiddenNo" id="hiddenNo" value="${cartList.cartNo}">
		            <input type="hidden" name="hiddenpbNo" id="hiddenpbNo" value="${cartList.pbNo}">
		            <input type="hidden" name="hiddencartNo" id="hiddenpbNo" value="${cartList.cartNo}">
		                <div class="product_image">
		                    <img src="${cartList.imgPath}" onerror="this.src='${pageContext.request.contextPath}/resources/images/foodthumbnail1.jpg'"/>
		                </div>
		                <div class="product_info">
		                    <div class="product_flex">
		                        <p class="product_name">${cartList.name}</p>
		                        <button id="product_delete_btn" class="product_delete_btn">X</button>
		                    </div>
		                    
		                    <div id="select_product_count">
		                        <p><button id="count_minus" class="count_minus">-</button></p>
		                        <p id="total_count">${cartList.prodCount}</p>
		                        <p><button id="count_plus" class="count_plus">+</button></p>
		                        <p class="total__price" id="total__price"><fmt:formatNumber value="${cartList.price}" groupingUsed="true"/>원</p>
		                    </div>
		                </div>
		            </div> <!-- 반복끝 -->
	            </c:forEach>
                <c:if test="${empty cartList}">
					<p class="cartMSG">장바구니에 상품이 존재하지 않습니다.</p>
					<p class="cartMSG2">상품을 담아주세요~!</p>
            	</c:if>
     		  </div>

	        <!-- 상품 종합 정보 -->
	        <div class="pb_cart_order_container">
	            <div class="pb_cart_order">
	                <div class="order_payment">총결제 금액<span class="order_price"><fmt:formatNumber value="" groupingUsed="true"/>원</span></div>
	            </div>
	            <div class="cart_order_btn">
	                <button class="payment_btn"><span class="order_count"></span>개상품구매하기</button>
	            </div>
	        </div>
	    </div>
    </div>
    
    <script>
    	let session = ${sessionScope.user.memNo};
    </script>
    <script src="<c:url value="/resources/js/store/cartpb.js"/>"></script>
</body>
</html>