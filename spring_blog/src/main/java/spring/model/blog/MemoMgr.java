package spring.model.blog;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemoMgr {
	
	@Autowired
	private MemoDAO dao = null;
	
	public boolean reply(MemoDTO dto) {
		boolean flag = false;
		
		
		Map map = new HashMap();
		map.put("ansnum", dto.getAnsnum());
		map.put("grpno", dto.getGrpno());
		try {
			dao.upAnsnum(map);
			
			flag = dao.createReply(dto);
			
		} catch (Exception e) {

		}finally {

		}
		
		
		return flag;
	}

}
