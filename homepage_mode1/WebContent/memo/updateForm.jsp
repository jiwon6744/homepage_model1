<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	// request.setCharacterEncoding("utf-8");
	// int memono = Integer.parseInt(request.getParameter("memono")); // read.jsp 에서 자바스크립트로 memono 를 보낸다.
	// sql.append(" SELECT memono, title, content ");
	// sql.append(" FROM memo ");
	// sql.append(" WHERE memono=? ");
	// pstmt = con.prepareStatement(sql.toString());
	// pstmt.setInt(1, memono);
	// rs = pstmt.executeQuery();
	// if (rs.next()) {
	int memono = Integer.parseInt(request.getParameter("memono")); // read.jsp 에서 자바스크립트로 memono 를 보낸다.
	MemoDTO dto = mdao.read(memono);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
/* * { */
/* 	font-family: gulim; */
/* 	font-size: 24px; */
/* } */

/* div { */
/* 	text-align: center; */
/* 	margin-top: 20px; */
/* 	margin-bottom: 20px; */
/* } */

/* table { */
/* 	width: 50%; */
/* 	margin: 0 auto; */
/* } */

/* table, th, td { */
/* 	border: 1px solid black; */
/* 	border-collapse: collapse; */
/* } */
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">메모 수정</div>

	<form name="frm" method="POST" action="./updateProc.jsp" onsubmit="return input(this)">
		<input type="hidden" name="memono" value="<%=memono%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
		<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
		<!-- submit하는걸 잠시멈추고 input()을 호출한다. -->
		<!-- input(this)는 자바스크립트의 this이다. HTML 페이지를 객체형태로 접근할 수 있는 것은 document이다. ( 이 페이지를 가르킴 ) -->
		<!-- 여기서 this는 form 객체 자신을 말한다. form 태그 자체를 객체로 받는다. -->
		<table>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" size="30" value="<%=dto.getTitle()%>" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="10" cols="30"><%=dto.getContent()%></textarea>
				</td>
			</tr>
		</table>
		<div class="bottom">
			<input type="submit" class="button" value="수정">
		</div>
	</form>
		<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
