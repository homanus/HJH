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
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public String getGrade(String id){
		String grade="";
		
		grade = mybatis.selectOne("member.getGrade",id);
		
		return grade;
	}
	
	public boolean loginCheck(Map map){
		boolean flag = false;
		
		int cnt = mybatis.selectOne("member.loginCheck",map);
		if(cnt>0)flag=true;
		
		return flag;
	}
	
	public String getFname(String id){
		String fname = "";
		
		fname = mybatis.selectOne("member.getFname",id);
		
		return fname;
	}
	
	public int total(Map map){
		int total=0;
		
		total = mybatis.selectOne("member.total",map);
		
		return total;
	}
	
	public boolean duplicateEmail(String email){
		boolean flag = false;
		
		int cnt = mybatis.selectOne("member.duplicateEmail",email);
		if(cnt>0)flag=true;
		
		return flag;
	}
	
	public boolean duplicateID(String id){
		boolean flag=false;
		
		int cnt = mybatis.selectOne("member.duplicateID",id);
		if(cnt>0)flag=true;
		
		return flag;
	}
	
	public List<MemberDTO> list(Map map){
	
		return mybatis.selectList("member.list",map);
	}

	public boolean create(MemberDTO dto){
		boolean flag = false;
		
		int cnt = mybatis.insert("member.create",dto);
		if(cnt>0)flag=true;
		
		return flag;
	}
	
	public MemberDTO read(String id){
		MemberDTO dto = null;
		
		dto = mybatis.selectOne("member.read",id);
		
		return dto;
	}
	
	
	public boolean updateFile(Map map){
		boolean flag = false;

		int cnt = mybatis.update("member.updateFile",map);
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
	}
	
	public boolean updatePasswd(Map map){
		boolean flag = false;
		
		int cnt = mybatis.update("member.updatePasswd",map);
		if(cnt>0)flag=true;
		
		return flag;
	}
	
	public boolean updateInfo(MemberDTO dto){
		boolean flag = false;
		
		int cnt = mybatis.update("member.updateInfo",dto);
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
	}
	
	
	
	public boolean delete(String id){
		boolean flag = false;
		
		int cnt = mybatis.delete("member.delete",id);
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
		
	}
	
	public boolean CheckPW(Map map){
		boolean flag = false;
		
		int cnt = mybatis.selectOne("member.CheckPW",map);
		if(cnt>0) {
			flag = true;
		}
		
		return flag;
	}
	
}
