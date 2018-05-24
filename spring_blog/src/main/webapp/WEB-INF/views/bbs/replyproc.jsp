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
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">답변확인</DIV>
 
<div class="content">
<c:choose>
	<c:when test="${flag == true }">
	답변생성
	</c:when>
	<c:otherwise>
	답변실패
	</c:otherwise>
</c:choose>
</div>
  
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
  </DIV>

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 