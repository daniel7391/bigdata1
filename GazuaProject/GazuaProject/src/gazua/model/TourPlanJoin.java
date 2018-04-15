package gazua.model;

public class TourPlanJoin extends TourPlan{
	private String dir;
	private String member_name2;
	
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getMember_name2() {
		return member_name2;
	}
	public void setMember_name2(String member_name2) {
		this.member_name2 = member_name2;
	}
	@Override
	public String toString() {
		return "TourPlanJoin [dir=" + dir + ", member_name2=" + member_name2 + "]";
	}
	
	
}
