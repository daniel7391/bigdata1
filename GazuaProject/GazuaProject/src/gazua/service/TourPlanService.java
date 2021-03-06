package gazua.service;

import java.util.List;

import gazua.model.TourPlan;

/**
 * 게시물 관련 기능을 제공하기 위한 Service 계층
 */
public interface TourPlanService {
   
   public List<TourPlan> selectTourPlanListByTime(TourPlan tourplan) throws Exception;

   public List<TourPlan> selectTourPlanListByPopular(TourPlan tourplan) throws Exception;

   public List<TourPlan> selectTourPlanListByPopularForMain() throws Exception;
   
   /**
    * 현재글을 기준으로 이전글을 읽어들인다.
    * @param place - 현재글에 대한 게시물 번호가 저장된 Beans
    * @return Place - 읽어들인 게시물 내용 (없을 경우 null)
    * @throws Exception
    */
   public TourPlan selectPrevTourPlan(TourPlan tourplan) throws Exception;

   /**
    * 현재글을 기준으로 다음글을 읽어들인다.
    * @param place - 현재글에 대한 게시물 번호가 저장된 Beans
    * @return Place - 읽어들인 게시물 내용 (없을 경우 null)
    * @throws Exception
    */
   public TourPlan selectNextTourPlan(TourPlan tourplan) throws Exception;
   
   /**
    * 전체 게시물 수 조회
    * @param tourplan
    * @return int 
    * @throws Exception
    */
   public int selectTourPlanCount(TourPlan tourplan) throws Exception;
   
   /**
    * 하나의 게시물을 읽어들인다.
    * @param tourplan - 읽어들일 게시물 일련번호가 저장된 Beans
    * @return TourPlan - 읽어들인 게시물 내용
    * @throws Exception
    */
   public TourPlan selectTourPlan(TourPlan tourplan) throws Exception;
   /**
    * 여행 일정 만들기 데이터 저장
    * @param tourplan - 일련번호, 가입일시,변경일시를 제외한 모든 정보
    * @throws Exception
    */
   public void insertTourPlan(TourPlan tourplan) throws Exception;
   /**
    * 게시물을 삭제한다.
    * @param tourplan
    * @throws Exception
    */
   public void deleteTourPlan(TourPlan tourplan) throws Exception;
   
   public void updateLikes(TourPlan tourplan) throws Exception;
   public void dedateLikes(TourPlan tourplan) throws Exception;
   
   public List<TourPlan> selectTourPlanByMemberId(TourPlan tourplan) throws Exception;
   public void deleteTourPlanByMemberId(TourPlan tourplan) throws Exception;
}