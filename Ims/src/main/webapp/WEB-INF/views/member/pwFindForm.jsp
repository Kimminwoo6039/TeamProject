<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script>
	
	window.onload = function() {
		document.getElementById('submit').onclick = function() {
			
			if ( document.pfrm.id.value.trim() == '' ) {
				alert( 'ID를 입력해주세요' );
				return false;
			}
			if ( document.pfrm.mail.value.trim() == '' ) {
				alert( '메일을 입력해주세요' );
				return false;
			}
			document.pfrm.submit();
		}
	}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="pwFind-form">
    <form action="pwFindForm_ok.do" method="post" class="form-horizontal" name="pfrm">
	
      	<div class="row">
        	<div align="center">
			<h2>비밀번호 찾기</h2>
		</div>	
      	</div>			
        <div class="form-group row">
		<label class="col-form-label col-4">아이디</label>
		<div class="col-8">
			<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요." required="required">
		</div>        	
        </div>

	<div class="form-group row">
		<label class="col-form-label col-4">이메일</label>
		<div class="col-8">
			<input type="text" class="form-control" name="mail" placeholder="메일을 입력하세요." required="required">
		</div>        	
        </div>
	<div class="form-group row">
		<button type="submit" id="submit" class="btn btn-primary btn-lg">비밀번호 찾기</button>
	</div>		

    </form>
</div>
</body>
</html>