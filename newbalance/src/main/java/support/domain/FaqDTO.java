package support.domain;

public class FaqDTO {
	
	
private int faqSeq; // 시퀀스
private String faqCategory; // 카테고리
private String faqQuestion; // 질문
private String faqAnswer; // 대답


public FaqDTO() {
	super();
}


public FaqDTO(int faqSeq, String faqCategory, String faqQuestion, String faqAnswer) {
	super();
	this.faqSeq = faqSeq;
	this.faqCategory = faqCategory;
	this.faqQuestion = faqQuestion;
	this.faqAnswer = faqAnswer;
}


public int getFaqSeq() {
	return faqSeq;
}


public String getFaqCategory() {
	return faqCategory;
}


public String getFaqQuestion() {
	return faqQuestion;
}


public String getFaqAnswer() {
	return faqAnswer;
}




}
