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
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">삭제 확인</DIV>
<FORM name='frm' method='POST' action='delete'>
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">
<input type="hidden" name="id" value="${id }">
<input type="hidden" name="fname" value="${fname }">
<div class="content">
정말 탈퇴 하시겠습니까?<br>
회원 탈퇴시 복구하실 수 없습니다.
</div>
 

  <DIV class='bottom'>
    <input type='submit' value='회원탈퇴'>
    <input type='button' value='취소' onclick='history.back()'>
  </DIV>

 </FORM>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 