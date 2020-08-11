$(document).ready(function() {
	$('#groupContent, #businessContent, #supportContent, #mustContent, #workContent').summernote({
		toolbar: [
		    ['font', ['bold', 'italic', 'underline', 'clear']],
		    ['fontname', ['fontname']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['table', ['table']],
		],
		height: 200,
		minHeight: null,
		maxHeight: null,
	});
});

var add = function() {
	var $form = $("#addForm");

	if (isEmpty($form)) {
		return;
	}
	
	var $closeDt = $("#addForm input[name='closeDt']");
	
	$closeDt.val(FormatUtil.toNumber($closeDt.val()));
	
	$form.submit();
};