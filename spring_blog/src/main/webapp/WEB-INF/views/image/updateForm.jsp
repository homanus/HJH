<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ include file="../ssi/ssi.jsp" %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
TABLE{
  margin: 0 auto;            /* 테이블 가운데 정렬 */
  border-color: #AAAAAA;     /* 테이블 외곽선 색깔 */ 
  border-width: 1px;         /* 테이블 외곽선 두께 */ 
  border-style: solid;       /* 테이블 외곽선 스타일 */
  border-collapse: collapse; /* 컬럼의 외곽선을 하나로 결합 */
  font-size: 20px;
  border-spacing:0px;
  border-style:none;
  padding:0px;
}
h1,h2,h3,h4,h5,h6 {font-family: "Oswald"}

body {font-family: "Open Sans"}
</style> 
<script type="text/javascript">
function incheck(f){
	if(f.mname.value==""){
		alert("이름을 입력해주세요.");
		f.mname.focus();
		return false;
	}
	if(f.title.value==""){
		alert("제목을 입력해주세요.");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력해주세요.");
		f.content.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력해주세요.");
		f.passwd.focus();
		return false;
	}
	if(f.fname.value==false){
		alert("사진을 올려주세요.");
		
		return false;
		
	}
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<div class="w3-white">
<div class="container">

<h2><span class="glyphicon glyphicon-pencil">
</span>수정</h2>
 
<FORM	 name='frm' 
		 method='POST' 
		 action='update'
		 enctype="multipart/form-data"
		 onsubmit="return incheck(this)">
		 <input type="hidden" name="ino" value="${dto.ino }">
		 <input type="hidden" name="oldfile" value="${dto.fname }">
		 <input type="hidden" name="nowPage" value="${param.nowPage }">
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		 
		 

  <TABLE class="table table-bordered">
  <tr>
  	<th><div style="margin:10px">원본 파일</div></th>
  	<td><img src="${root }/storage_image/${dto.fname}" width="60%"></td>
  </tr>
    <TR>
      <TH><div style="margin:10px">수정 파일</div></TH>
      <TD><div style="margin:10px"><input type="file" name="fnameMF" accept=".jpg,.png,.gif" size="15"></div></TD>
    </TR>
    <TR>
      <TH><div style="margin:10px">이름</div></TH>
      <TD><div style="margin:10px"><input type="text" name="mname" value="${dto.mname }" size="15"></div></TD>
    </TR>
    <TR>
      <TH><div style="margin:10px">제목</div></TH>
      <TD><div style="margin:10px"><input type="text" name="title" value="${dto.title }" size="15"></div></TD>
    </TR>
    <TR>
      <TH><div style="margin:10px">내용</div></TH>
      <TD><div style="margin:10px"><textarea name="content" rows="7">${dto.content }</textarea></div></TD>
    </TR>
    <tr>
    	<th><div style="margin:10px">비밀 번호</div></th>
    	<td><div style="margin:10px"><input type="password" name="passwd" size="15"></div></td>
    </tr>
    
  </TABLE>
  <p class="w3-center">
    <input type='submit' class="w3-button w3-red" value='수정'>
    <input type='button' class="w3-button w3-white w3-border" value='뒤로가기' onclick="history.back()">
    </p>
</FORM>
 
 </div>
 </div>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 