    let imgArr= ["a","b","c","d","e","f","g","h","i","j"];
    
    $(document).ready(function () {
    	$("#reviewmodal").modal("hide");
    	$("#reviewUpdatemodal").modal("hide");
    	$("#inquiremodal").modal("hide");
    	$("#inquireupdatemodal").modal("hide");
    	$("#cartmodal").modal("hide");
    	$("#inquireAnswerModal").modal("hide");
    });
    
    $("#pb_review_writeform").click(function () {
    	if (session != "") {
  	      $("#reviewmodal").modal("show");
      	} else {
      		alert("로그인 후 이용 가능합니다.");
      	}
    });
    
    $("#reviewmodal").modal({
      backdrop: 'static'
    });

    $("#inquireAnswerModal").modal({
      backdrop: 'static'
    });

    $("#reviewUpdatemodal").modal({
      backdrop: 'static'
    });
    
    $("#inquiremodal").modal({
    	backdrop: 'static'
    })
    
        $("a[href^='#']").click(function (event) {
            event.preventDefault();
            var target = $(this.hash);
            $('html, body').animate({scrollTop: target.offset().top}, 500);
        });

      $(document).ready(function () {
          var topBar = $("#pb_detail_menubar").offset();

          $(window).scroll(function () {
            var docScrollY = $(document).scrollTop()
            var barThis = $("#pb_detail_menubar")

            if (docScrollY > topBar.top) {
                barThis.addClass("top_bar_fix");
            } else {
                barThis.removeClass("top_bar_fix");
            }
          });
      });
    	
      
      
      // 수량 늘리기 줄이기.
      let price = parseInt($("#pb_detail_price_p").text().replace(/,/g,""));
      
      let cnt = $("#total_count").html();
      $(".total__price").text(price * cnt + "원");
      $(".total__price").text(changeComma($(".total__price:first").text()));
      $("#count_plus").click(function () {
          cnt++;
        $("#total_count").text(cnt);
        $(".total__price").text(price * cnt + "원");
	      $(".total__price").text(changeComma($(".total__price:first").text()));
      });

      $("#count_minus").click(function () {
        if (cnt == 1) {
            alert("주문 개수는 1개 이상이어야 합니다.");
            return;
        }
        cnt--;
        $("#total_count").text(cnt);
        $(".total__price").text(price * cnt + "원");
        $(".total__price").text(changeComma($(".total__price:first").text()));
        
      });
      
      // editor js 적용
      const value = $("#hiddenValue").text();
      const editor = new EditorJS({
          holderId: 'post-body',

          autofocus: false,
          data: JSON.parse(value),
          tools: { 
              warning: {
                  class: Warning,
                  inlineToolbar: true,
              },
   
              table: {
                  class: Table,
                  inlineToolbar: true,
              },                       
              quote: {
                  class: Quote,
                  inlineToolbar: true,
              },
				image: {
                  class: ImageTool,
              },            

              header: {
                  class: Header,
              }, 
              checklist: {
                  class: Checklist,
              },
              marker: {
                  class: Marker,
              },
              list: {
                  class: List,
              },
              embed: {
                  class: Embed,
              }
          }
      });
	
      // editor.js 커버 div
     function myTimeWait(){
	   
  	   	$("#post-body").append($("<div></div>").css({zIndex:"50","position":"absolute","width":"100%","height":"100%",top:"0px",left:"0px",background:"rgba(0,0,0,0)"}));	    
     }

     // 후기 모달 이미지 부분
   	   let index = 0;
       $(".imgPlus").click(function () {
          $("#img_file").click();
       });
     
		let imgCnt = 0;
		
		let idx = 0;
		let fileList = {};
		
		let reviewData = new FormData();
		
       $("#img_file").change(function (e) {
   	   	  let path = $(this).val();
		  let imgKey = imgArr.pop();
		  fileList[imgKey] = e.target.files[0];
		  idx++;

			var reader = new FileReader();
            reader.readAsDataURL(e.target.files[0]);


            reader.onload = function () {
                var tempImage = new Image();
                
                tempImage.src = reader.result;
                
                tempImage.onload = function () {
                    var canvas = document.createElement('canvas');
                    var canvasContext = canvas.getContext("2d");

                    canvas.width = 100;
                    canvas.height = 100;

                    canvasContext.drawImage(this, 0, 0, 100, 100);
                    
                    var dataURI = canvas.toDataURL("image/jpeg");
	
					imgCnt++;
                    var imgTag = "<div class='image_box' id='idx"+idx+"'><img name='preview_img"+imgCnt+"' class='preview_img' src='"+dataURI+"'/><div id='"+imgKey+"' class='preview_img_btn' >x</div></div>";
						
                    if(imgArr.length == 0){
                    	$(".imgPlus").hide();
                    }
                    
                    $("#preview_img_div").prepend(imgTag);
					
                    if(imgArr.length > 5){						
	                    $(".modal-backdrop").css({height:"1100px"});
					}
                };
            };
       });
       
       // review 등록 - 체크포인트
       $("#insertmodalbtn").click(function () {
    	   let content = $(".product__content").val();
    	   let rating = $("input[name='reviewStars']:checked").val();
    	   let ratingCnt = $("#hiddenRatingCnt").val();
    	   let storeRating = $("input[name='storeRating']").val();
	   	   if (content == null || content == '') {
	   		  alert("내용을 입력해주세요.");
	   		  return;
		   }
	   	   if ($(".check-frontStar").css("width") == "0px") {
	   		   alert("별점을 선택해주세요.");
	   		   return;
	   	   }
	   	   
    	   reviewData.append("content",content );
    	   reviewData.append("pbNo", pbNum);
    	   reviewData.append("rating", checkedValue);
    	   reviewData.append("ratingCnt", ratingCnt);
    	   reviewData.append("storeRating", storeRating );
    	   for(key in fileList){
    		   reviewData.append("imageList", fileList[key]);
    	   }
			$.ajax({
				type:"POST",
				processData:false,
				contentType:false,
				url : "/babmukja/store/pbreviewinsert.do",
				data : reviewData,
				success: function(avg){
					alert("후기가 등록되었습니다.");
					location.href="detailpb.do?pbNo="+pbNum;
				}
			});
       });
       
       // review 사진 삭제
		$(document).on("click",".preview_img_btn",function () {
			let key = $(this).attr("id");
			delete fileList[key];
			imgArr.push(key);
 		   $(this).parent().remove(); 
 	   });
		
		// 문의 모달 오픈
		$("#pb_inquire_writeform").click(function () {
			if (session != "") {
				$("#inquiremodal").modal("show");
			} else {
				alert("로그인 후 이용 가능합니다.");
			}
		});
		
		// 문의 등록 버튼
		$("#inquireInsertmodalbtn").click(function () {
			let inquireData = new FormData();
    	   	let content = $(".inquire__content").val();
    	   	if (content == null || content == '') {
    	   		alert("내용을 입력해주세요.");
    	   		return;
    	   	}
    	   	inquireData.append("content", content);
    	   	inquireData.append("pbNo", pbNum);
			$.ajax({
				type:"POST",
				processData:false,
				contentType:false,
				url : "/babmukja/store/pbinquiryinsert.do",
				data : inquireData,
				success: function(result){
					alert("문의가 등록되었습니다.");
					location.href="detailpb.do?pbNo="+pbNum;
				}
			});
		});
		
		// 문의 답변 modal 오픈
		let inqNoData = new FormData();
		$(document).on("click", ".pb_inq_admin_answer_btn", function () {
			$("#inquireAnswerModal").modal("show");
			let inquiryNo = $(this).siblings("input[name='inquiryNo']").val();
			inqNoData.append("inquiryNo", inquiryNo);
			$.ajax({
				url: "/babmukja/store/insertanswerform.do",
				data : {
					inquiryNo : inquiryNo
				}
			}).done(function (response) {
				$(".pb_inq_content_val").text(response.content);
			});
		});
		
		// 문의 답변
		$("#inq_answer_btn").click(function () {
			let inqNo = inqNoData.get("inquiryNo");
			let content = $(".inquire__answer__content").val();
			$.ajax({
				url: "/babmukja/store/insertanswer.do",
				data : {
					inquiryNo : inqNo,
					answer : content,
					answerStatus : "N"
				}
			}).done(function (result) {
				alert("문의 답변이 등록되었습니다.");
				location.href="detailpb.do?pbNo="+pbNum;
			});
		});
		
		// 문의 수정 모달 오픈
		let inqData = new FormData();
		$(document).on("click", ".inq_update_btn", function () {
			$("#inquireupdatemodal").modal("show");
			let inquiryNo = $(this).siblings("input[name='inquiryNo']").val();
			inqData.append("inquiryNo", inquiryNo);
			$.ajax({
				url: "/babmukja/store/pbinquiryupdateform.do",
   	  			data : {
   	  				inquiryNo : $(this).siblings("input[name='inquiryNo']").val()
   	  			}
			}).done(function (response) {
				$(".inquire__update__content").val(response.content);
			});
		});
		
		// 문의 수정
		$(document).on("click", "#inquireUpdatemodalbtn", function () {
			let inqNo = inqData.get("inquiryNo");
			let inqContent = $(".inquire__update__content").val();
			inqData.append("content", inqContent)
			$.ajax({
				url: "/babmukja/store/pbinquiryupdate.do",
				data: {
					inquiryNo : inqNo,
					content : inqContent
				}
			}).done(function (response) {
				alert("문의 수정이 완료되었습니다.");
				location.href="detailpb.do?pbNo="+pbNum;
			});
		});

		// 결제
		$(".buy_now").click(function () {
			if (session != "") {
				let t = new Array();
				obj = new Object();
				obj.price= $("#total__price").text().replace(/,/g, "").replace("원", "");    // 상품 총 금액
				obj.pbNo = pbNum;	  					// 해당 상품 번호
				obj.prodCount = $("#total_count").text();			// 상품 개수
				obj.memNo = $("input[name='memhidden']").val();
				t.push(obj);
				let price = $("#total__price").text().replace(/,/g, "").replace("원", "");    // 상품 총 금액
				
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
			            			location.href = "mainpb.do";
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
		              var msg = "결제에 실패하였습니다.";
		              msg += "에러내용 : " + rsp.error_msg;
		            }
		          }
		        );
			} else {
				alert("로그인 후 이용 가능합니다.");
			}
		});
		
		// 장바구니
		$(".add_to_cart").click(function () {
			if (session != "") {
				let price= $("#total__price").text().replace(/,/g, "").replace("원", "");    // 상품 총 금액
				let count = $("#total_count").text();			// 상품 개수
				let memNo = $("input[name='memhidden']").val();
				$.ajax({
					url: "/babmukja/store/pbcartinsert.do",
					data : {
						pbNo : pbNum,
						price : price,
						prodCount : count,
						memNo : memNo
					}
				}).done(function () {
					$("#cartmodal").modal("show");
					$(".cart_move_btn").click(function () {
						location.href = "cartpb.do?memNo="+memNo;
					});
					$(".cart_move_not_btn").click(function () {
						location.href="detailpb.do?pbNo="+pbNum;
					});
					
				});
			} else {
				alert("로그인 후 이용 가능합니다.");
			}
		});
		
		// 후기 별점부분
        let checkedValue = 0;
        let $checkStar = $(".check-frontStar");
		 $(".check-stars").mouseover(function(e){
	            let x,y;
	            $(this).mousemove(function(e){
	                let x = e.offsetX;
	                if(x <= 60){
	                	$checkStar.css({width: "60px"});
	                    checkedValue = 1;
	                }else if(x <= 120){
	                	$checkStar.css({width: "120px"});
	                    checkedValue = 2;
	                }else if(x <= 180){
	                	$checkStar.css({width: "180px"});
	                    checkedValue = 3;
	                }else if(x <= 240){
	                	$checkStar.css({width: "240px"});
	                    checkedValue = 4;
	                }else if(x <= 300){
	                	$checkStar.css({width: "300px"});
	                    checkedValue = 5;
	                	
	                }else{
	                	$checkStar.css({width: "0px"});
	                	checkedValue = 0;
	                }
	            })   
	        }).click(function(){
            	let widthVal = checkedValue * 60;
            	$checkStar.css({width: widthVal + "px"});
            });
		 
		 
		 // 상품 좋아요 버튼
		 $(".likeheart").click(function () {
			 if (session != "") {
				 $.ajax({
					 url : "pblike.do",
					 data : {
						 'pbNo' : pbNum,
						 'memNo' : sessionMemNo
					 },
					 success : function (result) {
						 if (result.status == 'Y') {
							 $(".likeheart").attr("src", likeImg2);
						 } else if (result.status == 'N') {
							 $(".likeheart").attr("src", likeImg1);
						 } else {
							 $(".likeheart").attr("src", likeImg2);
						 }
					 }
				 });
			 } else {
				 alert("로그인 후 이용 가능합니다.");
			 }
		 });
		 
		 // 날짜 변환 함수
		 function getFormatDate(date) {
			 var year = date.getFullYear();
			 var month = (1 + date.getMonth());
			 month = month >= 10 ? month : '0' + month;
			 var day = date.getDate();
			 day = day >= 10 ? day : '0' + day;
			 return year + '-' + month + '-' + day;
		 }
		 
		 
		 // 후기 전체조회 ajax 페이징 부분
		 function  detailpbAjax(pageNo){
			 pageNo = pageNo - 1;
			 let index = pageNo * 3;
			 $.ajax({
				 url : "/babmukja/store/pbReviewAjax.do",
				 data : {
					 'pbNo' : pbNum,
					 'pageNo' : pageNo,
					 index : index
				 },
				 success : function (result) {
					 console.dir(result);
					 let html = '';
						for(let i=0; i < result.list.length;i++){
							html+='<div class="pb_review_body" id="'+result.list[i].pbReviewNo+'">'
							html+='		<div class="pb_review_profile">';
							html+='			<div class="pb_review_profile_img">';
							if (session != null) {
								if (result.list[i].member.memImgPath == null || result.list[i].member.memImgPath == '') {
									html+='<img id="default_profile_imges" src="'+userDefault+'">';
								} else {
									html+='<img id="user_profile_imges" src="/babmukja/member/download.do?path='+result.list[i].member.memImgPath+'&sysname='+result.list[i].member.memImgSysname+'">';
								}
							}
							html+='			</div>';
							html+='		<div class="pb_review_user_info">';
							html+='		<div class="user_info_sec1">';
							html+='			<div class="review_flex">';
							html+='		<p class="review_user_nickname">'+result.list[i].member.memNickname+'</p>';
							html+='		<div class="review_date">';
							html+=		  getFormatDate(new Date(result.list[i].regDate));
							html+='		</div>';
							html+='	</div>';
							html+='	<div class="reviewBUTTON">';
							html+='		<input type="hidden" name="pbReviewNo" value="'+result.list[i].pbReviewNo+'">';
							if(sessionMemNo == result.list[i].member.memNo){
								html+='				<button class="reviewDeleteBTN">삭제하기</button>';
							}
							html+='	</div>';
							html+='</div>';
							html+='<div class="user_info_sec2">';
							html+='	<div class="stars">';
							html+='		<div class="backStar"></div>';
							html+='		<div class="frontStar-wrapper">';
							html+='			<div class="frontStar" style="width:'+result.list[i].rating*24+'px"></div>';
							html+='		</div>';
							html+='	</div>';
							html+='</div>';

							html+='	</div>';
							html+='</div>';
							html+='<div class="pb_review_select">';
							html+='	<div class="pb_review_select_content">';
							html+='		<p>'+result.list[i].content+'</p>';
							html+='	</div>';
							html+='	<div class="pb_review_select_img">';
							for(let j=0; j < result.list[i].reviewFile.length;j++){
								let file = result.list[i].reviewFile[j];
								html+='			<div>';
								html+='				<a href="downloadpb.do?path='+file.path +'&sysname='+file.sysname+'" data-lightbox="mygallery">';
								html+='					<img src="downloadpb.do?path='+file.path+'&sysname='+file.sysname+'">';
								html+='				</a>';
								html+='			</div>';
								
							}
							html+='	</div>';
							
							html+='		</div>';
							html+='</div>';
						}
						
						if (result.reviewMap.length == 0) {
							html+='<p class="reviewMSG">후기가 존재하지 않습니다.</p>';								
							html+='<p class="reviewMSG2">새 후기를 작성해주세요 !</p>';
						}
					$(".review_con").html(html);
					printPaging(result.pageResult);
				 }
			  });
		 }
		 
		 // 후기 페이징 번호
		 $(document).on("click","#review-page a",function(e){
	         e.preventDefault();
	         page = $(this).attr("href");         
	         $(".review_con").html("");
	         detailpbAjax(page);
	         $("#detail_product_review a").click();
	      });
		 
		 // 문의 페이징 번호
		 $(document).on("click","#inq-page a",function(e){
	         e.preventDefault();
	         page = $(this).attr("href");         
	         $(".inquiry_con").html("");
	         inqAjax(page);
	         $("#detail_product_inquire a").click();
	      });
		 
	     // 후기 페이징 함수
	     function printPaging(page) {
	    	 var str = "";
	    	 if(page.prev) {
	    		 str += "<div class='comment-prev'><a href='"+ (page.beginPage - 1) +"'><img class='left-arrow' src='"+leftArrow+"'/></a></div>";
	    	 }
			 for(var i = page.beginPage; i <= page.endPage; i++) {
				 if (page.pageNo == (i-1)) {
					 str += "<div class='this-review-page'><a href='"+ i +"'>" + i + "</a></div>";
				 } else {
					 str += "<div class='review-pagination'><a href='"+ i +"'>" + i + "</a></div>";
				 }
			 }
			 if(page.next) {
				 str += "<div class='comment-next'><a href='"+ (page.endPage + 1) +"'><img class='right-arrow' src='"+rightArrow+"'/></a></div>";
			 }
			 $("#review-page").html(str);
		};

		// 문의 페이징 함수
	     function inqPrintPaging(page) {
	    	 var str = "";
	    	 if(page.prev) {
	    		 str += "<div class='comment-prev'><a href='"+ (page.beginPage - 1) +"'><img class='left-arrow' src='"+leftArrow+"'/></a></div>";
	    	 }
			 for(var i = page.beginPage; i <= page.endPage; i++) {
				 if (page.pageNo == (i-1)) {
					 str += "<div class='this-inq-pagination'><a href='"+ i +"'>" + i + "</a></div>";
				 } else {
					 str += "<div class='inq-pagination'><a href='"+ i +"'>" + i + "</a></div>";
				 }
			 }
			 if(page.next) {
				 str += "<div class='comment-next'><a href='"+ (page.endPage + 1) +"'><img class='right-arrow' src='"+rightArrow+"'/></a></div>";
			 }
			 $("#inq-page").html(str);
		};
		 
	       // review 삭제
	       $(document).on("click", ".reviewDeleteBTN", function () {
	   	  		let num = $(this).siblings("input[name='pbReviewNo']").val();
	   	  		$.ajax({
	   	  			url: "/babmukja/store/pbreviewdelete.do",
	   	  			data: {
	   	  				pbReviewNo : num
	   	  			}
	   	  		}).done(function(response) {
	   	  			if ($(".pb_review_body").length == 1) {
		   	  			$(".review_con").html("<p class='reviewMSG'>후기가 존재하지 않습니다.</p><p class='reviewMSG2'>새 후기를 작성해주세요 !</p>");
	   	  			}
	   	  			$("#" + num).remove();
		   	  		detailpbAjax(1);
	   	  		});
	       });
	       
	       detailpbAjax(1);
	       
	       // 문의 전체조회 ajax 페이징 부분
	       function inqAjax(pageNo) {
	    	   pageNo = pageNo - 1;
	    	   let index = pageNo * 3;
	    	   $.ajax({
	    		   url: "/babmukja/store/pbInqAjax.do",
	    		   data : {
	    			   pbNo : pbNum,
	    			   pageNo : pageNo,
	    			   index : index
	    		   },
	    		   success : function (result) {
	    			   console.dir(result);
	    			   let html = '';
	    			   	for (let i = 0; i < result.list.length; i++) {
							html +='<div class="pb_inquire_body" id="'+result.list[i].inquiryNo+'">';
							html +='	<div id="pb_inquire_profile">';
							html +='		<div class="pb_inquire_header">';
							html +='			<div class="pb_inq_flex">';		
							if (result.list[i].answerStatus == 'Y') {
								html +='<p id="pb_inquire_state2">답변완료</p>';
							} else {
								html +='<p id="pb_inquire_state2">미답변</p>';
							}
							
                         	html += '</div>';
							html +='			<div class="pb_inq_flex">';		
                            html +='			<input type="hidden" name="inquiryNo" value="'+result.list[i].inquiryNo+'">';
                           	if (managerAt == 1) {
                           		if (result.list[i].answerStatus == 'N') {
                           			html +='<button class="pb_inq_admin_answer_btn">답변하기</button>';
                           		}
                           	}
                            if (sessionMemNo == result.list[i].member.memNo) {
                            	html+='<button class="inq_update_btn">수정</button>';
                            	html+='<p class="pb_inq_icon">ㅣ</p>';
                            	html+='<button class="inq_delete_btn">삭제</button>';
                            }
							html += '			</div>';				                                        
							html += '		</div>';
							
							html +='<div id="pb_inquire_nickname">';
							html +='<p id="pb_inquire_user_nickname">'+result.list[i].member.memNickname+'</p>';
							html +='<p id="pb_inquire_user_regdate">'+getFormatDate(new Date(result.list[i].inquiryRegdate));+'</p>';
							html += '</div>';
							
							html +='<div id="pb_inquire_Q&A">';
							html +='<p>';
							html +='	<span class="pb_inquire_q">Q</span>';
							html +='	<span id="pb_inquire_question">'+result.list[i].content+'</span>';
							html +='</p>';
							if (result.list[i].answerStatus == 'Y') {
								html +='<div class="pb_inquire_admin_answer">';
								html +='	<p class="pb_inquire_a">A</p>';
								html +='	<p class="pb_inquire_admin">관리자 답변</p>';
								html +='	<p class="pb_inquire_answer_regdate">'+getFormatDate(new Date(result.list[i].answerRegdate));+'</p>';
								html +='</div>';
								html +='<div class="pb_inq_answer_con" id="'+result.list[i].inquiryNo+'">';
								html +='	<p id="pb_inquire_admin_msg">안녕하세요 <span class="answer_mem_nickname">'+result.list[i].member.memNickname+'&nbsp</span>님</p>';
								html +='	<p id="pb_inquire_answer_content">'+result.list[i].answer+'</p>';
								html +='</div>';
							}
							html +='</div>'

							html += '	</div>';
							html +='<div id="pb_inquire_boder-bottom"></div>';
							html += '</div>';
	    			   		
	    			   	}
	    			   	if (result.list.length == 0) {
	    			   		html +='<p class="reviewMSG">문의가 존재하지 않습니다.</p>';
	    			   		html +='<p class="reviewMSG2">문의를 등록해주세요 !</p>';
	    			   	}
	    			   	$(".inquiry_con").html(html);
	    			   	inqPrintPaging(result.pageResult);
	    		   }
	    	   });
	       }
			
			// 문의 삭제
			$(document).on("click", ".inq_delete_btn", function () {
				let num = $(this).siblings("input[name='inquiryNo']").val();
				$.ajax({
					url: "/babmukja/store/pbinquirydelete.do",
					data: {
						inquiryNo : num
					}
				}).done(function (response) {
					if ($(".pb_inquire_body").length == 1) {
						$(".inquiry_con").html("<p class='reviewMSG'>문의가 존재하지 않습니다.</p><p class='reviewMSG2'>문의를 등록해주세요 !</p>");
					}
		  			$("#" + num).remove();
		  			inqAjax(1);
				})
			});
				       
	       	inqAjax(1);