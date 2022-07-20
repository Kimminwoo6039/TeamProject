<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=b3c90d252e0ab2e93579050eaf013549&redirect_uri=http://localhost:8080/shop/kakao.do&response_type=code">
		<img src="${pageContext.request.contextPath}/resources/icon/kakao.png" style="height:60px">
					</a>


<!-- <script type='text/javascript'>
        		//<![CDATA[
        		// 사용할 앱의 JavaScript 키를 설정해 주세요.
        		Kakao.init('cdb7bfd91e47297c1c21c434264eab2f');
        		// 카카오 로그인 버튼을 생성합니다.
        		Kakao.Auth.createLoginButton({
            container: '#kakao-login-btn',
            success: function (authObj) {
                alert(JSON.stringify(authObj));
            },
            fail: function (err) {
                alert(JSON.stringify(err));
            }
        });
      //]]>
    </script> -->


</body>
</html>