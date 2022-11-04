function checkForm(form){
	
	 if(form.id.value === ""){
        alert('생성할 아이디를 입력하세요.')
    }else if(form.password.value === ""){
        alert('생성할 비밀번호를 입력하세요.')
    }else if(form.name.value === ""){
        alert('이름을 입력하세요.')
    }else if(form.nickname.value === ""){
        alert('닉네임을 입력하세요.')
  	}else if(form.gender.value === ""){
        alert('성별을 선택해주세요.')
    }else if(form.phone.value === ""){
        alert('핸드폰 번호를 입력하세요.')
	}else{
        form.submit();
    }
	}