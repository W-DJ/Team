<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bbsMgr" class="pack_BBS.BoardMgr"  />

<%


/* out.print("1111");
String uid = request.getParameter("uid");

out.print(uid); 


String ip = request.getRemoteAddr();
out.print(ip); */

int rtnCnt = bbsMgr.insertBoard(request);

if(rtnCnt==1){
	response.sendRedirect("/bbs_Inquire/list.jsp"); 

}
%>