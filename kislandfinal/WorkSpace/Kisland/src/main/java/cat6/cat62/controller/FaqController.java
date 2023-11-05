package cat6.cat62.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import all.vo.InfoBoardVO;
import cat6.cat62.service.FaqService;
import common.Paging;
import common.ViewPath;

@Controller
public class FaqController {
	
	private FaqService faqService;
	
	public FaqController(FaqService faqService) {
		this.faqService = faqService;
	}

	
	@RequestMapping("/cat62/list")
	public String list(Model model, Integer page, String type, String word) {

		if(page==null) {
			page = 1;	
		}
		
		if(type !=null && type.equals("")) {
			type = null;
			word = null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("type", type);
		map.put("word", word);
		
		int readCount = faqService.getTotal(map);
		Paging paging = new Paging(page, readCount);
		
		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());	
		
		List<InfoBoardVO> list = faqService.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);

		return ViewPath.FAQ + "list.jsp";
	}

	
	@Autowired
	private ServletContext application;
	
	
	@RequestMapping("/cat62/content")
	public String content(Model model, int no) {
		
		Map<String, Object> map = faqService.getContent(no);
		
		model.addAttribute("vo", map);
		
		return ViewPath.FAQ + "content.jsp";
	}
	
}