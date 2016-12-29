<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	String id = request.getParameter("id");
	String oldfile = request.getParameter("oldfile");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function inCheck(f) {
	if(f.fname.value==""){
		alert("사진을 선택하세요.");
		f.fname.focus();
		return false;
	}
}
</script>
<style type="text/css">
* {
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">사진 수정</div>

	<form name='frm' 
		  method='POST' 
		  action='./updateFileProc.jsp'
		  enctype="multipart/form-data"
		  onsubmit="return inCheck(this)">
		  >
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="oldfile" value="<%=oldfile%>">
		<table>
			<tr>
				<th>원본파일</th>
				<td>
					<img src="./storage/<%=oldfile%>"><br> 원본파일명:<%=oldfile%>
				</td>
			</tr>
			<tr>
				<th>변경파일</th>
				<td>
					<input type="file" name="fname" accept=".png,.gif,.jpg">
				</td>
			</tr>
		</table>

		<div class='bottom'>
			<input type='submit' value='변경' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
