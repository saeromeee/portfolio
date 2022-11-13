package servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductRepository;


@WebServlet("*.do")
public class controller extends HttpServlet {
	
	ProductRepository dao = new ProductRepository();	
	String page=null;
	
	public void  service(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
		String m=req.getParameter("m");
		if(m!=null) {
			if(m.equals("set")) {				
				set(req,res); //기초데이터 세팅
			} else if(m.equals("dummy")) {				
				dummy(req,res); //더미 세팅
			} else if(m.equals("pset")) {				
				pset(req,res); //상품 등록
			} else if(m.equals("reset")) {				
				reset(); //상품 전체 삭제
			} 
		} 

		res.sendRedirect("../"+page);

	}
	
	
	
	private void set(HttpServletRequest req, HttpServletResponse res){			

		dao.set();
		page="product.jsp";	

	}
	
	private void dummy(HttpServletRequest req, HttpServletResponse res){		

		dao.dummy(req);
		page="product.jsp";		

	}
	
	private void pset(HttpServletRequest req, HttpServletResponse res) throws IOException{		

		dao.pset(req);
		page="product.jsp";	

	}
	
	private void reset() {		

		dao.reset();
		page="product.jsp";	

	}
	

}
