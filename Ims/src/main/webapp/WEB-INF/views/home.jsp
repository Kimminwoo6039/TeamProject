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

<a href="${pageContext.request.contextPath}/noticeList.do">공지사항1</a>
<br/>
<a href="<c:url value='/noticeList.do'/>">공지사항2</a>
<br/>
<a href="${pageContext.request.contextPath}/noticeWrite.do">공지사항글쓰기</a>
<br/>
<a href="<c:url value='/noticeWrite.do'/>">공지사항2</a>




<br/>
</body>
</html>
