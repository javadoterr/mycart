package com.javadoterr.api.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.javadoterr.api.entity.User;
import com.javadoterr.api.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = res.getWriter()) {
			
			try {
				
				String userName = req.getParameter("userName");
				String userEmail = req.getParameter("userEmail");
				String userPassword = req.getParameter("userPassword");
				String userPhone = req.getParameter("userPhone");
				String userAddress = req.getParameter("userAddress");
				
				// use validation
				if(userName.isEmpty()) {
					out.println("Name is blank");
					return;
				}
				
				//creating user object to store data
				User user = new User(userName, userEmail,
						userPassword, userPhone, "default.jsp", userAddress,"normal");
				
				//store data in db
				
				Session session = FactoryProvider.getFactory().openSession();
				Transaction tx = session.beginTransaction();
				
				Integer userId = (Integer)session.save(user);
				
				tx.commit();
				session.close();
				
				out.println("Successfully saved!!!!");
				out.println("<br> User Id is : "+ userId);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

}
