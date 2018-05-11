package gazua.service;

import gazua.model.Likes;

public interface LikesService {
   public void insertLikesByPlace(Likes likes) throws Exception;
   public void deleteLikesByPlace(Likes likes) throws Exception;
   public void insertLikesByPlan(Likes likes) throws Exception;
   public void deleteLikesByPlan(Likes likes) throws Exception;
   
   public int selectLikesCountByMemberId(Likes likes) throws Exception;
   public int selectLikesCountByMemberIdAndPlan(Likes likes) throws Exception;
   public void deleteLikesByOut(Likes likes) throws Exception;

}