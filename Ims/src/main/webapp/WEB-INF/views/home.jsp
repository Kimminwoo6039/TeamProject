<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Im's shopping mall</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"></link> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/image/style.css">
<script src="https://kit.fontawesome.com/6c060c00b1.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- s: dropdown css -->
<link
	href="${pageContext.request.contextPath}/resources/js/smoothscroll.min.js"></link>
<!-- e: dropdown css -->



<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Yellowtail&display=swap')
	;

.abc {
	font-family: 'Yellowtail', cursive;
	font-size: 100px;
}
</style>
<!-- top 버튼 css -->
<style>
.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:998;
	border:1px solid #ccc;
	outline:none;
	background-color:white;
	color:#333;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}
</style>
<!-- top 버튼 css -->








<c:if test="${model.message==kakaologout}">

	<script>
		/* 
		 window.onload = function(){
		 init();
		 }

		 function init(){
		 alert("카카오 로그아웃");
		 }
		 */
	</script>

</c:if>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dropdowncss.css" />

<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	padding-top: 70px;
	background: #eee;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	padding-top: 50px;
	padding-bottom: 50px;
}

.swiper-slide {
	background-position: center;
	background-size: cover;
	width: 300px;
	height: 300px;
}

.swiper-slide img {
	display: block;
	width: 100%;
}

</style>







</head>
<body>
	<h1 class="title">


		<div>
			<a href="${pageContext.request.contextPath}/" style="text-decoration: none;"><h3 style="text-align: center; color: black;" class="abc">
					Im'S something for us</h3></a>
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
						href="<%=request.getContextPath()%>/member/join.do"><i
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
		



		<div class="col navbar-sticky-top">
		<div class="justify-content-end collapse navbar-collapse " id="navbarResponsive">
			<ul class="navbar-nav ms-auto my-1 my-lg-0 align-items-center" style="margin: 50px;">

				<li class="nav-item">
				<form action="<%=request.getContextPath()%>/shop/product/list.do" method="post">
						<div class="input-group">
							<div class="form-group" style="display: flex; padding-top: 30px">
								<input style="background-color:#e7dce6" type="text" name="keyword" size="25" value="${pageMaker.cri.keyword }" placeholder="원하시는 상품을 입력하세요" class="form-control">
								<%-- <input type="hidden" name="brand" value="${pageMaker.cri.brand }"> --%>
								<button class="btn btn-outline-dark"><i class="fa-solid fa-magnifying-glass"></i></button>
							</div>
						</div>    
					</form></li>

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
				}, function() {
					var $this = $(this);
					$this.removeClass(showClass);
					$this.find($dropdownToggle).attr("aria-expanded", "false");
					$this.find($dropdownMenu).removeClass(showClass);
				});
			} else {
				$dropdown.off("mouseenter mouseleave");
			}
		});
	</script>
	<!-- 상단부 -->
	<div id="carouselExampleIndicators"
		class="carousel carousel-dark slide" data-bs-ride="carousel"
		style="max-with: 100%; max-height: 100%;">
		<div class="carousel-indicators">
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
				class="active" aria-current="true" aria-label="Slide 1"></button>
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
				aria-label="Slide 2"></button>
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
				aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner" style="text-align: center;">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/resources/image/aa.png" class="d-b lock w-70"> <img
					src="${pageContext.request.contextPath}/resources/image/bb.png" class="d-b lock w-70">
				<h5>Louis Vuitton</h5>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/resources/image/cc.png" class="d-b lock w-70"> <img
					src="${pageContext.request.contextPath}/resources/image/dd.png" class="d-b lock w-70">
				<h5>PRADA</h5>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/resources/image/ee.png" class="d-b lock w-70">
				<h5>MAISON MARGIELA</h5>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<br>













	<!-- 비디오 단 -->
	<div id="carouselExampleDark" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000"
				style="text-align: center;">
				<iframe id="aa" width="1280" height="720"
					src="https://www.youtube.com/embed/QgDjCQAHrt0?autoplay=1&mute=1"
					title="발렌시아가 런웨이를 보고 만든 패션쇼 음악 ㅣBalenciaga Clones Spring 22 Collection"
					frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<div class="carousel-caption d-none d-md-block">
					<h5>Balenciaga</h5>
					<p>Balenciaga Clones Spring 22 Collection</p>
				</div>
			</div>
			<div class="carousel-item" data-bs-interval="2000"
				style="text-align: center;">
				<iframe id="aa" width="1280" height="720"
					src="https://www.youtube.com/embed/1ly14-97QqA?autoplay=1&mute=1"
					title="Louis Vuitton Cruise 2022 Show | LOUIS VUITTON"
					frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<div class="carousel-caption d-none d-md-block">
					<h5>Louis Vuitton</h5>
					<p>Louis Vuitton Cruise 2022 Show | LOUIS VUITTON</p>
				</div>
			</div>
			<div class="carousel-item" style="text-align: center;">
				<iframe id="aa" width="1280" height="720"
					src="https://www.youtube.com/embed/hTU4_-iWJWQ?autoplay=1&mute=1"
					title="Dior Fall 2022 Show" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
				<div class="carousel-caption d-none d-md-block">
					<h5>Dior Run Way</h5>
					<p>Dior Fall 2022 Show</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleDark" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<br>
	
	<!-- 상품바로가기 -->
	<<div class="buy_now">
		<div class="main_subject">
			<h2 style="text-align: center;">Shop now</h2>
			<div class="brand_shop row-6" style="text-align: center;">
				<ul
					style="list-style: none; text-align: center; display: flex; justify-content: center; margin-left: -18px">
					<div style="margin: 5px">
<<<<<<< HEAD
						<li class="mb-2"><a
							href="/shop/product/list.do?brand=BOTTEGA VENETA"><button
									type="button" class="btn btn-outline-dark" style="width: 200">BOTTEGA
									VENETA</button></a></li>
=======
						<li class="mb-2"><a href="${pageContext.request.contextPath}/shop/product/list.do?brand=BOTTEGA VENETA"><button	type="button" class="btn btn-outline-dark" style="width: 200px;">BOTTEGA VENETA</button></a></li>
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
						<li class="mb-2"><a
<<<<<<< HEAD
							href="/shop/product/list.do?brand=GUCCI"><button
									type="button" class="btn btn-outline-dark" style="width: 200">GUCCI</button></a></li>
=======
							href="${pageContext.request.contextPath}/shop/product/list.do?brand=GUCCI"><button
									type="button" class="btn btn-outline-dark" style="width: 200px;">GUCCI</button></a></li>
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git

						


						<li class="mb-2"><a
<<<<<<< HEAD
							href="/shop/product/list.do?brand=THOM BROWN"><button
									type="button" class="btn btn-outline-dark" style="width: 200">THOM
									BROWN</button></a></li>
=======
							href="${pageContext.request.contextPath}/shop/product/list.do?brand=THOM BROWN"><button type="button" class="btn btn-outline-dark" style="width: 200px;">THOM BROWN</button></a></li>
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git

					</div>
					<div style="margin: 5px">

<<<<<<< HEAD

						<li class="mb-2"><a
							href="/shop/product/list.do?brand=BURBERRY"><button
									type="button" class="btn btn-outline-dark" style="width: 200">BURBERRY</button></a></li>
=======
                        <li class="mb-2"><a href="${pageContext.request.contextPath}/shop/product/list.do?brand=BURBERRY"><button	type="button" class="btn btn-outline-dark" style="width: 200px;">BURBERRY</button></a></li>
					
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git

						


						<li class="mb-2"><a
<<<<<<< HEAD
							href="/shop/product/list.do?brand=MAISON MARGIELA"><button
									type="button" class="btn btn-outline-dark" style="width: 200">MAISON
=======
							href="${pageContext.request.contextPath}/shop/product/list.do?brand=MAISON MARGIELA"><button
									type="button" class="btn btn-outline-dark" style="width: 200px;">MAISON
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
									MARGIELA</button></a></li> 


						<li class="mb-2"><a
<<<<<<< HEAD
							href="/shop/product/list.do?brand=VALETINO"><button
									type="button" class="btn btn-outline-dark" style="width: 200">VALENTINO</button></a></li>
=======
							href="${pageContext.request.contextPath}/shop/product/list.do?brand=VALETINO"><button
									type="button" class="btn btn-outline-dark" style="width: 200px;">VALENTINO</button></a></li>
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
				</ul>
			</div>

		</div>


	</div>




	<!-- 셀럽 착용샷 -->
	<div id="carouselExampleIndicators1"
		class="carousel carousel-dark slide" data-bs-ride="carousel"
		style="max-with: 100vh; max-height: 100vh;">
		<div class="carousel-indicators">
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators1" data-bs-slide-to="0"
				class="active" aria-current="true" aria-label="Slide 1"></button>
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators1" data-bs-slide-to="1"
				aria-label="Slide 2"></button>
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators1" data-bs-slide-to="2"
				aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner" style="text-align: center;">
			<div class="carousel-item active">
				<img src="${pageContext.request.contextPath}/resources/image2/a.png" class="d-b lock w-70">
				<h5>#GD #Balenciaga</h5>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/resources/image2/b.png" class="d-b lock w-70">
				<h5>
					#taeri_taeri #Nike #AirJordan #</a>
				</h5>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/resources/image2/c.png" class="d-b lock w-70">
				<h5>#Seolhyun #Kai #Gucci #Shoes</h5>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators1" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators1" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<br>




	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>



	<!-- Swiper -->
	<div class="swiper mySwiper"
		style="height: 400px; margin-top: 60px; margin-bottom: 60px;">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/resources/image/1.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/resources/image/2.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/resources/image/3.jpg" />
			</div>
			<div class="swiper-slide">
				<img src="${pageContext.request.contextPath}/resources/image/4.jpg" />
			</div>
		</div>
		<div class="swiper-pagination"></div>
	</div>
	<!-- Swiper JS -->


	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper(".mySwiper", {
			effect : "coverflow",
			grabCursor : true,
			centeredSlides : true,
			slidesPerView : "auto",
			autoplay : {
				delay : 1000
			},
			coverflowEffect : {
				rotate : 50,
				stretch : 0,
				depth : 100,
				modifier : 1,
				slideShadows : true,
			},
			pagination : {
				el : ".swiper-pagination",
			},
		});
	</script>































	<!-- 
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel" style="margin-left: 820px;width: 200px">
	<div class="carousel-inner" style="width: 800px;">
		<div class="carousel-item active">
	    	<img src="resources/image3/a.png"  style="width:250px; margin-right: -150px" >
		</div>
  		<div class="carousel-item">
			<img src="resources/image3/b.png" style="width:250px; margin-right: -200px">
		</div>
		<div class="carousel-item">
			<img src="resources/image3/c.png" style="width:250px; margin-right: 200px">
		</div>
		<div class="carousel-item">
		    <img src="resources/image3/d.png" style="width:250px; margin-right: 200px">
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>
</div> -->
	
<!-- 상단으로 이동하기 버튼 -->
<a href="#doz_header" class="btn_gotop" id="click">
	<span class="glyphicon glyphicon-chevron-up">
	<i class="fa-solid fa-angle-up"></i>
	</span>
</a>

<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script>
<!-- 상단으로 이동하기 버튼 -->
</body>
<%@ include file="include/footer.jsp" %>
</html>
