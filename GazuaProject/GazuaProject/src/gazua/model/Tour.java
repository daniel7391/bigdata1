package gazua.model;

public class Tour {
	private int tourCode;
	private String tourLocation_gu;
	public int getTourCode() {
		return tourCode;
	}
	public void setTourCode(int tourCode) {
		this.tourCode = tourCode;
	}
	public String getTourLocation_gu() {
		return tourLocation_gu;
	}
	public void setTourLocation_gu(String tourLocation_gu) {
		this.tourLocation_gu = tourLocation_gu;
	}
	@Override
	public String toString() {
		return "tour [tourCode=" + tourCode + ", tourLocation_gu=" + tourLocation_gu + "]";
	}
	
}
