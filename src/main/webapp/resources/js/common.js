$(document).ready(function() {
    // hide the menu when the page load
    $("#navigation-list").hide();
    // when .menuBtn is clicked, do this
    $(".menuBtn").click(function() {
        // open the menu with slide effect
        $("#navigation-list").slideToggle(300);
    });
    
    $("#datepicker").datepicker({
    	dateFormat: 'yy-mm-dd',
    	prevText: '이전 달',
    	nextText: '다음 달',
    	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    	showMonthAfterYear: true,
    	yearSuffix: '년'
    });
    
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
});

function trim(val) {
	if (val == null) return "";
	return val.replace(/(^\s*)|(\s*$)/gi, "");
};

var FormatUtil = {
	/**
     * 숫자 이외의 문자를 제거하여 반환.
     *
     * @param {String}
     *            numStr
     */
    toNumber : function(numStr) {
        if (!numStr) {
        	return '';
        }

        numStr = numStr + '';

        var m = numStr.substring(0, 1) == '-';
        var ret = numStr.replace(/[^\d]/g, '');

        return m ? ('-' + ret) : ret;
    },
};

var InputUtil = {
	validUserId : function(userIdStr) {
    	/*
    	 * 6 ~ 15자 이내의 영문 소문자, 숫자, 특수문자 @, ., _, - 사용
    	 */
    	var str = userIdStr;
    	var regx = /^[0-9a-z@._-]{6,15}$/;

		return regx.test(str);
    },
    validPassword : function(passStr) {
    	/*
    	 * 영문, 숫자, 특수문자 중 세 가지 조합 : 9자 ~ 20자 사용 가능
		 *	사용가능특수문자 : ! " # $ % & '( ) * + , - . / : ; > = < ? @ [ \ ] ^ _ { | } ~
		 *	영문 대소문자 구분 / 아이디 재사용 불가
		 *	3자 이상 연속 영문 / 숫자 조합 불가 (ex: aaa, 111)
    	 */
    	var str = passStr;
		var anUpperCase = /[A-Z]/;
		var aLowerCase = /[a-z]/;
		var aNumber = /[0-9]/;
		var aSpecial = /^[!"#$%&'()*+,\-.\/:;>=<?@\[\\\]\^_{\|}~]$/;
		var alphaNumeric = /^[a-zA-Z0-9]$/;

		if (str.length < 9 || str.length > 20) return false;
		
		var numUpper = 0;
		var numLower = 0;
		var numNums = 0;
		var numSpecials = 0;
		for (var i = 0; i < str.length; i++){
			if (anUpperCase.test(str[i])) numUpper++;
			else if (aLowerCase.test(str[i])) numLower++;
			else if (aNumber.test(str[i])) numNums++;
			else if (aSpecial.test(str[i])) numSpecials++;
		}

		if ((numUpper + numLower) < 1 || numNums < 1 || numSpecials <1) return false;

		// 영자,숫자,특수문자를 제외한 문자 체크
		var numAlphaNumSpecial = numUpper + numLower + numNums + numSpecials;
		if (numAlphaNumSpecial != str.length) return false;

		// 3자 연속 동일 영자숫자 체크
		var pos = 0;
		while (pos < str.length-2) {
			var c = str[pos];
			var s = 1;

			if (!alphaNumeric.test(c)) {
				++pos;
				continue;
			}

			for (var j = (pos+1); j < str.length; j++) {
				++pos;
				if (str[j] == c) s++;
				else break;

				if (s >= 3) break;
			}

			if (s >= 3) return false;
		}

		return true;
    },
	validEmail : function(emailStr) {
		var str = trim(emailStr);
		var regx = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i;

		return regx.test(str);
	},
	validDate : function(date) {
		/**
	     * 날짜 형식 체크
	     * @param {String} date 체크할 날자
	     */
        var val = FormatUtil.toNumber(date).toString();
        var re = /[0-9]{4}[0-9]{2}[0-9]{2}/;

        if (val.length == 8 && re.test(val)) {
        	return false;
        } else {
        	return true;
        } 
    },
};

var isVal = function($tags) {
	for (var idx = 0; idx < $tags.length; idx++) {
		var $tag = $($tags[idx]);
		if ($tag.is("[check]") === false) {
			continue;
		} 
		
		var $value = $tag.val();
		if (typeof $value === undefined || $value === "") {
			alert($tag.attr("title")+"을(를) 입력해주세요!!");
			$tag.focus();
			return true;
		}
		
		if ($tag.attr("id") == "datepicker" && InputUtil.validDate($value)) {
			alert($tag.attr("title")+"을(를) 입력(수정)해주세요!!");
			$tag.focus();
			return true;
		}
	}
};

var isEmpty = function($form) {
	if (isVal($form.find("select")) ||
		isVal($form.find("input")) ||
		isVal($form.find("textarea"))) {
		return true;
	} else {
		return false;
	}
};