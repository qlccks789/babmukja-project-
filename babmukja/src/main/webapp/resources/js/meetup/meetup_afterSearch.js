


//검색창 none->block 변경 부분
$(".header_search").click(function () {
    $(".after_click").css("display", "block");
});
$(".location_title_container").click(function () {
    
    $(".location_position").css("display", "block");
    

});

//실험
$(".header_cooking_meetup").click(function () {
	location.href="/babmukja/meetup/main.do";
});

$(".food_type_title").click(function () {
    $(".food_type_position").css("display", "block");
});
$(".monthly_fee_title").click(function () {
    $(".monthly_fee_position").css("display", "block");
});


//클릭시 주소 이동부분
$(".info_block").on("click",function(){
	let meetNo = $(this).find('.afterMeetNo').val();
	console.log("meetNo" +meetNo);
	location.href="detail.do?meetNo="+meetNo+"&memNo=" + $("#hiddenmemNo").val();
});






