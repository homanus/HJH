package spring.model.blog;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

public interface IBbs {
	
	String getFname(int bbsno);
	boolean checkRefnum(int bbsno);
	int total(Map map);
	List<BbsDTO> list(Map map);
	boolean create(BbsDTO dto);
	BbsDTO read(int bbsno);
	boolean update(BbsDTO dto);
	boolean delete(int bbsno);
	void upviewcnt(int bbsno) ;
	boolean passcheck(Map map);
	BbsDTO readReply(int bbsno);
	boolean createReply(BbsDTO dto);
	void upAnsnum(Map map);
	
}
