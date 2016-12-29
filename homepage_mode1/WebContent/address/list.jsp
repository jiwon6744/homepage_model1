<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}
	int nowPage = 1;
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;

	int sno = ((nowPage - 1)) * recordPerPage + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	int total = adao.total(col, word);
	List<AddressDTO> list = adao.list(map);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function update(no) {
		var url = "updateForm.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function del(no) {
		if (confirm("정말 삭제하시겠습니까?")) {
			var url = "deleteProc.jsp";
			url += "?no=" + no;
			url += "&col=<%=col%>";
			url += "&word=<%=word%>";
			url += "&nowPage=<%=nowPage%>";
			location.href = url;
		}
	}
	function read(no) {
		var url = "read.jsp";
		url += "?no=" + no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">회원 정보</div>
	<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<!-- 검색할 컬럼 -->
				<option value="name" <%if (col.equals("name"))
				out.print("selected='selected'");%>>성명</option>
				<option value="phone" <%if (col.equals("phone"))
				out.print("selected='selected'");%>>번호</option>
				<option value="zipcode" <%if (col.equals("zipcode"))
				out.print("selected='selected'");%>>우편</option>
				<option value="total">전체출력</option>
			</select>
			<input type="text" name="word" value="<%=word%>" />
			<!-- 검색어 -->
			<input type="submit" class="button" value="검색" />
		</form>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>가입날짜</th>
			<th>수정/삭제</th>
		</tr>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="6" class="align-center">등록된 회원 정보가 없습니다.</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					AddressDTO dto = list.get(i);
		%>
		<tr>
			<td class="align-center"><%=dto.getNo()%></td>
			<td>
				<a href="javascript:read('<%=dto.getNo()%>')"><%=dto.getName()%></a>
			</td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getWdate()%></td>
			<td class="align-center">
				<a href="javascript:update('<%=dto.getNo()%>')">수정 </a> / <a href="javascript:del('<%=dto.getNo()%>')">삭제</a>
			</td>
		</tr>
		<%
			}
			}
		%>

	</table>
	<div class="bottom">
		<!-- 		<input type="button" class="button" value="등록" onclick="location.href='./createForm.jsp'"> -->
		<%=Utility.paging3(total, nowPage, recordPerPage, col, word)%>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
