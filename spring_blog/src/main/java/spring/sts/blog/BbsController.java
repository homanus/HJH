package spring.sts.blog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.blog.BbsDAO;
import spring.model.blog.BbsDTO;
import spring.model.blog.BbsMgr;
import spring.model.blog.IBbs;
import spring.model.blog.ReplyDAO;
import spring.model.blog.ReplyDTO;
import spring.utility.blog.Utility;

@Controller
public class BbsController{
	
	@Autowired
	private IBbs dao;
	
	@Autowired
	private ReplyDAO rdao;
	
	@Autowired
	private BbsMgr mgr;
	
	@RequestMapping("/bbs/rdelete")
	public String rdelete(int rnum, int bbsno,
			String nowPage, int nPage,
			String col, String word,Model model) {
		
		int total = rdao.total(bbsno);
		int totalPage = (int)(Math.ceil((double)total/5));
		
		if(rdao.delete(rnum)) {
			if(nPage != 1 && nPage==totalPage && (total%5)==1) {
				nPage = nPage -1;
			}
			
			model.addAttribute("bbsno",bbsno);
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nPage",nPage);
		
			return "redirect:/bbs/read";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/bbs/rupdate")
	public String rdupdate(ReplyDTO dto, Model model,
			String nowPage, String col, String word, String nPage) {
		
		if(rdao.update(dto)) {
			model.addAttribute("bbsno",dto.getBbsno());
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			model.addAttribute("nPage",nPage);
			
			return "redirect:/bbs/read";
		}else {
			return "error";
		}
	}
	
	
	@RequestMapping("/bbs/rcreate")
	public String rcreate(ReplyDTO dto,
			HttpServletRequest request, Model model,
			String nowPage, String col, String word
			 ) {
		if(rdao.create(dto)) {
			model.addAttribute("bbsno",dto.getBbsno());
			model.addAttribute("nowPage",nowPage);
			model.addAttribute("col",col);
			model.addAttribute("word",word);
			return "redirect:/bbs/read";
		}else {
			return "/bbs/error";
		}
	}
	
	
	@RequestMapping(value="/bbs/update",method=RequestMethod.POST)
	public String update(BbsDTO dto, String oldfile, HttpServletRequest request,Model model) {
		String basePath = request.getRealPath("/storage_bbs");
		String filename = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		
		int filesize = (int) dto.getFilenameMF().getSize();
		
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		
		Map map = new HashMap();
		map.put("passwd", dto.getPasswd());
		map.put("bbsno", dto.getBbsno());
		
		boolean pflag = dao.passcheck(map);
		
		if(pflag) {
			if(dao.update(dto)) {
				if(filesize > 0)
					Utility.deleteFile(basePath, oldfile);
				model.addAttribute("col",request.getParameter("col"));
				model.addAttribute("word",request.getParameter("word"));
				model.addAttribute("nowPage",request.getParameter("nowPage"));
				return "redirect:/bbs/list";
			}else {
				return "/bbs/error";
			}
			
		}else {
			return "/bbs/passwdError";
		}
		
	}
	
	@RequestMapping(value="/bbs/update",method=RequestMethod.GET)
	public String update(int bbsno,HttpServletRequest request) {
		
		BbsDTO dto = dao.read(bbsno);
		
		request.setAttribute("dto", dto);
		return "/bbs/update";
	}
	
	@RequestMapping(value="/bbs/reply",method=RequestMethod.POST)
	public String reply(BbsDTO dto,HttpServletRequest request,Model model) {
		String basePath = request.getRealPath("/storage_bbs");
		
		String filename = "";
		
		try{
			
		filename = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		dto.setFilename(filename);
		
			mgr.reply(dto);
			
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			
			return "redirect:/bbs/list";
			
		}catch(Exception e){
			e.printStackTrace();
			Utility.deleteFile(basePath, filename);
			return "/error/error";
		}
	}
	
	@RequestMapping(value="/bbs/reply",method=RequestMethod.GET)
	public String reply(int bbsno,HttpServletRequest request) {
		
		BbsDTO dto = dao.readReply(bbsno);
		
		request.setAttribute("dto", dto);
		return "/bbs/reply";
	}
	
	@RequestMapping(value="/bbs/delete",method=RequestMethod.POST)
	public String delete(BbsDTO dto,String oldfile,Model model,HttpServletRequest request) {
		
		Map map = new HashMap();
		map.put("bbsno", dto.getBbsno());
		map.put("passwd", dto.getPasswd());
		
		boolean pflag = dao.passcheck(map);
		
		if(pflag) {
			//flag = dao.delete(dto.getBbsno());
			try {
				mgr.delete(dto.getBbsno());
			
				String basePath = request.getRealPath("/storage_bbs");
				Utility.deleteFile(basePath, oldfile);
			
				model.addAttribute("col",request.getParameter("col"));
				model.addAttribute("word",request.getParameter("word"));
				model.addAttribute("nowPage",request.getParameter("nowPage"));
				
				return "redirect:/bbs/list";
				
			}catch(Exception e){
				e.printStackTrace();
				return "/error/error";
			}
			
		}else {
			return "/bbs/passwdError";
		}
		
	}
	
	@RequestMapping(value="/bbs/delete",method=RequestMethod.GET)
	public String delete(int bbsno,HttpServletRequest request) {
		
		boolean flag = dao.checkRefnum(bbsno);
		
		request.setAttribute("flag", flag);
		
		return "/bbs/delete";
	}
	
	@RequestMapping(value="/bbs/create",method=RequestMethod.POST)
	public String create(BbsDTO dto,HttpServletRequest request) {
		
		String basePath = request.getRealPath("/storage_bbs");
		int filesize = (int)dto.getFilenameMF().getSize();
		String filename = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		
		if(dao.create(dto)) {
			return "redirect:/bbs/list";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value="/bbs/create",method=RequestMethod.GET)
	public String create() {
		
		return "/bbs/create";
	}
	
	@RequestMapping("/bbs/read")
	public String read(int bbsno,HttpServletRequest request,Model model) {
		
		dao.upviewcnt(bbsno);
		BbsDTO dto = dao.read(bbsno);
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		model.addAttribute("dto",dto);
		
		/**댓글 관련**/
		String url = "read";
		int nPage = 1;
		int recordPerPage = 5;
		if(request.getParameter("nPage")!=null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		
		int sno = ((nPage-1)*recordPerPage)+1;
		int eno = (nPage*recordPerPage);
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);
		
		List<ReplyDTO> rlist = rdao.list(map);
		
		int total = rdao.total(bbsno);
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		String paging = Utility.paging2(total, nPage, recordPerPage, url, bbsno, nowPage, col, word);
		
		
		model.addAttribute("rlist",rlist);
		model.addAttribute("paging",paging);
		model.addAttribute("nPage",nPage);
		
		
		
		
		
		return"/bbs/read";
	}
	
	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) {
			word = "";
		}
		
		int nowPage = 1;
		int recordPerPage = 5;
		
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("col", col);
		map.put("word", word);
		
		List<BbsDTO> list = dao.list(map);
		
		int totalRecord = dao.total(map);
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		int nPage = 1;
		
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("nPage", nPage);
		request.setAttribute("rdao", rdao);
		
		return "/bbs/list";
	}

	
}
