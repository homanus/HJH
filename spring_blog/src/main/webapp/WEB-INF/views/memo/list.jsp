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
.search{
	width:80%;
	margin:2px auto;
	text-align: center;
}
</style>
<!-- <link href="../css/style.css" rel="stylesheet"> -->

<script type="text/javascript">
	function read(memono){
		//alert(memono); 잘 보내졌나 확인해 봄
		var url="read.do"; //지역변수 선언
		url += "?memono="+memono;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href=url;
	}
</script>
</head> 
	<body> 
		<div class="search">
		<form action="./list" method="post">
		<select name="col">
			<option value="title"
			<c:if test="${col == 'title' }">selected</c:if>
			>제목</option>
			<option value="content"
			<c:if test="${col == 'content' }">selected</c:if>
			>내용</option>
			<option value="total">전체출력</option>
		
		</select>
		<input type="search" name="word" value="${word }" required>
		<button>검색</button>
		<button type="button" onclick="location.href='./create'">등록</button>
		</form>
		</div>
		
		<div class="container">
		<h2><span class="glyphicon glyphicon-th-list"></span>메모목록</h2>
		
		<div>
			<table class="table table-hover">
			
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
					<th>GRPNO</th>
					<th>INDENT</th>
					<th>ANSNUM</th>
				</tr>
				</thead>
			<c:choose>
				<c:when test="${empty list }">
			
			<tbody>
				<tr>
					<td colspan="7">등록된 메모가 없습니다.</td>
				</tr>
			</tbody>
			</c:when>
					<c:otherwise>
					<c:forEach var="dto" items="${list }">
						<tbody>
						<tr>
							<td>${dto.memono }</td>
							<td>
							<c:if test="${dto.indent > 0 }">
								<c:forEach begin="1" end="${dto.indent }">
									&nbsp;&nbsp;
								</c:forEach>
									<img src='${root }/images/re.jpg'>
							</c:if>
							<a href="javascript:read('${dto.memono }')">${dto.title }</a>
							<c:if test="${util:compareDay(dto.wdate) }">
								<img src="${root }/images/new.gif">
							</c:if>
							</td>
							<td>${dto.wdate }</td>
							<td>${dto.viewcnt }</td>
							<td>${dto.grpno }</td>
							<td>${dto.indent }</td>
							<td>${dto.ansnum }</td>
						</tr>
						</tbody>
						</c:forEach>
			</c:otherwise>
			</c:choose>
			</table>
			
			<div class="bottom">
				${paging }
			</div>
		</div>
		</div>
	</body> 
</html> 