package com.Ims.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NaverVo;
import com.Ims.shop.vo.NoticeVo;

@Repository
public class NaverDao {
	
	//MyBatisÎ•? ?ù¥?ö©?ï¥?Ñú DB?ûë?óÖ: SqlSession Í∞ùÏ≤¥ ?ïÑ?öî
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "naver";
	
	@Autowired
	public NaverDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	

	public NaverVo findnaver(NaverVo vo) {
		System.out.println("vo="+vo.getN_name());
		System.out.println("vo="+vo.getN_email());
		
		return sqlSession.selectOne(MAPPER+".findnaver", vo);
		
		
	}
	
	public void insert(NaverVo vo) {
		System.out.println("vo1111111111="+vo.getN_name());
		System.out.println("v11111111o="+vo.getN_email());
		sqlSession.insert(MAPPER+".insert",vo);
	}
	
	
	
	
}
