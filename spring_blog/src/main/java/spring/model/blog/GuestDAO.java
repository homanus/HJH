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
public class GuestDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public boolean idCheck(Map map){
		boolean flag = false;
		
		int cnt = mybatis.selectOne("guest.idCheck",map);
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
	}
	
	public GuestDTO read(int gno){
		GuestDTO dto = null;
		
		dto = mybatis.selectOne("guest.read",gno);
		
		return dto;
	}

	public int total(Map map){
		int total=0;
		
		total = mybatis.selectOne("guest.total",map);
		
		return total;
		
	}
	
	public String getFname(int gno){
		String fname = null;
		
		fname = mybatis.selectOne("guest.getFname",gno);
		
		return fname;
	}
	
	public boolean create(GuestDTO dto){
		boolean flag = false;
		
		int cnt = mybatis.insert("guest.create",dto);
		if(cnt > 0)flag=true;
		
		return flag;
		
	}
	
	public List<GuestDTO> list(Map map){
		List<GuestDTO> list = new ArrayList<GuestDTO>();
		
		list = mybatis.selectList("guest.list",map);
		
		return list;
	}
	
	public boolean update(GuestDTO dto){
		boolean flag = false;
		
		int cnt = mybatis.update("guest.update",dto);
		if(cnt>0)flag=true;
		return flag;
		
	}
	
	public boolean delete(int gno){
		boolean flag = false;
		
		int cnt = mybatis.delete("guest.delete",gno);
		if(cnt>0)flag=true;
		
		return flag;
	}

}
