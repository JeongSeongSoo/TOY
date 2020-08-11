var submitCheck = new Map();
submitCheck.set("userId", false);
submitCheck.set("userPw", false);
submitCheck.set("userPwCheck", false);
submitCheck.set("email", false);

$(document).ready(function() {
	validation();
	
	$("#loginSubmit").click(function() {
		var userPw = $("#userPw").val();
		var userPwCheck = $("#userPwCheck").val();
		
		if(!InputUtil.validUserId($('#userId').val())) {
			$(".userIdError").html("유효하지 않은 아이디입니다.");
        	$(".userIdError").css("display", "block");
        	
        	return;
    	}
		
		if(!InputUtil.validPassword($('#userPw').val())) {
			submitCheck.set("userPw", false);
			$(".userPwError").html("유효하지 않은 비밀번호입니다.");
        	$(".userPwError").css("display", "block");
        	$("#userPwCheck" ).prop('readonly', true);
        	
        	return;
    	} else {
    		submitCheck.set("userPw", true);
    		$(".userPwError").css("display", "none");
    		$("#userPwCheck" ).prop('readonly', false);
    	}
		
		if (userPw == userPwCheck) {
    		submitCheck.set("userPwCheck", true);
    		$("#userPw" ).prop('readonly', true);
    		$(".userPw").css("color", "gray");
    		$(".userPwCheckError").css("display", "none");
    	} else {
    		submitCheck.set("userPwCheck", false);
    		$("#userPw" ).prop('readonly', false);
    		$(".userPw").css("color", "black");
    		$(".userPwCheckError").html("입력하신 두 비밀번호가 일치하지 않습니다.");
    		$(".userPwCheckError").css("display", "block");
    		$(".userPwCheckError").css("color", "red");
    		
    		return;
    	}
		
		if(!InputUtil.validEmail($('#email').val())) {
    		$(".emailError").html("유효하지 않은 이메일입니다.");
        	$(".emailError").css("display", "block");
        	
        	return;
    	}
		
		$("#joinForm").submit();
	});
});

var validation = function() {
	$("#userId").focusout(function() {
		var userId = $('#userId').val();
		if (!InputUtil.validUserId(userId)) {
			$(".userIdError").html("유효하지 않은 아이디입니다.");
        	$(".userIdError").css("display", "block");
        	return;
    	}
		
		$.ajax({
            url: ['', 'login', 'join', 'userId', userId, 'load'].join('/').replace(/\/\//g, '/'),
            type: "GET",
            dataType: "JSON",
            data: null,
            success: function(data, textStatus, jqXHR) {
				if (typeof jqXHR !== 'undefined') {
					switch (jqXHR.status) {
						case 200: 
							submitCheck.set("userId", false);
		                	$(".userIdError").html("중복된 아이디가 있습니다.");
		                	$(".userIdError").css("display", "block");
							
							break;
							
	    				case 204:
	    					submitCheck.set("userId", true);
		                	$(".userIdError").css("display", "none");
		                	
	    					break;
	    					
	    				default:
	    					alert("일치하는 http응답 코드(" + jqXHR.status + "가 없습니다.");
	    					break;
	    					
	    			}
				} else {
					alert("응답 코드 에러 관리자에게 문의 바랍니다.");
				}
            },
            error:function(request,status,error){
            	alert("code = "+ request.status + " error = " + error); // 실패 시 처리
            }
        })
    });
	
	$("#userPw").focusout(function() {
		if(!InputUtil.validPassword($('#userPw').val())) {
			submitCheck.set("userPw", false);
			$(".userPwError").html("유효하지 않은 비밀번호입니다.");
        	$(".userPwError").css("display", "block");
        	$("#userPwCheck" ).prop('readonly', true);
        	return;
    	} else {
    		submitCheck.set("userPw", true);
    		$(".userPwError").css("display", "none");
    		$("#userPwCheck" ).prop('readonly', false);
    	}
	});
    
    $("#userPwCheck").focusout(function() {
    	var userPw = $("#userPw").val();
    	var userPwCheck = $("#userPwCheck").val(); 
    	
    	if (userPw == userPwCheck) {
    		submitCheck.set("userPwCheck", true);
    		$("#userPw" ).prop('readonly', true);
    		$(".userPw").css("color", "gray");
    		$(".userPwCheckError").css("display", "none");
    	} else {
    		submitCheck.set("userPwCheck", false);
    		$("#userPw" ).prop('readonly', false);
    		$(".userPw").css("color", "black");
    		$(".userPwCheckError").html("입력하신 두 비밀번호가 일치하지 않습니다.");
    		$(".userPwCheckError").css("display", "block");
    		$(".userPwCheckError").css("color", "red");
    		return;
    	}
    });
    
    $("#email").focusout(function() {
    	var email = $('#email').val();
    	
    	if (!InputUtil.validEmail(email)) {
    		$(".emailError").html("유효하지 않은 이메일입니다.");
        	$(".emailError").css("display", "block");
        	return;
    	}
    	
		$.ajax({
            url: ['', 'login', 'join', 'email', email, 'load'].join('/').replace(/\/\//g, '/'),
            type: "GET",
            dataType: "JSON",
            data: null,
            success: function(data, textStatus, jqXHR) {
            	if (typeof jqXHR !== 'undefined') {
					switch (jqXHR.status) {
					case 200: 
						submitCheck.set("email", false);
	                	$(".emailError").html("중복된 이메일이 있습니다.");
	                	$(".emailError").css("display", "block");
	                	$(".emailError").css("color", "red");
	                	
						break;
						
    				case 204:
    					submitCheck.set("email", true);
                    	$(".emailError").css("display", "none");
	                	
    					break;
    					
    				default:
    					alert("일치하는 http응답 코드(" + jqXHR.status + "가 없습니다.");
    					break;
					}
            	} else {
					alert("응답 코드 에러 관리자에게 문의 바랍니다.");
				}
            },
            error:function(request,status,error){
            	alert("code = "+ request.status + " error = " + error); // 실패 시 처리
            }
        })
    });
};