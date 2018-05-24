package spring.model.blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import spring.utility.blog.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	public boolean checkRefnum(int memono) {
		boolean flag = false;
		
		int cnt = mybatis.selectOne("memo.checkRefnum", memono);
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
	}
	
	public int total(Map map) {
		int total = 0;
		
		total = mybatis.selectOne("memo.total",map);
		
		return total;
		
		
	}
	
	public List<MemoDTO> list(Map map){
		
		return mybatis.selectList("memo.list", map);
		
	}//list close
	
	public boolean create(MemoDTO dto) {
		boolean flag=false;
		
		int cnt = mybatis.insert("memo.create",dto);
		if(cnt>0)flag = true;
		return flag;	
	}//create Close
	
	public MemoDTO read(int memono) {
		MemoDTO dto = null;
		
		dto = mybatis.selectOne("memo.read",memono);
		
		return dto;
		
	}//read Close
	
	public boolean update(MemoDTO dto) {
		boolean flag= false;
		
		int cnt = mybatis.update("memo.update",dto);
		if(cnt>0)flag = true;
		return flag;
	}//udpate Close
	
	public boolean delete(int memono) {
		boolean flag = false;
		
		int cnt = mybatis.delete("memo.delete",memono);
		if(cnt>0) flag=true;
		
		return flag;
	}//delete Close
	
	public void upViewcnt(int memono) {
		
		mybatis.update("memo.upViewcnt",memono);
		
	}	/*조회수 증가 end*/
	
	public MemoDTO readReply(int memono) {
		MemoDTO dto = null;
		
		dto = mybatis.selectOne("memo.readReply",memono);
		
		return dto;
	}
	
	
	
	public void upAnsnum(Map map) throws Exception {
		
		mybatis.update("memo.upAnsnum",map);
		
	}
	
	public boolean createReply(MemoDTO dto)throws Exception {
		boolean flag = false;
		
		int cnt = mybatis.insert("memo.createReply",dto);
		if(cnt>0)flag=true;
		
		return flag;
		
	}
	
}//MemoDAO Close
