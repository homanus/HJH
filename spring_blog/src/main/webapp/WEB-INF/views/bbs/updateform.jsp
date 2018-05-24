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
.bottom{
  margin: 20px auto;
  text-align: center;
  width: 100%;
  padding: 10px;  /* 위 오른쪽 아래 왼쪽 */
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function incheck(){
	
	var f = document.frm;
		
	if(f.wname.value==""){
		alert("이름을 입력해주세요.")
		f.wname.focus();
		return;
		}
	
	if(f.title.value==""){
		alert("제목을 입력해주세요.")
		f.title.focus();
		
		return;
		}
	 if (CKEDITOR.instances['content'].getData() == '') {
	      window.alert('내용을 입력해 주세요.');
	      CKEDITOR.instances['content'].focus();
	      return;
	    }
	
	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요.")
		f.passwd.focus();
		
		return;
		}
	
	f.submit();
}

</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
		<div class="container">
		<h2><span class="glyphicon glyphicon-pencil"></span></h2>
 
<FORM name='frm' 
	  method='POST'
	  action='./update'
	  enctype="multipart/form-data"
	  >
	  
	  <input type="hidden" name="bbsno" value="${dto.bbsno }">
	  <input type="hidden" name="col" value='${param.col }'>
	  <input type="hidden" name="word" value='${param.word }'>
	  <input type="hidden" name="nowPage" value='${param.nowPage }'>
	  <input type="hidden" name="oldfile" value='${param.oldfile }'>
	  

  <TABLE class="table table-bordered">
    <TR>
      <TH>작성자</TH>
      <TD><input type="text" name="wname" value="${dto.wname }"></TD>
    </TR>
    <tr>
    	<th>제목</th>
    	<td><input type="text" name="title" value="${dto.title }"></td>
    </tr>
    <tr>
    	<th>내용</th>
    	<td><textarea rows="5" cols="30" name="content">${dto.content }</textarea></td>
    </tr>
     <tr>
    	<th>비밀번호</th>
    	<td><input type="password" name="passwd"></td>
    </tr>
    <TR>
      <TH>원본파일</TH>
      <TD>
      원본파일명:${dto.filename }
      </TD>
    </TR>
     <tr>
    	<th>변경파일</th>
    	<td>
    	<input type="file" name="filenameMF">
    	</td>
    </tr>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='수정' onclick="incheck()">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</div>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 