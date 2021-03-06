package com.javadoterr.api.dao;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
	
	

}
