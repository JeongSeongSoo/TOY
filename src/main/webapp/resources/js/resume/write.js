$(document).ready(function() {
	loadPersonal();
});

var loadPersonal = function() {
	$.ajax({
		url: ['', 'resume', 'personal', 'load'].join('/').replace(/\/\//g, '/'),
		type: "get",
		dataType: "json",
		data: null,
		success: function(data) {
			var html = '';
			
			for (var i = 0; i < data.length; i++) {
				html += '<tr>';
				html += '<td colspan="3" id="personal">';
				html += '<div class="input" style="width: 51%;">';
				html += '<input type="text" value="' + data[i].company + '" disabled="disabled" />';
				html += '</div>';
				html += '<div class="input" style="width: 13%;">';
				html += '<input type="text" value="' + data[i].inDt + '" disabled="disabled" />';
				html += '</div>';
				html += '<div class="input" style="width: 13%;">';
				html += '<input type="text" value="' + data[i].outDt + '" disabled="disabled" />';
				html += '</div>';
				html += '<div class="input" style="width: 16%;">';
				html += '<input type="text" value="' + data[i].employStatus + '" disabled="disabled" />';
				html += '</div>';
				html += '<div class="input" style="width: 7%;">';
				html += '<input type="button" value="삭제" onclick="deletePersonal(\'' + data[i].hid + '\');" />';
				html += '</div>';
				html += '<div class="input" style="width: 35%;">';
				html += '<input type="text" value="' + data[i].classStatus + '" disabled="disabled" />';
				html += '</div>';
				html += '<div class="input" style="width: 65%;">';
				html += '<input type="text" value="' + data[i].workContent + '" disabled="disabled" />';
				html += '</div>';
				html += '</td>';
				html += '</tr>';
			}
			
			$("#loadPersonal").html(html);
		},
		error:function(request,status,error){
			alert("code = "+ request.status + " error = " + error); // 실패 시 처리
		}
	});
};

var addPersonal = function() {
	var sendData = {};
	
	if (isEmpty($("#personal"))) {
		return;
	}
	
	sendData.company = $("input[name=company]").val();
	sendData.inDt = $("input[name=inDt]").val();
	sendData.outDt = $("input[name=outDt]").val();
	sendData.employStatus = $("select[name=employStatus]").val();
	sendData.classStatus = $("input[name=classStatus]").val();
	sendData.workContent = $("input[name=workContent]").val();
	
	$.ajax({
		url: ['', 'resume', 'personal', 'add'].join('/').replace(/\/\//g, '/'),
		type: "POST",
		dataType: "text",
		data: sendData,
		success: function(data) {
			loadPersonal();
		},
		error:function(request,status,error){
			alert("code = "+ request.status + " error = " + error); // 실패 시 처리
		}
	});
};

var deletePersonal = function(hid) {
	var sendData = {};
	
	sendData.hid = hid;
	
	$.ajax({
		url: ['', 'resume', 'personal', 'remove'].join('/').replace(/\/\//g, '/'),
		type: "POST",
		dataType: "text",
		data: sendData,
		success: function(data) {
			loadPersonal();
		},
		error:function(request,status,error){
			alert("code = "+ request.status + " error = " + error); // 실패 시 처리
		}
	});
};