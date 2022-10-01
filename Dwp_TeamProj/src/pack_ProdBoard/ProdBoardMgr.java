package pack_ProdBoard;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack_ProdBoard.ProdBoardBean;
import pack_ProdBoard.UtilMgr;
import pack_DBCP.DBConnectionMgr;

public class ProdBoardMgr {
	private DBConnectionMgr objPool;
	
	Connection 				objConn;
	PreparedStatement 	objPstmt;
	Statement				 	objStmt;
	ResultSet 					objRS;
	
	private static final String SAVEFOLER = "D:/Bigdata_Java_220511/ych/silsp/p07_JSP/Dwp_TeamProj/WebContent/fileUpload";

	private static String encType = "UTF-8";
	private static int maxSize = 5 * 1024 * 1024;
	
	public ProdBoardMgr() {
		try {
			objPool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}

	}
	
	
	/*  게시판 입력(/product/prodPostProc.jsp) 시작  */
	public void insertBoard(HttpServletRequest req) {

		String sql = null;
		MultipartRequest multi = null;
		int fileSize = 0;
		String fileName = null;

		try {
			objConn = objPool.getConnection();


			File file = new File(SAVEFOLER);

			if (!file.exists())
				file.mkdirs();

			multi = new MultipartRequest(req, SAVEFOLER, maxSize, encType, new DefaultFileRenamePolicy());

			if (multi.getFilesystemName("imgFile") != null) {
				fileName = multi.getFilesystemName("imgFile");
				fileSize = (int) multi.getFile("imgFile").length();
			}
			String[] sellLabel = multi.getParameterValues("sellLabel");
			String[] sellLabelName = {"BEST", "NEW", "SALE", "NONE"};
			char[] sellLabelCode = {'0', '0', '0', '0'};
			for (int i=0; i<sellLabel.length; i++) {
				for(int j=0; j<sellLabelName.length; j++) {
					if (sellLabel[i].equals(sellLabelName[j])) {
						sellLabelCode[j] = '1';
					}
				}
			}


			sql = "insert into goodsTbl (";
			sql += "pName, pType, stockVolumn, salesVolumn, oriPrice, sellPrice, sellLabel, content, ";
			sql += "regDate, readCnt, oriFileName, sysFileName, fileSize, regId)";
			sql += " values (?, ?, ?, 0, ?, ?, ?, ?, now(), 0, ?, ?, ?, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, multi.getParameter("pName"));
			objPstmt.setString(2, multi.getParameter("pType"));
			objPstmt.setString(3, multi.getParameter("stockVolumn"));
			objPstmt.setString(4, multi.getParameter("oriPrice"));
			objPstmt.setString(5, multi.getParameter("sellPrice"));
			objPstmt.setString(6, new String(sellLabelCode));
			objPstmt.setString(7, multi.getParameter("content"));
			objPstmt.setString(8, multi.getOriginalFileName("imgFile"));
			objPstmt.setString(9, fileName);
			objPstmt.setInt(10, fileSize);
			objPstmt.setString(11, multi.getParameter("regId"));
			objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

	}
	

	/*  게시판 입력(/product/prodPostProc.jsp) 끝  */
	
	
	/*  게시판 리스트 출력 (/product/prodList.jsp) 시작    */
	public Vector<ProdBoardBean> getBoardList(String keyField, String keyWord, int start, int end) {

		Vector<ProdBoardBean> vList = new Vector<>();
		String sql = null;

		try {
			objConn = objPool.getConnection();
			
			
			if (keyWord.equals("null") || keyWord.equals("")) {
				// 검색어가 없을 경우
				sql = "select * from goodsTbl "
						+ "order by num desc limit ?, ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setInt(1, start);
				objPstmt.setInt(2, end);
			} else {
				// 검색어가 있을 경우
				sql = "select * from goodsTbl "
						+ "where "+ keyField +" like ? "
						+ "order by num desc limit ?, ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, "%"+keyWord+"%");
				objPstmt.setInt(2, start);
				objPstmt.setInt(3, end);				
			}
			
			
			objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				ProdBoardBean bean = new ProdBoardBean();
				bean.setNum(objRS.getInt("num"));
				bean.setpName(objRS.getString("pName"));
				bean.setpType(objRS.getString("pType"));
				bean.setSysFileName(objRS.getString("sysFileName"));
				bean.setOriPrice(objRS.getInt("oriPrice"));
				bean.setSellPrice(objRS.getInt("sellPrice"));
				
				String[] sellLabelAry = new String[4];
				String sellLabel = objRS.getString("sellLabel");
				sellLabelAry=sellLabel.split("");
				bean.setSellLabel(sellLabelAry);
				vList.add(bean);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return vList;
	}



	/*  게시판 리스트 출력(/product/prodList.jsp) 끝  */

	
	/* 총 게시물 수(/product/prodList.jsp) 시작  */
	public int getTotalCount(String keyField, String keyWord)  {
		String sql = null;
		int totalCnt = 0;

		try {
			objConn = objPool.getConnection();
			
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(*) from goodsTbl";
				objPstmt = objConn.prepareStatement(sql);
			} else {
				sql = "select count(*) from goodsTbl ";
				sql += "where "+keyField+" like ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, "%" + keyWord + "%");
			}

			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				totalCnt = objRS.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("SQL오류 : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return totalCnt;
	}
	
	/* 총 게시물 수(/product/prodList.jsp) 끝  */
	
	
	/* 게시판 뷰페이지 조회수 증가 시작 (/product/prodRead.jsp, 내용보기 페이지) */
	public void upCount(int num) {
		String sql = null;

		try {
			System.out.println("두번실행되나");
			objConn = objPool.getConnection();
			sql = "update goodsTbl set readCnt = readCnt+1 where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}

	} 
	/* 게시판 뷰페이지 조회수 증가 끝 (/product/prodRead.jsp, 내용보기 페이지) */
	
	
	/*	상세보기 페이지 게시글 출력 시작 (/product/prodRead.jsp, 내용보기 페이지) */
	public ProdBoardBean getBoard(int num) {
		String sql = null;

		ProdBoardBean bean = new ProdBoardBean();
		try {
			objConn = objPool.getConnection(); 
			sql = "select * from goodsTbl where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				bean.setNum(objRS.getInt("num"));
				bean.setpName(objRS.getString("pName"));
				bean.setpType(objRS.getString("pType"));
				bean.setStockVolumn(objRS.getInt("stockVolumn"));
				bean.setOriPrice(objRS.getInt("oriPrice"));
				bean.setSellPrice(objRS.getInt("sellPrice"));
				String[] sellLabelAry = new String[4];
				String sellLabel = objRS.getString("sellLabel");
				sellLabelAry=sellLabel.split("");
				bean.setSellLabel(sellLabelAry);
				bean.setContent(objRS.getString("content"));
				bean.setRegDate(objRS.getString("regDate"));
				bean.setReadCnt(objRS.getInt("readCnt"));
				bean.setSalesVolumn(objRS.getInt("salesVolumn"));
				bean.setSysFileName(objRS.getString("sysFileName"));
				bean.setFileSize(objRS.getInt("fileSize"));
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return bean;
	} 
	/*	상세보기 게시글 출력 끝 (/product/prodRead.jsp, 내용보기 페이지) */
	
	
	/* 게시글 삭제(/product/prodMod.jsp) 시작 */
	public int deleteBoard(int num) {

		String sql = null;

		int exeCnt = 0; // 삭제 데이터 수, DB 삭제가 실행되었는지 여부 판단

		try {
			objConn = objPool.getConnection();

			////////////게시글의 파일 삭제 시작 ///////////////
			sql = "select sysFileName from goodsTbl where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objRS = objPstmt.executeQuery();

			if (objRS.next() && objRS.getString(1) != null) {
				if (!objRS.getString(1).equals("")) {
					String fName = objRS.getString(1);
					String fileSrc = SAVEFOLER + "/" + fName;
					File file = new File(fileSrc);

					if (file.exists())  file.delete(); // 파일 삭제 실행

				}
			}
			//////////// 게시글의 파일 삭제 끝 ///////////////

			//////////// 게시글 삭제 시작 ///////////////
			sql = "delete from goodsTbl where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			exeCnt = objPstmt.executeUpdate();
			////////////게시글 삭제 끝 ///////////////

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return exeCnt;
	}

	/* 게시글 삭제(/product/prodMod.jsp) 끝 */
	
	
	/* 게시글 수정페이지 (/product/prodModProc.jsp) 시작 */
	public int updateBoard(ProdBoardBean bean) {
		String sql = null;
		int exeCnt = 0;

		try {
			
			String[] sellLabel = bean.getSellLabel();
			String[] sellLabelName = {"BEST", "NEW", "SALE", "NONE"};
			char[] sellLabelCode = {'0', '0', '0', '0'};
			for (int i=0; i<sellLabel.length; i++) {
				for(int j=0; j<sellLabelName.length; j++) {
					if (sellLabel[i].equals(sellLabelName[j])) {
						sellLabelCode[j] = '1';
					}
				}
			}
			
			objConn = objPool.getConnection();
			sql = "update goodsTbl set pName=?, pType=?, stockVolumn=?, oriPrice=?, sellPrice=?, sellLabel=?, content=? where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bean.getpName());
			objPstmt.setString(2, bean.getpName());
			objPstmt.setInt(3, bean.getStockVolumn());
			objPstmt.setInt(4, bean.getOriPrice());
			objPstmt.setInt(5, bean.getSellPrice());
			objPstmt.setString(6, new String(sellLabelCode));
			objPstmt.setString(7, bean.getContent());
			objPstmt.setInt(8, bean.getNum());
			exeCnt = objPstmt.executeUpdate();
			// exeCnt : DB에서 실제 적용된 데이터(=row, 로우)의 개수 저장됨

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}

		return exeCnt;
	}

	/* 게시글 수정페이지 (/product/prodModProc.jsp) 끝 */

}
