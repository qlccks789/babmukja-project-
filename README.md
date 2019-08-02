# babmukja-project-

## 기획 의도

시중에 많은 요리 전문 사이트가 있으나 이들 사이트가 요리에 필요한 재료를 바로 구매할 수 없다는 점, 이용자들이 요리에 관한 관심을 키울 수 있는 커뮤니티 기능을 구현하지 않는 점 등이 아쉬움으로 남았다. 이에 레시피를 작성하고 쉽게 관리할 수 있으며 필요한 요리의 재료를 즉시 구매할 수 있는 사이트를 제작하고자 하였다. 또한 이용자 간 요리 모임을 만들 수 있는 기능까지 추가하였다.

## 프로젝트 진행 과정
### 총 7 주간 진행
- 1주차 : 프로젝트 기획
- 2주차 : 데이터 모델링
- 3 ~ 6주차 : 개발 기간
- 7주차 : 코드 리펙토링, 발표 준비 및 발표 후 

### 프로젝트 기술
- Back-End : Spring, myBatis, MySQL, Ajax
- Front-End : JavaScript, html, css, jQuery, jsp
- 협업 도구 : sourcetree, google spreadsheet, Trello

# 후기

### 개발의 즐거움을 느낄 수 있었다.
7주간 진행된 프로젝트를 마치며, 우선 1주차에 프로젝트 아이디어 회의 부터 7주차 발표까지 열심히 최선을 다한 팀장 및 팀원께 감사함을 느낀다.
단 한번의 트러블 없이 잘 협업해서 뿌뜻하게 프로젝트를 마무리 할 수 있어서 기쁘다.
개발 과정에서는 간단한 api는 예시만으로 충분히 구현이 가능했지만, editor.js 같은 경우에는 구현하는데 상당히 애를 먹었다.
국내에서 적용한 사례를 거의 찾지 못하였고, 해외에서도 사용한 사례가 많지 않아 공부하는데 어려움을 느꼈다.
하지만 몇일동안 잡고 공부하여 적용한 결과 더 큰 만족도를 얻을 수 있었다. 
팀원 개개인의 의사를 최대한 반영하여 모두 만족 할 수 있는 프로젝트를 완성한 것에 대해 큰 기쁨을 느낄 수 있었다.
몇일동안 머리를 쥐어 감싸도 풀리는 않는 문제들 또한 있었다. 하지만 팀원들과 같이 고민하고 공부하여 해결 할 수 있었다.
부족한 부분을 팀원들과의 협업을 통하여 매꾸어 가며 프로젝트를 완성한 것에서 협업의 중요함과 필요성을 느낄 수 있었다.

## 프로젝트 구현 영상
[![Video Label](https://img.youtube.com/vi/EgwHpzViGGU/0.jpg)](https://youtu.be/EgwHpzViGGU)

### 주요 기능
1. 레시피 - 레시피 작성(Editor.js)
* 레시피를 상징하는 키워드를 선택할 수 있으며, 직관적인 블럭 형태로 본문을 작성할 수 있음.
* 키워드 선택
* Editor.js를 이용한 블럭 형태의 게시글 작성
<img src="/img/reicpewrite.gif" width="700px" height="300px">
<img src="/img/recipewirte-body.jpg" width="700px" height="400px">
<img src="/img/editor-menubar.gif" width="700px" height="100px">
<img src="/img/editor-imgupload.gif" width="700px" height="250px">

2. 레시피 - 레시피 검색
* 메뉴바에서 나라별로 구분 기능
* 무한 스크롤로 페이징
* 키워드로 검색
<img src="/img/main-menubar.gif" width="700px" height="100px">
<img src="/img/infinitescroll.gif" width="700px" height="250px">
<img src="/img/searchrecipe.gif" width="700px" height="600px">

3. 레시피 - 레시피 상세 조회
* 작성자에 대한 팔로우 기능
* 게시글에 대한 좋아요 기능
* 댓글과 함께 평점 입력 기능
<img src="/img/recipedetail.gif" width="700px" height="350px">

4. 스토어 - 상품 조회 및 검색
* 상품 검색 및 정렬 기능
<img src="/img/storelist.gif" width="700px" height="350px">
<img src="/img/storelistsearch.gif" width="700px" height="350px">

5. 스토어 -  상품 상세 조회
* 상품에 대한 좋아요 기능
* 상품에 대한 후기(별점)와 문의를 남길 수 있음
* 상품 수량 변경 후 장바구니에 추가 기능
* 장바구니 추가 후, 계속 쇼핑하거나 장바구니로 이동할 수 있음 (장바구니는 상단 메뉴바의 오른쪽 장바구니 버튼을 클릭해도 이동할 수 있다)
* 결제 완료 시 결제 내역화면으로 이동 (결제 내역은 마이페이지에서 확인 가능)
<img src="/img/storedetail.gif" width="700px" height="350px">
<img src="/img/payment.gif" width="700px" height="350px">
<img src="/img/review.gif" width="700px" height="350px">

6. 모임
* 모임 개설과 모임 관리 기능 제공
* 원하는 날짜와 카테고리, 키워드,회비를 설정한 후, 표지 이미지를 업로드하면 모임 개설 가능
* 모임 상세 화면에서 모임에 대한 소개글 작성 기능 제공
* 모임 상세 화면에서 공지사항과 자유게시판, 2개의 게시판 기능을 제공하고 있음
* 모임 상세화면에서 사진첩 기능을 제공(업로드된 이미지들을 모아서 확인할 수 있음)
* 모임 개설자는 회원 신청 현황과 회원 관리를 할 수 있음
<img src="/img/meetup.gif" width="700px" height="350px">
<img src="/img/meetup-introwrite.gif" width="700px" height="350px">
<img src="/img/meetup-notice.gif" width="700px" height="350px">
<img src="/img/meetup-detail.gif" width="700px" height="350px">
<img src="/img/meetup-member.gif" width="700px" height="350px">

7.마이 페이지(마이키친)
* Three.js를 이용해 3D로 구현
* 개인 정보 수정 (프로필 사진, 비밀번호) -> 타인의 경우 팔로우 해제 또는 팔로우 기능 활성화
* 팔로워/팔로우 현황 확인
* 작성한 게시물 확인
* 내 스크랩북 확인/ 스크랩북 추가 -> 타인의 경우 확인 불가능
* 결제 내역 확인 -> 타인의 경우 확인 
* 레시피 작성으로 이동
<img src="/img/mykitchen2.gif" width="700px" height="350px">
* 마이페이지 구현 영상
[![Video Label](https://img.youtube.com/vi/bPgruR_YFa0/0.jpg)](https://youtu.be/bPgruR_YFa0)

