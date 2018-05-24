package spring.model.blog;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class ImageDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	
	public String getFname(int ino){
		String fname = null;
		
		fname = mybatis.selectOne("image.getFname",ino);
		
		return fname;
		
	}
	
	public List imglist(int ino){
		List list = new ArrayList();
		
		Map map = mybatis.selectOne("image.imglist",ino);
		
		java.math.BigDecimal pre_ino2 = (BigDecimal) map.get("PRE_INO2");
		java.math.BigDecimal pre_ino1 = (BigDecimal) map.get("PRE_INO1");
		java.math.BigDecimal ino1 = (BigDecimal) map.get("INO");
		java.math.BigDecimal nex_ino1 = (BigDecimal) map.get("NEX_INO1");
		java.math.BigDecimal nex_ino2 = (BigDecimal) map.get("NEX_INO2");
		
		java.math.BigDecimal noArr[] = {
				pre_ino2,
				pre_ino1,
				ino1,
				nex_ino1,
				nex_ino2
				};
		String files[] = {
				(String)map.get("PRE_FILE2"),
				(String)map.get("PRE_FILE1"),
				(String)map.get("FNAME"),
				(String)map.get("NEX_FILE1"),
				(String)map.get("NEX_FILE2")
				};
		
		list.add(files);
		list.add(noArr);
		
		return list;
	}
	
	public boolean create(ImageDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.insert("image.create",dto);
		if(cnt>0)flag=true;

		return flag;
	}

	public List<ImageDTO> list(Map map) {

		return mybatis.selectList("image.list",map);
	}

	public boolean update(ImageDTO dto) {
		boolean flag = false;
		
		int cnt = mybatis.update("image.update",dto);
		if(cnt>0) {
			flag  =  true;
		}
		
		return flag;
	
	}

	public boolean delete(int ino) {
		boolean flag = false;
		
		int cnt = mybatis.delete("image.delete",ino);
		if(cnt>0)flag=true;
		
		return flag;
	}

	public ImageDTO read(int ino) {
		ImageDTO dto = null;
		
		dto = mybatis.selectOne("image.read",ino);

		return dto;
	}

	public boolean pwCheck(Map map) {
		boolean flag = false;
		
		int cnt = mybatis.selectOne("image.pwCheck",map);
		if(cnt>0)flag=true;

		return flag;
	}

	public int total(Map map) {
		int total = 0;
		
		total = mybatis.selectOne("image.total",map);

		return total;
	}

}
