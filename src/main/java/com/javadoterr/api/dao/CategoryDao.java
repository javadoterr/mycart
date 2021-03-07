package com.javadoterr.api.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.javadoterr.api.entity.Category;

public class CategoryDao {
	
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	//saving category to db using hibernate
	public int saveCategory(Category category) {
		
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		int catId = (Integer)session.save(category);
		
		
		tx.commit();
		session.close();
		
		return catId;
	}
	
	
	public List<Category> getCategories(){
		
		Session session = this.factory.openSession();
		String selectCategoryQuery = "from Category";
		Query<Category> query= session.createQuery(selectCategoryQuery, Category.class);
		List<Category> categoryList = query.list();
		
		return categoryList;
		
	}
	
	
	public Category getCategoryById(int cid) {
		
		Category category = null;
		
		try {
			
			Session session = this.factory.openSession();
			category = session.get(Category.class, cid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return category;
		
		
	}
	
	
	
	
	
	

}
