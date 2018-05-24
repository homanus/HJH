<%@ page contentType="text/html; charset=UTF-8"%> 
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

function dehet(){
opener.location.reload();
self.close();
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<DIV class="title">삭제</DIV>
<c:choose>
	<c:when test="${flag == true }">
		<FORM name='frm' method='POST' action='delete'> 
		<input type="hidden" name="gno" value="${param.gno }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		<div class="content">
		삭제시 복구 불가<br>
		정말로 삭제하시겠습니까?
	
		</div>
		
		<DIV class='bottom'>
	    <input type='submit' value='삭제'>
	    <input type='button' class='w3-button w3-white w3-border' value='취소' onclick="self.close()">
	 	</DIV>
		</FORM>
	
	</c:when>
	<c:otherwise>
		<div class="content">
	 		본인이 작성한 글이 아닙니다.
	 		<br><input type='button' value='확인' onclick='dehet()'>
		</div>
	</c:otherwise>
</c:choose>
 
</body>
</html> 