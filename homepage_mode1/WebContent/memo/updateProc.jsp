<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	// request.setCharacterEncoding("utf-8");
	// int memono = Integer.parseInt(request.getParameter("memono"));
	// String title = request.getParameter("title");
	// String content = request.getParameter("content");

	// sql.append(" UPDATE memo ");
	// sql.append(" SET title=?, content=? ");
	// sql.append(" WHERE memono=? ");
	// pstmt = con.prepareStatement(sql.toString());
	// pstmt.setString(1, title);
	// pstmt.setString(2, content);
	// pstmt.setInt(3, memono);
	// int cnt = pstmt.executeUpdate();
	boolean flag = mdao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function mlist() {
		var url = "list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">메모 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.println("메모 수정 성공");
			} else {
				out.println("메모 수정 실패");
			}
		%>
	</div>
	<div class="bottom">
		<input type="button" value="목록" class="button" onclick="mlist()">
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
