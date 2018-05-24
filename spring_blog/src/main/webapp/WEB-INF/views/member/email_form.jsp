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
<body>
 
<DIV class="title">Email 중복 확인</DIV>

<FORM name='frm' method='POST' action='./email_proc'>
  <TABLE>
    <TR>
      <TH>이메일</TH>
      <TD><input type="email" name="email" size="20"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='중복확인'>
    <input type='button' value='취소' onclick="location.href=''">
  </DIV>
</FORM>
 
 
</body>
</html> 