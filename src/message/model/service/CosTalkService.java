package message.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import message.model.dao.CosTalkDAO;
import message.model.vo.CosTalk;
/**
 * Servlet implementation class CosTalkService
 */

public class CosTalkService {

	public ArrayList<CosTalk> searchMember(String rName) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		ArrayList<CosTalk> rMember = new CosTalkDAO().searchMember(conn, rName);
		close(conn);
		return rMember;
	}

	public int sendMessage(CosTalk cosTalk) {
		Connection conn = getConnection();
		
		int result = new CosTalkDAO().sendMessage(conn, cosTalk);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<CosTalk> sendAfterSelect(int sUserNo, int rMNum) {
		Connection conn = getConnection();
		ArrayList<CosTalk> list = new CosTalkDAO().sendAfterSelect(conn, sUserNo, rMNum );
		close(conn);
		
		return list;
	}

	public ArrayList<CosTalk> refreshChat(int sUserNo, int rMNum) {
		
		Connection conn = getConnection();
		ArrayList<CosTalk> list = new CosTalkDAO().refreshChat(conn, sUserNo, rMNum);
		
		close(conn);
		
		return list;
	}
	



	public ArrayList<CosTalk> refreshHistory(int sUserNo) {
		Connection conn = getConnection();
		ArrayList<CosTalk> list = new CosTalkDAO().refreshHistory(conn, sUserNo);
		
		close(conn);
		 
		return list;
	}

	public ArrayList<CosTalk> refreshChatBox(ArrayList<Integer> arr, int sUserNo) {
		Connection conn = getConnection();
		ArrayList<CosTalk> list = new ArrayList<>();
		for(int i=0; i<arr.size(); i++) {
			list = new CosTalkDAO().refreshChatBox(conn, list, arr.get(i), sUserNo);
		}
		//ArrayList<CosTalk> list = new CosTalkDAO().refreshChatBox(conn, arr, sUserNo);
		ArrayList<CosTalk> list2 = new CosTalkDAO().refreshChatBox2(conn, arr, list);
		close(conn);
		 
		return list2;
	}

	public void getUserNo(String rMNum) {
		// TODO Auto-generated method stub
		
	}

}
