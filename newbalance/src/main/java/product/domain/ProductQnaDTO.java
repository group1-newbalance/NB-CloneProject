package product.domain;

public class ProductQnaDTO {

	private int qnaCode;
	private String userCode;
	private String userId;
	private int qtSeq;
	private String pdCode;
	private String ordCode;
	private String qnaWritedate;
	private String qnaStatus;
	private String qnaReplydate;
	private String qnaTitle;
	private String qnaContent;
	private String qnaFile;
	private int qnaPrivate;
	private String qnaReply;


	public ProductQnaDTO(int qnaCode, String userCode, int qtSeq, String pdCode, String ordCode, String qnaWritedate,
			String qnaStatus, String qnaReplydate, String qnaTitle, String qnaContent, String qnaFile, int qnaPrivate, String qnaReply) {
		this.qnaCode = qnaCode;
		this.userCode = userCode;
		this.qtSeq = qtSeq;
		this.pdCode = pdCode;
		this.ordCode = ordCode;
		this.qnaWritedate = qnaWritedate;
		this.qnaStatus = qnaStatus;
		this.qnaReplydate = qnaReplydate;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaFile = qnaFile;
		this.qnaPrivate = qnaPrivate;
		this.qnaReply = qnaReply;
	}
	

	public ProductQnaDTO(String userId, String userCode, String qnaWritedate, String qnaStatus, String qnaTitle, String qnaContent,
			String qnaFile, int qnaPrivate, String qnaReply) {
		super();
		this.userId = userId;
		this.userCode = userCode;
		this.qnaWritedate = qnaWritedate;
		this.qnaStatus = qnaStatus;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaFile = qnaFile;
		this.qnaPrivate = qnaPrivate;
		this.qnaReply = qnaReply;
	}


	public String getQnaReply() {
		return qnaReply;
	}
	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public int getQtSeq() {
		return qtSeq;
	}
	public void setQtSeq(int qtSeq) {
		this.qtSeq = qtSeq;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public String getOrdCode() {
		return ordCode;
	}
	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}
	public String getQnaWritedate() {
		return qnaWritedate;
	}
	public void setQnaWritedate(String qnaWritedate) {
		this.qnaWritedate = qnaWritedate;
	}
	public String getQnaStatus() {
		return qnaStatus;
	}
	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}
	public String getQnaReplydate() {
		return qnaReplydate;
	}
	public void setQnaReplydate(String qnaReplydate) {
		this.qnaReplydate = qnaReplydate;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaFile() {
		return qnaFile;
	}
	public void setQnaFile(String qnaFile) {
		this.qnaFile = qnaFile;
	}
	public int getQnaPrivate() {
		return qnaPrivate;
	}
	public void setQnaPrivate(int qnaPrivate) {
		this.qnaPrivate = qnaPrivate;
	}
	
	
	
}
