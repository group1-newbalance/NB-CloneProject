package my.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import my.dao.MyDAO;

import my.domain.QuestionDTO;
import my.domain.CouponDTO;
import my.domain.MbLevelDTO;
import my.domain.MileageDTO;
import my.domain.MyDeliveryInfoDTO;
import my.domain.MyMainDTO;
import my.domain.MyNbPointDTO;
import my.domain.MyWishDTO;
import my.domain.SaleCodeDTO;
import product.dao.ProductDAO;
import product.domain.WishlistDTO;

public class MyPageService {
private static MyPageService instance = null;
	
	private MyPageService() {}
	
	public static MyPageService getInstance() {
		if(instance == null) {
			instance = new MyPageService();
		}
		return instance;
	}
	
	public MyMainDTO getMyMainMenuInfo(String userCode) throws NamingException {
		MyMainDTO myData = null;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			myData = myDao.getMyMainMenuInfo(conn, userCode);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return myData;
		
	}
	
	public Map<String, Object> getMemberDeliveryInfo(String userCode) throws NamingException{
		Map<String, Object> myData = new HashMap<>();
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			List<MyDeliveryInfoDTO> deliveryInfoList = myDao.getMemberDeliveryInfo(conn, userCode);
			
			myData.put("delCount", deliveryInfoList == null ? 0 : deliveryInfoList.size());
			myData.put("myData", deliveryInfoList);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return myData;
	}
	
	public int insertMemberDeliveryInfo(MyDeliveryInfoDTO dto) throws NamingException{
		int rowCount = 0;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MyDAO myDao = MyDAO.getInstance();
			
			if(myDao.checkDuplicateDeliveryInfo(conn, dto)) {
				rowCount = -1;
			}else {
				conn.setAutoCommit(false);
				if(dto.getMaDefault() == 1) {
					myDao.updateMaDefault(conn, dto.getUserCode());
				}
				rowCount = myDao.insertMemberDeliveryInfo(conn, dto);
				conn.commit();
			}

		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return rowCount;
	}
	

	
	public int updateMemberDeliveryInfo(MyDeliveryInfoDTO dto) throws NamingException{
		int rowCount = 0;
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MyDAO myDao = MyDAO.getInstance();
			
			conn.setAutoCommit(false);
			if(dto.getMaDefault() == 1) {
				myDao.updateMaDefault(conn, dto.getUserCode());
			}
			rowCount = myDao.updateMemberDeliveryInfo(conn, dto);
			conn.commit();

		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return rowCount;
	}
	
	public int deleteMemberDeliveryInfo(int maSeq) throws NamingException{
		int rowCount = 0;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			rowCount = myDao.deleteMemberDeliveryInfo(conn, maSeq);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowCount;
	}

	
	public int addWishlist(WishlistDTO dto){
	      Connection conn = null;
	      int rowCount = 0;
	      try {
	         conn = ConnectionProvider.getConnection();
	         ProductDAO dao = ProductDAO.getInstance();

	         conn.setAutoCommit(false); 
	         rowCount = dao.addWishlist(conn, dto);

	         conn.commit();
	      } catch (NamingException | SQLException e) {
	         JdbcUtil.rollback(conn);
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(conn); 
	      }
	      return rowCount;
	   }

	public int getWishCount(String userCode) {
		Connection con =null;
		
		try {
			con  = ConnectionProvider.getConnection();
			MyDAO dao = MyDAO.getInstance();
			
			int totalCount = dao.getTotalWish(con);
			
			return totalCount;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	public List<QuestionDTO> getQuestion(String userCode) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			MyDAO dao = MyDAO.getInstance();
			List<QuestionDTO> list = null;
			list = dao.getMyQuestion(con, userCode);
			
			return list;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	public List<MyWishDTO> getMemberWishList(String userCode) throws NamingException {
		List<MyWishDTO> wishList = null;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			wishList = myDao.getMemberWishList(conn, userCode);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return wishList;
	}

	public int deleteWishList(String userCode, String[] wishList) throws NamingException {
		int rowCount = 0;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			rowCount = myDao.deleteWishList(conn, userCode, wishList);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowCount;
	}
	
	public MbLevelDTO getMbLevel(String userCode) throws NamingException {
		MbLevelDTO levelDto;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			levelDto = myDao.getMbLevel(conn, userCode);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return levelDto;
		
	} 
	
	public SaleCodeDTO getSaleCode(String userCode) throws NamingException {
		SaleCodeDTO salecodeDto;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			salecodeDto = myDao.getSaleCode(conn, userCode);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return salecodeDto;
		
	} 
	
	public int getMileage(String userCode) throws NamingException {
		int userMile;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			userMile = myDao.getMileage(conn, userCode);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return userMile;
		
	} 
	
	public ArrayList<MileageDTO> selectMileageByDate(String userCode, String sDate, String eDate) throws NamingException {
		ArrayList<MileageDTO> miList = null;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			miList = myDao.selectMileageByDate(conn, userCode,sDate, eDate );
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return miList;
		
	} 
	
	public ArrayList<CouponDTO> getCoupon(String userCode) throws NamingException {
		ArrayList<CouponDTO> cpList = null;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			cpList = myDao.getCoupon(conn, userCode);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return cpList;
		
	} 
	
	public ArrayList<CouponDTO> selectCouponByDate(String userCode, String sDate, String eDate) throws NamingException {
		ArrayList<CouponDTO> cpList = null;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			cpList = myDao.selectCouponByDate(conn, userCode, sDate, eDate);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return cpList;
		
	}
	
	public ArrayList<MyNbPointDTO> selectMyNbPointByDate(String userCode, String sDate, String eDate) throws NamingException {
		ArrayList<MyNbPointDTO> mpList = null;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			mpList = myDao.selectMyNbPointByDate(conn, userCode,sDate, eDate);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return mpList;
		
	}
	
	public MyNbPointDTO getLevel(String userCode) throws NamingException {
		MyNbPointDTO glDto;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			glDto = myDao.getLevel(conn, userCode);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return glDto;
		
	} 
	
	
	public CouponDTO getUserCoupon(String userCode, String cpCode) throws NamingException {
		CouponDTO cpDto;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			cpDto = myDao.getUserCoupon(conn, userCode, cpCode);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return cpDto;

	}

}
