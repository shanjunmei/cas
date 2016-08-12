package com.ffzx.cas;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.core.util.StringUtils;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public UserLoginServlet() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String sessionId=request.getRequestedSessionId();
			String ticket=request.getParameter("ticket");
			String service=request.getParameter("service");
			String userName=request.getParameter("userName");
			String password=request.getParameter("password");
			
			//根据sessionId去redis去取对应的key
			//查询不到则执行登录流程
			
		
			
			response.setContentType("text/html; charset=utf-8");
			javax.naming.Context ctx = new javax.naming.InitialContext();
			javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup("java:/comp/env/jdbc/pms_db");

			Connection conn = ds.getConnection();
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM sys_user");
			ResultSet rs = pst.executeQuery();
			StringBuilder table = new StringBuilder();
			table.append("<table border='1'>");
			table.append("<tr><td>eg-name</td><td>ch-name</td></tr>");
			while (rs.next()) {
				table.append("<tr><td>" + rs.getString("id") + "</td><td>");
				table.append(rs.getString("name") + "</td></tr>");
			}
			table.append("</table>");
			response.getWriter().append(table.toString());
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
