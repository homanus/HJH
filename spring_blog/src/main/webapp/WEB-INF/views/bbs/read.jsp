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
.rlist{
	line-height: 1.2em;
	font-size:15px;
	font-weight:bold;
	text-align:left;
	border-style:solid;
	border-width:1px;
	border-color:#AAAAAA;
	color:#000000;
	width:35%;
	padding:10px;
	margin:20px auto;
}
.rcreate{
	font-size:20px;
	font-weight:bold;
	text-align: left;
	border: 1px solid #AAAAAA;
	width:35%;
	padding:10px;
	margin:20px auto;
}
hr{
	text-align: center;
	border: 1px solid #AAAAAA;
	width:45%;
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function blist(){
	var url = "list";
	url+="?col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}
function bupdate(){
	var url = "update";
	url+="?bbsno=${dto.bbsno}";
 	url+="&oldfile=${dto.filename}";
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}
function bdelete(){
//	if(confirm("삭제시 복구하실 수 없습니다. \n 정말 삭제하시겠습니까?")){
	var url="delete";
	url+="?bbsno=${dto.bbsno}";
 	url+="&oldfile=${dto.filename}";
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
//}
}
function reply(bbsno){
	var url="reply";
	url+="?bbsno="+bbsno;
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}
function fileDown(filename){
	var url = "${root}/download";
	url+="?filename="+filename;
	url+="&dir=/storage_bbs";
	
	location.href = url;
}

function input(f){
		if('${sessionScope.id}'==""){
			if(confirm("로그인후 댓글을 다실 수 있습니다. \n 로그인 하시겠습니까?")){
				var url = "../member/login";
				url += "?bbsno=${dto.bbsno}";
				url += "&nowPage=${param.nowPage}";
				url += "&col=${param.col}";
				url += "&word=${param.word}";
				url += "&nPage=${nPage}";
				url += "&rflag=../bbs/read";
				location.href=url;
				
				return false;
			
		}else{
				return false;
		}
		
		
	}else if(f.content.value==false){
		alert("댓글내용을 입력하세요.");
		f.content.focus();
		
		return false;
	}

}

function rupdate(rnum,rcontent){
	var f = document.rform;
	f.content.value = rcontent;
	f.rnum.value = rnum;
	f.rsubmit.value="수정";
	f.action="./rupdate";
}

function rdelete(rnum){
	if(confirm("정말 삭제 하시겠습니까?")){
		var url="./rdelete";
		url += "?rnum="+rnum;
		url += "&bbsno=${dto.bbsno}";
		url += "&nowPage=${param.nowPage}";
		url += "&nPage=${nPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		
		location.href=url;
		
	}
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<div class="container-fluid">
<div align="center"><h2><span class="glyphicon glyphicon-th-list"></span>게시판 내용</h2></div>
 

  <TABLE class="table table-hover" style="width:80%; margin: 0 auto;">
    <TR>
      <TH>번호</TH>
      <TD>${dto.bbsno }</TD>
    </TR>
    <TR>
      <TH>작성자</TH>
      <TD>${dto.wname }</TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD>${dto.title }</TD>
    </TR>
    <TR>
      <TD colspan="2">${dto.content }</TD>
    </TR>
    <TR>
      <TH>조회수</TH>
      <TD>${dto.viewcnt }</TD>
    </TR>
    <TR>
      <TH>등록날짜</TH>
      <TD>${dto.wdate }</TD>
    </TR>
  		<tr>
  		<th>파일명</th>
   		<td>
   		<c:choose>
   			<c:when test="${empty dto.filename }">
   			파일없음
   			</c:when>
   			<c:otherwise>
   			<a href="javascript:fileDown('${dto.filename }')"${dto.filename }>${dto.filename }(${dto.filesize })</a>
   			</c:otherwise>
   		</c:choose>
    	</td>
    	</tr>
  </TABLE>
  
  <DIV class='bottom'>
  	<button type="button" onclick="reply('${dto.bbsno}')">답변</button>
    <input type='button' value='목록' onclick="blist()">
    <input type='button' value='수정' onclick="bupdate()">
    <input type='button' value='삭제' onclick="bdelete()">
  </DIV>
  <hr>
  <c:forEach var="rdto" items="${rlist }">
  <div class="rlist">
  ${rdto.id}<br>
  <p>${rdto.content}</p>
  ${rdto.regdate}
  <c:if test="${sessionScope.id==rdto.id}">
  <span style="float:right">
  <a href="javascript:rupdate('${rdto.rnum }','${rdto.content }')">수정</a>|
  <a href="javascript:rdelete('${rdto.rnum }')">삭제</a>
  </span>
  </c:if>
  </div>
  </c:forEach>

<div class="bottom">
${paging}
</div>

  <div class="rcreate">
  	<form name="rform"
  	action="./rcreate"
  	method="post"
  	onsubmit="return input(this)">
  	<textarea rows="3" cols="28" name="content"></textarea>
  	<input type="submit" name="rsubmit" value="등록"></input>
	
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="id" value="${sessionScope.id}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="bbsno" value="${dto.bbsno}">
	<input type="hidden" name="rnum" value="${0}">
	<input type="hidden" name="nPage" value="${nPage}">
  	
  	</form>
  </div>
  
</div>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 