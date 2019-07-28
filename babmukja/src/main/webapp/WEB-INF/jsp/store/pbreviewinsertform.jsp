<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="<c:url value="/resources/css/store/pbreviewinsertform.css"/>">
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
</head>

<body>
 	<div class="pb_insertform_container">
		<form method="post" enctype="multipart/form-data" action="<c:url value="/store/insertpb.do"/>">
	        <div class="pb_product_name">
	            <p>후기 제목</p>
	            <input type="text" name="name" id="product__name">
	        </div>
	        <div class="pb_product_image">
	            <div class="image_container"></div>
	            <div class="image_choice">
	            	<label for="product_img_file">사진선택</label>
	                <input type="file" name="imageList" id="product_img_file" multiple="multiple">
	            </div>
	        </div>
	        <div class="pb_product_content">
	            <textarea name="content" class="product__content" cols="50" rows="15" placeholder="상품의 설명을 입력해주세요."></textarea>
	        </div>
            <div class="pb_insert_submit">
          	    <button id="pb_insert_submit_button">등록</button>
      	    </div>
 		</form>
        	<button id="pb_insert_cancle_button">취소</button>
    </div>
    <script>
		let url = "<c:url value='/admin/main.do'/>";
    </script>
    <script src="<c:url value="/resources/js/store/pbreviewinsertform.js"/>"></script>
</body>
</html>