<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${root }/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function blist(){
	var url = "list.do";
	url+="?col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	location.href=url;
}
function bcreate(){
	var url = "createform.do";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">수정확인</DIV>
 

  
  <div class="content">
  <c:choose>
  	<c:when test="${pflag == false }">
  	잘못된 비밀번호 입니다.
  	<br><button type='button' onclick='history.back()'>다시시도</button>
  	</c:when>
  	<c:when test="${flag == true }">
  	글 수정 성공
  	</c:when>
  	<c:otherwise>
  	글 수정 실패
  	</c:otherwise>
  </c:choose>
  </div>
  
  
  <DIV class='bottom'>
    <input type='submit' value='등록' onclick="bcreate()">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 