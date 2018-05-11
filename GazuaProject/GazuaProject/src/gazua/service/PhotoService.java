package gazua.service;

import java.util.List;

import gazua.model.Photo;

/**
 * 게시물 관련 기능을 제공하기 위한 Service 계층
 */
public interface PhotoService {
   
   public List<Photo> selectPhotoListByTourId(Photo photo) throws Exception;
   
   public Photo selectOnePhotoByTourId(Photo photo) throws Exception;

   public List<Photo> selectPhotoListByTourPlanId(Photo photo) throws Exception;
   
   public Photo selectOnePhotoByTourPlanId(Photo photo) throws Exception;
   
   public List<Integer> selectTourIdByPlanId(Photo photo) throws Exception;
   
   public int selectTourIdByPlanIdCount(Photo photo) throws Exception;
   
   public List<Photo> selectPhotoListByTourPlanId2(Photo photo) throws Exception;
   
   public void insertPhotoByPlan(Photo photo) throws Exception;
   
   public void updateDirByTourId(Photo photo) throws Exception;
   
   public int selectCountTourInfoWithTourPlan(Photo photo) throws Exception;
   
   public void deletePhotoByTourPlanId(Photo photo) throws Exception;
}