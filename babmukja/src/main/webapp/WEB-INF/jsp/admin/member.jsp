<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="<c:url value="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value="/resources/css/admin/adminmember.css"/>">
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/datatables.css"/>"/>
<script type="text/javascript" src="<c:url value="/resources/js/DataTables/DataTables-1.10.18/js/jquery.dataTables.js"/>"></script>
<!-- MODAL bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<title>회원 관리</title>
</head>
<body>

	<div id="main">
		<div id="main-header">
			<h2>회원 관리</h2>

		</div>

		<div id="search-output">

			<div>
				<div id="search-output-list">
					<table id="searchResult">
						<thead>
							<tr>
								<th>체크</th>
								<th>회원 번호</th>
								<th>이메일</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>가입일</th>
								<th>최종 접속일</th>
								<th>총 구매액</th>
								<th>총 판매액</th>
								<th>레시피 개수</th>
								<th>상품 개수</th>
								<th>포인트</th>
								<th>등급</th>
							</tr>
						</thead>
						<tbody class="row-border hover order-column" style="width:100%">
							<c:forEach var="m" items="${list}">
								<tr>
									<td><input type="checkbox"></td>
									<td><a class="detailButton" href="#">${m.memNo }</a></td>
									<td>${m.memEmail }</td>
									<td>${m.memNickname }</td>
									<td><a
										href="<c:url value='/admin/memberdetail.do?no=${m.memNo }'/>">${m.memName }</a></td>
									<td><fmt:formatDate value="${m.signDate }"
											pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatDate value="${m.lastDate }"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${m.totalBuy }</td>
									<td>${m.totalSel }</td>
									<td>${m.recipeCnt }</td>
									<td>${m.sellingCnt }</td>
									<td>${m.point }</td>
									<td>${m.gradeName }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>체크</th>
								<th>회원 번호</th>
								<th>이메일</th>
								<th>닉네임</th>
								<th>이름</th>
								<th>가입일</th>
								<th>최종 접속일</th>
								<th>총 구매액</th>
								<th>총 판매액</th>
								<th>레시피 수</th>
								<th>상품 수</th>
								
								<th>포인트</th>
								<th>등급</th>
							</tr>
						</tfoot>
					</table>
					
				</div>
			</div>
		</div>
	</div>

	<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document" style="min-width:1100px">
    <div class="modal-content" style="width:1100px;">

      <div class="modal-body">
        
			<!-- 	datatables -->
				<div id="profile-main">
			        <div id="profile-left">
			            <div id="profile-left-photo">
			                <img  id="modal-input-profilephoto" src="<c:url value="/resources/images/profile13.jpg"/>">
			            </div>
			            <div id="profile-left-contact">
			                <h3>CONTACT</h3>
			                <div class="underline"></div>
			                <div>
			                    <i class="fas fa-at"></i>
			                    <p id="modal-input-email"></p>
			                </div>
			                <div>
			                    <i class="fas fa-mobile-alt"></i>
			                    <p id="modal-input-phone"></p>
			
			                </div>    
			                <div>
			                    <i class="fas fa-map-marker-alt"></i>
			                    <p id="modal-input-addr_default"><br> <b id="modal-input-addr_detail"></b></p>
			                </div>    
			            </div>
			            <div id="profile-left-simpledata">
			                <h3>팔로우/팔로워</h3>
			                <div class="underline"></div>
			                <div>
			                    <i class="fas fa-user-friends"></i>
			                    <P><b id="modal-input-follow"></b> / <b id="modal-input-follower"></b></P>
			                </div>
			                <h3>좋아요 누른 게시물</h3>
			                <div class="underline"></div>
			                <div>
			                    <i class="far fa-heart"></i>
			                    <P id="modal-input-like"></P>
			                </div>
			                <h3>스크랩한 게시물</h3>
			                <div class="underline"></div>
			                <div>
			                    <i class="fas fa-paperclip"></i>
			                    <P id="modal-input-scrap"></P>
			                </div>
			            </div>
			        </div>
			        <div id="profile-right">
			            <div id="profile-right-header">
			                <h5 id="modal-input-memNo"></h5>
			                <h2 class="modal-input-memNickname"></h2>
			                <hr>
			                <h3 id="modal-input-keyword"></h3>
			            </div>
			            <div id="profile-right-body">
			
			                <h4>보유 포인트</h4>
			                <div id="profile-right-point">
			                    <div id="point"><h3 id="point-value"></h3></div>
			                </div>
			                <p id="grade"> <b class="modal-input-memNickname"></b>님은 <b id="modal-input-grade"></b>입니다.</p>
			                    
			                <h4>구매 현황</h4>
			                <table class="totalTable" id="totalbuy">
			                    <thead>
			                        <tr>
			                            <th>주문 번호</th>
			                            <th>판매 회원	</th>
			                            <th>구매 회원	</th>
			                            <th>주문 수량	</th>
			                            <th>상품 수령 여부	</th>
			                            <th>총 결제 금액	</th>
			                            <th>송장 번호</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr  id="modal-input-totalbuy">
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                        </tr>
			
			                    </tbody>
			                    <tfoot>
			                        <tr>
			                            <th>주문 번호</th>
			                            <th>판매 회원	</th>
			                            <th>구매 회원	</th>
			                            <th>주문 수량	</th>
			                            <th>상품 수령 여부	</th>
			                            <th>총 결제 금액	</th>
			                            <th>송장 번호</th>
			                        </tr>
			                    </tfoot>
			                </table>
			                <h4>판매 현황</h4>
			                <table class="totalTable" id="totalsell">
			                    <thead>
			                        <tr>
			                            <th>주문 번호</th>
			                            <th>판매 회원	</th>
			                            <th>구매 회원	</th>
			                            <th>주문 수량	</th>
			                            <th>상품 수령 여부	</th>
			                            <th>총 결제 금액	</th>
			                            <th>송장 번호</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr id="modal-input-totalsell">
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                            <td>1</td>
			                        </tr>
			                    </tbody>
			                    
			                </table>
			
			            </div>
			
			        </div>
			    </div>		
			<!-- 	datatables -->


      </div>

    </div>
  </div>
</div>
	
	<script>
	    $(document).ready(function() {
	        $('#totalbuy').DataTable({
	            "order":[[0,"asc"]]
	        });
	        $('#totalsell').DataTable({
	            "order":[[0,"asc"]]
	        });
	    
	        // Setup - add a text input to each footer cell
            $('#searchResult tfoot th').each( function () {
                var title = $(this).text();
                $(this).html( '<input type="text" class="searchForm" placeholder="'+title+'" />' );
            } );
        
            // DataTable
            var table = $('#searchResult').DataTable({
                "order":[[1,"asc"]]
            });
        
            // Apply the search
            table.columns().every( function () {
                var that = this;
        
                $( 'input', this.footer() ).on( 'keyup change', function () {
                    if ( that.search() !== this.value ) {
                        that
                            .search( this.value )
                            .draw();
                    }
                } );
            } );
            
            $('.row-border')
            .on( 'mouseenter', 'td', function () {
                var colIdx = table.cell(this).index().column;
     
                $( table.cells().nodes() ).removeClass( 'highlight' );
                $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
            } );
            
	    });

		
		$("#detail_button").click(function() {
			$("#detail-search").css("display", "block");
		});
		
		$(".selector").flatpickr({
			enableTime : true,
			dateFormat : "Y-m-d"
		});
		$(".selector2").flatpickr({
			enableTime : true,
			dateFormat : "Y-m-d H:i"
		});
		
		
		
		$(".detailButton").click(function(){
			let no = $(this).text();

			$.ajax({
				url: "memberdetail.do",
				data : {memNo : no}
			}).done(function(response){
				console.dir(response);
				let member = response;
				$('#modal-detail').modal("show");
				
				let grade = "";
				
				switch(member.gradeNo){
					case 0:
						grade = "신규회원"; break;
					case 1:
						grade = "일반회원"; break;
					case 2:
						grade = "우수회원"; break;
					case 3:
						grade = "VIP회원"; break;
				}
				
				$("#modal-input-email").text(member.memEmail);
				$("#modal-input-phone").text(member.memPhone);
				$("#modal-input-addr_default").text(member.addrDefault);
				$("#modal-input-addr_detail").text(member.addrDetail);
				$("#modal-input-follow").text("10");
				$("#modal-input-follower").text("110");
				$("#modal-input-like").text("1" + '개');
				$("#modal-input-scrap").text("3" + '개');
				$("#modal-input-memNo").text(member.memNo+".");
				$(".modal-input-memNickname").text(member.memNickname);
				$("#modal-input-keyword").text("#" + "아직 없다 키워드");
				$("#point-value").text(member.point);	
				$("#modal-input-grade").text(grade);	
			
			});
			
			return false;
		});
		
		
		
	</script>
</body>
</html>