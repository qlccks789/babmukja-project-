<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<c:url value="/resources/js/jquery-3.2.1.js"/>"> </script> <script
        src='<c:url value="/resources/js/meetup/meetup_address.js"/>'> </script>
    <!--     <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
        integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <!--모달 부분  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!--     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
    <!--         integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
    <!--         crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <!-- modal address js -->
    <!--<script type="text/javascript" src="/resources/js/meetup_main_modal_address.js"></script>-->
    <script src='<c:url value="/resources/js/meetup/meetup_main_search_address.js"/>'> </script>

    <!-- maincss -->
    <link href="<c:url value="/resources/css/meetup/meetup_main.css"/>" rel="stylesheet" type="text/css">

    <script src='<c:url value="/resources/js/meetup/meetup_main_comma.js"/>'> </script>
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
  <!--로그인 여부 확인  -->
  
  
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
                        <span class="location_add_minus">
                        	<i class="fas fa-plus-circle" id="main_add_location"></i>
                            &nbsp; 
                            <i class="fas fa-minus-circle" id="main_substract_location"></i>
                        </span>
                    </div>
                    <div class=" location_position" id="location_position">

                    </div>
                </div>

                <div class="food_type_container">
                    <div class="food_type_title">카테고리</div>
                    <div class="food_type_position">

                        <input type="checkbox" name="category" value="total"> 전체
                        <input type="checkbox" name="category" value="total"> 한식
                        <input type="checkbox" name="category" value="total">중식
                        <input type="checkbox" name="category" value="total">일식
                        <input type="checkbox" name="category" value="total">양식
                        <input type="checkbox" name="category" value="total">동남아시아
                        <input type="checkbox" name="category" value="total">기타

                    </div>
                </div>
                <div class="monthly_fee_container">
                    <div class="monthly_fee_title">월 회비</div>
                    <div class="monthly_fee_position">

                        <input type="checkbox" name="fee" value="all" />무관
                        <input type="checkbox" name="fee" value="10000" />만원 이하
                        <input type="checkbox" name="fee" value="30000" />3만원 이하
                        <input type="checkbox" name="fee" value="50000" />5만원 이하
                        <input type="checkbox" name="fee" value="100000" />10만원 이하
                    </div>
                </div>
                <!--클릭 후  끝 -->
            </div>
        </form>
        
        
        <div class="create_manage_container"> 
        	<span class="header_meetup_create">모임개설</span>
        	<span class="header_meetup_manage">모임관리</span>
       	</div>
        
        <!-- 추천모임부분 시작 -->
        <div class="recommend_div"> <!-- recommend_div -->
        
            <div class="recommend_title">추천모임</div>

            <!-- 추천모임 탭 시작 -->
            <div class="tabContainer">
                <table class="selectTab">
                    <tr>
                        <td>전체</td>
                        <td>한식</td>
                        <td>중식</td>
                        <td>일식</td>
                        <td>양식</td>
                        <td>동남아시아</td>
                    </tr>
                </table>
            </div>


            <div class="tabPanel">
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <c:forEach var ="meetup" items="${selectAll}">
	                    <div class="info_block">
	                        <div class="info_pic"><img src="<c:url value='/meetup/download.do' />?path=${meetup.fileDir}" width="384px" height="190px">
	                        </div>
	                        <div class="info_line">${meetup.title}</div>
	                        <div class="info_monthly_fee">
	                            <span>${meetup.fee}</span>
	                        </div>
	
	                        <div class="info_bottom">
	                            <div class="bottom_location">
	                            	<span>
	                            		<i class="fas fa-map-marker-alt "></i>&nbsp;${meetup.location}
	                            	</span>
	                            </div>
	                            <div class="border_line"></div>
	                            <div class="bottom_view_count">
	                            	<span>
	                            		<i class="fas fa-eye"></i>&nbsp;${meetup.viewCnt}
	                            		<!-- hidden으로 번호값 넘겨주기 -->
	                            		 <input type="hidden"  name="recommendMeetNo" class="recommendMeetNo" value="${meetup.meetNo}">
	                            		
	     
	                            	</span>
	                            </div>
	                        </div>
	                    </div>
	                    
                    </c:forEach>
                    <!-- 추천모임 박스 복사끝 -->
                </div>
                <!-- 추천모임 박스 복사끝 -->
            </div>
            
           <!--한식모임 시작  --> 
         <div class="tabPanel">
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <c:forEach var ="meetup" items="${selectKorean}">
	                    <div class="info_block">
	                        <div class="info_pic"><img src="<c:url value='/meetup/download.do' />?path=${meetup.fileDir}" width="384px" height="190px">
	                        </div>
	                        <div class="info_line">${meetup.title}</div>
	                        <div class="info_monthly_fee">
	                            <span>${meetup.fee}</span>
	                           
	                        </div>
	
	                        <div class="info_bottom">
	                            <div class="bottom_location">
	                            	<span>
	                            		<i class="fas fa-map-marker-alt "></i>&nbsp;${meetup.location}
	                            	</span>
	                            </div>
	                            <div class="border_line"></div>
	                            <div class="bottom_view_count">
	                            	<span>
	                            		<i class="fas fa-eye"></i>&nbsp;${meetup.viewCnt}
	                            			<!-- hidden으로 번호값 넘겨주기 -->
	                            		 <input type="hidden"  name="recommendMeetNo" class="recommendMeetNo" value="${meetup.meetNo}">
	                            	</span>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    <!-- 추천모임 박스 복사끝 -->
                </div>
                <!-- 추천모임 박스 복사끝 -->
            </div>
        
           <!--양식모임 시작  --> 
         <div class="tabPanel">
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <c:forEach var ="meetup" items="${selectChinese}">
	                    <div class="info_block">
	                        <div class="info_pic"><img src="<c:url value='/meetup/download.do' />?path=${meetup.fileDir}" width="384px" height="190px">
	                        </div>
	                        <div class="info_line">${meetup.title}</div>
	                        <div class="info_monthly_fee">
	                            <span>${meetup.fee}</span>
	                        </div>
	
	                        <div class="info_bottom">
	                            <div class="bottom_location">
	                            	<span>
	                            		<i class="fas fa-map-marker-alt "></i>&nbsp;${meetup.location}
	                            	</span>
	                            </div>
	                            <div class="border_line"></div>
	                            <div class="bottom_view_count">
	                            	<span>
	                            		<i class="fas fa-eye"></i>&nbsp;${meetup.viewCnt}
	                            			<!-- hidden으로 번호값 넘겨주기 -->
	                            		 <input type="hidden"  name="recommendMeetNo" class="recommendMeetNo" value="${meetup.meetNo}">
	                            	</span>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    <!-- 추천모임 박스 복사끝 -->
                </div>
            </div>
            <!--양식  추천모임 박스 복사끝 -->
            
        
        
	     <!--일식모임 시작  --> 
         <div class="tabPanel">
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <c:forEach var ="meetup" items="${selectJapanese}">
	                    <div class="info_block">
	                        <div class="info_pic"><img src="<c:url value='/meetup/download.do' />?path=${meetup.fileDir}" width="384px" height="190px">
	                        </div>
	                        <div class="info_line">${meetup.title}</div>
	                        <div class="info_monthly_fee">
	                            <span>${meetup.fee}</span>
	                        </div>
	
	                        <div class="info_bottom">
	                            <div class="bottom_location">
	                            	<span>
	                            		<i class="fas fa-map-marker-alt "></i>&nbsp;${meetup.location}
	                            	</span>
	                            </div>
	                            <div class="border_line"></div>
	                            <div class="bottom_view_count">
	                            	<span>
	                            		<i class="fas fa-eye"></i>&nbsp;${meetup.viewCnt}
	                            			<!-- hidden으로 번호값 넘겨주기 -->
	                            		 <input type="hidden"  name="recommendMeetNo" class="recommendMeetNo" value="${meetup.meetNo}">
	                            	</span>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    <!-- 추천모임 박스 복사끝 -->
                </div>
            </div>
            <!--일식  추천모임 박스 복사끝 -->
            
            
            
               
	     <!--양식모임 시작  --> 
         <div class="tabPanel">
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <c:forEach var ="meetup" items="${selectWestern}">
	                    <div class="info_block">
	                        <div class="info_pic"><img src="<c:url value='/meetup/download.do' />?path=${meetup.fileDir}" width="384px" height="190px">
	                        </div>
	                        <div class="info_line">${meetup.title}</div>
	                        <div class="info_monthly_fee">
	                            <span>${meetup.fee}</span>
	                        </div>
	
	                        <div class="info_bottom">
	                            <div class="bottom_location">
	                            	<span>
	                            		<i class="fas fa-map-marker-alt "></i>&nbsp;${meetup.location}
	                            	</span>
	                            </div>
	                            <div class="border_line"></div>
	                            <div class="bottom_view_count">
	                            	<span>
	                            		<i class="fas fa-eye"></i>&nbsp;${meetup.viewCnt}
	                            			<!-- hidden으로 번호값 넘겨주기 -->
	                            		 <input type="hidden"  name="recommendMeetNo" class="recommendMeetNo" value="${meetup.meetNo}">
	                            	</span>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    <!-- 추천모임 박스 복사끝 -->
                </div>
            </div>
            <!--양식  추천모임 박스 복사끝 -->
            
             <!--동남아시아 모임 시작  --> 
         <div class="tabPanel">동남 아시아
                <!-- 추천모임 박스 -->
                <div class="info_block_container">
                    <!--1 추천모임 박스 복사시작 -->
                    <c:forEach var ="meetup" items="${selectEastAsia}">
	                    <div class="info_block">
	                        <div class="info_pic"><img src="<c:url value='/meetup/download.do' />?path=${meetup.fileDir}" width="384px" height="190px">
	                        </div>
	                        <div class="info_line">${meetup.title}</div>
	                        <div class="info_monthly_fee">
	                            <span>${meetup.fee}</span>
	                        </div>
	
	                        <div class="info_bottom">
	                            <div class="bottom_location">
	                            	<span>
	                            		<i class="fas fa-map-marker-alt "></i>&nbsp;${meetup.location}
	                            	</span>
	                            </div>
	                            <div class="border_line"></div>
	                            <div class="bottom_view_count">
	                            	<span>
	                            		<i class="fas fa-eye"></i>&nbsp;${meetup.viewCnt}
	                            			<!-- hidden으로 번호값 넘겨주기 -->
	                            		 <input type="hidden"  name="recommendMeetNo" class="recommendMeetNo" value="${meetup.meetNo}">
	                            	</span>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                    <!-- 추천모임 박스 복사끝 -->
                </div>
            </div>
            <!--동남아시아  추천모임 박스 복사끝 -->
	     
	       
	    </div><!-- recommend_div end -->
    <!-- 추천모임 탭 끝 -->

    <!-- 추천모임 박스 복사끝 -->

    <!-- 모달 부분 아래시작 -->
    <form id="modalForm" action="<c:url value='/meetup/createMeetup.do?hostNo=${sessionScope.user.memNo}'/>" method="POST" enctype="multipart/form-data">
        <div id="write_modal" class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">모임 개설하기</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    
                    <div class="modal-body">
                    
                        <!-- modal 이름 적는부분 -->
                        <div class="modal_meetup_name_container">
                            <div class="modal_meetup_name">
                                	카테고리/모임명
                            </div>
                            <div></div>
                            <!--방장과 방장번호 자동 선택  -->
                            <input type="hidden"  name="hostName" id="hiddenHostName" value="${sessionScope.user.memName}">
 							<input type="hidden"  name="hostNo" id="hiddenHostNo" value="${sessionScope.user.memNo}">
 							<input type="hidden"  name="hostEmail" id="hiddenHostEmail" value="${sessionScope.user.memEmail}">
 							
                            <div class="modal_meetup_category">
                                <select name="category" class="food_nation_category">
                                    <option value="카테고리">카테고리</option>
                                    <option value="한식">한식</option>
                                    <option value="중식">중식</option>
                                    <option value="일식">일식</option>
                                    <option value="동남아시아">동남아시아</option>
                                    <option value="양식">양식</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                            <div></div>
                            <div class="modal_meetup_name">
                                <input type="text" name="title" class="meetup_title" id="meetup_title" placeholder="모임명을 입력해주세요" />
                            </div>

                        </div>
                        
                        <!-- model tag 부분 -->
                        <div class="modal_meetup_tag_container">
                            <div class="tag1" id="modal_meetup_tag">태그</div>
                            <div class="tag2"></div>
                            
                            <div class="modal_meetup_tag_box">
                                <input type="text" name="tag" class="meetup_tag" value="#"/>
                                <input type="hidden" name="hiddenTag" class="meetup_hiddenTag" value=""/>
                            </div>
                         
                        </div>
                      
                      <!--  tagSelected-->
                      
                      <div class="modal_meetup_tagSelected_container">
                            <div id="modal_meetup_tagSelected"></div>
                            <div></div>
                            <div class="modal_meetup_tagSelected_box">
                            	
                           </div>
                      
                      </div>

                        <div class="modal_meetup_location_container">
                            <div class="location">활동지역</div>

                            <div class="modal_meetup_plus_container">
                                <div>
                                	<i class="fas fa-plus-circle" id="modal_location_plus"></i> 
                                	&nbsp;&nbsp; 
                                	<i class="fas fa-minus-circle" id="modal_location_minus"></i>
                               	</div>
                            </div>
                            <div></div>
                            <div class="modal_meetup_location_box"></div>
                        </div> <!-- location container 끝  -->


                        <!-- 요일선택 부분 -->
                        <div class="modal_meetup_day_container">
                            <div id="modal_meetup_day">요일선택</div>
                            <div></div>
                            <div class="modal_meetup_day_box">
                                <input type="checkbox" class="selectDay" id="selectMonday" name="day" value="월">
                                <label for="selectMonday" class="select_Day_label">월</label>
                                <input type="checkbox" class="selectDay" id="selectTuesday" name="day" value="화">
                                <label for="selectTuesday" class="select_Day_label">화</label>
                                <input type="checkbox" class="selectDay" id="selectWednesday" name="day" value="수">
                                <label for="selectWednesday" class="select_Day_label">수</label>
                                <input type="checkbox" class="selectDay" id="selectThursday" name="day" value="목">
                                <label for="selectThursday" class="select_Day_label">목</label>
                                <input type="checkbox" class="selectDay" id="selectFriday" name="day" value="금">
                                <label for="selectFriday" class="select_Day_label">금</label>
                                <input type="checkbox" class="selectDay" id="selectSaturday" name="day" value="토">
                                <label for="selectSaturday" class="select_Day_label">토</label>
                                <input type="checkbox" class="selectDay" id="selectSunday" name="day" value="일">
                                <label for="selectSunday" class="select_Day_label">일</label>
                            </div>
                        </div>

                        <div class="modal_meetup_fee_container">
                            <div class="modal_meetup_fee">월 회비</div>
                            <div></div>
                            <div class="modal_meetup_fee_checkbox">
                                <input type="radio" name="fee" class="modal_monthly_fee" value="na" id="notDefined" />미정
                            </div>
                            <div class="modal_meetup_fee_inputbox">
                                <input type="radio" name="fee" value="personal" class="modal_monthly_fee" id="Defined" />
                                <input type="text" name="detailFee" class="modal_fee_input" id="DefinedDetail" placeholder="액수를 입력해 주세요" />원
                            </div>
                        </div>
                        
                        <div class="modal_meetup_mainPic_container">
                            <div class="modal_meetup_mainPic">메인사진 설정</div>
                            <div></div>
                            <div class="modal_meetup_mainPic_box">
                                <!-- 부트스트랩 적용 -->
                                <div class="file-upload">
                                    <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">사진 첨부하기</button>

                                    <div class="image-upload-wrap">
                                        <input class="file-upload-input" type='file' name='file' onchange="readURL(this);" accept="image/*" />
                                        <div class="drag-text">
                                            <h3>Drag and drop a file or select add Image</h3>
                                        </div>
                                    </div>
                                    <div class="file-upload-content">
                                        <img class="file-upload-image" src="#" alt="your image" />
                                        <div class="image-title-wrap">
                                            <button type="button" onclick="removeUpload()" class="remove-image">삭제하기
                                                <span class="image-title">Uploaded Image</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 모델 바디 끝  -->

                    </div>
                    
                    <div class="modal-footer">
                        <button type="button"  class="btn btn-secondary" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary" id="modalSave">등록하기</button>
                    </div>

                </div>
            </div>


        </div>
    </form> <!-- check -->
    <!--form tag-->
    <!--위까지 모달 부분 끝 -->

    <!--메인 컨테이너 끝 -->
    </div>
    <!--  <script type="text/javascript" src="/resources/js/meetup_main.js"></script>-->
    <script src='<c:url value="/resources/js/meetup/meetup_main.js"/>'> </script>
	<!--주소 불러오기  -->
    <script src='<c:url value="/resources/js/meetup/meetup_main_modal_address.js"/>'> </script>


    </body>

</html>