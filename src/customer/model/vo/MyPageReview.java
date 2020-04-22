package customer.model.vo;

public class MyPageReview {
	private String user_id;
	private String user_name;
	private String board_no;
	private String board_title;
	private String board_date;

	public MyPageReview() {
		// TODO Auto-generated constructor stub
	}

	public MyPageReview(String user_id, String user_name, String board_no, String board_title, String board_date) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	@Override
	public String toString() {
		return "MyPageReview [user_id=" + user_id + ", user_name=" + user_name + ", board_no=" + board_no
				+ ", board_title=" + board_title + ", board_date=" + board_date + "]";
	}

}
