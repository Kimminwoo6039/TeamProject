<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${ct== 'notice'}">
		<title>공지사항</title>
	</c:when>
	<c:when test="${ct=='qna' }">
		<title>QnA</title>
	</c:when>
	<c:when test="${ct=='dq' }">
		<title>1:1문의하기</title>
	</c:when>
</c:choose>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
/*summernote images size fix*/

::ng-deep .ngx-summernote-view img{

  max-width: 100%;

}
</style>
<script src="https://kit.fontawesome.com/ea9f50e12b.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
<script>
	
		
		
	$(function(){
		var fm = document.frm;
	
		$("fm").on('submit' , function(){
			//alert('1');
			var category = $("#category").val();
			var title = $("#title").val();
			var name = $("#name").val();
			var content = $("#summernote").val();
			
			if(category  == ""){
				alert("카테고리를 선택해주세요");
				$("#category").focus();
				return false;	
				
			}else if(title == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#title").focus();
				return false;	
				
			}else if(name == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#name").focus();
				return false;		
				
			}else if(content == ""){
				alert("작성하지 않은 부분이 있습니다.");
				$("#content").focus();
				return false;	
				
			}
		});
	});
});	
	
	
</script>
</head>
<%@ include file="../include/menu1.jsp" %>
<body class="text-center">

<c:if test="${sessionScope.name == null}">
	<script type="text/javascript">	
		alert("유효하지 않은 접근입니다.");
		location.href="/"
	</script>	
</c:if>
<c:if test="${ct == 'dq'}">
	<script type="text/javascript">	
		alert("문의하기는 수정이 불가능합니다. \n문의하기를 다시 작성해 주세요");
		location.href="javascript:history.back();"
	</script>
</c:if>

<form class="form-horizontal" id="frm_Search" name="moveForm" method="post" action="${pageContext.request.contextPath}/board/${ct}/list.do" enctype="multipart/form-data">
<%-- <input type="hidden" name="type" value="${pageMaker.cri.type}">
<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> --%>
<input type="hidden" name="nowPage" value="${pageMaker.page}">
<input type="hidden" name="cntPerPage" value="${pageMaker.PerPageNum}">
<input type="hidden" name="bidx" value="${vo.bidx }">
<input type="hidden" name="ct_idx" value="${ct_idx}">
<input type="hidden" name="ct" value="${ct}">
</form>	
	
<!-- 제목 -->
<form class="form-horizontal" id="frm" name="moveForm" method="post" action="${pageContext.request.contextPath}/board/${ct}/update.do" enctype="multipart/form-data">
<input type="hidden" name="bidx" value="${vo.bidx }">
<div class="container">
	<div class="input-group">
		<c:choose>
					<c:when test="${ct == 'dq' }">
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="2" <c:if test="${ct=='dq'}"><c:out value="selected">selected</c:out></c:if>>1:1문의</option>
						</select>
					</c:when>
					<c:when test="${ct == 'notice' }">
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="0" <c:if test="${ct=='notice'}"><c:out value="selected">selected</c:out></c:if>>공지사항</option>				
						</select>
					</c:when>
					<c:otherwise>
						<select id="category" name="ct_idx" class="form-control col-2" aria-label="Default select example">
							<option value="1" <c:if test="${ct=='qna'}"><c:out value="selected">selected</c:out></c:if>>qna</option>				
						</select>
					</c:otherwise>
				</c:choose>
		<input type="text" class="form-control col-sm-8" id="title" placeholder="title" name="title" value="${vo.title }" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
		<div id="title_result"></div>
		<!-- 작성자 -->
		<input type="text" class="form-control col-sm-2" id="name" readonly="readonly" value="${vo.member_id }" name="member_id" aria-label="Recipient's username" aria-describedby="button-addon2"><br>
		<div id="writer_result"></div>
	</div>

<!--  -->
	<div>
		<textarea  id="summernote" class="summernote" name="content" style="text-align:left;">${vo.content}</textarea>
			<script>
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor,
            welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this
            
            
            
            );
            		}
            	}
            }
         };

        $('#summernote').summernote(setting);
        });
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "${pageContext.request.contextPath}/uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}
</script>
	</div>
</div>
<div class="container">
	<div class="pt-1 text-right"> 
		
		<input id="btn-outline-secondary" class="btn btn-outline-secondary" type="submit" value="글수정"/>
		
		<input id="btn-outline-secondary" class="btn btn-outline-secondary" type="button" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/board/${ct}/List.do?ct=${ct}&ct_idx${ct_idx}'"/>
		
		<!--  <button class="btn btn-outline-secondary" id="modi" type="submit">수정완료</button> -->
	</div>
</div>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>