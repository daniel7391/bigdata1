package gazua.service;

import java.util.List;

import gazua.model.TourInfoJoin;

public interface TourInfoJoinService {
	public List<TourInfoJoin> selectTourInfoJoin(TourInfoJoin tourInfoJoin) throws Exception;
	
	public int selectTourInfoJoinCount(TourInfoJoin tourInfoJoin) throws Exception;
}
