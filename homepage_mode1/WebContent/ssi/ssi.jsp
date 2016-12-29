<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="member.*"%>
<%@ page import="bbs.*"%>
<%@ page import="team.*"%>
<%@ page import="address.*"%>
<%@ page import="memo.*"%>
<%@ page import="imgbbs.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="utility.*"%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<jsp:useBean id="bdao" class="bbs.BbsDAO" />
<jsp:useBean id="tdao" class="team.TeamDAO" />
<jsp:useBean id="mdao" class="memo.MemoDAO" />
<jsp:useBean id="adao" class="address.AddressDAO" />
<jsp:useBean id="idao" class="imgbbs.ImgbbsDAO"/>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	//--업로드용 변수선언(폴더형)
%>
