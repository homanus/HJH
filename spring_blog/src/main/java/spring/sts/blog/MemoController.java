package spring.sts.blog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.blog.MemoDAO;
import spring.model.blog.MemoDTO;
import spring.model.blog.MemoMgr;
import spring.utility.blog.Utility;

@Controller
public class MemoController {
	
	@Autowired
	private MemoDAO dao;
	
	@Autowired
	private MemoMgr mgr;
	
	@RequestMapping(value="/memo/reply",method=RequestMethod.POST)
	public String reply(MemoDTO dto, Model model,HttpServletRequest request) {
		
		if(mgr.reply(dto)) {
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			return "redirect:/memo/list";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value="/memo/reply",method=RequestMethod.GET)
	public String reply(int memono,Model model) {
		
		MemoDTO dto = dao.readReply(memono);
		
		model.addAttribute("dto",dto);
		
		return "/memo/reply";
	}
	
	@RequestMapping(value="/memo/delete",method=RequestMethod.GET)
	public String delete(int memono, Model model) {
		boolean flag = dao.checkRefnum(memono);
		
		model.addAttribute("flag",flag);
		
		return "/memo/delete";
		
	}
	
	@RequestMapping(value="/memo/delete",method=RequestMethod.POST)
	public String delete(int memono,Model model,HttpServletRequest request) {
		
		if(dao.delete(memono)) {
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			return "redirect:/memo/list";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value="/memo/update",method=RequestMethod.POST)
	public String update(MemoDTO dto, Model model, HttpServletRequest request) {
		
		if(dao.update(dto)) {
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			return "redirect:/memo/list";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping(value="/memo/update",method=RequestMethod.GET)
	public String update(int memono,Model model) {
		MemoDTO dto = dao.read(memono);
		model.addAttribute("dto",dto);
		
		
		return "/memo/update";
	}
	
	@RequestMapping(value="/memo/create",method=RequestMethod.GET)
	public String create() {
		
		return "/memo/create";
	}
	
	@RequestMapping(value="/memo/create",method=RequestMethod.POST)
	public String create(MemoDTO dto) {
		
		if(dao.create(dto)) {
			return "redirect:/memo/list";
		}else {
			return "error";
		}
		
	}
	
	@RequestMapping("/memo/read")
	public String read(int memono,Model model) {
		
		dao.upViewcnt(memono);
		MemoDTO dto = dao.read(memono);
		
		if(dto.getContent() != null) {
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		}
		
		model.addAttribute("dto",dto);
		
		return "/memo/read";
	}
	
	@RequestMapping("/memo/list")
	public String list(HttpServletRequest request) {
		//검색관련======================================================
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
				
		if(col.equals("total")){
			word="";
		}
		//검색관련END----------------------------------------------------------------
				
		//페이징 관련
		int nowPage = 1;
		int recordPerPage = 5;
				
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
			
		int sno = ((nowPage -1) * recordPerPage) +1;
		int eno = nowPage * recordPerPage;
				
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
				
		List<MemoDTO> list = dao.list(map);
		int totalRecord = dao.total(map);
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
				
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		
		return "/memo/list";
	}
	
	
	
}
