package support.domain;

public class NoticeDTO {
	
	
	public NoticeDTO(int notiSeq, String notiTitle, String notiInsertdate, int notiViews, String notiContent,
			String notiImg) {
		super();
		this.notiSeq = notiSeq;
		this.notiTitle = notiTitle;
		this.notiInsertdate = notiInsertdate;
		this.notiViews = notiViews;
		this.notiContent = notiContent;
		this.notiImg = notiImg;
	}
	
	private int notiSeq;
	private String notiTitle;
	private String notiInsertdate;
	private int notiViews;
	private String notiContent;
	private String notiImg;
	public int getNotiSeq() {
		return notiSeq;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public String getNotiInsertdate() {
		return notiInsertdate;
	}
	public int getNotiViews() {
		return notiViews;
	}
	public String getNotiContent() {
		return notiContent;
	}
	public String getNotiImg() {
		return notiImg;
	}

	
}
