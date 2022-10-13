package com.springboot.java.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springboot.java.dao.EURRepository;
import com.springboot.java.dao.GBPRepository;
import com.springboot.java.dao.UsdRepository;
import com.springboot.java.pojo.EUR;
import com.springboot.java.pojo.GBP;
import com.springboot.java.pojo.USD;


@Controller
public class IndexController {
	
	
	@Autowired
	private UsdRepository usdRepository=null;
	
	@Autowired
	private GBPRepository gbpRepository=null;
	
	@Autowired
	private EURRepository eurRepository=null;
   
	
	//首頁
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	
	
	//更新時間
	@RequestMapping("/updatetime")
	@ResponseBody
	public String updateTime(String time) {
		System.out.println("time:"+time);
		
		 SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	       Date current = new Date(time);
		  String time1=sdFormat.format(current);
		   System.out.println("time1:"+time1);
		   
		   
			
		  //2022-09-14T09:52:00+00:00
	     SimpleDateFormat sdFormat2 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'+'ss:ss");	
	     Date current2 = new Date(time);
	     String time2=sdFormat2.format(current2);
         System.out.println("time2:"+time2);
         
         
         
         //Sep 14, 2022 at 10:52 BST
         SimpleDateFormat sdFormat3 = new SimpleDateFormat("MMM dd,yyyy 'at' HH:mm 'BST' ");	
	     Date current3 = new Date(time);
	     String time3=sdFormat3.format(current3);
         System.out.println("time3:"+time3);		          
				          
		
		
         usdRepository.findtimeUpdate(time1, time2, time3);
        
		
        
		return "updatetimeOK";
	}
	
	
	
	
	
	
	//新增幣別資料
	@PostMapping("/insert")
	@ResponseBody
	public  Object insert(@RequestBody USD usd) {
		
       if(usd.getCode().equals("USD")) {
		   /*
		  int num=usdRepository.InsertUSD(usd.getCode(), usd.getSymbol(), usd.getRate(), usd.getDescription(),
				  usd.getRate_float());
				  */
		
    	  
		     USD us= usdRepository.save(usd);
	         return us;
	      
	      
		  
		 // return num;
		  
       }
	   else if(usd.getCode().equals("GBP")) {
		   /*
	      int num=gbpRepository.InsertGBP(usd.getCode(), usd.getSymbol(), usd.getRate(), usd.getDescription(),
			   usd.getRate_float());
	      */
		   GBP gp=new GBP();
		   gp.setCode(usd.getCode());
		   gp.setSymbol(usd.getSymbol());
		   gp.setRate(usd.getRate());
		   gp.setDescription(usd.getDescription());
		   gp.setRate_float(usd.getRate_float());
		   
		   GBP g=gbpRepository.save(gp);
		  
	      return g;
	   
	    }else if(usd.getCode().equals("EUR")) {
	    	
	    /*	
	    	
	    int num=eurRepository.InsertEUR(usd.getCode(), usd.getSymbol(), usd.getRate(), usd.getDescription(),
	  			usd.getRate_float());
	  	 
	         return num;
	         
	         */
	    	  EUR eu=new EUR();
	    	 
	    	  eu.setCode(usd.getCode());
	    	  eu.setSymbol(usd.getSymbol());
	    	  eu.setRate(usd.getRate());
	    	  eu.setDescription(usd.getDescription());
	    	  eu.setRate_float(usd.getRate_float());
			   
	    	  EUR e=eurRepository.save(eu);
	    	  
	    	  return e;
	    
	    }
       
       return null;
       
		
	}
	
	
	
	
	 //更新幣別資料
	
	@RequestMapping("/updatecoin")
	@ResponseBody
	public Object updatecoin(int id,String code,String symbol,String rate,String description,String rate_float) {
		
		
		/*
		 if(code.equals("USD")) {
		    int num=usdRepository.updateUSD(code, symbol, rate, description, rate_float, id);
		    return num;
		 }else if(code.equals("USD")) {
			 int num=gbpRepository.updateGBP(code, symbol, rate, description, rate_float, id);
			 return num;
		 }else {
			 int num=eurRepository.updateEUR(code, symbol, rate, description, rate_float, id);
			 return num;
		 }
		*/
		
		
		 if(code.equals("USD")) {
			 
	     USD usd=usdRepository.findAll().get(--id);
	     
	       usd.setCode(code);
	       usd.setSymbol(symbol);
	       usd.setRate(rate);
	       usd.setDescription(description);
	       usd.setRate_float(rate_float);
	       
		 USD u= usdRepository.save(usd);
		 
		 return u;
		
		 }else if(code.equals("GBP")) {
			 
			 GBP gb=gbpRepository.findAll().get(--id);
			 
			 gb.setCode(code);
			 gb.setSymbol(symbol);
			 gb.setRate(rate);
			 gb.setDescription(description);
			 gb.setRate_float(rate_float);
			 
			 GBP g=gbpRepository.save(gb);
			 
			 return g;
			 
		 }else if(code.equals("EUR")) {
			 
			  EUR eu=eurRepository.findAll().get(--id);
			  
			  eu.setCode(code);
			  eu.setSymbol(symbol);
			  eu.setRate(rate);
			  eu.setDescription(description);
			  eu.setRate_float(rate_float);
			  
			  
			  EUR e=eurRepository.save(eu);
			  
			  return e;
		 }
		
		return null;
	 
	}
	
	
	
	
	
	//刪除幣別資料
	@RequestMapping("/deletecoin")
	@ResponseBody
	public String deletecoin(int id,String code) {
		
		
		 if(code.equals("USD")) {
			 
			 USD usd=usdRepository.findAll().get(--id);
			 usdRepository.delete(usd);
			 
			// usdRepository.deleteById(id);
			 
		 }else if(code.equals("GBP")) {
			 
			 GBP gbp=gbpRepository.findAll().get(--id);
			         gbpRepository.delete(gbp);
			  // gbpRepository.deleteById(id);
			   
		 }else {
			 
			 EUR eur=eurRepository.findAll().get(--id);
			         eurRepository.delete(eur);
			   //eurRepository.deleteById(id);
		 }
		
		
		
		return "deletecoinOK";
	}
	
	
	
	
	//請選擇查詢幣別
	
	@RequestMapping("/querycoin")
	@ResponseBody
	public List<Object> querycoin(String querycoin) {
	
		System.out.println(querycoin);
		
		if(querycoin.equals("GBP")) {
			
			List<Object> gb= gbpRepository.findBycode(querycoin);
			
			    return gb;
			
		}else if(querycoin.equals("USD")){
			
			List<Object> us=usdRepository.findBycode(querycoin);
			    
			
				return us;
			
			
	}else {

		List<Object> eu= eurRepository.findBycode(querycoin);
		
	        return eu;
		
		
	  }
		
	
	}
	
	
	
}
