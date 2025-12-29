package com.techvalon;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Role
 */
@WebServlet("/role")
public class Role extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String del = request.getParameter("del");
		
		// save the role
		String url = "jdbc:mysql://localhost:3306/employeesDb";
		 String dbUsername = "root";
		 String dbPassword = "password";
		 
		 boolean logged = false;
		 String error = "";
		 
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			 
			// check if is to delete
			if (id != null && del != null) {
				System.out.println(id);
				String sql = "delete from roles where id=?";
				PreparedStatement st = con.prepareStatement(sql);
				st.setInt(1, Integer.parseInt(id));
				
				st.executeUpdate();
			    st.close();
			    response.sendRedirect("roles.jsp?success=Cargo removido");
			} else {
				String sql = "insert into roles (name) values(?)";
				 
				 if (!id.isEmpty() && !id.isBlank()) {
					 sql = "update roles set name=? where id=?";
				 }
				 
				 PreparedStatement st = con.prepareStatement(sql);

			     st.setString(1, name);
			     
			     if (!id.isEmpty() && !id.isBlank()) {
			    	 st.setString(2, id);
			     }
			     
			     st.executeUpdate();
			     st.close();
			     
			     response.sendRedirect("roles.jsp");
			}
			 
			 

		 } catch (Exception e) {
			 PrintWriter out = response.getWriter();
			 out.println(e.getMessage());
			 error = e.getMessage();
			 response.sendRedirect("roles.jsp?error="+error + "-" + id);
		 }
		 
		 
	}

}
