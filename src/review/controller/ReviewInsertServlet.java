package review.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/insert.re")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
//		int heart = request.getParameter("heart");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUser_no();
	
		Review r = new Review();
		r.setTitle(title);
		r.setContent(content);
		r.setUser_no(user_no);
		
		int result = new ReviewService().insertReview(r);
		
		if(result > 0) {
			response.sendRedirect("list.re?currentPage=1");
		} else {			
			request.setAttribute("msg", "리뷰 등록에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
