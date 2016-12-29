<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	boolean flag = bdao.checkRefno(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function incheck(f) {
		if (f.passwd.value == "") {
			alert("패스워드를 입력하세요");
			f.passwd.focus();
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

	<div class="title">게시판 삭제</div>

	<div class="content">
		<%
			if (flag) {
				out.print("답변이 있는 글이므로 삭제 할 수 없습니다.<br>");
				out.print("<input type='button' class='button' value='다시시도' onclick='history.go(-2)'>");
			} else {
		%>
		<form name='frm' method='POST' action='./deleteProc.jsp' onsubmit="return incheck(this)">
			<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>" /> 삭제하면 복구할 수 없습니다.<br /> 
			<input name="bbsno" value="<%=bbsno%>" type="hidden"> 
			<input name="col" value="<%=request.getParameter("col")%>" type="hidden"> 
			<input name="word" value="<%=request.getParameter("word")%>" type="hidden"> 
			<input name="nowPage" value="<%=request.getParameter("nowPage")%>" type="hidden"> <br />
			<input name="oldfile" value="<%=request.getParameter("oldfile")%>" type="hidden"> <br />
			<table>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" name="passwd" />
					</td>
				</tr>
			</table>

			<div class='bottom'>
				<input type='submit' value='확인' class="button"> <input type='button' value='취소' onclick="history.back()" class="button">
			</div>
		</form>
		<%
			}
		%>
	</div>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
