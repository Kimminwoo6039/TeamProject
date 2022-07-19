package com.Ims.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.Criteria;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.ProductVo;
import com.Ims.shop.vo.SearchPagingVo;
import com.fasterxml.jackson.databind.cfg.MapperConfig;




@Repository
public class NoticeDao {
	
	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "notice";
	
	@Autowired
	public NoticeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int addNotice(NoticeVo noticeVo) {
		return sqlSession.insert(MAPPER+".addNotice", noticeVo);
	}
	
	
	public NoticeVo View(int n_bidx) {
		return sqlSession.selectOne(MAPPER+".View", n_bidx);
	}

//	public NoticeVo getNoticeModify(int n_bidx) {
//		
//		return sqlSession.selectOne(MAPPER+"getNoticeModify", n_bidx);
//	}
//	
	public void update(NoticeVo noticeVo) { 
		 
		 sqlSession.update(MAPPER+".update", noticeVo);
	}
	public String file_info(int n_bidx) {
		return sqlSession.selectOne(MAPPER+".file_info",n_bidx);
	}
	public void delete(int n_bidx) {
		sqlSession.delete(MAPPER+".delete", n_bidx);
	}
	public List<NoticeVo> list(){
		return sqlSession.selectList(MAPPER+".list");
	}
	public int NoticeListCnt(Criteria cri){
		return sqlSession.selectOne(MAPPER+".NoticeListCnt", cri);
	}
	
	public List<Map<String, Object>> noticelist(Criteria cri) throws Exception{
		return sqlSession.selectList(MAPPER+".Noticelist",cri);
	}
	
}
