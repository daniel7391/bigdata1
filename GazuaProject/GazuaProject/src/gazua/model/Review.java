package gazua.model;

public class Review {
	private int id;
	private int tour_id;
	private int like_level;
	private int people_level;
	private int season;
	private int member_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTour_id() {
		return tour_id;
	}
	public void setTour_id(int tour_id) {
		this.tour_id = tour_id;
	}
	public int getLike_level() {
		return like_level;
	}
	public void setLike_level(int like_level) {
		this.like_level = like_level;
	}
	public int getPeople_level() {
		return people_level;
	}
	public void setPeople_level(int people_level) {
		this.people_level = people_level;
	}
	public int getSeason() {
		return season;
	}
	public void setSeason(int season) {
		this.season = season;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "review [id=" + id + ", tour_id=" + tour_id + ", like_level=" + like_level + ", people_level="
				+ people_level + ", season=" + season + ", member_id=" + member_id + "]";
	}
	
}
