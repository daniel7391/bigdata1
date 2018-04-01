package gazua.model;

public class Photo {
	private int photo_id;
	private int tour_id;
	private String dir;
	private String origin_name;
	private String name;
	private String size;
	private String content_type;
	private String reg_date;
	private String edit_date;
	private String contents;
	private int tourPlan_id;
	public int getPhoto_id() {
		return photo_id;
	}
	public void setPhoto_id(int photo_id) {
		this.photo_id = photo_id;
	}
	public int getTour_id() {
		return tour_id;
	}
	public void setTour_id(int tour_id) {
		this.tour_id = tour_id;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getTourPlan_id() {
		return tourPlan_id;
	}
	public void setTourPlan_id(int tourPlan_id) {
		this.tourPlan_id = tourPlan_id;
	}
	@Override
	public String toString() {
		return "Photo [photo_id=" + photo_id + ", tour_id=" + tour_id + ", dir=" + dir + ", origin_name=" + origin_name
				+ ", name=" + name + ", size=" + size + ", content_type=" + content_type + ", reg_date=" + reg_date
				+ ", edit_date=" + edit_date + ", contents=" + contents + ", tourPlan_id=" + tourPlan_id + "]";
	}
	
	 
}
