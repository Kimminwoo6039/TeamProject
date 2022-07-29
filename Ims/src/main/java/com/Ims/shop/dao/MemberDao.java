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
<<<<<<< HEAD
	}

=======
	}
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git



public Integer pwFind_Lookup( MemberVo membervo ) {
	int result = sqlSession.selectOne( MAPPER+".pwFind_lookup",membervo);
	return result;
}

//�쉶�썝 硫붿씪 �엳�뒗吏� �솗�씤
public int pwFind_ok(MemberVo membervo) {
	int result = sqlSession.selectOne(MAPPER+ ".pwFind_ok", membervo );
	return result;
}

//�쉶�썝 鍮꾨�踰덊샇 媛��졇�삤湲�
public MemberVo pwFind_select( MemberVo membervo ) {
	MemberVo to = sqlSession.selectOne(MAPPER+".pwFind_select", membervo );
	return to;
<<<<<<< HEAD
}

=======
}
>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git
	
	public int memberdelete(MemberVo vo) {
		return sqlSession.selectOne(MAPPER+".memberdelete", vo);
	}

	public int delete(String userid) {
		return sqlSession.update(MAPPER+".delete", userid);

	}
<<<<<<< HEAD

}
=======

	public int update(MemberVo vo) {
		return sqlSession.update(MAPPER+".update", vo);
	}

	public List<MemberVo> allList(){
		return sqlSession.selectList(MAPPER+".allList");
	}
	
	}


>>>>>>> branch 'master' of https://github.com/gogogo1123/shopping.git

