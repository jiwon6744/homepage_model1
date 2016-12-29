<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	// -- 검색 관련 
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if (col.equals("total"))
		word = "";

	int nowPage = 1; // 현재페이지, 변경가능
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5; // 한 페이지당 보여줄 레코드 갯수

	// DB 가져올 순번.
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = tdao.total(col, word);
	List<TeamDTO> list = tdao.list(map);
	Iterator<TeamDTO> iter = list.iterator();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function update(teamno) {
		var url = "updateForm.jsp";
		url += "?teamno=" + teamno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function del(teamno,oldfile) {
		if (confirm("정말 삭제하시겠습니까?")) {
			var url = "deleteProc.jsp";
			url += "?teamno=" + teamno;
			url += "&col=<%=col%>";
			url += "&word=<%=word%>";
			url += "&nowPage=<%=nowPage%>";
			url += "&oldfile=" + oldfile;
			location.href = url;
		}

	}
	function read(teamno) {
		var url = "read.jsp";
		url += "?teamno=" + teamno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function tcreate() {
		var url = "createForm.jsp";
		location.href = url;
	}
</script>

</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">팀 목록</div>
	<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<option value="name" <%if (col.equals("name"))
				out.print("selected='selected'");%>>이름</option>
				<option value="phone" <%if (col.equals("phone"))
				out.print("selected='selected'");%>>전화번호</option>
				<option value="skill" <%if (col.equals("skill"))
				out.print("selected='selected'");%>>보유기술</option>
				<option value="total">전체출력</option>
			</select>
			<input type="text" name="word" value="<%=word%>"/> 
			<input type="submit" class="button" value="검색"> 
			<input type="button" class="button" value="등록" onclick="tcreate()">
		</form>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>보유기술</th>
			<th>사진</th>
			<th>수정/삭제</th>
		</tr>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="6">등록된 팀정보가 없습니다.</td>
		</tr>
		<%
			} else {
				while (iter.hasNext()) {
					TeamDTO dto = iter.next();
		%>
		<tr>
			<td class="align-center"><%=dto.getNo()%></td>
			<td>
				<a href="javascript:read('<%=dto.getNo()%>')"><%=dto.getName()%></a>
			</td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getSkillstr()%></td>
			<td>
				<img src="./storage/<%=dto.getFilename()%>">
			</td>
			<td class="align-center">
				<a href="javascript:update('<%=dto.getNo()%>')">수정 </a> / <a href="javascript:del('<%=dto.getNo()%>','<%=dto.getFilename()%>')">삭제</a>
			</td>
		</tr>
		<%
			}
			}
		%>
	</table>
	<div class='bottom'>
		<!-- 		<input type="button" class="button" value="등록" onclick="tcreate()"> -->
		<%=Utility.paging3(total, nowPage, recordPerPage, col, word)%>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
