<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String email = request.getParameter("email");
	boolean flag = dao.duplicateEmail(email);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function use() {
		opener.frm.email.value='<%=email%>';
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
	<!-- *********************************************** -->

	<div class="title">이메일 중복 확인</div>
	<div class="content">
		입력된 Eamil:	<%=email%><br><br>
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
		<input type='button' value='다시시도' class="button" onclick="location.href='email_form.jsp'"/> 
		<input type='button' value='닫기' class="button" onclick="window.close()"/>
	</div>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
