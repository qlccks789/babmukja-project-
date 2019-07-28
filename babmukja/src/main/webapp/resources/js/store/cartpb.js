// 총 결제 금액 및 개수
let orderPrice = 0;
let orderCnt = 0;
$(document).ready(function () {
	orderCnt = $(".pb_cart_product").length;
	$(".pb_cart_product").each(function () {
		let a = parseInt($(this).children().children().children(".total__price").text().replace(/,/g,"").replace('원',""));
		orderPrice += a;
	});
	$(".order_price").text(changeComma(orderPrice)+"원");
	$(".order_count").text(orderCnt);
});

// 장바구니 삭제
$(".product_delete_btn").click(function () {
	let num = $(this).parent().parent().siblings("input[name='hiddenNo']").val();
	let p = parseInt($(this).parent().siblings().children("#total__price").text().replace(/,/g,""));
	$.ajax({
		url: "/babmukja/store/deletepbcart.do",
		data : {
			cartNo : num
		}
	}).done(function () {
		if ($(".pb_cart_product").length == 1) {
  			$(".pb_cart_con").html("<p class='cartMSG'>장바구니에 상품이 존재하지 않습니다.</p><p class='cartMSG2'>상품을 담아주세요~!</p>");
		}
		$("#" + num).remove();
		orderPrice -= p;
		orderCnt--;
		$(".order_price").text(changeComma(orderPrice)+"원");
		$(".order_count").text(orderCnt);
	});
});

// 결제
$(".payment_btn").click(function () {
	let t = new Array();
	let obj = null;
	$(".pb_cart_product").each(function () {
		obj = new Object();
		obj.price = parseInt($(this).children().children().children(".total__price").text().replace(/,/g,"").replace('원',""));
		obj.pbNo = parseInt($(this).children("input[name='hiddenpbNo']").val());
		obj.prodCount = parseInt($(this).children().children().children("#total_count").text());
		obj.memNo = $("input[name='memhidden']").val();
		obj.cartNo = parseInt($(this).children("input[name='hiddencartNo']").val());
		t.push(obj);
	});
	
	let price= $(".order_price").text().replace(/,/g, "").replace("원", "");    // 상품 총 금액
    var IMP = window.IMP; // 생략가능
    IMP.init("imp21130958"); // 가맹점 식별 코드

    IMP.request_pay(
      {
        pg: "kakao", // 결제방식
        pay_method: "card", // 결제 수단
        merchant_uid: "merchant_" + new Date().getTime(),
        name: "BABMUKJA", // order 테이블에 들어갈 주문명 혹은 주문 번호
        amount: price, // 결제 금액
        buyer_name: "", // 구매자 이름
        buyer_tel: "", // 구매자 전화번호
        m_redirect_url: "" // 결제 완료 후 보낼 컨트롤러의 메소드명
      },
      function(rsp) {
        if (rsp.success) {
        	$.ajax({
        		url: "/babmukja/store/pbpaymentinsert.do",
        		traditional : true,
        		dataType:"JSON",
        		contentType : 'application/json; charset=UTF-8',
        		type:"POST",
        		data: JSON.stringify(t),
        		success: function(result){
					if (result == 1) {
            			alert("결제가 완료되었습니다.");
    					location.href="buyList.do?memNo="+session;
					}
				}
        	});
          // 성공시
          var msg = "결제가 완료되었습니다.";
          msg += "고유ID : " + rsp.imp_uid;
          msg += "상점 거래ID : " + rsp.merchant_uid;
          msg += "결제 금액 : " + rsp.paid_amount;
          msg += "카드 승인번호 : " + rsp.apply_num;
        } else {
          // 실패시
          var msg = "결제를 취소하였습니다.";
          alert (msg);
        }
      }
    );
});

// 수량 조절 부분
let price = parseInt($("#total__price").text().replace(/,/g,""));
let cnt = $("#total_count").html();
//         $("#total__price").text(price * cnt + "원");
$("#total__price").text(changeComma($("#total__price").text()));

// 수량 늘리기 버튼
$(".count_plus").click(function () {
	let $this = $(this).parent();
	let cnt = $this.siblings("#total_count").text();
	let p = parseInt($this.siblings("#total__price").text().replace(/,/g,""));
	let p1 = p / cnt;  
    cnt++;
    
  $this.siblings("#total_count").text(cnt);
  $this.siblings("#total__price").text(p1 * cnt + "원");
  $this.siblings("#total__price").text(changeComma($this.siblings("#total__price").text()));
  orderPrice += p1;
  $(".order_price").text(changeComma(orderPrice)+"원");
});

// 수량 빼기 버튼
$(".count_minus").click(function () {
	let $this = $(this).parent();
	let cnt = $this.siblings("#total_count").text();
	let p = parseInt($this.siblings("#total__price").text().replace(/,/g,""));
	let p1 = p / cnt;

  if (cnt == 1) {
      alert("주문 개수는 1개 이상이어야 합니다.");
      return;
  }
  cnt--;

  $this.siblings("#total_count").text(cnt);
  $this.siblings("#total__price").text(p1 * cnt + "원");
  $this.siblings("#total__price").text(changeComma($this.siblings("#total__price").text()));
  orderPrice -= p1;
  $(".order_price").text(changeComma(orderPrice)+"원");
});