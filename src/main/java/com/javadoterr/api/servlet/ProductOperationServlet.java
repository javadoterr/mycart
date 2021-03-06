package com.javadoterr.api.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javadoterr.api.dao.CategoryDao;
import com.javadoterr.api.entity.Category;
import com.javadoterr.api.helper.FactoryProvider;

public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductOperationServlet() {
        super();
    }
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	resp.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = resp.getWriter()) {
			
			String op = req.getParameter("operation");
			
			if(op.trim().equals("addCategory")) {
				//add Category
				// fetching category data
				String title = req.getParameter("catTitle");
				String description = req.getParameter("catDescription");
				
				Category category = new Category(title, description);
				
				//saving category in db
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);
				
				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("message", "Category Added Successfully : "+ catId);
				resp.sendRedirect("admin.jsp");
				return;
				
				
			}else if(op.trim().equals("addProduct")) {
				//add product
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
