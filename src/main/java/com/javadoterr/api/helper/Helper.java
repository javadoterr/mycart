package com.javadoterr.api.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.javadoterr.api.entity.Product;
import com.javadoterr.api.entity.User;

public class Helper {
	
	public static String get10Words(String desc) {
		String[] str = desc.split(" ");
		
		if(str.length > 10) {
			
			String res = "";
			
			for(int i = 0; i < 10; i++) {
				res = res + str[i] + " ";
			}
			return res + " ...";
			
		}else {
			return desc + " ...";
		}
	}
	
	public static Map<String, Long> getCounts(SessionFactory factory) {
		
		Session session = factory.openSession();
		String userQuery = "select count(*) from User";
		String productQuery = "select count(*) from Product";
		
		Query uq = session.createQuery(userQuery);
		Query pq = session.createQuery(productQuery);
		
		
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("userCount", (long)uq.list().get(0));
		map.put("productCount", (long)pq.list().get(0));
		session.close();
		
		return map;
	}
	
	
	
	
	
	

}
