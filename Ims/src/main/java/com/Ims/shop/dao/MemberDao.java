package com.Ims.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;

@Repository
public class MemberDao {

	private SqlSession sqlSession;
	
	public static final String MAPPER = "member";
	
	@Autowired
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	
	
	public String login(MemberVo vo){
		return sqlSession.selectOne(MAPPER+".login",vo);
	}
	
	public void joinProcess(MemberVo vo) {
		sqlSession.insert(MAPPER+".joinProcess",vo);
	}
	
	public MemberVo list(String userid) {
		return sqlSession.selectOne(MAPPER+".list", userid );
	}



public Integer pwFind_Lookup( MemberVo membervo ) {
	int result = sqlSession.selectOne( "pwFind_lookup",membervo);
	return result;
}

//회원 메일 있는지 확인
public int pwFind_ok(MemberVo membervo) {
	int result = sqlSession.selectOne( "pwFind_ok", membervo );
	return result;
}

//회원 비밀번호 가져오기
public MemberVo pwFind_select( MemberVo membervo ) {
	MemberVo to = sqlSession.selectOne("pwFind_select", membervo );
	return to;
}
	
	public int memberdelete(MemberVo vo) {
		return sqlSession.selectOne(MAPPER+".memberdelete", vo);
	}

	public int delete(String userid) {
		return sqlSession.update(MAPPER+".delete", userid);
<<<<<<< HEAD
	}

	public int update(MemberVo vo) {
		return sqlSession.update(MAPPER+".update", vo);
	}
=======
	}
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
}

