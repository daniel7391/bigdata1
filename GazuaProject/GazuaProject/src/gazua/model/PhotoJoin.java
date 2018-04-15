package gazua.model;

public class PhotoJoin extends Photo {
	private String planname;
	private String intro;
	public String getPlanname() {
		return planname;
	}
	public void setPlanname(String planname) {
		this.planname = planname;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	@Override
	public String toString() {
		return "PhotoJoin [planname=" + planname + ", intro=" + intro + "]";
	}
	
	
}
