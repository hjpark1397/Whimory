<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Whimory</title>
<!-- Bootstrap CSS -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Jua|Nanum+Gothic|Sunflower:300" rel="stylesheet">
<style type="text/css">
html head{
	font-family: Roboto, Nanum Gothic;
}
html body{
	font-family: Roboto, Nanum Gothic;
} 
table tr td a { text-decoration:none } 
</style> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function moveLoginPage(){
   alert("로그인 후 이용 가능한 서비스입니다.\n로그인 페이지로 이동합니다.");   
   location.href = "${ pageContext.servletContext.contextPath }/loginPage.do";
}

function freeDel(button, free_re_file){
   
	free_no = button.id.substring(4);
	console.log(free_no);
	
	var answer = confirm("게시글을 정말 삭제하시겠습니까?\n삭제 후 복구가 불가능합니다.");
   
   if(answer == true){
      location.href = "${ pageContext.servletContext.contextPath }/fdelete.do?free_no=" + free_no;
   }
}

function showDiv(item){
	if($(item).val() == "title"){
		$("#titleDiv").css("display", "inline-block");
		$("#writerDiv").css("display", "none");
		$("#contentDiv").css("display", "none");
	}
	   
	if($(item).val() == "writer"){
		$("#titleDiv").css("display", "none");
		$("#writerDiv").css("display", "inline-block");
		$("#contentDiv").css("display", "none");
	}
	   
	if($(item).val() == "content"){
		$("#titleDiv").css("display", "none");
		$("#writerDiv").css("display", "none");
		$("#contentDiv").css("display", "inline-block");
	}
}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">자유 토론 공간</h2>
<br>
<!-- 로그인 여부에 따라 로그인페이지/게시글 작성 페이지로 이동, 관리자는 작성 x -->
<c:if test="${ empty sessionScope.loginUser }">
   <div style="align:center;text-align:center;">
       <button class="btn btn-outline-primary" onclick="moveLoginPage();">게시글 작성</button>
    </div>
</c:if>
<c:if test="${ !empty sessionScope.loginUser and sessionScope.loginUser.admin_yn eq 'N' }">
   <div style="align:center;text-align:center;">
      <button class="btn btn-outline-primary" onclick="javascript:location.href='fwform.do';">게시글 작성</button>
   </div>
</c:if>
<br>

<table align="center" width="1150px">
	<tr>
		<td colspan="3"><h5>총 게시글 갯수 : ${ listCount }</h5></td>
    	<!-- 게시판 내 검색기능 -->  
		<td colspan="7" align="right">
			<div style="float: left; width: 50%;">
			<select class="form-control" onchange="showDiv(this)" style="width:80px; display:inline-block">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="content">내용</option>
			</select>
			</div>
			<div id="titleDiv" style="display:inline-block; float: left; width: 40%;" >
				<form action="fstitle.do" method="post">
					<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control">
					<button type="submit" class="btn btn-outline-primary">검색</button>
				</form>
			</div>
			<div id="writerDiv" style="display:none; float: left; width: 40%;">
				<form action="fswriter.do" method="post">
					<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control" >
					<button type="submit" class="btn btn-outline-primary">검색</button>
				</form>
			</div>
			<div id="contentDiv" style="display:none; float: left; width: 40%;">
				<form action="fscontent.do" method="post">
					<input type="search" name="keyword" placeholder="검색어를 입력하세요" style="width: 250px; float: left;" class="form-control" >
					<button type="submit" class="btn btn-outline-primary">검색</button>
				</form>
			</div>
		</td>
	</tr>
</table>


<div style="height:10px"></div>

<table class="table table-lightgray table-hover" style="table-layout: fixed; width:1200px" align="center" cellspacing="0" cellpadding="3" >
   <thead>
      <tr align="center" class="thead-light">
         <th width="50px">번호</th>
         <th width="300px" colspan="3">제목</th>
         <th width="120px">작성자</th>
         <th width="150px">등록일</th>
         <th width="100px">첨부파일</th>
         <th width="100px">조회수</th>
         <th width="100px">추천수</th>
         <th width="100px">신고수</th>
         <!-- 관리자용 리스트 : 삭제기능 추가 -->
         <c:if test="${ loginUser.admin_yn eq 'Y' }">
         	<th width="120px">삭제하기</th>
         </c:if> 
      </tr>
   </thead>   
   <c:forEach items="${ list }" var="li">
      <input type="hidden" id="free_no" value="${ li.free_no }">
      <input type="hidden" id="free_re_file" value="${ li.free_re_file }">
      <tr align="center">
         <td>${ li.free_no }</td>
         <td colspan="3" align="left">
            <c:url var="fdetail" value="fdetail.do">
               <c:param name="free_no" value="${ li.free_no }" />
               <c:param name="page" value="${ currentPage }" />
            </c:url>
            <a href="${ fdetail }">&nbsp;&nbsp;${ li.free_title }</a>
         </td>
         <td>${ li.user_id }</td>
         <td>${ li.free_date }</td>
         <td>
            <c:if test="${ !empty li.free_re_file }">
               <i class="fas fa-file-download"></i>
            </c:if>
            <c:if test="${ empty li.free_re_file }">
               &nbsp;
            </c:if>
         </td>
         <td>${ li.free_readcount }</td>
         <td>${ li.free_like }</td>
         <td>${ li.free_bad }</td>
         <!-- 관리자용 리스트 : 삭제기능 추가 -->
         <c:if test="${ loginUser.admin_yn eq 'Y' }">
            <td>
               <button type="button" id="btn_${ li.free_no }" class="btn btn-outline-primary" onclick="freeDel(this)" >
                       <font style="vertical-align: inherit;">삭제</font>
               </button>
         	</td>
         </c:if>
      </tr>
   </c:forEach>
</table>
<br>



<!-- 페이징 처리 -->
<div style="text-align:center;">
   <c:if test="${ currentPage <= 1 }">
      [맨처음]
   </c:if>
   <c:if test="${ currentPage > 1 }">
      <c:url var="ubl" value="/flist.do">
         <c:param name="page" value="1" />
      </c:url>
      <a href="${ ubl }">[맨처음]</a>
   </c:if>
   
<!-- 이전 그룹으로 이동 처리 -->
<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
   <c:url var="ubl2" value="/flist.do">
      <c:param name="page" value="${ startPage - 10 }"/>
   </c:url>
   <a href="${ ubl2 }">이전그룹</a>
</c:if>
<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
   &nbsp;&nbsp;이전그룹&nbsp;&nbsp;
</c:if>

<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
   <c:if test="${ p eq currentPage }">   
      <font weight="bolder" size="4"><b>${ p }</b></font>
   </c:if>
   <c:if test="${ p ne currentPage }">
      <c:url var="ubl3" value="/flist.do">
         <c:param name="page" value="${ p }"/>
      </c:url>
      <a href="${ ubl3 }">${ p }</a>
   </c:if>
</c:forEach>

<!-- 다음 그룹으로 이동 처리 -->
<c:if test="${ (currentPage + 10) > endPage && (currentPage + 10) < maxPage }">
   <c:url var="ubl4" value="/flist.do">
      <c:param name="page" value="${ endPage + 10 }"/>
   </c:url>
   <a href="${ ubl4 }">다음그룹</a>
</c:if>
<c:if test="${ !((currentPage + 10) > endPage && (currentPage + 10) < maxPage) }">
   &nbsp;&nbsp;다음그룹&nbsp;&nbsp;
</c:if>

<!-- 맨끝 페이지로 이동 처리 -->
<c:if test="${ currentPage >= maxPage }">
   [맨끝]
</c:if>   
<c:if test="${ currentPage < maxPage }">
   <c:url var="ubl5" value="/flist.do">
      <c:param name="page" value="${ maxPage }"/>
   </c:url>
   <a href="${ ubl5 }">[맨끝]</a>
</c:if>
</div>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>