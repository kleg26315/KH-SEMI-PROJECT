package customer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import customer.model.service.CustomerService;
import customer.model.vo.MyPageCustomer;
import customer.model.vo.MyPageReview;
import member.model.vo.Member;
import review.model.vo.PageInfo;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/mypage.me")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginUser");
		// 마이페이지 내정보관리 내용을 가져옴
		MyPageCustomer mpc = new CustomerService().selectCustomer(m.getUser_id());
		
		
		// 페이징 처리
		CustomerService service = new CustomerService(); // 두 개의 서비스를 호출하기 때문에 참조변수로 생성
		
		// 게시글의 총 개수
		int getReviewCount = service.getReviewCount(m.getUser_id());
		
		int currentPage;  		// 현재 페이지
		int pageLimit = 10;  	// 한 페이지에 표시될 페이징 수
		int maxPage;	  		// 전체 페이지 중에서 마지막 페이지
		int startPage;    		// 페이징된 페이지 중 시작페이지
		int endPage;	  		// 페이징된 페이지 중 마지막페이지
		int boardLimit = 10;   	// 한 페이지에 보여지는 게시글 수
		
		PageInfo reviewPi = null;
		ArrayList<MyPageReview> mpr = null;
//		ArrayList<MyPageWorry> mpw = null;
		
		if(request.getParameter("currentPage") != null) {			
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getReviewCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			reviewPi = new PageInfo(currentPage, getReviewCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			
			// 마이페이지 내 리뷰 내용을 가져옴
			mpr = service.selectCustomerReview(m.getUser_id(), currentPage, boardLimit); 
			
			response.setContentType("application/json; charset=UTF-8");
			new Gson().toJson(mpr, response.getWriter());
		} else {
			currentPage = 1;
			
			startPage = (((int)((double)currentPage / pageLimit + 0.9)) - 1) * pageLimit + 1;
			maxPage = (int)((double)getReviewCount / pageLimit + 0.9);
			endPage = pageLimit + startPage - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			// 리뷰 페이징
			reviewPi = new PageInfo(currentPage, getReviewCount, pageLimit, maxPage, startPage, endPage, boardLimit);
			mpr = service.selectCustomerReview(m.getUser_id(), currentPage, boardLimit); 
			String page = "";
			if(mpc != null) {
				page = "/views/customer/myPage.jsp";
				request.setAttribute("mpc", mpc);
				request.setAttribute("mpr", mpr);
				request.setAttribute("reviewPi", reviewPi);
			} else {
				request.setAttribute("msg", "회원조회 실패");
			}
			
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}