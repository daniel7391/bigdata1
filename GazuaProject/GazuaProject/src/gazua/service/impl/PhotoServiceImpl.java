package gazua.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import gazua.model.Photo;
import gazua.service.PhotoService;

public class PhotoServiceImpl implements PhotoService {
   
   /** 처리 결과를 기록할 Log4J 객체 생성 */
   // --> import org.apache.logging.log4j.Logger;
   Logger logger;

   /** MyBatis */
   // --> import org.apache.ibatis.session.SqlSession
   SqlSession sqlSession;

   /** 생성자를 통한 객체 생성 */
   public PhotoServiceImpl(SqlSession sqlSession, Logger logger) {
      this.sqlSession = sqlSession;
      this.logger = logger;
   }
   
   @Override
   public List<Photo> selectPhotoListByTourId(Photo photo) throws Exception {
      List<Photo> result = null;

      try {
         result = sqlSession.selectList("PhotoMapper.selectPhotoListByTourId", photo);
         if (result == null) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         throw new Exception("조회된 사진 목록이 없습니다.");
      } catch (Exception e) {
         logger.error(e.getLocalizedMessage());
         throw new Exception("사진 목록 조회에 실패했습니다.");
      }

      return result;
   }

   @Override
   public Photo selectOnePhotoByTourId(Photo photo) throws Exception {
      Photo result = null;

      try {
         result = sqlSession.selectOne("PhotoMapper.selectOnePhotoByTourId", photo);
         if (result == null) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         throw new Exception("조회된 게시물이 없습니다4.");
      } catch (Exception e) {
         logger.error(e.getLocalizedMessage());
         throw new Exception("게시물 조회에 실패했습니다.");
      }

      return result;
   }

   @Override
   public List<Photo> selectPhotoListByTourPlanId(Photo photo) throws Exception {
      List<Photo> result = null;

      try {
         result = sqlSession.selectList("PhotoMapper.selectTourPlanList", photo);
         if (result == null) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         throw new Exception("조회된 사진 목록이 없습니다.");
      } catch (Exception e) {
         logger.error(e.getLocalizedMessage());
         throw new Exception("사진 목록 조회에 실패했습니다.");
      }

      return result;
   }

   @Override
   public Photo selectOnePhotoByTourPlanId(Photo photo) throws Exception {
      Photo result = null;

      try {
         result = sqlSession.selectOne("PhotoMapper.selectOnePhotoByTourPlanId", photo);
         if (result == null) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         throw new Exception("조회된 게시물이 없습니다.99");
      } catch (Exception e) {
         logger.error(e.getLocalizedMessage());
         throw new Exception("게시물 조회에 실패했습니다.");
      }

      return result;
   }

   @Override
   public List<Integer> selectTourIdByPlanId(Photo photo) throws Exception {
      List<Integer> result = null;

      try {
         result = sqlSession.selectList("PhotoMapper.selectTourIdByPlanId", photo);
         if (result == null) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         throw new Exception("조회된 장소 목록2이 없습니다.");
      } catch (Exception e) {
         logger.error(e.getLocalizedMessage());
         throw new Exception("장소 목록 조회에 실패했습니다.");
      }

      return result;
   }

   @Override
   public int selectTourIdByPlanIdCount(Photo photo) throws Exception {
      int result = 0;
      
      try {
         result = sqlSession.selectOne("PhotoMapper.selectTourIdByPlanIdCount", photo);
         if (result == 0) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         throw new Exception("조회된 장소 목록3이 없습니다.");
      } catch (Exception e) {
         logger.error(e.getLocalizedMessage());
         throw new Exception("장소 목록 조회에 실패했습니다.");
      }
      
      return result;
   }

   @Override
   public List<Photo> selectPhotoListByTourPlanId2(Photo photo) throws Exception {
      List<Photo> result = null;

      try {
         result = sqlSession.selectList("PhotoMapper.selectPhotoListByTourPlanId2", photo);
         if (result == null) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         throw new Exception("조회된 사진 목록이 없습니다.");
      } catch (Exception e) {
         logger.error(e.getLocalizedMessage());
         throw new Exception("사진 목록 조회에 실패했습니다.");
      }

      return result;
   }

   @Override
   public void insertPhotoByPlan(Photo photo) throws Exception {
      try {
         int result = sqlSession.insert("PhotoMapper.insertPhotoByPlan", photo);
         if (result == 0) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         sqlSession.rollback();
         throw new Exception("저장된 에몽이 없습니다.");
      } catch (Exception e) {
         sqlSession.rollback();
         logger.error(e.getLocalizedMessage());
         throw new Exception("에몽 등록에 실패했습니다.");
      } finally {
         sqlSession.commit();
      }
      
   }

   @Override
   public void updateDirByTourId(Photo photo) throws Exception {
      try {
         int result = sqlSession.insert("PhotoMapper.updateDirByTourId", photo);
         if (result == 0) {
            throw new NullPointerException();
         }
      } catch (NullPointerException e) {
         sqlSession.rollback();
         throw new Exception("수정된 에몽이 없습니다.");
      } catch (Exception e) {
         sqlSession.rollback();
         logger.error(e.getLocalizedMessage());
         throw new Exception("에몽 수정에 실패했습니다.");
      } finally {
         sqlSession.commit();
      }
      
   }

   @Override
   public int selectCountTourInfoWithTourPlan(Photo photo) throws Exception {
      int result = 0;
      
      try {
         result = sqlSession.selectOne("PhotoMapper.selectCountTourInfoWithTourPlan", photo);
         
      } catch (NullPointerException e) {
         sqlSession.rollback();
         throw new Exception("에몽에몽이 없습니다.");
      } catch (Exception e) {
         sqlSession.rollback();
         logger.error(e.getLocalizedMessage());
         throw new Exception("에몽에몽에 실패했습니다.");
      } finally {
         sqlSession.commit();
      }
      
      return result;
   }

   @Override
   public void deletePhotoByTourPlanId(Photo photo) throws Exception {
      
      try{
         int result = sqlSession.delete("PhotoMapper.deletePhotoByTourPlanId", photo);
         if(result == 0){
            throw new NullPointerException();
         }
      }catch (NullPointerException e) {
         sqlSession.rollback();
         throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
      } catch (Exception e) {
         sqlSession.rollback();
         logger.error(e.getLocalizedMessage());
         throw new Exception("게시물 삭제에 실패했습니다.");
      }finally{
         sqlSession.commit();
      }
      
   }

}