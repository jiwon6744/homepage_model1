<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 
	int no = Integer.parseInt(request.getParameter("no"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	String nowPage = request.getParameter("nowPage");
	
	int cnt = 0;
	/*조회수 증가*/
	idao.upViewcnt(no);
	ImgbbsDTO dto = idao.read(no);
	String content = dto.getContent();
	
	content = content.replaceAll("\r\n", "<br>");
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
  function icreate(){
    var url = "./createForm.jsp";
    location.href=url;
  }
  
  function iupdate(){
    var url = "./updateForm.jsp";
    url += "?no=<%=no %>";
    url += "&col=<%=col %>";
    url += "&word=<%=word %>";
    url += "&nowPage=<%=nowPage%>";
    location.href=url;
  }
  
  function idelete(){
    var url = "./deleteForm.jsp";
    url += "?no=<%=no %>";
    url += "&col=<%=col %>";
    url += "&word=<%=word %>";
    url += "&nowPage=<%=nowPage%>";
    url += "&oldfile=<%=dto.getFilename()%>";
    location.href=url;
  }
  function ireply(){
    var url = "./replyForm.jsp";
    url += "?no=<%=no %>";
    url += "&col=<%=col %>";
    url += "&word=<%=word %>";
    url += "&nowPage=<%=nowPage%>";
    location.href=url;
  }
  
  function ilist(){
    var url = "./list.jsp";
    url += "?col=<%=col %>";
    url += "&word=<%=word %>";
    url += "&nowPage=<%=nowPage%>";
    location.href=url;
  }
  
  function down(filename){
    var url = "<%=root%>/download";
    url += "?dir=/imgbbs/storage";
    url += "&filename="+filename;
    
    location.href = url;
    
  }
  function readGo(no){
	  var url = "./read.jsp";
	  url = url +"?no="+no;
	  url += "&col=<%=col %>";
	  url += "&word=<%=word %>";
	  url += "&nowPage=<%=nowPage%>";
	  
	  location.href=url;
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>
 

  <TABLE>
    <TR>
    	<TD colspan="2" class="img-c">
    	<img src="./storage/<%=dto.getFilename()%>" class="img-size-400">
    	</TD>
    </TR>
    <TR>
      <TH class="text-c">제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH class="text-c">내용</TH>
      <TD><%=dto.getContent() %></TD>
    </TR>
    <TR>
      <TH class="text-c">성명</TH>
      <TD><%=dto.getName() %></TD>
    </TR>
    <TR>
      <TH class="text-c">조회수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
    <TR>
      <TH class="text-c">등록일</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
    <TR>
      <TH class="text-c">파일 다운</TH>
      <TD>
      	<%if(dto.getFilename()==null) {
        out.print("파일없음");
      }else{
    %>
      <%=dto.getFilename() %>
      <a href="javascript:down('<%=dto.getFilename()%>')">
      <img src="../menu/images/down.png" >
      </a>
        <%} %>
      </TD>
    </TR>
  </TABLE>
  
   <TABLE style="width: 50%">
  <TR>
  <%
  List list = idao.imgRead(no);
    String[] files = (String[])list.get(0);
    int[] noArr = (int[])list.get(1);
    for(int i=0;i<5;i++){
      if(files[i]==null){  
  %>
  <td><img class="curImg" src="./storage/default.jpg" width="100%"><td>
  <%
      }else{
        if(noArr[i]==no){
  %>  
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%    
        }else{
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img class="ncurImg" src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
        
  <%
        }
       }      
      }
  %>
  </TR>
  </TABLE>
  
  <DIV class='bottom'>
   	<input type="button" value="등록" class="button" onclick="icreate()">
	<input type="button" value="목록" class="button" onclick="ilist()">
	<input type="button" value="수정" class="button" onclick="iupdate()">
	<input type="button" value="삭제" class="button" onclick="idelete()">
	<input type="button" value="답변" class="button" onclick="ireply()">
  </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 