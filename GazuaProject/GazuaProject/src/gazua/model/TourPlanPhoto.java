package gazua.model;

public class TourPlanPhoto extends TourPlan{
	private String dir;

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	@Override
	public String toString() {
		return "TourPlanPhoto [dir=" + dir + "]";
	}
	
	
}
