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
function greload(){
	opener.location.reload();
	self.close();
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">삭제 확인</DIV>
<div class="content">
<c:choose>
	<c:when test="${flag == true }">
		삭제성공
	</c:when>
	<c:otherwise>
		삭제실패
	</c:otherwise>
</c:choose>

</div>
  
  <DIV class='bottom'>
    <input type='button' value='확인' onclick="greload()">
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 