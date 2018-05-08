package com.project.proto.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.project.proto.dto.board1Dto;



public class board1Dao {

	
	DataSource datasrc;
	JdbcTemplate template;
	
	public board1Dao(){//default 생성자
		
//아래의 과정은 스프링 설정파일에서 빈으로 만들고 jdbctemplate에 담아 줬다.
		try {
			Context context = new InitialContext();
			datasrc = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g"); 
		} catch (NamingException e) {
			
			e.printStackTrace();
		} // 여기까지 삭제
		
		template = Constant.template;
		
	}
	
	public board1Dao content(String listnum) { 
		
		board1Dao dto;
		upHit(listnum); 
		String sql = "select * from MVCBOARD where num = "+listnum;
		//저장된 데이터 가져오기 작업
		dto = template.queryForObject(sql, new BeanPropertyRowMapper<Dto>(Dto.class));
	
		

		return dto;
	}
	private void upHit(final String listnum) { 
		//아래의 listid가 이 listid를 참조하는데, 이 값이 변경이 되면 밑에 listid가 영향을 받을수 있기땜누에 변경되지 않도록 final처리
		// TODO Auto-generated method stub
		
		String sql = "update MVCBOARD set hit = hit +1 where num = ?";
		template.update(sql, new PreparedStatementSetter() { //PreparedStatementSetter 클래스 생성

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, Integer.parseInt(listnum));
				
			}
			
		});

	}

	public void write(final String name, final String title, final String content) {
		
		
		
		//작성은 update
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				// TODO Auto-generated method stub
				String sql = "insert into MVCBOARD (num, name, title, content, hit, bgroup, step, indent) values(MVCBOARD_seq.nextval,?,?,?,0,MVCBOARD_seq.currval,0,0)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, title);
				pstmt.setString(3, content);
				return pstmt; //
			}
		});

	
	}
	public ArrayList<Dto> list() {
		
		int i = 0;
		ArrayList<Dto> dto = null;
		ArrayList<MemberDto> memdto = null;
		//정렬 순서는 group으로 내림차순, step으로 오름차순
		/*String sql = "select MVCBOARD.*, ID from MVCBOARD, GARAM WHERE MVCBOARD.NAME = GARAM.NAME order by bgroup desc, step asc"; //마지막 NAME은 GARAM테이블의 데이터이다.		
*/	
		String sql = "SELECT a.*,b.ID FROM MVCBOARD a LEFT JOIN GARAM b  ON  a.ID = b.ID  ORDER BY a.bgroup DESC, step asc"; //name이 일치하면 그 데이터 들의 값 중 null값이 있어도  다 가져온다.*/
	   //반환하기
	 
		dto = (ArrayList<Dto>) template.query(sql, new BeanPropertyRowMapper<Dto>(Dto.class));//data를 가져올 command 객체 명시
		
	 	
		

		return dto;
		
	}

	public void modify(final String num, final String name, final String title, final String content) {
		// TODO Auto-generated method stub
		String sql = "update MVCBOARD set name = ?, title = ?, content = ? where num = ?";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setString(1,  name);
				pstmt.setString(2,  title);
				pstmt.setString(3,  content);
				pstmt.setInt(4,  Integer.parseInt(num));
				
			}
				
				});

		
	}

	public void delete(final String num) {
		// TODO Auto-generated method stub
		String sql= "delete from MVCBOARD where num = ?";
		template.update(sql,new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement pstmt) throws SQLException {
				// TODO Auto-generated method stub
				pstmt.setString(1, num);
				
			}
			
		});

		
	}

	//답변을 위한 뷰 화면을 가져오기
	public board1Dto replyview(String num) {
		// TODO Auto-generated method stub
		board1Dto dto;
//		String sql = "select * from MVCBOARD where id = ?";
		String sql = "select * from MVCBOARD where num = " + num;
		//실제 답변 다는게 아니라, 답변을 위한 뷰화면 가져오기
		dto = template.queryForObject(sql, new BeanPropertyRowMapper<Dto>(Dto.class));

		return dto;
		
		
		
	}
	//답글쓰기
	public void replywrite(String num, String name, String title, String content, String bgroup, String step,String indent) {
		// TODO Auto-generated method stub
		
		
		//원글보다 한번 들여 써야 한다.
		replyShape(bgroup, step);
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = datasrc.getConnection();
			String sql = "insert into MVCBOARD(num, name, title, content, bgroup, step, indent) values (MVCBOARD_SEQ.nextval,?,?,?,?,?,?)";//왜 아이디에 시퀀스를?
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2,  title);
			pstmt.setString(3,  content);
			pstmt.setInt(4,  Integer.parseInt(bgroup));
			pstmt.setInt(5,  Integer.parseInt(step)+1);
			pstmt.setInt(6,  Integer.parseInt(indent)+1);
			
			pstmt.executeQuery();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
		}
	}

	//답변글 들여쓰기 ??애네 하는일 없ㅇ므...
	private void replyShape(String bgroup, String step) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {//같은 그룹내에서 step이 현재 step보다 크다면, step을 +1해라.  ??step indent
			String sql = "update MVCBOARD set step = step+1 where bgroup = ? and step > ?";
			conn = datasrc.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  Integer.parseInt(bgroup));
			pstmt.setInt(2, Integer.parseInt(step));
			
			int n = pstmt.executeUpdate();
			System.out.println("실행" + n); //답글에 또 답글을 쓸때나 실행
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
			e.printStackTrace();
		}
	}
	}

	//답글달기
//	public void reply(final String id, final String name, final String content, final String bgroup, final String step, final String indent) {
//		
//		String sql = "insert into MVCBOARD(id, name, title, content, bgroup, step, indent) values(MVCBOARD_SEQ.nextval, ?,?,?,?,?,?)";
//		template.update(sql, new PreparedStatementSetter() {
//			
//			@Override
//			public void setValues(PreparedStatement pstmt) throws SQLException {
//				// TODO Auto-generated method stub
//				pstmt.setInt(1, Integer.parseInt(id));
//				pstmt.setString(2,  name);
//				pstmt.setString(3,  content);
//				pstmt.setInt(4,  Integer.parseInt(bgroup));
//				pstmt.setInt(5, Integer.parseInt(step)+1);
//				pstmt.setInt(6, Integer.parseInt(indent)+1);
//				
//			}
//		
//		});
//	}
//	
//	private void replyShape(String strGroup, String strStep ) {
//		
//	}
	
}