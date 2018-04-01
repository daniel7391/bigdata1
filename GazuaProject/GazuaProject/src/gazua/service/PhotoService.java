package gazua.service;

import java.util.List;

import gazua.model.Photo;

/**
 * 게시물 관련 기능을 제공하기 위한 Service 계층
 */
public interface PhotoService {
	
	public List<Photo> selectPhotoListByTourId(Photo photo) throws Exception;
	
	public Photo selectOnePhotoByTourId(Photo photo) throws Exception;
	
}




