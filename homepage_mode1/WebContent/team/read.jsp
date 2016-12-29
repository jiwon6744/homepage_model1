
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int teamno = Integer.parseInt(request.getParameter("teamno"));
	TeamDTO dto = tdao.read(teamno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function pre(teamno) {
		var url = "read.jsp";
		url += "?teamno=" + (parseInt(teamno) - 1);
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function next(teamno) {
		var url = "read.jsp";
		url += "?teamno=" + (parseInt(teamno) + 1);
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function tlist(){
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
	function imgUpdate(){
		var url = "updateFileForm.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		url += "&teamno=<%=teamno%>";
		url += "&oldfile=<%=dto.getFilename()%>";
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">팀 조회</div>
	<table>
		<tr>
			<td colspan="2">
				<div>
					<img src='./storage/<%=dto.getFilename()%>'>
				</div>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=dto.getName()%></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=dto.getGender()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getPhone()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dto.getAddress1()%><br>
				<%=dto.getAddress2()%><br> 우(<%=dto.getZipcode()%>)
			</td>
		</tr>
		<tr>
			<th>스킬</th>
			<td><%=dto.getSkillstr()%></td>
		</tr>
		<tr>
			<th>취미</th>
			<td><%=dto.getHobby()%></td>
		</tr>
	</table>
	<div class="bottom">
		<input type="button" class="button" value="글쓰기" onclick="location.href='./createForm.jsp'"> 
		<input type="button" class="button" value="목록" onclick="tlist()"> 
		<input type="button" class="button" value="사진변경" onclick="imgUpdate()">
		<input type='button' value='다운로드' class="button" onclick="location.href='<%=root %>/download?dir=/team/storage&filename=<%=dto.getFilename()%>'">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
