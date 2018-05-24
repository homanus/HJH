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

import spring.model.blog.ImageDAO;
import spring.model.blog.ImageDTO;
import spring.utility.blog.Utility;


@Controller
public class ImageContoller {
	@Autowired
	private ImageDAO dao;
	
	@RequestMapping(value="/image/delete",method=RequestMethod.POST)
	public String delete(String fname,HttpServletRequest request, Model model,int ino,String passwd) {
		
		Map map = new HashMap();
		map.put("ino", ino);
		map.put("passwd", passwd);
		
		if(dao.pwCheck(map)) {
		
			if(dao.delete(ino)) {
				String basePath = request.getRealPath("/storage_image");
				Utility.deleteFile(basePath, fname);
				model.addAttribute("nowPage",request.getParameter("nowPage"));
				model.addAttribute("col",request.getParameter("col"));
				model.addAttribute("word",request.getParameter("word"));
				return "redirect:/image/list";
			}else {
				return "error";
			}
		}else {
			return "passwdError";
		}
	}
	
	@RequestMapping(value="/image/delete",method=RequestMethod.GET)
	public String delete() {
		
		return "/image/delete";
	}
	
	@RequestMapping(value="/image/update",method=RequestMethod.POST)
	public String update(ImageDTO dto,Model model,HttpServletRequest request,String oldfile) {
		String basePath = request.getRealPath("/storage_image");
		int size = (int)dto.getFnameMF().getSize();
		
		String fname = "member.jpg";
		if(size > 0) {
			Utility.deleteFile(basePath, oldfile);
			fname = Utility.saveFileSpring30(dto.getFnameMF(), basePath);
		}
		
		dto.setFname(fname);
		
		if(dao.update(dto)) {
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			return "redirect:/image/list";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value="/image/update",method=RequestMethod.GET)
	public String update(int ino,HttpServletRequest request) {
		ImageDTO dto = dao.read(ino);
		request.setAttribute("dto", dto);
		
		return "/image/update";
		
	}
	
	@RequestMapping(value="/image/create",method=RequestMethod.POST)
	public String create(ImageDTO dto,HttpServletRequest request) {
		String basePath = request.getRealPath("/storage_image");
		
		String fname = Utility.saveFileSpring30(dto.getFnameMF(), basePath);
		
		dto.setFname(fname);
		
		if(dao.create(dto)) {
			return "redirect:/image/list";
		}else {
			return "error";
		}
	}
	
	
	@RequestMapping(value="/image/create",method=RequestMethod.GET)
	public String create() {
		
		
		return "/image/create";
	}
	
	@RequestMapping("/image/read")
	public String read(int ino,HttpServletRequest request) {
		
		
		ImageDTO dto = dao.read(ino);
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		List list = dao.imglist(dto.getIno());
		
		request.setAttribute("dto", dto);
		request.setAttribute("list", list);
		
		return "/image/read";
	}
	
	@RequestMapping("/image/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")){
			word = "";
		}
		
		int nowPage = 1;
		int recordPerPage = 5;
		
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = nowPage*recordPerPage;
		
		Map map = new HashMap();
		map.put( "col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		


		List<ImageDTO> list = dao.list(map);
		
		int totalRecord = dao.total(map);
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		
		return "/image/list";
	}
}
