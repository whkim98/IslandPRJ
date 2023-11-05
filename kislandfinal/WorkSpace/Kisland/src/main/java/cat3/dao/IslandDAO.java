package cat3.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import all.vo.IslandVO;

public class IslandDAO {
	
	private SqlSession sqlSession;
	
	public void setSqlSession (SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	public List<IslandVO> IslandList(Map<String, Object> map){
		return sqlSession.selectList("island.islandList", map);
	}
	
	public IslandVO IslandOne(int no) {
		return sqlSession.selectOne("island.islandOne", no);
	}
		
	public int IslandInsert(IslandVO vo) {
		return sqlSession.insert("island.islandInsert", vo);
	}
	
	public Map<String, Object> IslandGetContent(int no) {
		return sqlSession.selectOne("island.isnaldGetContent", no);
	}
	
	public int IslandUpdate(IslandVO vo) {
		return sqlSession.update("island.islandUpdate", vo);
	}

	public int IslandDdelete(int no) {
		return sqlSession.delete("island.islandDelete", no);
	}


}
