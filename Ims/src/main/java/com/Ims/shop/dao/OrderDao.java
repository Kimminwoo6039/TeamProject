package com.Ims.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.AllVo;
import com.Ims.shop.vo.Dio;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;
import com.Ims.shop.vo.ZzimVo;

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
	
	public List<OrderVo> list(Dio dio){
		return sqlSession.selectList(MAPPER+".list",dio);
	}
	

	public int abc(String userid) {
		return sqlSession.selectOne(MAPPER+".abc", userid);
	}
	
	public int abc1(String userid) {
		return sqlSession.selectOne(MAPPER+".abc1", userid);
	}
	
	public int abc2(String userid) {
		return sqlSession.selectOne(MAPPER+".abc2", userid);
	}
	
	public int abc3(String userid) {
		return sqlSession.selectOne(MAPPER+".abc3", userid);
	}
	
	public List<OrderVo> allList(){
		return sqlSession.selectList(MAPPER+".allList");
	}


	public List<AllVo> zzimlist(String member_id) {
		
		return sqlSession.selectList(MAPPER+".zlist", member_id);
	}


	public int sumMoney(String member_id) {
		return sqlSession.selectOne(MAPPER+".sumMoney",member_id);
	}

	
}
