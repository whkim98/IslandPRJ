package cat6.cat62.service;

import java.util.List;
import java.util.Map;

import all.dao.InfoBoardDAO;
import all.dao.MngBrdDAO;
import all.vo.InfoBoardVO;
import all.vo.MngBrdVO;
import cat6.cat63.dao.SuggestDAO;
import cat6.cat63.vo.SuggestVO;

public class FaqService {

	private InfoBoardDAO infoboardDao;
	
	public FaqService(InfoBoardDAO infoboardDao) {
		this.infoboardDao = infoboardDao;
	}
	
	
	// 정보 불러오기 (전체 보기)
	public List<InfoBoardVO> selectList(Map<String, Object> map){	
		List<InfoBoardVO> list = infoboardDao.selectList(map);
		
		return list;	
		
	}
	
	// 정보 불러오기
	public InfoBoardVO selectOne(int no)	{
		return infoboardDao.selectOne(no);
	}
	
	// 게시글 총 개수
	public int getTotal(Map<String, Object> map) {
		return infoboardDao.getTotal(map);
	}
	
	// 게시글 불러오기
	public Map<String, Object> getContent(int no){
		
		infoboardDao.readCount(no);
		
		Map<String, Object> map = infoboardDao.getContent(no);
		
		return map;
	}
	
	
	
}
