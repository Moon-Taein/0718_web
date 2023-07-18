package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MemberService {

	public List<Member> getMemberList() {

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?userUnicode=true&characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "root";
			String query = "select * from member order by memberid";

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				String name = rs.getString("name");
				String memberId = rs.getString("memberid");
				String email = rs.getString("email");

				list.add(new Member(name, memberId, email));
			}

		} catch (SQLException e) {
//		out.println(e.getMessage());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	public boolean existThisMember(String memberId) {

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/chap14?userUnicode=true&characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "root";
			String query = "select * from member where memberid = ?";

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.prepareStatement(query);
			stmt.setString(1, memberId);
			rs = stmt.executeQuery();

			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
//		out.println(e.getMessage());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

}