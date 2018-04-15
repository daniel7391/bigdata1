package gazua.service;

import java.util.List;

import gazua.model.PhotoTourInfo;

public interface PhotoTourInfoService {
	public List<PhotoTourInfo> selectTourNameByPhoto(PhotoTourInfo phototourinfo) throws Exception;
}
