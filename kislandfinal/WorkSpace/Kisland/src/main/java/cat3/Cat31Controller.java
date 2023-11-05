package cat3;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import all.vo.IslandVO;
import cat3.service.IslandService;
import common.ViewPath;

@Controller
public class Cat31Controller {
	
	private IslandService islandService;
	
	public Cat31Controller(IslandService islandService) {
		this.islandService = islandService;
	}

	
	@RequestMapping("/cat31/list")
	public String list(Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<IslandVO> list = islandService.IslandList(map);
		
		if(list.isEmpty()) {
			list = null;
		}
		
		model.addAttribute("list", list);

		return ViewPath.CAT31 + "list.jsp";
	}

	
	@RequestMapping("/cat31/writeform")
	public String insertForm() {
		return ViewPath.CAT31 + "write.jsp";
	}
	
	@Autowired
	private ServletContext application;
	
	@RequestMapping("/cat31/write")
	public String insert(Model model, HttpSession session, IslandVO vo, HttpServletRequest request) {
		
		Integer mngcheck = (Integer)request.getSession().getAttribute("mngcheck");
		vo.setManager_no(mngcheck);
		
		int su = islandService.IslandInsert(vo);
		
		model.addAttribute("su", su);
		model.addAttribute("status", "write");
		model.addAttribute("url", "/kisland/cat31/list");
		
		model.addAttribute("vo", vo);

		return ViewPath.CAT31 + "result.jsp";
	}
	
	
	@RequestMapping("/cat31/content")
	public String content(Model model, int no) {
		
		Map<String, Object> map = islandService.IslandGetContent(no);
		
		model.addAttribute("vo", map);
		
		return ViewPath.CAT31 + "content.jsp";
	}
	
	@RequestMapping("/cat31/updateform")
	public String updateForm(Model model, int no) {
		
		IslandVO vo = islandService.IslandOne(no);
		
		model.addAttribute("vo", vo);
		
		return ViewPath.CAT31 + "update.jsp";
	}
	
	@RequestMapping("/cat31/update")
	public String update(Model model, IslandVO vo) {
	
		int su = islandService.IslandUpdate(vo);
		
		model.addAttribute("su", su);
		model.addAttribute("status", "update");
		model.addAttribute("url", "/kisland/cat31/content?no=" + vo.getNo());
				
		return ViewPath.CAT31 + "result.jsp";
	}
	
	@RequestMapping("/cat31/delete")
	public String delete(Model model, int no) {
		
		int su = islandService.IslandDelete(no);
		
		model.addAttribute("su", su);
		model.addAttribute("status", "delete");
		model.addAttribute("url", "/kisland/cat31/list");
		
		return ViewPath.CAT31 + "result.jsp";
	}


}








