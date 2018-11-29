$(function() {
	eventBind();
});

const eventBind = function() {
	$("#btnCreate").click(function() {
		location.href=ctx + "/views/carCreate.jsp";
		//$("#detailModal").appendTo('body').modal();
	});
	
	let customerDetailElements = $("[name='customerDetail']");
	$(customerDetailElements).each(function() {
		$(this).click(function() {
			let customerId = $(this).data("customer-id");
			console.log(customerId);
			findCustomerDetail(customerId);
		});
	});

	let maintenanceDetailElements = $("[name='maintenanceDetail']");
	$(maintenanceDetailElements).each(function() {
		$(this).click(function() {
			let carId = $(this).data("car-id");
			console.log(carId);
			findMaintenanceDetail(carId);
		});
	});
};

const findCustomerDetail = function(customerId) {
	$.ajax({
		url:ctx + "/customer/find.ajax"
		,type:"post"
		,data:{"customerId":customerId}
		,success:customerDetailPop
		,error:errorCallback
	});
};

const findMaintenanceDetail = function(carId) {
	$.ajax({
		url:ctx+"/car/maintenance/find.ajax"
		,type:"get"
		,data:{"carId":carId}
		,success:maintenancePop
		,error:errorCallback
	});
};

const customerDetailPop = function(customer) {
	console.log(customer);
	$("#customerId").val(customer.usid);
	$("#customerName").val(customer.name);
	$("#customerJuminNo").val(customer.juminNo);
	$("#customerPhone").val(customer.phone);
	$("#customerAddress").val(customer.address);
	$("#customerRemark").val(customer.remark);
	//팝업표시
	$("#detailModal").appendTo("body").modal();
};

const maintenancePop = function(car) {
    console.log(car);
    $("#carSummary").val(car.name + "/" + car.manufacturer);
    let maintenanceBody = createMaintenanceBody(car);
    console.log(maintenanceBody);
    $("#maintenanceTable tbody").empty().append(maintenanceBody);
    //팝업표시
    $("#maintenanceModal").appendTo("body").modal();
};

const createMaintenanceBody = function(car) {
    if(car.maintenances.length == 0) {
        return "<tr class='no-list'><td colspan='3'>검색 결과가 없습니다</td></tr>";
    }
    let maintenanceBody = "<tr>";
    $(car.maintenances).each(function() {
        maintenanceBody += "<td>" + this.inspectionDate + "</td>";
        maintenanceBody += "<td class='alignLeft'>" + this.item + "</td>";
        maintenanceBody += "<td>" + numberWithCommas(this.amount) + "</td>";
    })
    maintenanceBody += "</tr>";
    return maintenanceBody;
}

const numberWithCommas = function(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var errorCallback = function() {
	alert("수행중 오류가 발생했습니다.");
};



