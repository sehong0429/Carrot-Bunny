package com.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;

/**
 * Servlet implementation class BoardSellServlet
 */
@WebServlet("/board/boardSell")
public class BoardSellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSellServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		
		Board b = new Board();
		b = new BoardService().selectBoard(Integer.parseInt(request.getParameter("no")));
		int result;
		// 판매중이라면 판매완료 처리.
		if (b.getBoardIsSell() == 1) {
			b.setBoardIsSell(0);
			result = new BoardService().sellBoard(b);
		} else {
			result = -1;
		}
//		b.setBoardIsSell(0);
//		b.setBoardNumber(Integer.parseInt(request.getParameter("no")));
//		
//		int result = new BoardService().sellBoard(b);
		
		String msg = "";
		String loc = "/board/boardPage?cPage="+cPage;
		if (result > 0) {
			msg = "판매처리 완료";
		} else if (result == -1) {
			msg = "이미 판매완료 된 상품입니다.";
		} else {
			msg = "판매처리 실패. 관리자에게 문의하십시오.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
