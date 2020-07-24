$(document).ready(function() {
	$("#load").click(function() {
		loadChance();
	});
	
	loadChance();
});

function loadChance() {
	$.ajax({
		url: "/page/chance/load",
		type: "get",
		dataType: "JSON",
		data: null,
		success: function (data) {
			var html = "";
			var chance = "";
			for (var i = 0; i < data.length; i++) {
				chance = data[i];
				html += "<p>" + chance.substring(0, 1) + "조 " + chance.substring(1, chance.length) + "</p>";
			}
			
			$("#content").html(html);
		},
		error:function(request,status,error){
			alert("code = "+ request.status + " error = " + error); // 실패 시 처리
		}
	})
}