<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<!-- CREATE 할 때 내용이 비어있는지 확인하는 자바스크립트  -->
<script type="text/javascript">
	function input(frm) {
		if (frm.title.value == "" && frm.content.value == "") {
			alert("제목과 내용을 입력해주세요.");
			frm.title.focus();
			return false;
		} else if (frm.title.value == "") {
			alert("제목을 입력해주세요.");
			frm.title.focus();
			return false;
		} else if (frm.content.value == "") {
			alert("내용을 입력해주세요.");
			frm.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">메모 등록</div>

	<form name="frm" method="POST" action="./createProc.jsp" onsubmit="return input(this)">
		<!-- submit하는걸 잠시멈추고 input()을 호출한다. -->
		<!-- input(this)는 자바스크립트의 this이다. HTML 페이지를 객체형태로 접근할 수 있는 것은 document이다. ( 이 페이지를 가르킴 ) -->
		<!-- 여기서 this는 form 객체 자신을 말한다. form 태그 자체를 개겣로 받는다. -->
		<table class="table-30">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" size="30">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="10" cols="30"></textarea>
				</td>
			</tr>
		</table>
		<div class="bottom">
			<input type="submit" class="button" value="전송">
			<input type="button" class="button" value="취소" onclick="history.back()">
		</div>
	</form>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
