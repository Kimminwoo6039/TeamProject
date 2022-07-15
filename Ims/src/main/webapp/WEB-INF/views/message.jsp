<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script th:inline="javascript">

/*<![CDATA[*/

   var message = [[${message}]];
   alert(message);

   location.replace([[${SearchUrl}]]);

/*]]>*/

</script>

<body>

</body>
</html>