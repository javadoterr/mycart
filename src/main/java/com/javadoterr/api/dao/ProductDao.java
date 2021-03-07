package com.javadoterr.api.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.javadoterr.api.entity.Product;

public class ProductDao {
	
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) {
		
		boolean f = false;
		
		try {
			
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			
			
			session.save(product);
			
			
			tx.commit();
			session.close();
			
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}
		
		return f;
	}

	
	public List<Product> getAllProducts(){
			
		List<Product> products = null;
		
		try {
			
			Session session = this.factory.openSession();
			Query<Product> query = session.createQuery("from Product", Product.class);
			products = query.list();
			
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	//get all product of given category	
	public List<Product> getAllProductsByCategoryId(int catId){
		
		List<Product> products = null;
		
		try {
			
			Session session = this.factory.openSession();
			Query<Product> query = session.createQuery("from Product p where p.category.categoryId =:id", Product.class);
			query.setParameter("id", catId);
			products = query.list();
			
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
}
