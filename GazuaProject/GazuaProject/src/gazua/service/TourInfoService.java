package gazua.service;

import java.util.List;

import gazua.model.TourInfo;

/**
 * 게시물 관련 기능을 제공하기 위한 Service 계층
 */
public interface TourInfoService {
	
	public List<TourInfo> selectTourInfoList(TourInfo tourinfo) throws Exception;
	
	/**
	 * 현재글을 기준으로 이전글을 읽어들인다.
	 * @param place - 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return Place - 읽어들인 게시물 내용 (없을 경우 null)
	 * @throws Exception
	 */
	public TourInfo selectPrevTourInfo(TourInfo tourinfo) throws Exception;

	/**
	 * 현재글을 기준으로 다음글을 읽어들인다.
	 * @param place - 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return Place - 읽어들인 게시물 내용 (없을 경우 null)
	 * @throws Exception
	 */
	public TourInfo selectNextTourInfo(TourInfo tourinfo) throws Exception;
	
	/**
	 * 전체 게시물 수 조회
	 * @param place
	 * @return int 
	 * @throws Exception
	 */
	public int selectTourInfoCount(TourInfo tourinfo) throws Exception;
}




