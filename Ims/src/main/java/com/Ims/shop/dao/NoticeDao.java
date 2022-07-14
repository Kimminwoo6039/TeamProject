package com.Ims.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.PagingVo;
import com.Ims.shop.vo.SearchPagingVo;
import com.fasterxml.jackson.databind.cfg.MapperConfig;




@Repository
public class NoticeDao {
	
	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "com.Ims.shop.notice";
	
	@Autowired
	public NoticeDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int addNotice(NoticeVo noticeVo) {
		return sqlSession.insert(MAPPER+".addNotice", noticeVo);
	}
	//페이징까지 완료
	public List<NoticeVo> selectNoticeList(PagingVo pvo){
		
		/*
		 * HashMap<String, Object> map = new HashMap<>(); map.put("type", type);
		 * map.put("keyword", keyword); map.put("start", start); map.put("end", end);
		 */
		
		return sqlSession.selectList(MAPPER+".selectNoticeList",pvo);
	}
	
	public int countNotice(SearchPagingVo spvo) {
		return sqlSession.selectOne(MAPPER+".countNotice",spvo);
	}
	
	
//	public List<PagingVo> selectNoticeList(String search_option, String keyword)throws Exception {
//		
//		Map<String, Object> map = new HashMap<>();
//		map.put("search_option", search_option);
//		map.put("keyword", keyword);
//		
//		return sqlSession.selectList(MAPPER+".selectNoticeList", map);
//	}
//	
//	public int countNotice(String search_option, String keyword) {
//		return sqlSession.selectOne(MAPPER+".countNotice");
//	}
	

	public NoticeVo getNoticeView(int n_bidx) {
		return sqlSession.selectOne(MAPPER+".getNoticeView", n_bidx);
	}

	public NoticeVo getNoticeModify(int n_bidx) {
		
		return sqlSession.selectOne(MAPPER+"getNoticeModify", n_bidx);
	}
	
	public void getNoticeModifyProcess(NoticeVo noticeVo) { 
		 
		 sqlSession.update(MAPPER+".getNoticeModifyProcess", noticeVo);
	}
	
	public void getNoticeDelete(int n_bidx) {
		sqlSession.update(MAPPER+".getNoticeDelete", n_bidx);
	}

}
