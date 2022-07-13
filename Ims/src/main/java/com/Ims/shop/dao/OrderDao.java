package com.Ims.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;

@Repository
public class OrderDao {
	
	//MyBatis�? ?��?��?��?�� DB?��?��: SqlSession 객체 ?��?��
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "order";
	
	@Autowired
	public OrderDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	public void cancel(String order_idx) {
		sqlSession.update(MAPPER+".cancel", order_idx);
	}
	
	public List<OrderVo> list(String userid){
		return sqlSession.selectList(MAPPER+".list",userid);
	}
	

	
	
}
