package gazua.model;

public class TourInfoJoin extends TourInfo {
	private int member_id;

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	

	@Override
	public String toString() {
		return "TourInfoJoin [member_id=" + member_id + "]";
	}
	
	
}
