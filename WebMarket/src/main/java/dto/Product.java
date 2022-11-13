package dto;

import java.io.Serializable; // 인터페이스 쓰려고

public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String productID; // 상품아뒤
	private String pname; // 상품명
	private Integer unitPrice; // 상품가
	private String description; // 상품설명
	private String manufacturer; //제조사
	private String category; //분류
	private long unitsInStock; //재고 수
	private String condition; //상태(신상, 중고, 재생품)
	private String filename; 
	private int count=1;
	
	public Product() {
		super();
	}
	
	public void counts(int count) {		
		count+=1;
		this.count=count;
		
	}
	
	public Product(String productID, String pname, Integer unitPrice) {
		this.productID = productID;
		this.pname=pname;
		this.unitPrice=unitPrice;
	}
	
	public Product(String productID, String pname, Integer unitPrice, 
			String description, String manufacturer, String category, 
			long unitsInStock, String condition, String filename) {
		this.productID = productID;
		this.pname=pname;
		this.unitPrice=unitPrice;
		this.description=description;
		this.manufacturer=manufacturer;
		this.category=category;
		this.unitsInStock=unitsInStock;
		this.condition=condition;
		this.filename=filename;
	}
	public Product(String productID, String pname, Integer unitPrice, 
			String description, String manufacturer, String category, 
			long unitsInStock, String condition, String filename, int count) {
		this.productID = productID;
		this.pname=pname;
		this.unitPrice=unitPrice;
		this.description=description;
		this.manufacturer=manufacturer;
		this.category=category;
		this.unitsInStock=unitsInStock;
		this.condition=condition;
		this.filename=filename;
		this.count=count;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getProductName() {
		return pname;
	}

	public void setProductName(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getFilename() {
		return filename;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	

}
