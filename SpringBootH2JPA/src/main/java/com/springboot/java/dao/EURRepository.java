package com.springboot.java.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.java.pojo.EUR;
import com.springboot.java.pojo.GBP;
import com.springboot.java.pojo.USD;


public interface EURRepository extends JpaRepository<EUR, String> {
	
	
	/*nativeQuery = true,SQL連線資料庫,如果沒寫nativeQuery=true,SQL則是連線到實體類別和屬性名稱*/
	
	/*
	@Modifying
	@Query(value = "update TIME SET UPDATED=?1",nativeQuery = true)
	 List<USD> findtimeUpdate(String  UPDATED);
	*/
	
	
	/*
	@Transactional
	@Modifying
	@Query(value = " INSERT INTO EUR(code,symbol,rate,description,rate_float) "
			+ " values (:code, :symbol,:rate,:description,:rate_float);" , nativeQuery = true)
	public int InsertEUR(@Param("code") String code, @Param("symbol") String symbol,@Param("rate")
	String rate,@Param("description") String description,@Param("rate_float") String rate_float);
	*/
	
	
	/*
	@Transactional
	@Modifying
	@Query(value = "UPDATE EUR SET code= ?1,symbol=?2,rate=?3,description=?4,rate_float=?5 WHERE id=?6")
	public int updateEUR(String code,String symbol,String rate,String description,String rate_float,String id);
	*/
	
	
	
	//@Query(value = "SELECT * FROM  ?1")
	List<Object> findBycode(String code);
	
	
	
	
	
	
	
	
	
	
}