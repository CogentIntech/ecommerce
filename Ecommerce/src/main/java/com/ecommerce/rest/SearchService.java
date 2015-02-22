package com.ecommerce.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.persistence.ProductBean;

@Path("/doSearch")
public class SearchService {
	
    @Autowired
	private ApplicationContext appContext;
	 @Autowired
	private ProductDao productDao;  
	 
	 
	@GET
	@Path("/{param}")
	public Response storeProducts(@PathParam("param") String msg) {
 
		String output = "Jersey say : " + msg;
		
		
		 try{
	    	  ProductDao customerDao = appContext.getBean("productDao", ProductDao.class);
	    	  ProductBean bean = new ProductBean();
	    	  bean.setProductColor( "Blue");
	    	  bean.setProductDescription( "Kenmore 100 cu ft washer" );
	    	  bean.setProductId( "ECOM_KEN_100_Washer" );
	    	  bean.setProductImage( "../img/washer.png" );
	    	  bean.setProductType( "Washer" );
	    	   
	    	  customerDao.addCustomer(bean);
	    	  
	    	  
	    	  bean = new ProductBean();
	    	  bean.setProductColor( "White");
	    	  bean.setProductDescription( "Kmart 100 cu ft Dryer" );
	    	  bean.setProductId( "ECOM_KMR_100_Dryer" );
	    	  bean.setProductImage( "../img/dryer.png" );
	    	  bean.setProductType( "Dryer" );
	    	  
	  		  customerDao.addCustomer(bean);
	  		  
	  		 bean = new ProductBean();
	    	  bean.setProductColor( "Orange");
	    	  bean.setProductDescription( "Kmart 100 cu ft Dryer" );
	    	  bean.setProductId( "ECOM_KMR_100_Dryer" );
	    	  bean.setProductImage( "../img/dryer.png" );
	    	  bean.setProductType( "Dryer" );
	    	  
	  		  customerDao.addCustomer(bean);
	  		  
	  		  
	  		
	      }catch(Exception ex){
	    	  ex.printStackTrace();
	      } 
 
		return Response.status(200).entity(output).build();
 
	}
	
	@GET
	@Path("/{param}{param}")
	public Response getProducts(@PathParam("param") String msg) {
 
		String output = "Jersey say : " + msg;
		
		
		 try{
	    	  ProductDao customerDao = appContext.getBean("productDao", ProductDao.class);
	    	  
	  		
	      }catch(Exception ex){
	    	  ex.printStackTrace();
	      } 
 
		return Response.status(200).entity(output).build();
 
	}

}