package com.Ims.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.AllVo;
import com.Ims.shop.vo.CartVo;
import com.Ims.shop.vo.MemberVo;
import com.Ims.shop.vo.NoticeVo;

@Repository
public class CartDao {
	
	//MyBatisÎ•? ?ù¥?ö©?ï¥?Ñú DB?ûë?óÖ: SqlSession Í∞ùÏ≤¥ ?ïÑ?öî
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "cart";
	
	@Autowired
	public CartDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	public void insert(CartVo vo) {
		sqlSession.insert(MAPPER+".insert", vo);
	}
	
	public List<AllVo> list(String userid){
		List<AllVo> list =sqlSession.selectList(MAPPER+".list",userid);
		/*
		 * for(AllVo vo:list) { System.out.println(vo.getMember_phone());
		 * System.out.println(vo.getMember_name()); System.out.println(vo.getPrice());
		 * System.out.println(vo.getMoney()); System.out.println(vo.getMember_id());
		 * System.out.println(vo.getColor()); }
		 */
		return list;
	}
	

	public int sumMoney(String userid) {
		return sqlSession.selectOne(MAPPER+".sumMoney",userid);
	}
	
	
	public void delete(int cart_id) {
		sqlSession.delete(MAPPER+".delete",cart_id);
	}
	
	public void deleteAll(String userid) {
		sqlSession.delete(MAPPER+".deleteAll", userid);
	}
	
	public void modify(CartVo vo) {
		sqlSession.update(MAPPER+".modify",vo);
	}
}
