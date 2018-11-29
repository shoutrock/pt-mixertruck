$(function() {
	eventBind();
});

var eventBind = function() {
	$("#btnRegistPop").click(function() {
		$("#detailModal").appendTo("body").modal();
	});
	
	$("#btnRegist").click(function() {
		registCustomer();
	});

};

var registCustomer = function(customerId) {
	$.ajax({
		url:ctx + "/customer/regist.do"
		,type:"post"
		,data:{"name":$("#name").val()
			   ,"juminNo":$("#juminNo").val()
			   ,"phone":$("#phone").val()
			   ,"address":$("#address").val()
			   ,"remark":$("#remark").val()}
		,success:findCustomerList
		,error:errorCallback
	});
};

var findCustomerList = function() {
	location.href=ctx+"/customer/list.do";
};

var errorCallback = function() {
	alert("수행중 오류가 발생했습니다.");
};