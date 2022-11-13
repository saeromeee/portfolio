package dao;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dto.Product;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import java.io.*;
import java.sql.*;

import common.JDBConnect;



public class ProductRepository  extends JDBConnect {
	private ArrayList<Product> listOfProducts= new ArrayList<Product>();
	private ArrayList<String> buyinglist= new ArrayList<String>();


	
	public ProductRepository() {		
		Product phone = new Product("P1", "iPhone 6s", 800000);
		phone.setCategory("Smart Phone");
		phone.setCondition("new");
		phone.setDescription("4.7-inch, 1334X750 Retinal HD display, 8-megapixel iSight Camera");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setFilename("./upload/와.jpg");
		
		Product nbook = new Product("P2", "LG PC 그램", 1500000);
		nbook.setCategory("NoteBook");
		nbook.setCondition("new");
		nbook.setDescription("13.3-inch,IPS LED display, 5rd Generation Intel Core Processors");
		nbook.setManufacturer("LG");
		nbook.setUnitsInStock(1000);
		nbook.setFilename("./upload/와.jpg");
		
		Product tablet = new Product("P3", "Galaxy Tab s", 900000);
		tablet.setCategory("Tablet");
		tablet.setCondition("new");
		tablet.setDescription("212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor");
		tablet.setManufacturer("SamSung");
		tablet.setUnitsInStock(1000);
		tablet.setFilename("./upload/와.jpg");
		
		listOfProducts.add(phone);
		listOfProducts.add(nbook);
		listOfProducts.add(tablet);
	} 

	public void setProduct(String productID, String pname, Integer unitPrice, 
			String description, String manufacturer, String category, long unitsInStock, 
			String condition, String filename) {
		Product pd= new Product(productID, pname, unitPrice,  description,  
				manufacturer,  category,  unitsInStock,  condition, filename);
		listOfProducts.add(pd);
	}
	
	
	
	
    //전체 상품 담은 리스트
    public List<Product> pro(){            
        String sql = "select * from product";
        List<Product> pro=new ArrayList<Product>();
        ResultSet rs = null;    	  
	    PreparedStatement pstmt=null;
        try {
			pstmt= con.prepareStatement(sql);    
    	    rs = pstmt.executeQuery();
    	    if(rs==null) {System.out.println("상품 못불러옴;");}
    	    
    	    while(rs.next()) {
    	    	Product product=new Product();
    	    	product.setProductID(rs.getString(1));
    	    	product.setProductName(rs.getString(2));
    	    	product.setUnitPrice(rs.getInt(3));
    	    	product.setCategory(rs.getString(4));
    	    	product.setCondition(rs.getString(5));
    	    	product.setDescription(rs.getString(6));
    	    	product.setManufacturer(rs.getString(7));
    	    	product.setUnitsInStock(rs.getInt(8));
    	    	product.setFilename(rs.getString(9));
    	    	
    	    	pro.add(product);
    	    }
        }
        catch (Exception e) {
            System.out.println("전체상품 리스트 구하는 중 예외 발생");
            e.printStackTrace();
        }      
        return pro; 
    }
    //상품 갯수
    public int len() {
    	int len=0;
    	try {
			Statement stmts =con.createStatement();			
		    ResultSet rss = stmts.executeQuery("SELECT COUNT(*) FROM product");
		    if(rss.next()) len = rss.getInt(1);
    	}
    	catch (Exception e) {
            System.out.println("상품 갯수 구하는 중 예외 발생");
            e.printStackTrace();
        }        
        return len; 
    }
	
    //장바구니 상품 갯수
    public int clen(String mid) {
    	int clen=0;
    	try {
			Statement stmts =con.createStatement();			
		    ResultSet rss = stmts.executeQuery("SELECT COUNT(*) FROM cart where mid='"+mid+"'");
		    if(rss.next()) clen = rss.getInt(1);
    	}
    	catch (Exception e) {
            System.out.println("상품 갯수 구하는 중 예외 발생");
            e.printStackTrace();
        }        
        return clen; 
    }
	
	///////// 기초데이터 세팅
    public void set() {	    
		PreparedStatement pstmt=null;		
		String sql=null;
		try{			
			 sql = "INSERT INTO product VALUES"+
			"('p1', 'iphone6s',800000, 'smartphone','new',"+
			"'4.7-inch, 1334X750 Retinal HD display, 8-megapixel iSight Camera',"+
			"'apple', 1000, './upload/와.jpg'),"+

			"('p2', 'LG PC 그램',1500000, 'NoteBook','new',"+
			"'13.3-inch,IPS LED display, 5rd Generation Intel Core Processors',"+
			"'LG', 1000, './upload/와.jpg'),"+

			"('p3', 'Galaxy Tab s', 900000, 'Tablet','new',"+
			"'212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor',"+
			"'SamSung', 1000,'./upload/와.jpg')";
			 
			pstmt= con.prepareStatement(sql);			
			pstmt.executeUpdate();
			System.out.println("기초 데이터 생성 성공");
		} catch(SQLException ex){
			System.out.println("기초 데이터 생성 실패");
			System.out.println("SQLException : " + ex.getMessage());
		} 
    }
    ////더미생성
    public void dummy(HttpServletRequest req) {	    
    	String i=req.getParameter("i");
    	PreparedStatement pstmt=null;		
		String sql=null;
		try{			
			sql = "insert into product values("+
					i+","+i+","+i+","+i+","+i+","+i+","+i+","+i+",'./upload/우.jpg')";
			 
			pstmt= con.prepareStatement(sql);			
			pstmt.executeUpdate();
			System.out.println("더미 생성 성공");
		} catch(SQLException ex){
			System.out.println("더미 생성 실패");
			System.out.println("SQLException : " + ex.getMessage());
		} 
    }
    
    
    ////게시글 전체 삭제
    public void reset() {	    
    	PreparedStatement pstmt=null;		
		String sql=null;
		try{			
			sql = "DELETE FROM product";			 
			pstmt= con.prepareStatement(sql);			
			pstmt.executeUpdate();
			System.out.println("게시글 전체삭제 성공");
		} catch(SQLException ex){
			System.out.println("게시글 전체삭제 실패");
			System.out.println("SQLException : " + ex.getMessage());
		} 
    }
    
    ////////게시물 등록
    
    public void pset(HttpServletRequest req) throws IOException {	    
    	
    	try{
    		String realFolder= req.getSession().getServletContext().getRealPath("/upload");//올리는 곳의 경로
        	MultipartRequest multi= new MultipartRequest(req, realFolder, 5*1024*1024, 
        			"utf-8", new DefaultFileRenamePolicy()); //product_set에서 넘겨받은 정보 담고있는 객체//괄호안은 

        	Enumeration files = multi.getFileNames();		
        	String file = (String) files.nextElement();
        	String filename = multi.getFilesystemName(file); //올린 이미지 파일이름
        	
        	PreparedStatement pstmt=null;   
        	String sql=null;
        	
    		if(multi.getParameter("productID")!=null){
			sql = "insert into product values('"+
					multi.getParameter("productID")+"','"+
					multi.getParameter("pname")+"',"+
					Integer.parseInt(multi.getParameter("unitPrice"))+",'"+
					multi.getParameter("category")+"','"+
					multi.getParameter("condition")+"','"+
					multi.getParameter("description")+"','"+
					multi.getParameter("manufacturer")+"',"+						
					Long.parseLong(multi.getParameter("unitsInStock"))+",'"+						
					"./upload/"+filename+"')";
    		}
    		pstmt= con.prepareStatement(sql);			
    		pstmt.executeUpdate();
    		System.out.println("상품 등록 성공");

    	} catch(SQLException ex){
    		System.out.println("실패<br>");
    		System.out.println("SQLException : " + ex.getMessage());
    	}     	
    		
    }
   
    
	////////////////////// bill.jsp 관련////////////////////////

	public void setbuy(String productID) {
	
		buyinglist.add(productID);
		
	}
	public ArrayList<String> getbuy() {
		
		return buyinglist;
		
	}
	///////////////////////////////////////////////////////////
	

	
	public Product getpdid(String pdID) {
		Product pd=null;
		for(int i=0; i<listOfProducts.size(); i++) {
				if (pdID.equals(listOfProducts.get(i).getProductID())) {
					 pd=listOfProducts.get(i);
				}
		}
		return pd; //상품객체 넘기는거
	}
	

	

	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public static String ran(int size) {
		if(size > 0) {
			char[] tmp = new char[size];
			for(int i=0; i<tmp.length; i++) {
				int div = (int) Math.floor( Math.random() * 2 );
				
				if(div == 0) { // 0이면 숫자로
					tmp[i] = (char) (Math.random() * 10 + '0') ;
				}else { //1이면 알파벳
					tmp[i] = (char) (Math.random() * 26 + 'A') ;
				}
			}
			return new String(tmp);
		}
		return "ERROR : Size is required."; 
	}
	

	public void setListOfProducts(ArrayList<Product> listOfProducts) {
		this.listOfProducts = listOfProducts;
	}
	
	
	
}
