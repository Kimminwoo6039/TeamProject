package com.Ims.shop.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.KakaoVo;
import com.Ims.shop.vo.MemberVo;

@Repository
public class KaKaoDao {

	
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "kakao";
	
	@Autowired
	public KaKaoDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 정보 저장
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sqlSession.insert(MAPPER+".insert",userInfo);
	}

	// 정보 확인
	public MemberVo findkakao(HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
	
		
		return sqlSession.selectOne(MAPPER+".kakao", userInfo);
	}
}
