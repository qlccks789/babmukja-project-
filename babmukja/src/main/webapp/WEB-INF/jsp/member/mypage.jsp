<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Kitchen</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="<c:url value="/resources/css/member/mypage.css"/>">
  	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/js/DataTables/DataTables-1.10.18/css/jquery.dataTables.1.css"/>"/>
	<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/images/favicon.png'/>">
	<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/DataTables/DataTables-1.10.18/js/jquery.dataTables.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/modernizr.2.5.3.min.js"/>"></script>
   	<script type="text/javascript" src="<c:url value="/resources/js/hash.js"/>"></script>
	
</head>
<body>
    <div id="open-filter">
        <p>"<b id="memNickname">${user.memNickname}</b>'s KITCHEN"</p>
        <input type="hidden" name="memNo" value="${user.memNo}">
        <input type="hidden" name="memEmail" value="${user.memEmail}">
        <input type="hidden" name="follow" value="${user.follow}">
        <input type="hidden" name="follower" value="${user.follower}">
        <input type="hidden" name="recipeCnt" value="${user.recipeCnt}">
        <input type="hidden" name="followStatus" value="${followStatus}">
        <input type="hidden" name="visitor" value="${sessionScope.user.memNo}">
    </div>
    <div id="container">
    </div>
	<div class="modal fade" id="modal-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document" style="min-width:1100px;margin:0 auto;margin-top:70px;">
				<div class="modal-content" id="recipe-content" style="width:1200px; height: 700px;margin:0 auto;">
					
					<div class="modal-body">
						<table id="writtenrecipe">
							<thead>
								<tr>
									<th>제목</th>
									<th>작성일</th>
									<th> we</th>
									<th>평점</th>
									<th>좋아요 수</th>
									<th>스크랩 수</th>
								</tr>
							</thead>
							<tbody id="tbody">
								
							</tbody>
						</table>
					</div>
				</div>
		</div>
	</div>
	<!-- user info -->
	<div class="modal fade" id="modal-user-detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
			<div class="modal-dialog" role="document" style="min-width:1100px;margin:0 auto;margin-top:70px;">
				<div class="modal-content" style="width:800px; height: 400px;margin:0 auto;">
					
					
                        <input type="file" name="profile-picture" style="display:none;">
					    <div id="updateform-body">
					        <div id="updateform-sec1">
					            <c:choose>
					            	<c:when test="${sessionScope.user.memNickname == user.memNickname}">
							            <div id="updateform-sec1-menu1" style="background: white;">회원 정보</div>
							            <div id="updateform-sec1-menu2">비밀번호 변경</div>
					            	</c:when>
					            	<c:otherwise>
							            <div style="background: white;">회원 정보</div>
					            		<div style="background:gray;"></div>
					            	</c:otherwise>
					            </c:choose>
					        </div>
					        <div id="updateform-sec2">
					            <div id="check-userinfo">
					                <div id="updateform-sec2-imgSelector">
					                	<c:choose>
						                	<c:when test="${user.memImgPath == null}">
						                    	<img id="profile-picture" src="<c:url value="/resources/images/default/userdefault.png"/>">					                	
						                	</c:when>
						                	<c:otherwise>					                	
						                    	<img id="profile-picture" src="${pageContext.request.contextPath}/member/download.do?path=${user.memImgPath}&memNickname=${user.memNickname}&sysname=${user.memImgSysname}">
						                	</c:otherwise>
					                	</c:choose>
					                </div>
					                <div id="updateform-sec2-userinfo">
					                    <p id="updateform-sec2-userinfo-id">${user.memNickname}</p>
					                    <div id="updateform-sec2-userinfo-opt">
							            	<c:if test="${sessionScope.user.memNickname == user.memNickname}">
						                        <button id="profile-change-button">프로필 사진 변경</button>
				            				</c:if>
         					                <c:choose>
					                        	<c:when test="${followStatus eq 'Y' }">
					                        		<button id='follow-button'>팔로우 해제</button>
					                        		<p>팔로우 중</p>
					                        	</c:when>
					                        	<c:when test="${followStatus eq 'N' }">
					                        		<button id='follow-button'>팔로우</button>
					                        	</c:when>
					                        	<c:when test="${followStatus eq 'M' }">
					                        	</c:when>
					                        	<c:otherwise>
					                        		<button id="followLogin" class="follow">팔로우</button>   
					                        	</c:otherwise>
                        					</c:choose>  
					                    </div>
					                    <p id="updateform-sec2-userinfo-info">
								                        작성한 레시피<b>${user.recipeCnt}</b>
								                        팔로워<b id="follower-cnt">${user.follower}</b>
								                        팔로우<b>${user.follow}</b>
					                    </p>
					                </div>
					            </div>
					        </div>
					    </div>
					
				</div>
		</div>
	</div>
	<!-- scrapbook -->
	<div class="modal fade" id="modal-scrapbook" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document" style="margin: 0;">
			<div class="modal-content" id="scrapbook-content" style="width:1500px; height: 800px;margin:0 auto;">
					
				<div class="modal-body">
				
				 <div id="scrapbook-container">
			        <div id="scrapbook-add">
			            <p id="scrapbook-add-text1">
			               	 스크랩북을 생성하시려면<br>영역을 선택해주세요.
			            </p>
			            <p id="scrapbook-add-text2">+</p>
			            <p id="scrapbook-add-text3">자신만의 레시피북을<br>만들어보세요!</p>
			        </div>
			
			        <div id="scrapbook-wrapper">

			        </div>
			
			    </div>
				
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modal-scrapbook-creator" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document" style="min-width:1100px;margin:0 auto;margin-top:70px;">
			<div class="modal-content" style="width:500px; height: 600px;margin:0 auto;">
					
				
				    <div id="scrapbook-creator">
				        <p id="scrapbook-creator-header">스크랩북 생성</p>
				        <div id="scrapbook-creator-wrapper">
				            <div id="scrapbook-creator-wrapper-inner1">
				                <p>제목</p>
				                <input type="text" name="scrapbook-title" id="scrapbook-title">
				            </div>
				            <div id="scrapbook-creator-wrapper-inner2">
				                <div id="scrapbook-coverselector">
				                    <p id="scrapbook-coverselector-text">표지로 설정할 이미지를<br>업로드해주세요!</p>
				                </div>
				                    <input type="file" style="display:none;" name="bookcover">
				            </div>
				        </div>
				    </div>
					<div id="book-button">
			            <button id="book-create">생성</button>
			            <button id="book-cancel">취소</button>
			        </div>
			</div>
		</div>
	</div>
	
	
	
    <script src="<c:url value="/resources/js/three/three.min.js"/>"></script>
    <script src="<c:url value="/resources/js/three/GLTFLoader.js"/>"></script>
    <script src="<c:url value="/resources/js/three/PointLight.js"/>"></script>
    <script src="<c:url value="/resources/js/three/DRACOLoader.js"/>"></script>
    <script src="<c:url value="/resources/js/three/three.interaction/build/three.interaction.js"/>"></script>
	<script src="<c:url value="/resources/js/three/DirectionalLight.js"/>"></script>
	<script src="<c:url value="/resources/js/three/GeometryUtils.js"/>"></script>

	<script src="<c:url value="/resources/js/turn.min.js"/>"></script>
	<script src="<c:url value="/resources/js/three/mypage.js"/>"></script>
	<script src="<c:url value="/resources/js/three/scrapbook.js"/>"></script>
    
</body>
</html>