<%@page import="member.MemberService"%>
<%@page import="java.util.Map"%>
<%@page import="member.MemberValidator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("memberId");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    MemberValidator validator = new MemberValidator();
	Map<String, String> errors = validator.validate(memberId, password, name, email);
	
	MemberService ms = new MemberService();
	if (ms.existThisMember(memberId)){
		errors.put("idDuplication", "이미 존재하는 아이디입니다.");
	}
	
	// session 에 에러리스트 넣어두기
	session.setAttribute("errors", errors);
    	
	if(errors.size() > 0){		
		response.sendRedirect("insertForm.jsp");	
	} else {	
		
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = null;
    PreparedStatement stmt = null;

    try{

        String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?useUnicode=true&characterEncoding=utf8";
        String dbUser = "root";
        String dbPass = "root";

        String query = "insert into member values (?, ?, ?, ?)";

        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stmt = conn.prepareStatement(query);
        
        stmt.setString(1, memberId);
        stmt.setString(2, password);
        stmt.setString(3, name);
        stmt.setString(4, email);
        
        stmt.executeUpdate();
    } finally {
        if(stmt != null){
            try {
                stmt.close();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
        if(conn != null){
            try {
                conn.close();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
    }
    }
%>

<html>
<head><title>삽입</title></head>
<body>
    member 테이블에 새로운 레코드를 삽입했습니다.
    <a href="insertForm.jsp">돌아가기</a>
</body>
</html>