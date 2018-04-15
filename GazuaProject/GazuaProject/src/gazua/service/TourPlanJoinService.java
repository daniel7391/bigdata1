package gazua.service;

import java.util.List;

import gazua.model.TourPlanJoin;

public interface TourPlanJoinService {

	public List<TourPlanJoin> selectTourPlanJoin() throws Exception;

	public List<TourPlanJoin> selectTourPlanJoin2() throws Exception;
	
	public List<TourPlanJoin> selectTourPlanJoinList(TourPlanJoin tourPlanJoin) throws Exception;

	public List<TourPlanJoin> selectTourPlanJoinList2(TourPlanJoin tourPlanJoin) throws Exception;

	public List<TourPlanJoin> selectTourPlanJoinList3(TourPlanJoin tourPlanJoin) throws Exception;
	
	public int selectTourPlanJoinCount(TourPlanJoin tourPlanJoin) throws Exception;

	public int selectTourPlanJoinCount2(TourPlanJoin tourPlanJoin) throws Exception;
}
