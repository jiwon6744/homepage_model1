<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	boolean flag = dao.duplicateId(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function use() {
		opener.frm.id.value='<%=id%>';
		window.close();
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

	<div class="title">아이디 중복 확인</div>
	<div class="content">
		입력된 ID:	<%=id%><br><br>
		<%
			if (flag) {
				out.print("중복되어서 사용할 수 없습니다.");
			} else {
				out.print("사용 가능합니다.<br><br>");
				out.print("<input type='button' value='사용' class='button_mini' onclick='use()'>");
			}
		%>
	</div>

	<div class='bottom'>
		<input type='button' value='다시시도' class="button" onclick="location.href='id_form.jsp'"/> 
		<input type='button' value='닫기' class="button" onclick="window.close()"/>
	</div>

</body>
<!-- *********************************************** -->
</html>
