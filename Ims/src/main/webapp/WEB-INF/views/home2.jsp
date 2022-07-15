<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<%@ include file="include/menu.jsp" %>
<h1>
	Hello world! 안녕
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="<c:url value='/notice/List.do'/>">공지사항2</a> 
<a href="<c:url value='/notice/Write.do'/>">공지사항 글쓰기</a>




<br/>
</body>
</html>
