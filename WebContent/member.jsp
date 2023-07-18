<%@page import="member.Member"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try{
	 	MemberService ms = new MemberService();	
	 	List<Member> list = ms.getMemberList();
	
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/viewMemberList.jsp").forward(request, response);
		
	} catch (Exception e){
		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		out.println("요청 처리 중 에러 발생, 관리자에게 문의하세요");
	}
%>