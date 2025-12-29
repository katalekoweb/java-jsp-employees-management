package com.techvalon;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = "";
		
		 String url = "jdbc:mysql://localhost:3306/employeesDb";
		 String dbUsername = "root";
		 String dbPassword = "password";
		 
		 boolean logged = false;
		 String error = "";
		 
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			 Statement st = con.createStatement();
			 
			 String sql = "select * from users where username='"+username+"' AND password='"+password+"'";
			 ResultSet rs = st.executeQuery(sql);
			 
			 while (rs.next()) {
				 name = rs.getString(2);
				 logged = true;
				 break;
			 }
			 
		 } catch (Exception e) {
			 PrintWriter out = response.getWriter();
			 out.println(e.getMessage());
			 error = e.getMessage();
		 }
		
		if (logged) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			session.setAttribute("uname", name);
			response.sendRedirect("welcome.jsp");
		} else {
			response.sendRedirect("login.jsp?error="+error);
		}
	}

}
