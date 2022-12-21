package com.smtw.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.mypage.model.service.MypageService;

/**
 * Servlet implementation class mypageNationViewServlet
 */
@WebServlet("/mypage/mypageNationView.do")
public class mypageNationViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mypageNationViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nation = request.getParameter("nation");
		System.out.println("골른나라 :"+nation);
		
		String id = request.getParameter("id");
		System.out.println("아이디 :"+id);
		
		//아이디에 저장된 나라 좋아요 찾기
		List likeNation = new MypageService().getNation(id);
		System.out.println("디비에 저장된 나라:"+likeNation);
		
		List part = new ArrayList();
		List saveNation = new ArrayList();
		if(nation.equals("eu")) {
			for(int i=0;i<likeNation.size();i++) {
				for(int j=0;j<part.size();j++) {
					if(likeNation.get(i).equals(saveNation.get(j))) {
						saveNation.add(likeNation.get(i));
					}
				}
			}
		}
		
		System.out.println("저장된 나라 : "+saveNation);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
