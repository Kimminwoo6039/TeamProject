package com.Ims.shop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;
import com.Ims.shop.vo.OrderVo;

@Repository
public class AdminOrderDao {
	
	//MyBatisÎ•? ?ù¥?ö©?ï¥?Ñú DB?ûë?óÖ: SqlSession Í∞ùÏ≤¥ ?ïÑ?öî
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "admin_order";
	
	@Autowired
	public AdminOrderDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	public void modify(Map deliveryMap) throws Exception{
		sqlSession.update(MAPPER+".modify", deliveryMap);
	}

	
	public List<OrderVo> list(){
		return sqlSession.selectList(MAPPER+".list");
	}
	
}
