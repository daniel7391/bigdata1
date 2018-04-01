package gazua.model;

public class TourInfo {
	private int id ;  
	private String name;
	private String postcode;
	private String addr1;
	private String addr2;
	private String cost;
	private String route1;
	private String route2;
	private String holiday1;
	private String holiday2;
	private String holiday3;
	private String intro;
	private int likes;
	private String tel;
	private String homepage;
	private double x;
	private double y;
	private int tour_tourCode;
	
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
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getRoute1() {
		return route1;
	}
	public void setRoute1(String route1) {
		this.route1 = route1;
	}
	public String getRoute2() {
		return route2;
	}
	public void setRoute2(String route2) {
		this.route2 = route2;
	}
	public String getHoliday1() {
		return holiday1;
	}
	public void setHoliday1(String holiday1) {
		this.holiday1 = holiday1;
	}
	public String getHoliday2() {
		return holiday2;
	}
	public void setHoliday2(String holiday2) {
		this.holiday2 = holiday2;
	}
	public String getHoliday3() {
		return holiday3;
	}
	public void setHoliday3(String holiday3) {
		this.holiday3 = holiday3;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public int getTour_tourCode() {
		return tour_tourCode;
	}
	public void setTour_tourCode(int tour_tourCode) {
		this.tour_tourCode = tour_tourCode;
	}
	@Override
	public String toString() {
		return "tourinfo [id=" + id + ", name=" + name + ", postcode=" + postcode + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", cost=" + cost + ", route1=" + route1 + ", route2=" + route2 + ", holiday1=" + holiday1
				+ ", holiday2=" + holiday2 + ", holiday3=" + holiday3 + ", intro=" + intro + ", likes=" + likes
				+ ", tel=" + tel + ", homepage=" + homepage + ", x=" + x + ", y=" + y + ", tour_tourCode="
				+ tour_tourCode + "]";
	}
	
	
	
	
		
}
