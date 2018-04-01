package gazua.model;

public class Member {
   private int member_id;
   private String member_user_id;
   private String member_pw;
   private String member_name;
   private String member_name2;
   private String member_email;
   private String birthdate;
   private String member_gender;
   private String member_profile_img;
   private String reg_date;
   private String edit_date;
   private String new_member_pw;
   
   public int getMember_id() {
      return member_id;
   }
   public void setMember_id(int member_id) {
      this.member_id = member_id;
   }
   public String getMember_user_id() {
      return member_user_id;
   }
   public void setMember_user_id(String member_user_id) {
      this.member_user_id = member_user_id;
   }
   public String getMember_pw() {
      return member_pw;
   }
   public void setMember_pw(String member_pw) {
      this.member_pw = member_pw;
   }
   public String getMember_name() {
      return member_name;
   }
   public void setMember_name(String member_name) {
      this.member_name = member_name;
   }
   public String getMember_name2() {
      return member_name2;
   }
   public void setMember_name2(String member_name2) {
      this.member_name2 = member_name2;
   }
   public String getMember_email() {
      return member_email;
   }
   public void setMember_email(String member_email) {
      this.member_email = member_email;
   }
  
   public String getMember_gender() {
      return member_gender;
   }
   public void setMember_gender(String member_gender) {
      this.member_gender = member_gender;
   }
   public String getMember_profile_img() {
      return member_profile_img;
   }
   public void setMember_profile_img(String member_profile_img) {
      this.member_profile_img = member_profile_img;
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
   public String getBirthdate() {
	return birthdate;
}
   public void setBirthdate(String birthdate) {
	this.birthdate = birthdate;

}
   public String getnew_member_pw() {
	return new_member_pw;
}
   public void setnew_member_pw(String new_member_pw) {
	this.new_member_pw = new_member_pw;
}
@Override
public String toString() {
	return "Member [member_id=" + member_id + ", member_user_id=" + member_user_id + ", member_pw=" + member_pw
			+ ", member_name=" + member_name + ", member_name2=" + member_name2 + ", member_email=" + member_email
			+ ", birthdate=" + birthdate + ", member_gender=" + member_gender + ", member_profile_img="
			+ member_profile_img + ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", new_member_pw=" + new_member_pw
			+ "]";
}

   
   
   
}
