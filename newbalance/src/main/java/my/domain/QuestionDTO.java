package my.domain;

public class QuestionDTO {

	private int qnaCode;
	private String userCode;
	private String qnaWritedate;
	private String qnaStatus;
	private int qtSeq;
	private String qtContent;
	private String qnaReplydate;
	private String qnaTitle;
	private String qnaContent;
	private String pdCode;
	private String ordCode;
	private String qnaFile;
	private String qnaReply;
	
	// 메일, 이름, 연락처
	private String userEmail;
	private String userName;
	private String userPhone;
	
	private QuestionDTO() {
		
	}

	public QuestionDTO(int qnaCode, String userCode, String qnaWritedate, String qnaStatus, int qtSeq,
			String qtContent, String qnaReplydate, String qnaTitle, String qnaContent, String pdCode, String ordCode,
			String qnaFile, String qnaReply, String userEmail, String userName, String userPhone) {
		super();
		this.qnaCode = qnaCode;
		this.userCode = userCode;
		this.qnaWritedate = qnaWritedate;
		this.qnaStatus = qnaStatus;
		this.qtSeq = qtSeq;
		this.qtContent = qtContent;
		this.qnaReplydate = qnaReplydate;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.pdCode = pdCode;
		this.ordCode = ordCode;
		this.qnaFile = qnaFile;
		this.qnaReply = qnaReply;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userPhone = userPhone;
	}

	public int getQnaCode() {
		return qnaCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public String getQnaWritedate() {
		return qnaWritedate;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public int getQtSeq() {
		return qtSeq;
	}

	public String getQtContent() {
		return qtContent;
	}

	public String getQnaReplydate() {
		return qnaReplydate;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public String getPdCode() {
		return pdCode;
	}

	public String getOrdCode() {
		return ordCode;
	}

	public String getQnaFile() {
		return qnaFile;
	}

	public String getQnaReply() {
		return qnaReply;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	
	
}
