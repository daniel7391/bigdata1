package gazua.model;

public class Likes {
	private int id;
	private int member_id;
	private int tour_id;
	private int plan_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getTour_id() {
		return tour_id;
	}
	public void setTour_id(int tour_id) {
		this.tour_id = tour_id;
	}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	@Override
	public String toString() {
		return "Likes [id=" + id + ", member_id=" + member_id + ", tour_id=" + tour_id + ", plan_id=" + plan_id + "]";
	}
	
	
}
