package com.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/board/boardSearch")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		int numPerPage;
		// 데이터를 가져올때 원하는 구역 가져오기
		// 1. 사용자가 원하는 page -> 현재 페이지
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		// 2. 페이지당 데이터 수 -> 사용자가 설정
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=10;
		}
		
		String searchType=request.getParameter("searchType");
		String keyword=request.getParameter("searchKeyword");
		
		System.out.println(searchType);

		System.out.println(keyword);
		// 사용자가 원하는 페이지를 호출할 수 있게 pageBar 구성
		// board의 총 개수
		int totalData=new BoardService().searchBoardCount(searchType, keyword);
		// 1. 전체 페이지에 대한 수(전체자료에서 페이지당 수 나누기, 자동 올림처리)
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		// pageBar에 출력될 페이지숫자 갯수
		int pageBarSize=10;
		// pageNo는 pageBar에 출력되는 페이지숫자의 시작값
		// 예를 들어 pageBarSize=5라는 가정 하에
		// cPage가 1~5는 pageNo=1, cPage가 6~10이면 pageNo=6
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		// pageEnd는 당연히 끝나는 값이겠죠
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/board/boardSearch?cPage="+(pageNo-1)
					+"&numPerpage="+numPerPage
					+"&searchType="+searchType+"&searchKeyword="+keyword+"'>[이전]</a>";
		}
	
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/board/boardSearch?cPage="+pageNo
						+"&numPerpage="+numPerPage
						+"&searchType="+searchType+"&searchKeyword="+keyword+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/board/boardSearch?cPage="+pageNo
					+"&numPerpage="+numPerPage
					+"&searchType="+searchType+"&searchKeyword="+keyword+"'>[다음]</a>";
		}
		// pageBar에는 결국 [이전], 페이지 숫자들, [다음]과 관련된 html 문자열이 들어감
		request.setAttribute("pageBar",pageBar);
		request.setAttribute("cPage",cPage);
		

		List<Board> list=new BoardService().searchBoardList(cPage, numPerPage, searchType, keyword);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/boardPage.jsp")
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
