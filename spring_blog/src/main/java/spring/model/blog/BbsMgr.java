package spring.model.blog;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class BbsMgr {

		@Autowired
		private BbsDAO dao;
		
		@Autowired
		private ReplyDAO rdao;
		
		public void reply(BbsDTO dto) throws Exception {
				Map map = new HashMap();
				map.put("grpno", dto.getGrpno());
				map.put("ansnum", dto.getAnsnum());
				dao.upAnsnum(map);
				dao.createReply(dto);
		}
		
		public void delete(int bbsno) throws Exception{
			rdao.bdelete(bbsno); //댓글들 삭제
			dao.delete(bbsno); //댓글을 포함하고 있는 게시글 삭제
		}

}
