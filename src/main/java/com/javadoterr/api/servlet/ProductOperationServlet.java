package com.javadoterr.api.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.javadoterr.api.dao.CategoryDao;
import com.javadoterr.api.dao.ProductDao;
import com.javadoterr.api.entity.Category;
import com.javadoterr.api.entity.Product;
import com.javadoterr.api.helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductOperationServlet() {
		super();
	}

	@SuppressWarnings("deprecation")
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = resp.getWriter()) {

			String op = req.getParameter("operation");

			if (op.trim().equals("addCategory")) {
				// add Category
				// fetching category data
				String title = req.getParameter("catTitle");
				String description = req.getParameter("catDescription");

				Category category = new Category(title, description);

				// saving category in db
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);

				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("message", "Category Added Successfully : " + catId);
				resp.sendRedirect("admin.jsp");
				return;

			} else if (op.trim().equals("addProduct")) {
				// add product

				String pName = req.getParameter("pName");
				String pDesc = req.getParameter("pDesc");
				int pPrice = Integer.parseInt(req.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(req.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(req.getParameter("pQuantity"));
				int catId = Integer.parseInt(req.getParameter("catId"));
				Part part = req.getPart("pPhoto");

				Product product = new Product();
				product.setpName(pName);
				product.setpDesc(pDesc);
				product.setpPrice(pPrice);
				product.setpDiscount(pDiscount);
				product.setpQuantity(pQuantity);
				product.setpPhoto(part.getSubmittedFileName());

				// get category by id
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				Category category = categoryDao.getCategoryById(catId);

				product.setCategory(category);

				// save product
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				productDao.saveProduct(product);
				
				
				//upload photo
				String path = req.getRealPath("img")+ File.separator +"products"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
				
				//uploading code
				try {
					
				
				FileOutputStream fos = new FileOutputStream(path);
				
				InputStream is = part.getInputStream();
				
				//reading data
				
				byte[] data = new byte[is.available()];
				
				is.read(data);
				
				//writing data
				fos.write(data);
				fos.close();
				
				} catch (Exception e) {
					e.printStackTrace();
				}

				HttpSession httpSession = req.getSession();
				httpSession.setAttribute("message", "Product is added successfully..");
				resp.sendRedirect("admin.jsp");
				return;

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
