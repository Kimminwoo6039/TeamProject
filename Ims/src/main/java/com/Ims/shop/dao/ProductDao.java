package com.Ims.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Ims.shop.vo.Criteria;
import com.Ims.shop.vo.ProductVo;
import com.Ims.shop.vo.ZzimVo;

@Repository
public class ProductDao {

	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "product";
	
	@Autowired
	public ProductDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	public void insert(ProductVo vo) {
		sqlSession.insert(MAPPER+".insert",vo);
	}
	
	public List<ProductVo> list(){
		return sqlSession.selectList(MAPPER+".list");
	}
	
	
	public ProductVo detail(int product_code) {
		return sqlSession.selectOne(MAPPER+".detail", product_code);
	}
	
	public void update(ProductVo vo) {
		sqlSession.update(MAPPER+".update", vo);
	}
	
	public String file_info(int product_code) {
		return sqlSession.selectOne(MAPPER+".file_info",product_code);
	}
	
	public void delete(Integer product_code) {
		sqlSession.delete(MAPPER+".delete",product_code);
	}
	
	
	public int ProductListCnt(Criteria cri){
		return sqlSession.selectOne(MAPPER+".ProductListCnt",cri);
	}
	
	public List<Map<String, Object>> productlist(Criteria cri) throws Exception{
		return sqlSession.selectList(MAPPER+".Productlist",cri);
	}
	
	public List<ProductVo> top5(){
		return sqlSession.selectList(MAPPER+".top");
	}
	public int zzim(HashMap<String, Object> map) {
		
		return sqlSession.insert(MAPPER+".insertzzim",map);
	}
	public List<Map<String, Object>> selectzzim(HashMap<String, Object> map1) throws Exception{
		return sqlSession.selectList(MAPPER+".selectzzim",map1);
	}
	
//	public int deletezzim(HashMap<String, Object> map) {
//		return sqlSession.update(MAPPER+".deletezzim",map);
//	}
	
	public int deletezzim(HashMap<String, Object> map) {
		return sqlSession.delete(MAPPER+".deletezzim",map);
	}
	
	public int selectzzim2(HashMap<String, Object> map1) {
		return sqlSession.selectOne(MAPPER+".selectzzim2",map1);
	}
}
