<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty property="*" name="dto" />
<%-- <jsp:setProperty property="title" param="title" name="dto"/>  --%>
<%-- <jsp:setProperty property="content" name="dto"/> --%>
<!-- 내가 dto를 가져와야하기때문에 name에 dto를 적는다. -->
<!-- param은 name명 -> title / property는 저장할 필드명 title 로 맞춰 준다.-->

<%
	// 	String title = request.getParameter("title");
	// 	String content = request.getParameter("content"); // request는 내부객체이기때문에 따로 객체생성을 하지 않아도 사용할 수 있다.

	// 	sql.append(" INSERT INTO memo(memono, title, content, wdate) ");
	// 	sql.append(" VALUES (memo_seq.nextval, ?, ?, sysdate) ");

	// 	pstmt = con.prepareStatement(sql.toString());

	// 	pstmt.setString(1, title);
	// 	pstmt.setString(2, content);

	// 	int cnt = pstmt.executeUpdate();
	boolean flag = mdao.create(dto);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="title">메모 등록 결과</div>
	<div class="content">
		<%
			if (flag) {
				out.println("메모를 등록 했습니다");
			} else {
				out.println("메모 등록이 실패했습니다.");
			}
		%>
		<div class="bottom">
		<input type="button" value="계속 등록" class="button" onclick="location.href='./createForm.jsp'">
		<!-- 
		location.href location는 자바스크립트의 객체 // href는 속성. 
		location.href 안에는 홑따옴표를 사용한다.
		-->
		<input type="button" value="목록" class="button" onclick="location.href='./list.jsp'">
		</div>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
