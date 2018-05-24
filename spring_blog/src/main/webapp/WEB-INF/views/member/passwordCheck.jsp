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


</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
 
<FORM name='frm' method='POST' action='updatePasswdForm'>


		<input type="hidden" name="id" value="${param.id }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		
<DIV class="title">현재 비밀번호 확인</DIV>
<div class="content">
 <input type="password" name="passwd1" value="" required>
</div>
  
  <DIV class='bottom'>
    <input type='submit' value='수정하러가기'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 