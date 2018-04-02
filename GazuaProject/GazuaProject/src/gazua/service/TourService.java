package gazua.service;

import java.util.List;

import gazua.model.Tour;

public interface TourService {
	/**
	 * tour 목록 조회
	 * @param tour
	 * @return
	 * @throws Exception
	 */
	public List<Tour> selectTourList(Tour tour) throws Exception;
	
	/**
	 * 하나의 tour 정보 조회
	 * @param tour
	 * @return
	 * @throws Exception
	 */
	public Tour selectTour(Tour tour) throws Exception;
	
	/**
	 * 전체 게시물 수 조회
	 * @param place
	 * @return int 
	 * @throws Exception
	 */
	public int selectTourCount(Tour tour) throws Exception;
	
}
