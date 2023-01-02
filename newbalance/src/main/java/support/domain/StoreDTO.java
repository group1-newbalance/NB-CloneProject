package support.domain;

public class StoreDTO {

	private int storeSeq; // 매장seq
	private int storecateSeq; // 매장분류seq
	private String storecateName; // 매장분류명
	private int storeareaSeq; // 매장지역seq
	private String storeareaName; // 매장지역명
	private String storeName; // 매장 이름
	private String storeAddr; // 매장 주소
	private String storeTel; // 매장 전화번호
	private Double storeLat; // 매장 위도 
	private Double storeLng; // 매장 경도
	
	private StoreDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public StoreDTO(int storeSeq, int storecateSeq, String storecateName, int storeareaSeq, String storeareaName,
			String storeName, String storeAddr, String storeTel, Double storeLat, Double storeLng) {
		super();
		this.storeSeq = storeSeq;
		this.storecateSeq = storecateSeq;
		this.storecateName = storecateName;
		this.storeareaSeq = storeareaSeq;
		this.storeareaName = storeareaName;
		this.storeName = storeName;
		this.storeAddr = storeAddr;
		this.storeTel = storeTel;
		this.storeLat = storeLat;
		this.storeLng = storeLng;
	}
	
	public int getStoreSeq() {
		return storeSeq;
	}
	public int getStorecateSeq() {
		return storecateSeq;
	}
	public String getStorecateName() {
		return storecateName;
	}
	public int getStoreareaSeq() {
		return storeareaSeq;
	}
	public String getStoreareaName() {
		return storeareaName;
	}
	public String getStoreName() {
		return storeName;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public String getStoreTel() {
		return storeTel;
	}
	public Double getStoreLat() {
		return storeLat;
	}
	public Double getStoreLng() {
		return storeLng;
	}
	
	
}
