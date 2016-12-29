<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	int memono = Integer.parseInt(request.getParameter("memono"));
	// sql.append(" UPDATE memo ");
	// sql.append(" SET viewcnt = viewcnt + 1 ");
	// sql.append(" WHERE memono = ? ");
	// pstmt = con.prepareStatement(sql.toString());
	// pstmt.setInt(1, memono);
	// pstmt.executeUpdate();

	/* 조회수 증가 */
	mdao.upViewcnt(memono);
	/* 조회수 증가  END */

	/* 조회  */
	MemoDTO dto = mdao.read(memono);
	/* 조회  END */
	// 	sql.delete(0, sql.length());
	// 	sql.append(" SELECT memono, title, content, to_char(wdate,'yyyy-mm-dd') wdate, viewcnt ");
	// 	sql.append(" FROM memo ");
	// 	sql.append(" WHERE memono=? ");

	// 	pstmt = con.prepareStatement(sql.toString());
	// 	pstmt.setInt(1, memono);
	// 	rs = pstmt.executeQuery();

	String content = null;
	if (dto != null) {
		content = dto.getContent();
		content = content.replaceAll("\r\n", "<BR>");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function mcreate() {
		var url = "createForm.jsp";
		location.href = url;
	}

	function mupdate(memono) {
		var url = "updateForm.jsp";
		url += "?memono=" + memono;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}

	function mdelete(memono) {
		var url = "deleteForm.jsp";
		url += "?memono=" + memono;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}

	function mlist() {
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">메모 조회</div>
	<table class="table-30">
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=content%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewcnt()%></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getWdate()%></td>
		</tr>
	</table>
	<div class="bottom">
		<input type="button" value="등록" class="button" onclick="mcreate()"> 
		<input type="button" value="수정" class="button" onclick="mupdate('<%=dto.getMemono()%>')"> 
		<input type="button" value="삭제" class="button" onclick="mdelete('<%=dto.getMemono()%>')"> 
		<input type="button" value="목록" class="button" onclick="mlist()">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>

