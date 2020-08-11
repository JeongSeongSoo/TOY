$(document).ready(function() {
	
});

var del = function() {
	$.ajax({
		url: ['', 'job', 'remove'].join('/').replace(/\/\//g, '/'),
		type: "POST",
		dataType: "json",
		//dataType: "text",
		data: $("#detailForm").serialize(),
		success: function(data) {
			location.href = data.defaultPath;
		},
		error:function(request,status,error){
			alert("code = "+ request.status + " error = " + error); // 실패 시 처리
		}
	});
};

var modify = function() {
	location.href = ['', 'job', $("#jid").val(), 'modify', 'load'].join('/').replace(/\/\//g, '/');
};