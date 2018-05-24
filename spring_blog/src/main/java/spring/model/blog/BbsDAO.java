package spring.model.blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class BbsDAO implements IBbs{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public String getFname(int bbsno){
		String fname = mybatis.selectOne("board.getFname",bbsno);
		
		return fname;
	}
	
	public boolean checkRefnum(int bbsno) {
		boolean flag = false;
		
		int cnt = mybatis.selectOne("bbs.checkRefnum", bbsno);
		
		if(cnt>0) {
			flag = true;
		}
		return flag;
	}
	
	public int total(Map map) {
		int total=0;
		
		total = mybatis.selectOne("bbs.total",map);
		
		return total;
		
		
	}

	public List<BbsDTO> list(Map map){
		
		return mybatis.selectList("bbs.list",map);
	}
	
	public boolean create(BbsDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.insert("bbs.create",dto);
		
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
	}
	
	public BbsDTO read(int bbsno) {
		
		
		return mybatis.selectOne("bbs.read", bbsno);
	}
	
	public boolean update(BbsDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.update("bbs.update",dto);
		
		if(cnt>0)flag = true;
		
		return flag;
	}
	
	public boolean delete(int bbsno) {
		boolean flag = false;
		
		int cnt = mybatis.delete("bbs.delete",bbsno);
		if(cnt>0) {
			flag = true;
		}
		return flag;
	}
	
	public void upviewcnt(int bbsno) {
		
		mybatis.update("bbs.upViewcnt",bbsno);
		
	}
	
	public boolean passcheck(Map map) {
		boolean flag = false;
		
		int cnt = mybatis.selectOne("bbs.passcheck", map);
		if(cnt > 0)flag = true;

		return flag;
		
	}
	
	public BbsDTO readReply(int bbsno) {
		BbsDTO dto = null;
		
		dto = mybatis.selectOne("bbs.readReply", bbsno);
		
		return dto;
	}
	
	public boolean createReply(BbsDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.update("bbs.createReply",dto);
		if(cnt > 0) {
			flag = true;
		}
		
		return flag;
	}
	
	public void upAnsnum(Map map) {
		
		mybatis.update("bbs.upAnsnum",map);
		
		
	}

}
