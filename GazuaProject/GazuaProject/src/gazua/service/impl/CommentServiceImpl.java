package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.Comment;
import gazua.service.CommentService;

public class CommentServiceImpl implements CommentService {
	
	Logger logger;
	
	SqlSession sqlSession;
	
	public CommentServiceImpl(SqlSession sqlSession, Logger logger){
		this.sqlSession=sqlSession;
		this.logger=logger;
	}
	@Override
	public void insertCommentTour(Comment comment) throws Exception {
		
		try{
			int result=sqlSession.insert("CommentMapper.insertCommentTour",comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 덧글이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}
	@Override
	public Comment selectCommentTour(Comment comment) throws Exception {
		Comment result=null;
		
		try {
			result = sqlSession.selectOne("CommentMapper.selectCommentTour", comment);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 덧글이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 조회에 실패했습니다.");
		}

		return result;

	}
	@Override
	public List<Comment> selectCommentListTour(Comment comment) throws Exception {
			List<Comment> result =null;
			
			try {
				result = sqlSession.selectList("CommentMapper.selectCommentListTour", comment);
				if (result == null) {
					throw new NullPointerException();
				}
			} catch (NullPointerException e) {
				throw new Exception("조회된 덧글이 없습니다.");
			} catch (Exception e) {
				logger.error(e.getLocalizedMessage());
				throw new Exception("덧글 목록 조회에 실패했습니다.");
			}

			return result;
	}
	@Override
	public int selectCommentCountByMemberId(Comment comment) throws Exception {
		int result=0;
		
		try{
			
			result=sqlSession.selectOne("CommentMapper.selectCommentCountByMemberId", comment);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 수 조회에 실패했습니다.");
		}
		return result;
	}
	@Override
	public void deleteComment(Comment comment) throws Exception {
		// TODO Auto-generated method st
		try {
			int result = sqlSession.delete("CommentMapper.deleteComment", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 덧글에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}
	@Override
	public void updateComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		try {
			int result = sqlSession.update("CommentMapper.updateComment", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 덧글에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("덧글 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}
		
	}


