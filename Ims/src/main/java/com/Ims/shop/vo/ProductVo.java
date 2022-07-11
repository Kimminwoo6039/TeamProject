package  com.Ims.shop.vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVo {

	
   private int product_code;
   private String product_name;
   private int quantity;
   private int price;
   private String filename;
   private int fee;
   private int out_put;
   private MultipartFile file1;
    private String brand;
   private String gender;
   private int size;
   private String color;
   private String purpose;
   
   
public int getProduct_code() {
	return product_code;
}
public void setProduct_code(int product_code) {
	this.product_code = product_code;
}
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
public int getFee() {
	return fee;
}
public void setFee(int fee) {
	this.fee = fee;
}
public int getOut_put() {
	return out_put;
}
public void setOut_put(int out_put) {
	this.out_put = out_put;
}

public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public int getSize() {
	return size;
}
public void setSize(int size) {
	this.size = size;
}
public String getColor() {
	return color;
}
public void setColor(String color) {
	this.color = color;
}
public String getPurpose() {
	return purpose;
}
public void setPurpose(String purpose) {
	this.purpose = purpose;
}
public MultipartFile getFile1() {
	return file1;
}
public void setFile1(MultipartFile file1) {
	this.file1 = file1;
}
   
	
	


}
