$(document).ready(function() {
	$("#addBtn").click(function() {
		location.href = "/job/write";
	});
	
	$.ajax({
		url: "/job/job/load",
		type: "get",
		dataType: "JSON",
		data: null,
		success: function (data) {
			var html = "";
			var job = "";
			
			for (var i = 0; i < data.length; i++) {
				job = data[i];
				
				html += "<tr>";
				html += "<td width='60%' style='text-align: left;'>";
				html += "<ul>";
				html += "<li class='title'>" + job.title + "</li>";
				html += "<li class='date'>" + job.closeDt + "|" + job.location + "</li>";
				html += "<li class='tag'>#Server</li>";
				html += "</ul>";
				html += "</td>";
				html += "<td class='date' width='20%'>" + job.company + "</td>";
				
				var employStatus = "";
				switch (job.employStatus) {
					case "1":
						employStatus = "정규직";
						break;
					case "2":
						employStatus = "계약직";
						break;
					case "3":
						employStatus = "파견직";
						break;
					case "4":
						employStatus = "인턴";
						break;
					default:
						employStatus = "기타";
						break;
				}
				
				html += "<td class='date' width='20%'>" + employStatus + "</td>";
				html += "</tr>";
			}
			
			$("#jobList").html(html);
			//$("#content").html(html);
		},
		error:function(request,status,error){
			alert("code = "+ request.status + " error = " + error); // 실패 시 처리
		}
	});
});