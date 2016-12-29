<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	//검색
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}
	//검색end
	//페이지 관련 ----------------`--------------
	int nowPage = 1; // 현재 페이지(변경가능해야함))
	if (request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	int recordPerPage = 5; //현 페이지당 보여줄 레코드 갯수

	//DB에서 읽어줄 시작순번과 끝순번 생성
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	//검색에 대한 데이터를 리스트에가서 뽑아와야함.
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	// sql.append(" SELECT memono, title, to_char(wdate, 'yyyy-mm-dd') as wdate, viewcnt ");
	// sql.append(" FROM memo ");
	// sql.append(" ORDER BY memono DESC ");

	// pstmt = con.prepareStatement(sql.toString()); // 전송객체 + 쿼리문

	// rs = pstmt.executeQuery(); // SELECT 는 ResultSet으로 받는다. 데이터를 다 받는다.
	List<MemoDTO> list = mdao.list(map);
	int total = mdao.total(col, word);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function read(memono) {
		var url = "read.jsp";
		url += "?memono=" + memono;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";

		location.href = url; // url 이동하라
	}
	function create() {
		var url = "<%=root%>/memo/createForm.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url; // url 이동하라
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">메모 목록</div>
	<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<!-- 검색할 컬럼 -->
				<option value="title" <%if (col.equals("title"))
				out.print("selected='selected'");%>>제목</option>
				<option value="cotent" <%if (col.equals("cotent"))
				out.print("selected='selected'");%>>내용</option>
				<option value="total">전체출력</option>
			</select>
			<input type="text" name="word" value="<%=word%>" />
			<!-- 검색어 -->
			<input type="submit" class="button_mini" value="검색" />
			<input type="button" class="button_mini" value="등록" onclick="create()"/>
		</form>
	</div>

	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="4" class="text-c">등록된 메모가 없습니다.</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					MemoDTO dto = list.get(i);
		%>
		<tr>
			<td class="text-c"><%=dto.getMemono()%></td>
			<td class="text-c">
				<a href="javascript:read('<%=dto.getMemono()%>')"> <%=dto.getTitle()%></a>
			</td>
			<td class="text-c"><%=dto.getWdate()%></td>
			<td class="text-c"><%=dto.getViewcnt()%></td>
		</tr>
		<%
			} //for-end
			} //else-end
		%>
	</table>
	<div class='bottom'>
<!-- 		<input type="button" value="등록" class="button" onclick="location.href='./createForm.jsp'"> -->
		<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
