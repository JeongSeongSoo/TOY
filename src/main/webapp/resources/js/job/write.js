$(document).ready(function() {
	$('#groupContent, #businessContent, #supportContent, #mustContent, #workContent').summernote({
		toolbar: [
			//['style', ['style']],
		    ['font', ['bold', 'italic', 'underline', 'clear']],
		    ['fontname', ['fontname']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['table', ['table']],
		    //['insert', ['picture', 'hr']],
		    //['help', ['help']]
		],
		height: 200,
		minHeight: null,
		maxHeight: null,
		/*
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i], this);
				}
			}
		}
		*/
	});
});

/*
function sendFile(file, el) {
	var form_data = new FormData();
	
	form_data.append('file', file);
	
	$.ajax({
		data: form_data,
		type: "POST",
		url: '/page/image/add',
		cache: false,
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(url) {
			$(el).summernote('editor.insertImage', url);
		}
	});
}
*/