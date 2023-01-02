package my.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.domain.CouponDTO;
import my.domain.MbLevelDTO;
import my.domain.MileageDTO;
import my.domain.MyDeliveryInfoDTO;
import my.domain.MyMainDTO;
import my.domain.MyNbPointDTO;
import my.domain.SaleCodeDTO;

public interface IMy {

	public MyMainDTO getMyMainMenuInfo(Connection conn, String id) throws SQLException;
	public List<MyDeliveryInfoDTO> getMemberDeliveryInfo(Connection conn, String id) throws SQLException;
	public void updateMaDefault(Connection conn, String userCode) throws SQLException;
	public int insertMemberDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto) throws SQLException;
	public boolean checkDuplicateDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto ) throws SQLException;
	public int updateMemberDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto) throws SQLException;
	public int deleteMemberDeliveryInfo(Connection conn, int maSeq) throws SQLException;
	public MbLevelDTO getMbLevel(Connection conn, String userCode) throws SQLException;
	public SaleCodeDTO getSaleCode(Connection conn, String userCode) throws SQLException;
	public int getMileage(Connection conn, String userCode) throws SQLException;
	public ArrayList<MileageDTO> selectMileageByDate(Connection conn, String userCode, String sDate, String eDate) throws SQLException;
	public ArrayList<CouponDTO> getCoupon(Connection conn, String userCode) throws SQLException;
	public ArrayList<CouponDTO> selectCouponByDate(Connection conn, String userCode, String sDate, String eDate) throws SQLException;
	public ArrayList<MyNbPointDTO> selectMyNbPointByDate(Connection conn, String userCode, String sDate, String eDate) throws SQLException;
	public MyNbPointDTO getLevel(Connection conn, String userCode) throws SQLException;
	public CouponDTO getUserCoupon(Connection conn, String userCode, String cpCode) throws SQLException;
}
