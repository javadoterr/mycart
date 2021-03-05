package com.javadoterr.api.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.javadoterr.api.entity.User;

public class UserDao {
	
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	//get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {
		
		User user = null;
		
		try {
			
			String query = "from User u where u.userEmail=:e and u.userPassword=:p";
			Session session = this.factory.openSession();
			Query<User> selectQuery = session.createQuery(query, User.class);
			selectQuery.setParameter("e", email);
			selectQuery.setParameter("p", password);
			
			user = (User)selectQuery.uniqueResult();
			
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	
	

}
