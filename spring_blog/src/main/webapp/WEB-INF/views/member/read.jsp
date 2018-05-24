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
function mcreate(){
	var url="agreement";
	location.href=url;
}

function mdelete(id){
	var url="delete";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	url+="&grade=${dto.grade}";
	location.href=url;
}

function pwUpdate(id){
	var url = "passwordCheck";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}

function infoUpdate(id){
	var url="updateInfo";
	url+="?id="+id;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}

function updateFile(){
	var url="updateFile";
	url+="?id=${dto.id}";
	url+="&oldfile=${dto.fname}";
	url+="&col=${param.col}"
	url+="&word=${param.word}"
	url+="&nowPage=${param.nowPage}"
	location.href=url;
}

function mlist(){
	var url = "${root}/admin/list";
	url+="?col=${param.col}"
	url+="&word=${param.word}"
	url+="&nowPage=${param.nowPage}"
	location.href=url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">${dto.mname }회원 정보</DIV>
 
  <TABLE>
    <tr>
    	<td colspan="2"><img src="${root }/storage_member/${dto.fname }"></td>
    </tr>
    <TR>
		<TH>id</TH>
		<td>${dto.id }</td>
    </TR>
    <tr>
      <Th>이름</Th>
      <td>${dto.mname }</td>
    </tr>
    <tr>
    	<th>연락처</th>
    	<td>${dto.tel }</td>
    </tr>
    <tr>
    	<th>이메일</th>
    	<td>${dto.email }</td>
    </tr>
    <tr>
    	<th>우편번호</th>
    	<td>${dto.zipcode }</td>
    </tr>
    <tr>
    	<th>주소</th>
    	<td>
    	${dto.address1 }
    	<br>
    	${dto.address2 }
    	</td>
    </tr>
    <tr>
    	<th>직업</th>
    	<td>${dto.job }
    	<br>${util:getCodeValue(dto.job) }</td>
    </tr>
    <tr>
    	<th>가입날짜</th>
    	<td>${dto.mdate }</td>
    </tr>
    <tr>
    	<th>등급</th>
    	<td>${dto.grade }</td>
    </tr>
  </TABLE>
  
  
  <div class="bottom">
  <c:if test="${(not empty sessionScope.id) && (sessionScope.grade=='A') }">
  	<input type='button' value='목록' onclick="mlist()">
  </c:if>
    <input type='button' value='등록' onclick="mcreate()">
    <input type='button' value='정보수정' onclick="infoUpdate('${dto.id}')">
    <br><br>
  <c:if test="${(not empty sessionScope.id) && !(sessionScope.grade=='A') }">
  	<input type='button' value='사진수정' onclick="updateFile()">
  <input type='button' value='패스워드변경' onclick="pwUpdate('${dto.id}')">
  </c:if>
    <input type='button' value='회원탈퇴' onclick="mdelete('${dto.id}')">
     <input type='button' value='다운로드'
                onclick="location.href='${root }/download?dir=/storage_member&filename=${dto.fname }'">  
  </DIV>
  
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 