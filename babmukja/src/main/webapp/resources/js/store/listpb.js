$(".page a").click(function(e){
	pageNo = $(this).text().substring(1,$(this).text().lastIndexOf("]"));
	sortType = $("#selectbox").find(":selected").val();
	searchName = $("#namanyay-search-box").val();
	$("#searchForm > input[name='pageNo']").val(pageNo);
	$("#searchForm > input[name='sortType']").val(sortType);
	$("#searchForm > input[name='searchName']").val(searchName);
	$("#searchForm").submit();
	return false;
});

$("#selectbox").change(function () {
	$(".page a:eq(0)").click();
});

$(".searchNameBTN").click(function () {
	$(".page a:eq(0)").click();
});

$(".pb_list_title").click(function () {
	location.href = "listpb.do";
});

$(function () {
	if (cntval == 0) {
		alert("검색한 상품이 존재하지 않습니다.");
		location.href = "listpb.do";
	}
});