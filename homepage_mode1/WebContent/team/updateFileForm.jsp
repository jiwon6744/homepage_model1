<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	String oldfile = request.getParameter("oldfile");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-size: 20px;
}

img {
	width: 400px;
	height: 400px;
}
</style>
<script type="text/javascript">
	function incheck(f) {
		if (f.filename.value == "") {
			alert("파일을 선택하세요");
			f.filename.focus();
			return false;
		}
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">사진수정</div>

	<form name='frm' method='POST' action='./updateFileProc.jsp' enctype="multipart/form-data" onsubmit="return incheck(this)">
		<input type="hidden" name="teamno" value="<%=request.getParameter("teamno")%>"> 
		<input type="hidden" name="col" value="<%=request.getParameter("col")%>"> 
		<input type="hidden" name="word" value="<%=request.getParameter("word")%>"> 
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"> 
		<input type="hidden" name="oldfile" value="<%=oldfile%>">
		<table>
			<tr>
				<th>원본파일</th>
				<td>
					<img src="./storage/<%=oldfile%>"> 원본파일명:<%=oldfile%></td>
			</tr>
			<tr>
				<th>변경파일</th>
				<td>
					<input type="file" name="filename">
				</td>
			</tr>
		</table>

		<div class='bottom'>
			<input type='submit' value='변경'> <input type='button' value='취소' onclick="history.back()">
		</div>
	</form>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
