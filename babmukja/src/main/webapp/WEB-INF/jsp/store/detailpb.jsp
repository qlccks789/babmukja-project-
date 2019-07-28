<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>PB 스토어 상세 조회</title>
<script src="<c:url value="/resources/js/editor.min.js"/>"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/raw@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/store/detailpb.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/js/dist/css/lightbox.css"/>">
<script src="<c:url value="/resources/js/dist/js/lightbox.js"/>"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/common/stringUtil.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body onload="myTimeWait()">
	<div id="pb_detail_container">
	<input type="hidden" id="hiddenRatingCnt" value="${storepb.ratingCnt}">
	<input type="hidden" id="hiddenPBNo" value="${storepb.pbNo}">
		<!-- 상단 컨테이너 --> 
		<div id="pb_detail_header_container">
			<div id="pb_detail_header_images">
				<div id="pb_detail_thumbnail_list">
					<c:forEach var="img" items="${imgList}" varStatus="status">
						<c:if test="${status.count != 1}">
							<a href="${img}" data-lightbox="gallery"> <img src="${img}">
							</a>
						</c:if>
					</c:forEach>
				</div>
				<div id="pb_detail_main_image">
					<a href="${imgList[0]}" data-lightbox="gallery"> 
					<img src="${imgList[0]}">
					</a>
				</div>
			</div>

			<div id="pb_detail_info">
				<div id="pb_detail_title">
					<p>${storepb.name}</p>
				</div>
				<div id="pb_detail_rating_point">
					<div class="storeRating">
					<input type="hidden" value="${storepb.rating}" name="storeRating">
						<div class="storeRating-backStar"></div>
						<div class="storeRating-frontStar-wrapper">
						<div class="storeRating-frontStar" style="width:${storepb.rating *20}%;"></div>

						</div>
					</div>
				</div>
				<div id="pb_detail_price">

					<p id="pb_detail_price_p">
						<fmt:formatNumber value="${storepb.price}" groupingUsed="true" />
						원
					</p>
				</div>
				
				<!-- 좋아요 -->
				<div class="pb_product_like">
					<div id="like_icon">
						<c:choose>
							<c:when test="${likeStatus eq 'Y'}">
								<img class="likeheart" id="likeNo" src="<c:url value='/resources/images/icons/like2.png'/>"/>
							</c:when>
							<c:when test="${likeStatus eq 'N'}">
								<img class="likeheart" id="likeYes" src="<c:url value='/resources/images/icons/like1.png'/>"/>
							</c:when>
							<c:otherwise>
								<img class="likeheart" id="likeLogin" src="<c:url value='/resources/images/icons/like1.png'/>"/>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div id="pb_detail_select_box">
					<div id="select_product_title">${storepb.name}</div>
					<div id="select_product_count">
						<p>
							<button id="count_minus">-</button>
						</p>
						<p id="total_count">1</p>
						<p>
							<button id="count_plus">+</button>
						</p>
						<p class="total__price">원</p>
					</div>
				</div>
				<div id="select_product_total-price">
					<p>총 주문금액</p>
					<p class="total__price" id="total__price">원</p>
				</div>
				<div id="pb_detail_btns">
               	<input type="hidden" name="memhidden" value="${sessionScope.user.memNo}">
					<button class="add_to_cart">장바구니</button>
					<button class="buy_now">구매하기</button>
				</div>
			</div>
		</div>

		<!-- 메뉴바 -->
		<div id="pb_detail_menubar">
			<div id="detail_product_info">
				<a href="#pb_info_move">&nbsp;상품정보&nbsp;</a>
			</div>
			<div id="detail_product_review">
				<a href="#pb_review_move">&nbsp;후기&nbsp;</a>
			</div>
			<div id="detail_product_inquire">
				<a href="#pb_inq_move">&nbsp;문의</a>
			</div>
		</div>

		<a id="pb_info_move"></a>
		<div id="product_info_detail">
			<div id="product_info">
				상품정보<br>
				<br>
			</div>
			<br>
			<br>
			<br>
		</div>
		
		<div id="hiddenValue" style="display: none">${storepb.content}</div>
		<div id="post-body"></div>

		<!-- 후기 -->
		<div id="pb_review_move"></div>
		<div id="pb_review_detail">
			<div id="pb_review_header">
				<div id="pb_review">
					후기<br>
					<br>
				</div>
				<br>
				<br>
				<button id="pb_review_writeform">후기쓰기</button>
			</div>

			<div class="review_con">
			</div>
			<div id="review-page"></div>
		</div>
		<!-- 후기 끝 -->


		<!-- 후기 작성 modal -->
		<form method="POST" enctype="multipart/form-data">
			<div id="reviewmodal" class="modal fade" tabindex="-1">
				<div class="moadl-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">x</button>
							<p class="modal-title">후기 작성</p>
						</div>
						<div class="modal-body">
							<div class="pb_insertform_container">
								<div class="pb_product_item">
									<div class="pb_product_item_img">
										<img src="${imgList[0]}">
									</div>
									<div class="pb_product_item_info">
										<p class="pb_product_item_name">${storepb.name}</p>
										
									</div>
								</div>
								<div class="pb_product_item_rating">
									<p class="rating_msg">별점을 눌러 만족도를 알려주세요.</p>
									<div class="check-stars">
										<div class="check-backStar"></div>
										<div class="check-frontStar-wrapper">
											<div class="check-frontStar"></div>
										</div>
									</div>
								</div>

								<div class="pb_reviewMap">
									<div class="pb_product_content">
										<textarea name="content" class="product__content" cols="60"
											rows="10" placeholder="상품에 대한 솔직한 후기가 궁금해요!"></textarea>
										<p class="review_images_msg">아래 + 를 눌러 이미지를 등록해주세요.</p>
									</div>
									<div class="review_images">
										<input type="file" name="img_file" id="img_file">
										<div id="preview_img_div">
											<div class="imgPlus">+</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-insert" id="insertmodalbtn">등록</button>
						</div>
					</div>
				</div>
			</div>
		</form>


		<!-- 문의 -->
		<div id="pb_inq_move"></div>
		<div id="pb_review_inquire_detail">
			<div id="pb_review_inquire_header">
				<div id="pb_review_inquire">
					문의<br>
					<br>
				</div>
				<br>
				<br>
				<button id="pb_inquire_writeform">문의하기</button>
			</div>

			<!-- 문의 내용 -->
			<div class="inquiry_con">
			</div>
			<div id="inq-page"></div>
		</div>
	</div>

	<!-- 문의 등록 modal -->
	<div id="inquiremodal" class="modal fade" tabindex="-1">
		<div class="moadl-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<p class="modal-title">문의 작성</p>
				</div>
				<div class="modal-body">
					<div class="pb_insertform_container">
						<div class="pb_product_item">
							<div class="pb_product_item_img">
								<img src="${imgList[0]}">
							</div>
							<div class="pb_product_item_info">
								<p class="pb_product_item_name">${storepb.name}</p>
							</div>
						</div>

						<div class="pb_reviewMap">
							<div class="pb_product_content">
								<textarea name="content" class="inquire__content" cols="60"
									rows="10" placeholder="상품에 대해 문의해주세요!"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-insert"
						id="inquireInsertmodalbtn">등록</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 문의 답변 등록 modal -->
	<div id="inquireAnswerModal" class="modal fade" tabindex="-1">
		<div class="moadl-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<p class="modal-title">문의 답변</p>
				</div>
				<div class="modal-body">
					<div class="pb_insertform_container">
						<div class="pb_answer_item">
							<div class="pb_inq_info">
								<p class="pb_inq_content_text">문의 내용</p>
								<p class="pb_inq_content_val"></p>
							</div>
						</div>

						<div class="pb_reviewMap">
							<div class="pb_product_content">
								<textarea name="content" class="inquire__answer__content" cols="60"
									rows="10" placeholder="문의에 답변 해 주세요!"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-insert"
						id="inq_answer_btn">등록</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 문의 수정 modal -->
	<div id="inquireupdatemodal" class="modal fade" tabindex="-1">
		<div class="moadl-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<p class="modal-title">문의 수정</p>
				</div>
				<div class="modal-body">
					<div class="pb_insertform_container">
						<div class="pb_product_item">
							<div class="pb_product_item_img">
								<img src="${imgList[0]}">
							</div>
							<div class="pb_product_item_info">
								<p class="pb_product_item_name">${storepb.name}</p>
							</div>
						</div>

						<div class="pb_reviewMap">
							<div class="pb_product_content">
								<textarea name="content" class="inquire__update__content"
									cols="60" rows="10" placeholder="상품에 대해 문의해주세요!"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-insert"
						id="inquireUpdatemodalbtn">수정</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 장바구니  modal -->
	<div id="cartmodal" class="modal fade" tabindex="-1">
		<div class="moadl-dialog">
			<div class="modal-content" id="cart-modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<div class="cartmodal_container">
						<div class="cartmodal_header">
							<p class="cartmodal_msg">장바구니에 상품을 담았습니다.</p>
							<div class="cartmodal_button">
								<div>
									<button class="cart_move_btn">장바구니 보러가기</button>
								</div>
								<div>
									<button class="cart_move_not_btn">계속 쇼핑하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		let session = '${sessionScope.user}';
		let sessionMemNo = '${sessionScope.user.memNo}';
		let managerAt = '${sessionScope.user.managerAt}';
		let pbNum = '${storepb.pbNo}';
		let likeImg2 = "<c:url value='/resources/images/icons/like2.png'/>";
		let likeImg1 = "<c:url value='/resources/images/icons/like1.png'/>";
		let userDefault = "<c:url value='/resources/images/default/userdefault.png'/>";
		let leftArrow = "<c:url value='/resources/images/icons/left-arrow.png'/>";
		let rightArrow = "<c:url value='/resources/images/icons/right-arrow.png'/>";
    </script>
    <script src="<c:url value="/resources/js/store/detailpb.js"/>"></script>
</body>
</html>