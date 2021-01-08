package com.mycom.myboard;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	@Autowired
	DataSource dataSource;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String board_list(Model model, @RequestParam(value = "gubun", defaultValue = "first") String gubun,
			@RequestParam(value = "pageCounts", defaultValue = "0") int pageCounts,
			@RequestParam(value = "currentPage", defaultValue = "0") int currentPage) throws SQLException {

		Connection conn = dataSource.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		int recordsToDisplay = 10; // 한 페이지에 표시할 건수
		int totalRecordCounts = 0;

		String sql = "";
		sql = "select Count(*) as counts from board";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery(sql);
		if (rs.next()) {
			totalRecordCounts = rs.getInt("counts");
		}
		pageCounts = (int) Math.ceil((double) totalRecordCounts / (double) recordsToDisplay);
		if (gubun.equals("first")) {
			currentPage = 0;
			
		} else if (gubun.equals("previous")) {
			if (currentPage != 0) {
				currentPage -= 1;
			}
		} else if (gubun.equals("next")) {
			currentPage += 1;
			if (currentPage == pageCounts) {
				currentPage -= 1;
			}
		} else if (gubun.equals("last")) {
			currentPage = pageCounts - 1;
		} else {
			currentPage = Integer.parseInt(gubun);
		}
		int startLimit = currentPage * recordsToDisplay;
		int recordCountsToDisplay = recordsToDisplay;
		
		sql = "select * from board order by id DESC limit " + startLimit + "," + recordCountsToDisplay;
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery(sql);

		List<Board> boardList = new ArrayList<Board>();
		while (rs.next()) {
			int id = rs.getInt("id");
			String title = rs.getString("title");
			String author = rs.getString("author");
			Date created_date = rs.getDate("created_date");

			Board board = new Board(id, title, null, null, null, author, created_date);
			boardList.add(board);
		}
		conn.close();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageCounts", pageCounts);
		model.addAttribute("boardList", boardList);
		
		return "board_list";
	}

	@RequestMapping(value = "/board_add", method = RequestMethod.GET)
	public String board_add(
			@ModelAttribute BoardForm board
			) {
		return "board_add";
	}

	@RequestMapping(value = "/board_add_process", method = RequestMethod.POST)
	public String board_add_process(
			Model model,
			@RequestParam("title") String title, @RequestParam("message") String message,
			@RequestParam("photo") MultipartFile photo, Authentication authentication,
			@Validated BoardForm board, BindingResult bindingResult
			) throws SQLException, IOException {

		
		String currentPrincipalName = authentication.getName();
		//System.out.println(currentPrincipalName);
		
		Connection conn = null;

		conn = dataSource.getConnection();
		PreparedStatement ps = null;
	                                               // 제목, 메시지, 사진, 사진 타입, 저자, 작성일자
		ps = conn.prepareStatement("INSERT INTO board VALUES(default, ?, ?, ?, ?, ?, ?)");
		ps.setString(1, title);
		ps.setString(2, message);

		// 사진 바이너리 업로드
		InputStream is = photo.getInputStream();
		ps.setBlob(3, is);
		
		String contentType = photo.getContentType();
		ps.setString(4, contentType);

		ps.setString(5, currentPrincipalName);

		Timestamp timestamp = new Timestamp(new Date().getTime());
		ps.setTimestamp(6, timestamp);
		
		int affectedRows = ps.executeUpdate();
		conn.close();
		
		 if (affectedRows == 1) {
			//model.addAttribute("gubun", "boardAdd");
			return "redirect:/";
		} else {
			return "board_add";
		}

	}
	
	@RequestMapping(value = "/board_delete", method = {RequestMethod.GET,RequestMethod.POST})
	public String board_delete(
			Model model, 
			@RequestParam("id") int id) throws SQLException {
		
		Connection conn = dataSource.getConnection();
		String sql = "DELETE from board where id = ?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		
		int rs = ps.executeUpdate();
		Board board = new Board();
	
		board.setId(id);
			
		
		model.addAttribute("board", board);
		
		return "redirect:/";
	}
		
	
	@RequestMapping(value = "/board_edit_process", method = RequestMethod.POST)
	public String board_edit_process(
			Model model,
			@RequestParam("id") int id,
			@RequestParam("edited_title") String title, @RequestParam("edited_message") String message,
			@RequestParam("edited_photo") MultipartFile photo,
			HttpServletResponse response
			) throws SQLException, IOException {
		
		String sql = "";			
		if(photo.isEmpty()) {
			sql = "UPDATE board set title=?, message=? where id=?";
		} 
		else {
			sql = "UPDATE board set title=?, message=?, photo=?, content_type=? where id=?";
		}

		Connection conn = null;
		conn = dataSource.getConnection();
		PreparedStatement ps = null;
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, title);
		ps.setString(2, message);
		
		if(photo.isEmpty()) {
			ps.setInt(3, id);
		} 
		else {
			InputStream is = photo.getInputStream();
			ps.setBlob(3, is);

			String contentType = photo.getContentType();
			ps.setString(4, contentType);

			ps.setInt(5, id);
		}
		
		int affectedRows = ps.executeUpdate();
		conn.close();

		if (affectedRows == 1) {
//			response.setContentType("text/html; charset=UTF-8");
//            PrintWriter out = response.getWriter();
//            out.println("<script>alert('정상 수정되었습니다.'); loction.href='/board_list'; </script>");
//            out.flush();
			//model.addAttribute("gubun", "boardEdit");
			//return "board_process_result";
			return "redirect:/";
		} else {
			return "board_edit";
		}

	}
	
	@RequestMapping(value = "/board_edit", method = RequestMethod.GET)
	public String board_edit(
			Model model, @RequestParam("id") int id) throws SQLException {
		
		Connection conn = dataSource.getConnection();
		String sql = "select * from board where id = ?";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Board board = new Board();
		
		if (rs.next()) {
			String title = rs.getString("title");
			String message = rs.getString("message");
			String author = rs.getString("author");
			Date created_date = rs.getDate("created_date");

			board.setId(id);
			board.setTitle(title);
			board.setMessage(message);
			board.setAuthor(author);
			board.setCreated_date(created_date);
		}	
		
		model.addAttribute("board", board);
		return "board_edit";
	}

	@RequestMapping(value = "/board_details", method = RequestMethod.GET)
	public String board_details(Model model, @RequestParam("id") int id) throws SQLException {
		Connection conn = dataSource.getConnection();
		String sql = "select * from board where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);

		ResultSet rs = ps.executeQuery();
		Board board = new Board();
		if (rs.next()) {

			String title = rs.getString("title");
			String message = rs.getString("message");
			String author = rs.getString("author");
			Date created_date = rs.getDate("created_date");

			board.setId(id);
			board.setTitle(title);
			board.setMessage(message);
			board.setAuthor(author);
			board.setCreated_date(created_date);
		}

		conn.close();

		model.addAttribute("board", board);

		return "board_details";
	}
	
	
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String getsignup(
			@ModelAttribute BoardForm users, @ModelAttribute BoardForm authorities
			) {
		return "statics/signup";
	}
	
	@RequestMapping(value = "/signup_process", method = RequestMethod.POST)
	public String postsignup(
			Model model,
			@RequestParam("email") String email, @RequestParam("password") String password
			) throws SQLException, IOException {
		
		Connection conn = null;

		conn = dataSource.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
	                                                               // 이름,비밀번호,enabled
		ps = conn.prepareStatement("INSERT INTO users VALUES(default, ?, ?, 1)");
		ps2 = conn.prepareStatement("INSERT INTO authorities VALUES(?,'USERS')");
		ps.setString(1, email);
		ps2.setString(1, email);
		ps.setString(2, password);
		
		int affectedRows = ps.executeUpdate();
		int affectedRows2 = ps2.executeUpdate();
		conn.close();
		
		 if (affectedRows == 1 && affectedRows2 == 1) {
			return "redirect:/login";
		} else {
			return "signup";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public int idcheck(HttpServletRequest req) throws Exception {
		String userId = req.getParameter("email");
		 //System.out.println(userId);	 
		 Connection conn = dataSource.getConnection();
		 String sql = "select email from users where email = ?";
		 PreparedStatement ps = conn.prepareStatement(sql);
		 ps.setString(1,userId);

		 ResultSet rs = ps.executeQuery();
		 int result = 0;
		 
		 	if (rs.next()) {
		 		conn.close(); //사용불가
			} else {
				conn.close();
				result = 1; //사용가능
			}
		 return result;
	}

	@RequestMapping(value = "/get_image", method = RequestMethod.GET)
	public void get_image(@RequestParam("id") int id, HttpServletResponse response) throws SQLException, IOException {
		Connection conn = dataSource.getConnection();
		String sql = "select * from board where id = ?";

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			Blob blob = rs.getBlob("photo");
			String contentType = rs.getString("content_type");
			
			if (blob == null || contentType.matches(".*app.*")) {
				ClassPathResource resource = new ClassPathResource("static/img/invisible.png");
				InputStream inputStream = resource.getInputStream();
				contentType = "image/png";
				response.setContentType(contentType);
				OutputStream os = response.getOutputStream();
				byte byteArray[] = inputStream.readAllBytes();
				os.write(byteArray);
				os.flush();
				os.close();
			} else {
				byte byteArray[] = blob.getBytes(1, (int) blob.length());
				response.setContentType(contentType);

				OutputStream os = response.getOutputStream();
				os.write(byteArray);
				os.flush();
				os.close();
			}

		}
	}
}
