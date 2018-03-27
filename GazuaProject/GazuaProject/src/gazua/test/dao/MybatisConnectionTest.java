package gazua.test.dao;

import org.apache.ibatis.session.SqlSession;

import gazua.dao.MyBatisConnectionFactory;

public class MybatisConnectionTest {
	public static void main(String[] args) {
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		
		sqlSession.close();
	}
}
