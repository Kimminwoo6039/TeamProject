<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/shop/email/send.do" method="post">

<H2>인증번호 보내기</H2>

이메일 입력 : <input name="send">
<input type="submit" value="전송">

</form>


<span style="color:red;">${message}</span>

</body>
</html>