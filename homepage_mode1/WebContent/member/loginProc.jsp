<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	boolean flag = dao.loginCheck(id, passwd);

	String grade = null; // 회원등급을 담을 변수

	if (flag) { // 회원인 경우
		grade = dao.getGrade(id);
		session.setAttribute("id", id);
		session.setAttribute("grade", grade);
		// ---------------------------------------------- 
		// Cookie 저장, Checkbox는 선택하지 않으면 null 임 
		// ---------------------------------------------- 
		Cookie cookie = null;

		String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 

		if (c_id != null) { // 처음에는 값이 없음으로 null 체크로 처리
			cookie = new Cookie("c_id", "Y"); // 아이디 저장 여부 쿠키 
			cookie.setMaxAge(120); // 2 분 유지 
			response.addCookie(cookie); // 쿠키 기록 

			cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
			cookie.setMaxAge(120); // 2 분 유지 
			response.addCookie(cookie); // 쿠키 기록  

		} else {
			cookie = new Cookie("c_id", ""); // 쿠키 삭제 
			cookie.setMaxAge(0);
			response.addCookie(cookie);

			cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		// --------------------------------------------- 
	}
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
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">로그인처리</div>
	<div class="content">
		<%
			if (flag) {
				out.print("로그인이 되었습니다.");
			} else {
				out.print("아이디/비밀번호를 잘못 입력하셨거나<br>");
				out.print("회원이 아닙니다. 회원가입을 하세요.<br>");
			}
		%>

	</div>
	<div class='bottom'>
		<input type='button' value='홈' class="button" onclick="location.href='../index.jsp'"> 
		<input type='button' value='다시시도' class="button" onclick="history.back()">
	</div>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
