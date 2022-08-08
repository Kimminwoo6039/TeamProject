package com.Ims.shop.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class AjaxDao {

	
private SqlSession sqlSession;
	
	public static final String MAPPER = "ajax";
	
	@Autowired
	public AjaxDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int checkId(String  member_id) {
	       
		return sqlSession.selectOne(MAPPER+".checkId",  member_id);
	}
}
