package com.ecommerce.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.ecommerce.persistence.ProductBean;

@Repository
public class ProductDaoImpl extends HibernateDaoSupport implements ProductDao {

	@Autowired
 	public void init(SessionFactory factory) {
 		 
 	    setSessionFactory(factory);
 	}
	
	@Override
	public void addCustomer(ProductBean customer) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(customer);
	}

}