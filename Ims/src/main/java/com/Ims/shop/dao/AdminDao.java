package com.Ims.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;

@Repository
public class AdminDao {
	
	//MyBatisÎ•? ?ù¥?ö©?ï¥?Ñú DB?ûë?óÖ: SqlSession Í∞ùÏ≤¥ ?ïÑ?öî
	
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
