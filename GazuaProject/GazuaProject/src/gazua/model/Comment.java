package gazua.model;

public class Comment {
	public int comment_id;
	public String comment_user_name;
	public int like_count;
	public String reg_date;
	public String edit_date;
	public String content;
	public int tour_id;
	public int tourPlan_id;
	public int member_id;
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_user_name() {
		return comment_user_name;
	}
	public void setComment_user_name(String comment_user_name) {
		this.comment_user_name = comment_user_name;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTour_id() {
		return tour_id;
	}
	public void setTour_id(int tour_id) {
		this.tour_id = tour_id;
	}
	public int getTourPlan_id() {
		return tourPlan_id;
	}
	public void setTourPlan_id(int tourPlan_id) {
		this.tourPlan_id = tourPlan_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", comment_user_name=" + comment_user_name + ", like_count="
				+ like_count + ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", content=" + content
				+ ", tour_id=" + tour_id + ", tourPlan_id=" + tourPlan_id + ", member_id=" + member_id + "]";
	}
	
	
	
}
