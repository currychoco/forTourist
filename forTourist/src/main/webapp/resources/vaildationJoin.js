function checkForm(form) {
	if (form.id.value === "") {
		alert('생성할 아이디를 입력하세요.')
	} else if (form.password.value === "") {
		alert('생성할 비밀번호를 입력하세요.')
	} else if (form.passwordCheck.value !== form.password.value) {
		alert('비밀번호가 일치하지 않습니다.')
	} else if (form.name.value === "") {
		alert('이름을 입력하세요.')
	} else if (form.phone.value === "") {
		alert('전화번호를 입력하세요.')
	} else if (form.id.value === "") {
		alert('주민번호를 입력하세요.')
	} else {
		let check = checkPw();
		if(check === true){
		form.submit();
		}
	}
}

function checkPw() {
	var pw = $("#password").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	if (pw.length < 8 || pw.length > 20) {
		alert("8자리 ~ 20자리 이내로 입력해주세요.");
		return false;
	} else if (pw.search(/\s/) != -1) {
		alert("비밀번호는 공백 없이 입력해주세요.");
		return false;
	} else if (num < 0 || eng < 0 || spe < 0) {
		alert("영문,숫자,특수문자를 혼합하여 입력해주세요.");
		return false;
	} else {
		alert("회원가입이 완료되었습니다.");
		return true;
	}
}

