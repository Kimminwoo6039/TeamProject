<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<a href="/shop/">홈</a>

<a href="/shop/shop/product/list.do?">상품리스트</a>

<a href="<c:url value='/board/notice/List.do?ct=notice&ct_idx=0'/>">공지사항</a> 

<a href="<c:url value='/board/qna/List.do?ct=qna&ct_idx=1'/>">QnA</a>

<a href="<c:url value='/board/dq/List.do?ct=dq&ct_idx=2'/>">1:1문의</a>

<a href="<c:url value='/email.do'/>">이메일 보내기</a>


<div style="text-align:right;">

<c:choose>

<c:when test="${sessionScope.userid == null }">

<a href="<%=request.getContextPath() %>/member/login.do">로그인</a> |

<a href="<%=request.getContextPath() %>/admin/login.do">관리자 로그인</a>

<a href="<%=request.getContextPath() %>/shop/cart/list.do">장바구니</a>

<a href="<%=request.getContextPath() %>/mypage/main.do">마이페이지</a>

</c:when>

<c:otherwise>

${sessionScope.name}님이 로그인중입니다.

<a href="<%=request.getContextPath() %>/member/logout.do">로그아웃</a> |

<a href="<%=request.getContextPath() %>/admin/logout.do">관리자 로그아웃</a>

<a href="<%=request.getContextPath() %>/shop/cart/list.do">장바구니</a>

<a href="<%=request.getContextPath() %>/mypage/main.do?delivery_state=">마이페이지</a>

<a href="<%=request.getContextPath() %>/admin/main.do?delivery_state=">관리</a>

</c:otherwise>

</c:choose>

</div>

<hr>