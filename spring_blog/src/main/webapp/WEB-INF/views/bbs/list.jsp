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
.search{
	width:80%;
	margin:2px auto;
	text-align: center;
}
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function bread(bbsno){
	var url="read";
	url+="?bbsno="+bbsno;
	url+="&col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	url+="&nPage=${nPage}";
	location.href=url;
}

function create(){
	var url="create";
	location.href=url;
}
function fileDown(filename){
	var url = "${root}/download";
	url+="?filename="+filename;
	url+="&dir=/storage_bbs";
	
	location.href = url;
}
</script>
</head> 
<body>
 
 <div class="search">
 <form action="./list" method="post" name="fname">
 <select name="col"><!-- 검색할 컬럼 -->
 	<option value="wname"
 	<c:if test="${col == 'wname' }">
 	selected
 	</c:if>
 	>성명</option>
 	<option value="title"
 	<c:if test="${col == 'title' }">
 	selected
 	</c:if>
 	>제목</option>
 	<option value="content"
 	<c:if test="${col == 'content' }">
 	selected
 	</c:if>
 	>내용</option>
 	<option value="total">전체출력</option>
 </select>
 


 <input type="search" name="word" value="${word }"  required> <!-- 검색어 -->
 <button>검색</button>
 <button type="button" onclick="create()">등록</button>
 </form>

 </div>
 
<div class="container">
<h2><span class="glyphicon glyphicon-th-list"></span>게시판 목록</h2>
 
 
  <TABLE class="table table-hover">
  <thead>
    <TR>
      <TH>번호</TH>
      <Th>작성자</Th>
      <Th>제목</Th>
      <Th>작성날짜</Th>
      <Th>조회수</Th>
      <Th>파일명</Th>
      <!-- <TH>수정/삭제</TH> -->
    </tr>
    </thead>
    <c:choose>
    	<c:when test="${empty list }">
    		<tbody>
		    <tr>
		    	<td colspan="7">등록된 게시글이 없습니다.</td>
		    </tr>
		    </tbody>
    	</c:when>
    	<c:otherwise>
    		<c:forEach var="dto" items="${list }">
    			<tbody>
    				<tr>
				    	<td>${dto.bbsno }</td>
				    	<td>${dto.wname }</td>
				    	<td>
				    		<c:if test="${dto.indent > 0 }">
				    			<c:forEach begin="0" end="${dto.indent-1}">
				    			&nbsp;&nbsp;
				    			</c:forEach>
				    		    <img src='${root }/images/re.jpg'>
				    		</c:if>
				    	<a href="javascript:bread('${dto.bbsno }')">${dto.title }</a>
				    		<c:if test="${util:compareDay(dto.wdate) }">
				    			<img src="${root }/images/new.gif">
				    		</c:if>
				    		
				    		<!-- 댓글 개수 -->
				    		<c:set var="rcount" value="${util:rcount(dto.bbsno,rdao)}"/>
				    		<c:if test="${rcount > 0}">
				    			<span style="color:red">(${rcount })</span>
				    		</c:if>
				    		
				    		</td>
				    	<td>${dto.wdate }</td>
    					<td>${dto.viewcnt }</td>
    					<td>
    						<c:choose>
    							<c:when test="${empty dto.filename }">
    								${dto.filename }
    							</c:when>
    							<c:otherwise>
    								<a href="javascript:fileDown('${dto.filename }')"${dto.filename }>${dto.filename }</a>
    							</c:otherwise>
    						</c:choose>
    					</td>
    				</tr>
    			</tbody>
    		</c:forEach>
    	</c:otherwise>
    </c:choose>
  </TABLE>
  
  <DIV class='bottom'>
  ${paging }
  </DIV>
 </div>
 
</body>
</html> 