package gazua.model;

public class TourInfo {
	private int id;
	private String name;
	private int postCode;
	private String addr1;
	private String addr2;
	private String cost;
	private String route1;
	private String route2;
	private String holiday1;
	private String intro;
	private int likes;
	private String tel;
	private String homePage;
	private double x;
	private double y;
	private int tourCode;
	
	// 페이지 구현을 위해서 추가된 값
	private int limitStart;
	private int listCount;
	
	// 갤러리 구현을 위해서 추가된 값
	private boolean gallery;
	private String imagePath;
	
	public int getId() {
		return id;
	}
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public boolean isGallery() {
		return gallery;
	}
	public void setGallery(boolean gallery) {
		this.gallery = gallery;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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
	public int getPostCode() {
		return postCode;
	}
	public void setPostCode(int postCode) {
		this.postCode = postCode;
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
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
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
	public int getTourCode() {
		return tourCode;
	}
	public void setTourCode(int tourCode) {
		this.tourCode = tourCode;
	}
	@Override
	public String toString() {
		return "Place [id=" + id + ", name=" + name + ", postCode=" + postCode + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", cost=" + cost + ", route1=" + route1 + ", route2=" + route2 + ", holiday1=" + holiday1
				+ ", intro=" + intro + ", likes=" + likes
				+ ", tel=" + tel + ", homePage=" + homePage + ", x=" + x + ", y=" + y + ", tourCode=" + tourCode
				+ ", limitStart=" + limitStart + ", listCount=" + listCount + ", gallery=" + gallery + ", imagePath="
				+ imagePath + "]";
	}
	
	
}
