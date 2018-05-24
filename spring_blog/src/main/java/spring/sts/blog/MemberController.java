package spring.sts.blog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.blog.MemberDAO;
import spring.model.blog.MemberDTO;
import spring.utility.blog.Utility;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("/member/email_form")
	public String email_form() {

		return "/member/email_form";
	}
	
	@RequestMapping("/member/email_proc")
	public String email_proc(HttpServletRequest request) {
		String email = request.getParameter("email");
		boolean flag = dao.duplicateEmail(email);
		
		request.setAttribute("flag", flag);
		return "/member/email_proc";
	}
	
	@RequestMapping("/member/id_form")
	public String id_form() {
		
		return "/member/id_form";
	}
	
	@RequestMapping("/member/id_proc")
	public String id_proc(HttpServletRequest request) {
		String id = request.getParameter("id");
		boolean flag = dao.duplicateID(id);
		
		request.setAttribute("flag", flag);
		
		return "/member/id_proc";
	}
	
	@RequestMapping("/member/agreement")
	public String agreement() {
		return "/member/agreement";
	}
	
	@RequestMapping(value="/member/createProc")
	public String create(MemberDTO dto, HttpServletRequest request, Model model) {
		
		String grade = (String)request.getSession().getAttribute("grade");
		boolean idflag = dao.duplicateID(dto.getId());
		boolean emailflag = dao.duplicateEmail(dto.getEmail());
		String basePath = request.getRealPath("/storage_member");
		if(idflag) {
			model.addAttribute("idflag",idflag);
			return "redirect:/member/dup";
		}else if(emailflag) {
			model.addAttribute("emailflag",emailflag);
			return "redirect:/member/dup";
		}else {
			String fname = "";
			int size = (int)dto.getFilenameMF().getSize();
				if(size > 0) {
					fname = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
				}else {
					fname = "member.jpg";
				}
				
				dto.setFname(fname);
				if(dao.create(dto)) {
					return "redirect:/";
				}else {
					return "error";
				}
		}//else end
	}//method end
	
	@RequestMapping(value="/member/createForm")
	public String create() {
		return "/member/create";
	}
	
	@RequestMapping(value="/member/delete",method=RequestMethod.POST)
	public String delete(String id,HttpServletRequest request,Model model) {
		
		String id1 = request.getParameter("id");
		String fname = request.getParameter("fname");
		
		String sid = (String)request.getSession().getAttribute("id");
		String grade = (String)request.getSession().getAttribute("grade");
		
		boolean flag = dao.delete(id1);
		String upDir = request.getRealPath("/storage_member");
		
		if(flag) {
			if(fname != null && !fname.equals("member.jpg")) {
				Utility.deleteFile(upDir, fname);
			}
			if(sid != null && !grade.equals("A")) {
				request.getSession().invalidate();
				
				return "redirect:/";
			}
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			return "redirect:/admin/list";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value="/member/delete",method=RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		if(id == null) {
			id=(String)request.getSession().getAttribute("id");
		}
		String fname = dao.getFname(id);
		
		request.setAttribute("id", id);
		request.setAttribute("fname", fname);
		
		return "/member/delete";
	}
	
	
	@RequestMapping(value="/member/passwordCheck")
	public String passwordCheck() {
		return "/member/passwordCheck";
	}
	
	@RequestMapping(value="/member/updatePasswdProc",method=RequestMethod.POST)
	public String updatePasswd(String id,String passwd,Model model,HttpServletRequest request) {
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);
		
		if(dao.updatePasswd(map)) {
			model.addAttribute("id",id);
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			return "redirect:/member/read";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value="/member/updatePasswdForm",method=RequestMethod.POST)
	public String updatePasswd(String id, String passwd1) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("passwd", passwd1);
		
		if(dao.CheckPW(map)) {
			return "/member/updatePasswdForm";
		}else {
			return "/member/passwdError";
		}
		
	}
	
	@RequestMapping(value="/member/updateFile",method=RequestMethod.POST)
	public String updateFile(MemberDTO dto,HttpServletRequest request,String oldfile) {
		
		String basePath = request.getRealPath("/storage_member");
		
		
		int filesize = (int)dto.getFilenameMF().getSize();
		String filename = "";
		
		if(filesize >0) {
			
			if(oldfile != null && !oldfile.equals("member.jpg")) {
				Utility.deleteFile(basePath, oldfile);
			}
			
			filename = Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
			
		}
		dto.setFname(filename);
		
		Map map = new HashMap();
		map.put("id", dto.getId());
		map.put("fname", dto.getFname());
		
		boolean flag = dao.updateFile(map);
		
		if(flag) {
			request.setAttribute("flag", flag);
			request.setAttribute("id", dto.getId());
			request.setAttribute("nowPage", request.getParameter("nowPage"));
			request.setAttribute("col", request.getParameter("col"));
			request.setAttribute("word", request.getParameter("word"));
			return "redirect:/member/read";
		}else {
			
			return "error";
		}
		
		
	}
	
	@RequestMapping(value="/member/updateFile",method=RequestMethod.GET)
	public String updateFile(MemberDTO dto,HttpSession session) {
		
		return "/member/updateFile";
	}
	
	@RequestMapping(value="/member/updateInfo",method=RequestMethod.POST)
	public String updateInfo(MemberDTO dto,Model model,HttpServletRequest request,HttpSession session) {
		
		if(dao.updateInfo(dto)) {
			model.addAttribute("id",dto.getId());
			model.addAttribute("col",request.getParameter("col"));
			model.addAttribute("word",request.getParameter("word"));
			model.addAttribute("nowPage",request.getParameter("nowPage"));
			return "redirect:read";
		}else {
			return "error";
		}
	}
	
	@RequestMapping(value="/member/updateInfo",method=RequestMethod.GET)
	public String updateInfo(String id,Model model,HttpSession session) {
		
		if(id == null) {
			id = (String)session.getAttribute("id");
		}
		
		MemberDTO dto = dao.read(id);
		model.addAttribute("dto",dto);
		
		return "/member/updateInfo";
	}
	
	@RequestMapping("/member/read")
	public String read(HttpServletRequest request, Model model,HttpSession session) {
		String id = request.getParameter("id");
		if(id == null) {
			id = (String)session.getAttribute("id");
		}
		MemberDTO dto = dao.read(id);
		
		model.addAttribute("dto",dto);
		model.addAttribute("id",id);
		
		return "/member/read";
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String login(HttpServletRequest request,
			HttpServletResponse response,Model model) {
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		/**bbs_read_reply로 되돌아 갈 때 가져갈 데이터들**/
		String bbsno = request.getParameter("bbsno");
		String nPage = request.getParameter("nPage");
		String nowPage = request.getParameter("nowPage");
		String col = request.getParameter("col");
		String word = request.getParameter("word");
		String rflag = request.getParameter("rflag");


		Map map = new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);

		boolean flag = dao.loginCheck(map);
		String grade=null;
		String url = "/member/passwdError";
		
		
		HttpSession session = request.getSession();

		if(flag){//flag start
			grade = dao.getGrade(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
			
			Cookie cookie = null; 
		       
		    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
		       
		    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
		      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록 
		   
		      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
		      cookie.setMaxAge(120);               // 2 분 유지 
		      response.addCookie(cookie);          // 쿠키 기록  
		         
		    }else{ 
		      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
		      cookie.setMaxAge(0); 
		      response.addCookie(cookie); 
		         
		      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
		      cookie.setMaxAge(0);
		      response.addCookie(cookie);
		    }//else END
		    
		    url = "redirect:/";
		    
		    if(rflag != null && !rflag.equals("")) {
		    	model.addAttribute("bbsno",bbsno);
		    	model.addAttribute("nPage",nPage);
		    	model.addAttribute("col",col);
		    	model.addAttribute("word",word);
		    	model.addAttribute("nowPage",nowPage);
		    	url = "redirect:"+rflag;
		    }//if rflag END
		    
		}//flag END
		
		return url;
	}//login end
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request){
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		 
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		 
		if (cookies != null){ 
		 for (int i = 0; i < cookies.length; i++) { 
		   cookie = cookies[i]; 
		 
		   if (cookie.getName().equals("c_id")){ 
		     c_id = cookie.getValue();     // Y 
		   }else if(cookie.getName().equals("c_id_val")){ 
		     c_id_val = cookie.getValue(); // user1... 
		   } 
		 } 
		}
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);
		return "/member/login";
	}
	
	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")){
			word="";
		}

		int nowPage = 1;
		int recordPerPage = 3;
		
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = nowPage*recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<MemberDTO> list = dao.list(map);
		
		int totalRecord = dao.total(map);
		
		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
		
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("list", list);
		
		return "/member/list";
	}
	

}
