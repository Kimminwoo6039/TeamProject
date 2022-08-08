<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dropdowncss.css" />
   
  <style type="text/css">
    
	
	@import url('https://fonts.googleapis.com/css2?family=Yellowtail&display=swap');
	
	.abc{
	font-family: 'Yellowtail', cursive;
	font-size: 50px;
	}
    
    
</style>
    
    
   

<h1 class="title">


<div>
<a href="${pageContext.request.contextPath}/" style="text-decoration: none;"><h3 style="text-align: center; color: black;"class="abc" >Im'S something for us</h3></a>
</div>
<br>



</h1>



        <nav class="navbar navbar-expand-lg navbar-light justify-content-end"
		id="mainNav">

		<div class="row row-cols-1">
		<div class="col col-md col-justify-content-end">
			<a class="navbar-brand" href="#page-top"></a>
			<button class="navbar-toggler navbar-toggler-right justify-content-end" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fa-solid fa-bars"></i>
			</button>
		</div>
		<ul class="col justify-content-end" style="display: flex;list-style: none">
			<c:choose>
				<c:when
					test="${sessionScope.userid == null && sessionScope.admin_userid == null }">


					<li class="nav-item" style="color: black;"><a class="nav-link"
						href="<%=request.getContextPath()%>/admin/login.do">AdminLogin</a></li>
					<li class="nav-item" style="color: black;"><a class="nav-link"
						href="<%=request.getContextPath()%>/member/join. do"><i
							class="fa-solid fa-handshake"></i>&nbsp;Join</a></li>
					<li class="nav-item" style="color: black;"><a class="nav-link"
						href="<%=request.getContextPath()%>/member/login.do"><i
							class="fa-solid fa-door-open"></i>&nbsp;Login</a></li>



				</c:when>

				<c:otherwise>
					<div style="margin-top: 10px; color: blue;">
						<strong>${sessionScope.name} 님</strong> "즐거운 쇼핑되세요"
					</div>

					<c:if
						test="${sessionScope.userid !=null && sessionScope.admin_userid==null }">

						<li class="nav-item" style="color: black;"><a
							class="nav-link"
							href="<%=request.getContextPath()%>/member/logout.do"><i
								class="fa-solid fa-door-closed"></i>&nbsp;일반Logout</a></li>



					</c:if>
					<c:if test="${sessionScope.admin_userid !=null }">

						<li class="nav-item" style="color: black;"><a
							class="nav-link"
							href="<%=request.getContextPath()%>/admin/logout.do"><i
								class="fa-solid fa-door-closed"></i>&nbsp;관리자Logout</a></li>


					</c:if>
				</c:otherwise>



			</c:choose>





		</ul>
		



		<div class="col">
		<div class="justify-content-end collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto my-1 my-lg-0 align-items-center" style="margin: 50px;">

				<li class="nav-item">
					<form action="<%=request.getContextPath()%>/shop/product/list.do" method="post">
						<div class="input-group">
							<div class="form-group navbar-left" style="display: flex;">
								<input type="text" name="keyword" size="25" value="${pageMaker.cri.keyword }" placeholder="원하시는 상품을 입력하세요" class="form-control">
								<%-- <input type="hidden" name="brand" value="${pageMaker.cri.brand }"> --%>
								<button class="btn btn-outline-dark"><i class="fa-solid fa-magnifying-glass"></i></button>
							</div>
						</div>    
					</form>
				</li>

				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/shop/product/list.do"><i
						class="fa-solid fa-shirt">&nbsp;MyFit</i></a></li>



				<c:choose>
					<c:when test="${sessionScope.admin_userid == null }">

						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/shop/cart/list.do"><i
								class="fa-solid fa-bag-shopping">&nbsp;Bag</i></a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/mypage/main.do?delivery_state="><i
								class="fa-solid fa-person">&nbsp;&nbsp;MyPage</i></a></li>



					</c:when>

					<c:otherwise>

						<li class="nav-item"><a class="nav-link"
							href="<%=request.getContextPath()%>/admin/main.do?delivery_state="><i
								class="fa-solid fa-person">&nbsp;&nbsp;AdminPage</i></a></li>



					</c:otherwise>



				</c:choose>

				<li class="nav-item">
					<div class="dropdown">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fa-solid fa-headset">&nbsp;Center</i>
						</a>
						<div class="dropdown-menu">



							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/board/notice/List.do?ct=notice&ct_idx=0">공지사항</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/board/qna/List.do?ct=qna&ct_idx=1">QnA</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/board/dq/List.do?ct=dq&ct_idx=2">1:1문의게시판</a>

						</div>
					</div>
				</li>
			</ul>
		</div>
		</div>
		</div>


		<br>

	</nav>
        <script>
        // dropdown menu hover시 작동
        
		var $dropdown = $(".navbar-nav .nav-item .dropdown");
		var $dropdownToggle = $(".dropdown-toggle");
		var $dropdownMenu = $(".dropdown-menu");
		var showClass = "show";
		$(window).on("load resize", function() {
			if (this.matchMedia("(min-width: 768px)").matches) {
				$dropdown.hover(function() {
				var $this = $(this);
				$this.addClass(showClass);
				$this.find($dropdownToggle).attr("aria-expanded", "true");
				$this.find($dropdownMenu).addClass(showClass);
				},
				function() {
					var $this = $(this);
					$this.removeClass(showClass);
					$this.find($dropdownToggle).attr("aria-expanded", "false");
					$this.find($dropdownMenu).removeClass(showClass);
					}
				);
				} else {
					$dropdown.off("mouseenter mouseleave");
					}
			});
	    
		</script>
      <div class="mb-5"></div>
      <div class="mb-5"></div>
      <div class="mb-5"></div>
<!-- 상단부 -->