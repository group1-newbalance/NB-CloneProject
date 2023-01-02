package manager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.connection.JdbcUtil;

import member.domain.MemberDTO;

public class ManagerDAO implements IManager {
	private static ManagerDAO managerDAO = null;

	public static ManagerDAO getInstance() {
		if (managerDAO == null) {
			managerDAO = new ManagerDAO();
		}
		return managerDAO;
	}

public MemberDTO selectMember(Connection conn, String id) throws SQLException {
	String sql = " SELECT user_code,user_id, user_pwd,user_gender,user_phone,"
			+ "user_name,user_birth,user_email,user_zipcode,user_mileage,user_address1,user_address2,lv "
			+ "FROM user_info WHERE user_id = ? order by user_code desc";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

System.out.println("1");	
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		System.out.println("2");
		MemberDTO member = null;
		if (rs.next()) {
			member = new MemberDTO(rs.getString("user_code"), rs.getString("user_id"), 
					rs.getString("user_pwd"),rs.getInt("user_gender"), rs.getString("user_phone"),
					rs.getString("user_name"), rs.getString("user_birth"), rs.getString("user_email"),
					rs.getInt("user_zipcode"), rs.getInt("user_mileage"), rs.getString("user_address1"),rs.getString("user_address2"),rs.getString("lv"));
		}
		System.out.println("3");
		return member;

	} finally {

		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
	}}



public int selectCount(Connection con) throws SQLException { 
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   System.out.println("4");
   String sql = " select count(*) from user_info";
   try {
      pstmt = con.prepareStatement(sql);         
      rs = pstmt.executeQuery();
      rs.next();
      System.out.println("5");
      return rs.getInt(1);
   } catch (Exception e) {
      System.out.println("> ManagerDAO.selectCount -" + e.toString());
   } finally {
      try {
         pstmt.close();
         rs.close();
      }catch(Exception e) {            
      }
   }      
   return 0;
}

// 현재 페이지의 방명록 목록

public List<MemberDTO> selectList(Connection con, int firstRow, int endRow) throws SQLException { 
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   System.out.println("6");
   String sql = "  SELECT user_code, user_id, user_pwd, user_gender, user_phone,"
   		+ "			user_name, user_birth, user_email, user_zipcode, user_mileage, user_address1, user_address2, lv"
   		+ "			FROM user_info ";
   		//+ " where TO_NUMBER(substr(user_code,2,1)) between ? and ? " ;
  

   try {
      pstmt = con.prepareStatement(sql);   
      // where b.no between ? and ?  
      //pstmt.setInt(1, firstRow);
      //pstmt.setInt(2, endRow);
      System.out.println("7");
      rs = pstmt.executeQuery();
      if ( rs.next() ) {
         List<MemberDTO> list = new ArrayList<MemberDTO>();
         do {
        	 MemberDTO member = new MemberDTO();
        	 member.setUserCode(rs.getString("user_code"));
        	 member.setUserId( rs.getString("user_id"));      
        	 member.setUserPwd(rs.getString("user_pwd"));
        	 member.setUserGender(rs.getInt("user_gender"));
        	 member.setUserPhone(rs.getString("user_phone"));
        	 member.setUserName(rs.getString("user_name"));
        	 member.setUserBirth(rs.getString("user_birth"));
        	 member.setUserEmail(rs.getString("user_email"));
        	 member.setUserZipcode(rs.getInt("user_zipcode"));
        	 member.setUserMileage(rs.getInt("user_mileage"));
        	 member.setUserAddress1(rs.getString("user_address1"));
        	 member.setUserAddress2(rs.getString("user_address2"));
        	 member.setLv(rs.getString("lv"));
        	
            list.add(member);
            System.out.println("lala"+member.toString());
            
         }while( rs.next() );
         return list;
      } // if
   } catch (Exception e) {
      System.out.println("> ManagerDAO.selectList -" + e.toString());
      // 예외 객체 발생....
   } finally {
      try {
         pstmt.close();
         rs.close();
      }catch(Exception e) {            
      }
   }   
   return null;
}

// 해당 방명록 번호의 글 정보를 반환하는 메서드

public MemberDTO select(Connection con, String user_code) throws SQLException { 
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   try {
      pstmt = con.prepareStatement(
    		  " SELECT user_code,user_id, user_pwd,user_gender,user_phone,"
    					+ "user_name,user_birth,user_email,user_zipcode,user_mileage,user_address1,user_address2,lv "
    					+ "FROM user_info WHERE user_code = ? ");
      pstmt.setString(1, user_code);
      rs = pstmt.executeQuery();
      if (rs.next()) {
         // makeMessageFromResultSet() 프로젝트 선언해서 사용.
         return makeManagerFromResultSet(rs);
      } else {
         return null;
      }
   } finally {
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
   }
}
// 
private MemberDTO makeManagerFromResultSet(ResultSet rs)
      throws SQLException {
	MemberDTO member = new MemberDTO();
	 member.setUserCode(rs.getString("user_code"));
	 member.setUserName( rs.getString("user_name"));      
	 member.setUserPwd(rs.getString("user_pwd"));
	 member.setUserGender(rs.getInt("user_gender"));
	 member.setUserPhone(rs.getString("user_phone"));
	 member.setUserName(rs.getString("user_name"));
	 member.setUserBirth(rs.getString("user_birth"));
	 member.setUserEmail(rs.getString("user_email"));
	 member.setUserZipcode(rs.getInt("user_zipcode"));
	 member.setUserMileage(rs.getInt("user_mileage"));
	 member.setUserAddress1(rs.getString("user_address1"));
	 member.setUserAddress2(rs.getString("user_address2"));
	 member.setLv(rs.getString("lv"));
   return member;
}











}
=======
	public MemberDTO selectMember(Connection conn, String id) throws SQLException {
		String sql = " SELECT user_code,user_id, user_pwd,user_gender,user_phone,"
				+ "user_name,user_birth,user_email,user_zipcode,user_mileage,user_address1,user_address2,lv "
				+ "FROM user_info WHERE user_id = ? order by user_code desc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.println("1");   

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			System.out.println("2");
			MemberDTO member = null;
			if (rs.next()) {
				member = new MemberDTO(rs.getString("user_code"), rs.getString("user_id"), 
						rs.getString("user_pwd"),rs.getInt("user_gender"), rs.getString("user_phone"),
						rs.getString("user_name"), rs.getString("user_birth"), rs.getString("user_email"),
						rs.getInt("user_zipcode"), rs.getInt("user_mileage"), rs.getString("user_address1"),rs.getString("user_address2"),rs.getString("lv"));
			}
			System.out.println("3");
			return member;

		} finally {

			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}}



	public int selectCount(Connection con) throws SQLException { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("4");
		String sql = " select count(*) from user_info";
		try {
			pstmt = con.prepareStatement(sql);         
			rs = pstmt.executeQuery();
			rs.next();
			System.out.println("5");
			return rs.getInt(1);
		} catch (Exception e) {
			System.out.println("> ManagerDAO.selectCount -" + e.toString());
		} finally {
			try {
				pstmt.close();
				rs.close();
			}catch(Exception e) {            
			}
		}      
		return 0;
	}

	// 현재 페이지의 방명록 목록

	public List<MemberDTO> selectList(Connection con, int firstRow, int endRow) throws SQLException { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("6");
		String sql = "  SELECT user_code, user_id, user_pwd, user_gender, user_phone,"
				+ "         user_name, user_birth, user_email, user_zipcode, user_mileage, user_address1, user_address2, lv"
				+ "         FROM user_info ";
		//+ " where TO_NUMBER(substr(user_code,2,1)) between ? and ? " ;


		try {
			pstmt = con.prepareStatement(sql);   
			// where b.no between ? and ?  
			//pstmt.setInt(1, firstRow);
			//pstmt.setInt(2, endRow);
			System.out.println("7");
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				List<MemberDTO> list = new ArrayList<MemberDTO>();
				do {
					MemberDTO member = new MemberDTO();
					member.setUserCode(rs.getString("user_code"));
					member.setUserId( rs.getString("user_id"));      
					member.setUserPwd(rs.getString("user_pwd"));
					member.setUserGender(rs.getInt("user_gender"));
					member.setUserPhone(rs.getString("user_phone"));
					member.setUserName(rs.getString("user_name"));
					member.setUserBirth(rs.getString("user_birth"));
					member.setUserEmail(rs.getString("user_email"));
					member.setUserZipcode(rs.getInt("user_zipcode"));
					member.setUserMileage(rs.getInt("user_mileage"));
					member.setUserAddress1(rs.getString("user_address1"));
					member.setUserAddress2(rs.getString("user_address2"));
					member.setLv(rs.getString("lv"));

					list.add(member);
					System.out.println("lala"+member.toString());

				}while( rs.next() );
				return list;
			} // if
		} catch (Exception e) {
			System.out.println("> ManagerDAO.selectList -" + e.toString());
			// 예외 객체 발생....
		} finally {
			try {
				pstmt.close();
				rs.close();
			}catch(Exception e) {            
			}
		}   
		return null;
	}

	// 해당 방명록 번호의 글 정보를 반환하는 메서드

	public MemberDTO select(Connection con, String user_code) throws SQLException { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(
					" SELECT user_code,user_id, user_pwd,user_gender,user_phone,"
							+ "user_name,user_birth,user_email,user_zipcode,user_mileage,user_address1,user_address2,lv "
							+ "FROM user_info WHERE user_code = ? ");
			pstmt.setString(1, user_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// makeMessageFromResultSet() 프로젝트 선언해서 사용.
				return makeManagerFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	// 
	private MemberDTO makeManagerFromResultSet(ResultSet rs)
			throws SQLException {
		MemberDTO member = new MemberDTO();
		member.setUserCode(rs.getString("user_code"));
		member.setUserName( rs.getString("user_name"));      
		member.setUserPwd(rs.getString("user_pwd"));
		member.setUserGender(rs.getInt("user_gender"));
		member.setUserPhone(rs.getString("user_phone"));
		member.setUserName(rs.getString("user_name"));
		member.setUserBirth(rs.getString("user_birth"));
		member.setUserEmail(rs.getString("user_email"));
		member.setUserZipcode(rs.getInt("user_zipcode"));
		member.setUserMileage(rs.getInt("user_mileage"));
		member.setUserAddress1(rs.getString("user_address1"));
		member.setUserAddress2(rs.getString("user_address2"));
		member.setLv(rs.getString("lv"));
		return member;
	}




}