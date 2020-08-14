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

var modify = function() {
	var $form = $("#modifyForm");

	if (isEmpty($form)) {
		return;
	}
	
	var $closeDt = $("#modifyForm input[name='closeDt']");
	
	$closeDt.val(FormatUtil.toNumber($closeDt.val()));
	
	$form.submit();
};