package cat3.service;

import java.util.List;
import java.util.Map;

import all.vo.IslandVO;
import cat3.dao.IslandDAO;

public class IslandService {
	
	private IslandDAO islandDao;
	
	public IslandService(IslandDAO islandDao) {
		this.islandDao = islandDao;
	}
	
	
	public int IslandInsert(IslandVO vo) {	
		return islandDao.IslandInsert(vo);
	}
	
	public List<IslandVO> IslandList(Map<String, Object> map){
		return islandDao.IslandList(map);
	}
	
	public IslandVO IslandOne(int no) {
		return islandDao.IslandOne(no);
	} 
	
	public Map<String, Object> IslandGetContent(int no){
				
		Map<String, Object> map = islandDao.IslandGetContent(no);
				
		return map;
	} 

	
	public int IslandUpdate(IslandVO vo) {
		return islandDao.IslandUpdate(vo);
	}
	
	public int IslandDelete(int no) {
		return islandDao.IslandDdelete(no);
	}
	
	
}
