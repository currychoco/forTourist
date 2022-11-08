function checkForm(form) {

	if (form.id.value === "") {
		alert('생성할 아이디를 입력하세요.');
	} else if (form.password.value === "") {
		alert('생성할 비밀번호를 입력하세요.');
	} else if (form.name.value === "") {
		alert('이름을 입력하세요.');
	} else if (form.nickname.value === "") {
		alert('닉네임을 입력하세요.');
	} else if (form.gender.value === "") {
		alert('성별을 선택해주세요.');
	} else if (form.phone.value === "") {
		alert('핸드폰 번호를 입력하세요.');
	} else {
		checkPw();	
	}
}



function checkPw() {
	var pw = $("#password").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if (pw.length < 8 || pw.length > 20) {
		alert("8자리 ~ 20자리 이내로 입력해주세요.");
	} else if (pw.search(/\s/) != -1) {
		alert("비밀번호는 공백 없이 입력해주세요.");
	} else if (num < 0 || eng < 0 || spe < 0) {
		alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
	} else {
		alert("회원가입이 완료되었습니다.");
		form.submit();
	}
}



