package gazua.service;

import java.util.List;

import gazua.model.Review;

public interface ReviewService {
	
	public List<Review> selectReviewListByTourId(Review review) throws Exception;
	
	public int selectLikeLevel4Count(Review review) throws Exception;
	public int selectLikeLevel3Count(Review review) throws Exception;
	public int selectLikeLevel2Count(Review review) throws Exception;
	public int selectLikeLevel1Count(Review review) throws Exception;
	public int selectPeopleLevel4Count(Review review) throws Exception;
	public int selectPeopleLevel3Count(Review review) throws Exception;
	public int selectPeopleLevel2Count(Review review) throws Exception;
	public int selectPeopleLevel1Count(Review review) throws Exception;
	public int selectSeasonLevel4Count(Review review) throws Exception;
	public int selectSeasonLevel3Count(Review review) throws Exception;
	public int selectSeasonLevel2Count(Review review) throws Exception;
	public int selectSeasonLevel1Count(Review review) throws Exception;
}
