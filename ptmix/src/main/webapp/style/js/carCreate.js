$(function() {
	$("#btnCustomerSearch").click(customerSearchPop);
	$("#customerName").keyup(search);
});

var customerSearchPop = function() {
	$("#detailModal").appendTo("body").modal();
	$("#customerName").focus();
};

var search = function(event) {
	if(event.keyCode != 13) {
		return;
	}
	
	$.ajax({
		url:ctx + "/customer/findByName.ajax"
		,type:"post"
		,data:{"name":$("#customerName").val()}
		,success:showCustomerList
		,error:errorCallback
	});
};

var showCustomerList = function(data) {
	var customerContent = "";
	$.each(data, function(index, item) {
		var customerParam = "'" + item.usid + "','" + item.name +"'";
		customerContent += "<tr ondblclick=\"selectCustomer("+customerParam+")\">";
		customerContent += "<td>" + (Number(index) + 1) + "</td>";
		customerContent += "<td>" + item.name + "</td>";
		customerContent += "<td>" + item.phone + "</td>";
		customerContent += "<td>" + item.juminNo + "</td>";
		customerContent += "</tr>";
	});
	
	$("#customerList tbody").empty();
	$("#customerList tbody").append(customerContent);
};

var errorCallback = function() {
	alert("수행중 오류가 발생했습니다.");
};

var selectCustomer = function(usid, name) {
	$("#sellerId").val(usid);
	$("#sellerName").val(name);
	
	//팝업화면 초기화
	$("#customerName").val("");
	$("#customerList tbody").empty();
	$("#detailModal").hide();
};