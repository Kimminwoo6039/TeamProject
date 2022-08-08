<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style99.css" type="text/css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://kit.fontawesome.com/6c060c00b1.js" crossorigin="anonymous"></script>
   
   
   
   
   <script type="text/javascript">

$(function(){
	
	$("#btnAdd").click(function(){
	location.href="<%=request.getContextPath() %>/shop/product/write.do"
});
});

</script>
   
   
   
   
   
</head>
<body>

<%@ include file="../include/menu1.jsp"%>

<%-- <h1 class="title">


<div>
<a href="<%=request.getContextPath() %>/" style="text-decoration: none;"><h3 style="text-align: center; color: black;"class="abc" >Im'S something for us</h3></a>
</div>
<br>



</h1> --%>
<!-- 
<nav class="navbar navbar-expand-sm navbar-light bg-white border-bottom">
 
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor" aria-controls="navbarColor" aria-expanded="false" aria-label="Toggle navigation"> 
        <span class="navbar-toggler-icon"></span> 
    </button>
  
    </div>    
</nav> --> 



<br><br><br>

<div class="filter" style="margin-top: 100px;">
    <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#mobile-filter" aria-expanded="false" aria-controls="mobile-filter">Filters<span class="fa fa-filter pl-1"></span></button>
</div>
<div id="mobile-filter">
    <div>
        <h6 class="p-1 border-bottom">브랜드</h6>
        <ul>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=GUCCI">GUCCI</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=BOTTEGA VENETA">BOTTEGA VENETA</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=BURBERRY">BURBERRY</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=MAISON MARGIELA">MAISON MARGIELA</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=THOM BROWN">THOM BROWN</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=VALETINO">VALENTINO</a></li>
        </ul>
    </div>
    <div>
        <h6 class="p-1 border-bottom">Filter By</h6>
        <p class="mb-2">Color</p>
        <ul class="list-group">
            <li class="list-group-item list-group-item-action mb-2 rounded"><a href="#">
                <span class="fa fa-circle pr-1" id="red"></span>Red
            </a></li>
            <li class="list-group-item list-group-item-action mb-2 rounded"><a href="#">
                <span class="fa fa-circle pr-1" id="teal"></span>Teal
            </a></li>
            <li class="list-group-item list-group-item-action mb-2 rounded"><a href="#">
                <span class="fa fa-circle pr-1" id="blue"></span>Blue
            </a></li>
        </ul>
    </div>
    
</div>
<section id="sidebar">
    <div>
        <h6 class="p-1 border-bottom">브랜드</h6>
        <ul>
        <li><a href="<%=request.getContextPath() %>/shop/product/list.do">ALL</a></li>
              <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=GUCCI">GUCCI</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=BOTTEGA VENETA">BOTTEGA VENETA</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=BURBERRY">BURBERRY</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=MAISON MARGIELA">MAISON MARGIELA</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=THOM BROWN">THOM BROWN</a></li>
            <li><a href="<%=request.getContextPath() %>/shop/product/list.do?brand=VALETINO">VALENTINO</a></li>
        </ul>
    </div>
    <div>
       
    </div>
  
</section>
<section id="products">
<div class="container">
    <div class="row">
     <div class="d-flex justify-content-between align-items-center mb-3">
     <!-- 관리자 로그인시 상품등록 페이지 -->
        <c:if test="${sessionScope.admin_userid != null }">
        
        <button class="btn btn-outline-dark" type="button"  id="btnAdd"  style="float: right;" > 상품등록  </button>  
        
        </c:if>
        </div>
    
    <c:forEach var="row" items="${list}">
    
    
        <div class="col-lg-3 col-sm-4 col-12">
            <div>
               <a href="<%=request.getContextPath() %>/shop/product/detail/${row.product_code}" style="height: 300px;"> <img width="286px" height="300px;" src="<%=request.getContextPath() %>/resources/images/${row.filename}" ></A>
                <div class="card-body">
                
                <!-- 상품수정 관리자 -->
                 <c:if test="${sessionScope.admin_userid !=null }">
                    <a href="<%=request.getContextPath() %>/shop/product/edit/${row.product_code}" style="text-align:center;">
                    <button class="btn btn-outline-dark">  수정  </button>         
                    </a>
                    </c:if>
                    <!--  -->
                    
                   <Div>
                  <span class="badge bg-dark" style="float: right;">${row.gender}</span>  
                  </Div>
                  
     <a href="<%=request.getContextPath() %>/shop/product/detail/${row.product_code}" style="text-decoration: none;color: black;"><p class="card-text" style="font-family: 'Noto Sans KR', sans-serif;font-size: 19px;">${row.product_name}</p></a>
     
                  <p style="float: right;margin-top: 6px;"><fmt:formatNumber value="${row.price}" pattern="#,###" />&nbsp;원</p>
                  
                  
                      <div class="stars" style="float: left;color: #FFD400;opacity: 0.5;margin-top: 6px;"> 
                
                 <c:if test="${row.result >= 1.0 and row.result < 1.5}">
   <i class="fa fa-star"></i> 
    <i class="fa-regular fa-star"></i>
     <i class="fa-regular fa-star"></i>
      <i class="fa-regular fa-star"></i>
      
  </c:if>   
    <c:if test="${row.result >= 1.5 and row.result < 2.0}">
   <i class="fa fa-star"></i> 
   <i class="fa-solid fa-star-half-stroke"></i>
    <i class="fa-regular fa-star"></i>
     <i class="fa-regular fa-star"></i>
  </c:if>   
      <c:if test="${row.result >= 2.0 and row.result < 2.5}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
    <i class="fa-regular fa-star"></i>
     <i class="fa-regular fa-star"></i>
  </c:if>   
     <c:if test="${row.result >= 2.5 and row.result < 3.0}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
    <i class="fa-solid fa-star-half-stroke"></i>
    <i class="fa-regular fa-star"></i>
  </c:if>   
     <c:if test="${row.result >= 3.0 and row.result < 3.5}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
      <i class="fa fa-star"></i>
       <i class="fa-regular fa-star"></i>
  </c:if>  
     <c:if test="${row.result >= 3.5 and row.result < 4.0}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
      <i class="fa fa-star"></i>
        <i class="fa-solid fa-star-half-stroke"></i>
  </c:if>  
     <c:if test="${row.result == 4.0}">
   <i class="fa fa-star"></i> 
   <i class="fa fa-star"></i> 
      <i class="fa fa-star"></i>
           <i class="fa fa-star"></i>
  </c:if>  
    
                 </div>
                 <span style="float: left;margin-left: 4px;font-family: 'Noto Sans KR', sans-serif;margin-top: 6px;">${row.result}</span>
                      
                </div>       
                
                
        </div>    
            </div>
            
    </c:forEach>        
          
           
        </div>
</div>
</section>

 <c:choose>
			<c:when test="${pageMaker.cri.brand} !=null "> 

<ul class="pagination justify-content-center" id="pageInfo">

				<c:if test="${pageMaker.prev}">
				<li class="page-item disabled">
					<a class="page-link" href="<%=request.getContextPath() %>/shop/product/list.do?page=${pageMaker.startPage - 1}&brand=${pageMaker.cri.brand}&keyword=${pageMaker.cri.keyword}">Previous</a>
				</li>
				</c:if>
				
			
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item">
					<a class="page-link" href="<%=request.getContextPath() %>/shop/product/list.do?page=${num}&brand=${pageMaker.cri.brand}&keyword=${pageMaker.cri.keyword}">${num}</a>
				</li>
				</c:forEach>
				
					<c:if test="${pageMaker.next}">
				<li class="page-item">
					<a class="page-link" href="<%=request.getContextPath()%>/shop/product/list.do?page=${pageMaker.endPage + 1}&brand=${pageMaker.cri.brand}&keyword=${pageMaker.cri.keyword}">Next</a>
				</li>
				</c:if>
					</ul>
			 </c:when>
			 
			<c:otherwise> 
			<ul class="pagination justify-content-center" id="pageInfo">
			
			<c:if test="${pageMaker.prev}">
				<li class="page-item disabled">
					<a class="page-link" href="<%=request.getContextPath() %>/shop/product/list.do?page=${pageMaker.startPage - 1}">Previous</a>
				</li>
				</c:if>
			
			
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item">
					<a class="page-link" href="<%=request.getContextPath() %>/shop/product/list.do?page=${num}&keyword=${pageMaker.cri.keyword}&brand=${pageMaker.cri.brand}">${num}</a>
				</li>
				</c:forEach>
			
				<c:if test="${pageMaker.next}">
				<li class="page-item">
					<a class="page-link" href="<%=request.getContextPath() %>/shop/product/list.do?page=${pageMaker.endPage + 1}">Next</a>
				</li>
				</c:if>
				</ul>
			
			
		 	</c:otherwise>
		 	
		 	
		
			</c:choose> 



</body>
</html>