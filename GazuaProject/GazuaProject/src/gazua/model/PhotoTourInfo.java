package gazua.model;

public class PhotoTourInfo extends Photo {
	private String tourname;

	public String getTourname() {
		return tourname;
	}

	public void setTourname(String tourname) {
		this.tourname = tourname;
	}

	@Override
	public String toString() {
		return "PhotoTourInfo [tourname=" + tourname + "]";
	}

	
}
