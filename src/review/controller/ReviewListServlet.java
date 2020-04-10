package review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.PageInfo;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review.li")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ReviewService service = new ReviewService();
		
		int listCount = service.getListCount();
		
		int currentPage;
		int pageLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 10;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		maxPage = (int)((double)listCount / boardLimit + 0.9);
		startPage = (((int)((double)currentPage / pageLimit + 0.9)) -1) * pageLimit +1;
		endPage = pageLimit + startPage -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<Review> list = service.selectList(currentPage, boardLimit);
		
		String page = null;
		if(list != null) {
			page = "views/review/reviewMain.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/error.jsp";
			request.setAttribute("msg", "게시판 조회에 실패했습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		for(int i =0; i < list.size(); i++) {
	         System.out.println(list.get(i));
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