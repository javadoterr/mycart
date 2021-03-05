package com.javadoterr.api.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javadoterr.api.dao.UserDao;
import com.javadoterr.api.entity.User;
import com.javadoterr.api.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	resp.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = resp.getWriter()) {
			
			
			//geting data
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			
			
			//validations
			
			//authenticating user
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
			
			HttpSession httpSession = req.getSession();
			
			if(user == null){
				httpSession.setAttribute("message", "Invalid details ! try with right one!");
				resp.sendRedirect("login.jsp");
				return;
			}else {
				out.println("<h2> Welcome "+ user.getUserName() + " </h2>");
			}
			
			
			
		}
    	
    	
    	
    	
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
