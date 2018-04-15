package gazua.service;

import java.util.List;

import gazua.model.PhotoJoin;

public interface PhotoJoinService {

	public List<PhotoJoin> selectPhotoJoinList(PhotoJoin photoJoin) throws Exception;
}
