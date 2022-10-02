package pack_BBS;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import pack_DBCP.DBConnectionMgr;

public class BoardMgr {

	private DBConnectionMgr objPool;
	
	Connection 				objConn 		= 		null;
	PreparedStatement 	objPstmt 		= 		null;
	Statement				 	objStmt 		= 		null;
	ResultSet 					objRS 			= 		null;
	
	private static final String SAVEFOLER = "D:/Bigdata_Java_220511/DJ/silsp/p07_JSP/Dwp_TeamProj/WebContent/fileUpload";
	// 작업자의 워크스페이스가 다르다면 파일이 업로드되는 경로도 그에 맞게 설정해야 함.
	private static String encType = "UTF-8";
	private static int maxSize = 5 * 1024 * 1024;

	public BoardMgr() {
		try {
			objPool = DBConnectionMgr.getInstance();
			System.out.println("접속 ok!");
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		}

	}
	

/*  게시판 입력(/bbs/postProc.jsp) 시작  */
	public int insertBoard(HttpServletRequest req) {

		String sql = null;
		MultipartRequest multi = null;
		int fileSize = 0;
		String oriFileName = null;
		String systemFileName = null;
		String ip="";
		
		int rtnCnt = 0;

		try {
			
			
			objConn = objPool.getConnection();
			sql = "select max(num) from adminWriteTbl";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			int ref = 1; // 답변글 작성용, 원본글의 글번호(num)와 일치
			if (objRS.next())
				ref = objRS.getInt(1) + 1;
			// 현재 DB adminWriteTbl에 데이터가 3개(num 컬럼에 1, 2, 3)가
			// 있다고 가정하면 max(num)는 3을 반환함. 
			// 그러므로 새 글번호를 참조하는 DB의 컬럼 ref는 4가 됨.

			File file = new File(SAVEFOLER);

			if (!file.exists())
				file.mkdirs();

			
			 multi = new MultipartRequest(
					 req,
					 SAVEFOLER,
					 maxSize,
					 encType,
					 new DefaultFileRenamePolicy()
					 );
			 
			 if (multi.getFilesystemName("upFileName") != null) {
				 	oriFileName = multi.getOriginalFileName("upFileName");
				 	systemFileName  = multi.getFilesystemName("upFileName");
					fileSize = (int) multi.getFile("upFileName").length();
				}
				 
			 BoardBean bean = new BoardBean();
			
			sql = "insert into adminWriteTbl (aName, asubject, acontent, pos, ref, depth,regTM, ip, readCnt, oriFileName, systemFileName, fileSize ) ";
			sql += " values ( ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?, ?)";
			  
			  objPstmt = objConn.prepareStatement(sql); 
			  objPstmt.setString(1, multi.getParameter("aName")); 
			  objPstmt.setString(2, multi.getParameter("asubject")); 
			  objPstmt.setString(3, multi.getParameter("acontent"));
			  objPstmt.setInt(4, bean.getPos());
			  objPstmt.setInt(5, bean.getRef());
			  objPstmt.setInt(6, bean.getDepth());
			  objPstmt.setString(7, ip);
			  objPstmt.setInt(8, bean.getReadCnt());
			  objPstmt.setString(9,oriFileName); 
			  objPstmt.setString(10, systemFileName); 
			  objPstmt.setLong(11, fileSize); 
			  
			  rtnCnt = objPstmt.executeUpdate();
	  
	  
		/* System.out.println(rtnCnt); */
	 
		}catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}
		return rtnCnt;	
		
	}
	/*  게시판 입력(/bbs/postProc.jsp) 끝  */
	
	
	/*  1:1 문의 입력(/입력(/bbs_Inquire/write.jsp) 시작  */
	public int inquireBoard(HttpServletRequest req) {

		String sql = null;
		MultipartRequest multi = null;
		int fileSize = 0;
		String oriFileName = null;
		String systemFileName = null;
		String ip="";
		
		int rtnCnt = 0;

		try {
			
			
			objConn = objPool.getConnection();
			sql = "select max(num) from inquireTbl";
			objPstmt = objConn.prepareStatement(sql);
			objRS = objPstmt.executeQuery();

			int ref = 1; // 답변글 작성용, 원본글의 글번호(num)와 일치
			if (objRS.next())
				ref = objRS.getInt(1) + 1;
			// 현재 DB adminWriteTbl에 데이터가 3개(num 컬럼에 1, 2, 3)가
			// 있다고 가정하면 max(num)는 3을 반환함. 
			// 그러므로 새 글번호를 참조하는 DB의 컬럼 ref는 4가 됨.

			File file = new File(SAVEFOLER);

			if (!file.exists())
				file.mkdirs();

			
			 multi = new MultipartRequest(
					 req,
					 SAVEFOLER,
					 maxSize,
					 encType,
					 new DefaultFileRenamePolicy()
					 );
			 
			 if (multi.getFilesystemName("upFileName") != null) {
				 	oriFileName = multi.getOriginalFileName("upFileName");
				 	systemFileName  = multi.getFilesystemName("upFileName");
					fileSize = (int) multi.getFile("upFileName").length();
				}
				 
			 BoardBean bean = new BoardBean();
			
			sql = "insert into inquireTbl (uid ,uName, subject, content, bbsPw, qnaType	, pos, ref, depth,regTM, ip, readCnt, oriFileName, systemFileName, fileSize ) ";
			sql += " values ( ?,?,?,?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?, ?)";
			  
			  objPstmt = objConn.prepareStatement(sql); 
			  objPstmt.setString(1, multi.getParameter("uid")); 
			  objPstmt.setString(2, multi.getParameter("uName")); 
			  objPstmt.setString(3, multi.getParameter("subject")); 
			  objPstmt.setString(4, multi.getParameter("content"));
			  objPstmt.setString(5, multi.getParameter("bbsPw"));
			  objPstmt.setString(6, multi.getParameter("qnaType"));
			  objPstmt.setInt(7, bean.getPos());
			  objPstmt.setInt(8, bean.getRef());
			  objPstmt.setInt(9, bean.getDepth());
			  objPstmt.setString(10, ip);
			  objPstmt.setInt(11, bean.getReadCnt());
			  objPstmt.setString(12,oriFileName); 
			  objPstmt.setString(13, systemFileName); 
			  objPstmt.setLong(14, fileSize); 
			  
			  rtnCnt = objPstmt.executeUpdate();
	  
	  
		/* System.out.println(rtnCnt); */
	 
		}catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}
		return rtnCnt;	
		
	}
	/*  1:1문의 입력(/bbs_Inquire/write.jsp) 끝  */
	
	
	
	


	/*  공지사항 게시판 리스트 출력 (/bbs_Notice/noticebbs.jsp) 시작    */
	public Vector<BoardBean> getBoardList( int start, int end) {

		Vector<BoardBean> vList = new Vector<>();
		String sql = null;

		try {
			objConn = objPool.getConnection(); //DbCp로 연동
			
			
		
				// 검색어가 없을 경우
				sql = "select * from adminWriteTbl "
						+ "order by ref desc, pos asc limit ?, ?"; //start 와 end
				//DB에서는 ref  가 같으면 먼저 입력된글이 위로 올라온다. 
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setInt(1, start);
				objPstmt.setInt(2, end);
			
						
			
			
			
			objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(objRS.getInt("num"));
				bean.setaName(objRS.getString("aName"));
				bean.setAsubject(objRS.getString("asubject"));
				bean.setAcontent(objRS.getString("acontent"));
				bean.setPos(objRS.getInt("pos"));
				bean.setRef(objRS.getInt("ref"));
				bean.setDepth(objRS.getInt("depth"));
				bean.setRegTM(objRS.getString("regTM"));
				bean.setReadCnt(objRS.getInt("readCnt"));
				vList.add(bean);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return vList;
	}


	/*  공지사항 게시판 리스트 출력 (/bbs_Notice/noticebbs.jsp) 끝  */

	
	/*  공지사항 게시판 리스트 출력 (/bbs_Notice/noticebbs.jsp) 시작    */
	public Vector<BoardBean> getInquireList( int start, int end) {

		Vector<BoardBean> vList = new Vector<>();
		String sql = null;

		try {
			objConn = objPool.getConnection(); //DbCp로 연동
			
			
		
				// 검색어가 없을 경우
				sql = "select * from inquireTbl "
						+ "order by ref desc, pos asc limit ?, ?"; //start 와 end
				//DB에서는 ref  가 같으면 먼저 입력된글이 위로 올라온다. 
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setInt(1, start);
				objPstmt.setInt(2, end);
			
						
			
			
			
			objRS = objPstmt.executeQuery();

			while (objRS.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(objRS.getInt("num"));
				bean.setuId(objRS.getString("uid"));
				bean.setuName(objRS.getString("uName"));
				bean.setSubject(objRS.getString("subject"));
				bean.setContent(objRS.getString("content"));
				bean.setPos(objRS.getInt("pos"));
				bean.setRef(objRS.getInt("ref"));
				bean.setDepth(objRS.getInt("depth"));
				bean.setRegTM(objRS.getString("regTM"));
				bean.setReadCnt(objRS.getInt("readCnt"));
				bean.setSystemFileName(objRS.getString("systemFileName"));
				bean.setFileSize(objRS.getInt("fileSize"));
				vList.add(bean);
			}
		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return vList;
	}


	/*  공지사항 게시판 리스트 출력 (/bbs_Notice/noticebbs.jsp) 끝  */

	
	
	

	/* 총 게시물 수(/bbs/list.jsp) 시작  */
	public int getTotalCount(String keyField, String keyWord) {

		String sql = null;
		int totalCnt = 0;

		try {
			objConn = objPool.getConnection();
			
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(*) from adminWriteTbl";
				objPstmt = objConn.prepareStatement(sql);
			} else {
				sql = "select count(*) from adminWriteTbl ";
				sql += "where "+keyField+" like ?";
				objPstmt = objConn.prepareStatement(sql);
				objPstmt.setString(1, "%" + keyWord + "%");
			}

			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				totalCnt = objRS.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("SQL이슈 : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return totalCnt;
	}
	/* 총 게시물 수(/bbs/list.jsp) 끝  */
	

	
	
	
	/* 게시판 뷰페이지 조회수 증가 시작 (/bbs/read.jsp, 내용보기 페이지) */
	public void upCount(int num) {
		String sql = null;

		try {
			objConn = objPool.getConnection();
			sql = "update adminWriteTbl set readCnt = readCnt+1 where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objPstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}

	} 
	/* 게시판 뷰페이지 조회수 증가 끝 (/bbs/read.jsp, 내용보기 페이지) */
	
	

	/*	상세보기 페이지 게시글 출력 시작 (/bbs/read.jsp, 내용보기 페이지) */
	public BoardBean getBoard(int num) {
		String sql = null;

		BoardBean bean = new BoardBean();
		try {
			objConn = objPool.getConnection(); 
			sql = "select * from adminWriteTbl where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			objRS = objPstmt.executeQuery();

			if (objRS.next()) {
				bean.setNum(objRS.getInt("num"));
				bean.setaName(objRS.getString("aName"));
				bean.setAsubject(objRS.getString("asubject"));
				bean.setAcontent(objRS.getString("acontent"));
				bean.setPos(objRS.getInt("pos"));
				bean.setRef(objRS.getInt("ref"));
				bean.setDepth(objRS.getInt("depth"));
				bean.setRegTM(objRS.getString("regTM"));
				bean.setIp(objRS.getString("ip"));
				bean.setReadCnt(objRS.getInt("readCnt"));
				bean.setOriFileName(objRS.getString("oriFileName"));
				bean.setSystemFileName(objRS.getString("systemFileName"));
				bean.setFileSize(objRS.getInt("fileSize"));
				
			}

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return bean;
	} 
	/*	상세보기 게시글 출력 끝 (/bbs/read.jsp, 내용보기 페이지) */

	
	/* 상세보기 페이지 파일다운로드 시작 (/bbs/read.jsp) */
	public static int len;
	public void downLoad(HttpServletRequest req, HttpServletResponse res, JspWriter out, PageContext pageContext) {
		String fileName = req.getParameter("fileName"); // 다운로드할 파일 매개변수명 일치
		try {
			File file = new File(UtilMgr.con(SAVEFOLER + File.separator + fileName));

			byte[] b = new byte[(int) file.length()];
			res.setHeader("Accept-Ranges", "bytes");
			String strClient = req.getHeader("User-Agent");
			res.setContentType("application/smnet;charset=utf-8");
			res.setHeader("Content-Disposition", "attachment;fileName=" + fileName + ";");

			out.clear();
			out = pageContext.pushBody();

			if (file.isFile()) {
				BufferedInputStream fIn = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream fOuts = new BufferedOutputStream(res.getOutputStream());
				int read = 0;
				while ((read = fIn.read(b)) != -1) {
					fOuts.write(b, 0, read);
				}
				fOuts.close();
				fIn.close();

			}

		} catch (Exception e) {
			System.out.println("파일 처리 이슈 : " + e.getMessage());
		}

	}

	/* 상세보기 페이지 파일다운로드 끝 (/bbs/read.jsp) */
	
	

	/* 게시글 삭제(/bbs/delete.jsp) 시작 */
	public int deleteBoard(int num) {

		String sql = null;

		int exeCnt = 0; // 삭제 데이터 수, DB 삭제가 실행되었는지 여부 판단

		try {
			objConn = objPool.getConnection();

			//////////// 게시글의 파일 삭제 시작 ///////////////
			sql = "select systemFileName from adminWriteTbl where num=?";
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
			sql = "delete from adminWriteTbl where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, num);
			exeCnt = objPstmt.executeUpdate();
			//////////// 게시글 삭제 끝 ///////////////

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return exeCnt;
	}

	/* 게시글 삭제(/bbs/delete.jsp) 끝 */

	

	/* 게시글 수정페이지 (/bbs/updateProc.jsp) 시작 */
	public int updateBoard(BoardBean bean) {
		String sql = null;
		int exeCnt = 0;

		try {
			objConn = objPool.getConnection();
			sql = "update adminWriteTbl set asubject=?, acontent=? where num=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bean.getAsubject());
			objPstmt.setString(2, bean.getAcontent());
			objPstmt.setInt(3, bean.getNum());
			exeCnt = objPstmt.executeUpdate();
			// exeCnt : DB에서 실제 적용된 데이터(=row, 로우)의 개수 저장됨

		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt);
		}

		return exeCnt;
	}

	/* 게시글 수정페이지 (/bbs/updateProc.jsp) 끝 */
		
	

	/* 게시글 답변 페이지 (/bbs/replyProc.jsp) 시작 */
	public int replyBoard(BoardBean bean) {

		String sql = null;
		int cnt = 0;
	

		try {
			objConn = objPool.getConnection(); 

			sql = "insert into adminWriteTbl (";
			sql += "uName, content, subject, ";
			sql += "ref, pos, depth,  ";
			sql += "regTM, readCnt, ip) values (";
			sql += "?, ?, ?, ?, ?, ?, now(), 0, ?)";

			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1;
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bean.getuName());
			objPstmt.setString(2, bean.getContent());
			objPstmt.setString(3, bean.getSubject());
			objPstmt.setInt(4, bean.getRef());
			objPstmt.setInt(5, pos);
			objPstmt.setInt(6, depth);
			objPstmt.setString(7, bean.getIp());
			cnt = objPstmt.executeUpdate();


		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		return cnt;  
	}
	/* 게시글 답변 페이지 (/bbs/replyProc.jsp) 끝 */
	
	

	/* 답변글 끼어들기 시작 (/bbs/replyProc.jsp) */
	public int replyUpBoard(int ref, int pos) {

		String sql = null;
		int cnt = 0;		

		try {
			objConn = objPool.getConnection();

			//////////// 게시글의 포지션 증가 시작 ///////////////
			sql = "update adminWriteTbl set pos = pos + 1 ";
			sql += "where ref = ? and pos > ?";
			
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setInt(1, ref);
			objPstmt.setInt(2, pos);
			cnt = objPstmt.executeUpdate();


		} catch (Exception e) {
			System.out.println("Exception : " + e.getMessage());
		} finally {
			objPool.freeConnection(objConn, objPstmt, objRS);
		}

		
		return cnt;
	}	
	/* 답변글 끼어들기 끝 (/bbs/replyProc.jsp) */
	

}
