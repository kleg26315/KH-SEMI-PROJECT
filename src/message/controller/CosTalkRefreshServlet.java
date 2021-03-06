package message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import member.model.vo.Member;
import message.model.service.CosTalkService;



/**
 * Servlet implementation class CosTalkRefreshServlet
 * @param <CosTalk>
 */
@WebServlet("/CosTalkRefreshServlet")
public class CosTalkRefreshServlet<CosTalk> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CosTalkRefreshServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginUser");
		
		if(m == null) {
			
		}else {
			int sUserNo = m.getUser_no();
			String rMNum = request.getParameter("rMNum");
				ArrayList<message.model.vo.CosTalk> list =  new CosTalkService().refreshChat(sUserNo , Integer.parseInt(rMNum));
				
				/*
				// 내 입장에서 받은것들 가져오기
				ArrayList<message.model.vo.CosTalk> list2 =  new CosTalkService().refreshChat2(Integer.parseInt(rMNum), sUserNo);

				Map<String, ArrayList> map = new HashMap<String, ArrayList>();
				map.put("list1", list);
				map.put("list2", list2);
				*/
				
				response.setContentType("application/json; charset=UTF-8");
				new Gson().toJson(list, response.getWriter());
		}
		
		
		// 내 입장에서 보낸것들 가져오기
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
