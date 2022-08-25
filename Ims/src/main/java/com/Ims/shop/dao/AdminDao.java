package com.Ims.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.MemberVo;

@Repository
public class AdminDao {
	
	//MyBatis�? ?��?��?��?�� DB?��?��: SqlSession 객체 ?��?��
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "admin";
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	
	
	public String login(MemberVo vo) {
		return sqlSession.selectOne(MAPPER+".login", vo);
	}
	
	
	
	
	
}
