package gazua.model;

public class TourPlan {
	private int id;
	private String name;
	private String intro;
	private String intro_main;
	private String startDate;
	private int days;
	private int people;
	private int theme;
	private String reg_date;
	private String edit_date;
	private int member_member_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getIntro_main() {
		return intro_main;
	}
	public void setIntro_main(String intro_main) {
		this.intro_main = intro_main;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getTheme() {
		return theme;
	}
	public void setTheme(int theme) {
		this.theme = theme;
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
	public int getMember_member_id() {
		return member_member_id;
	}
	public void setMember_member_id(int member_member_id) {
		this.member_member_id = member_member_id;
	}
	@Override
	public String toString() {
		return "TourPlan [id=" + id + ", name=" + name + ", intro=" + intro + ", intro_main=" + intro_main
				+ ", startDate=" + startDate + ", days=" + days + ", people=" + people + ", theme=" + theme
				+ ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", member_member_id=" + member_member_id
				+ "]";
	}
	
	
}
