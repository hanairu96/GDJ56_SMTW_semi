package com.smtw.diary.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smtw.diary.model.service.DiaryService;
import com.smtw.diary.model.vo.CheckList;
import com.smtw.member.model.vo.Member;

/**
 * Servlet implementation class SaveCheckList
 */
@WebServlet("/diary/saveCheckList.do")
public class SaveCheckList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveCheckList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String checkList=request.getParameter("checkList");
		List<String> list=new Gson().fromJson(checkList, List.class);
		//System.out.println(list);
 
        // List를 배열로 변환
        int arrListSize = list.size();
        String arrCheckList[] = list.toArray(new String[arrListSize]);
        
        CheckList check=new CheckList();
        for(int i=0;i<arrCheckList.length;i++) {
        	switch(arrCheckList[i]) {
        		case "passport" : check.setPassport('Y'); break;
        		case "doller" : check.setDoller('Y');break;
        		case "resume" : check.setResume('Y'); break;
        		case "sim" : check.setSim('Y');break;
        		case "surplus" : check.setSurplus('Y'); break;
        		case "insurance" : check.setInsurance('Y'); break;
        		case "hCheckup" : check.setHCheckup('Y');break;
        		case "vCertificate" : check.setVCertificate('Y');break;
        		case "ticket" : check.setTicket('Y'); break;
        		case "multitab" : check.setMultitab('Y'); break;
        		case "em" : check.setEm('Y');break;
        		case "roaming" : check.setRoaming('Y'); break;
        		case "aCertificate" : check.setACertificate('Y');break;
        		case "certificate" : check.setCertificate('Y');break;
        		case "reservation" : check.setReservation('Y');break;
        		case "iLicense" : check.setILicense('Y');break;
        		case "creditCard" : check.setCreditCard('Y');break;
        		case "eContact" : check.setEContact('Y');break;
        		case "clothing" : check.setClothing('Y');break;
        		case "dailyNecessity" : check.setDailyNecessity('Y'); break;
        	}
        }
        HttpSession session=request.getSession();
		Member m=(Member) session.getAttribute("logInMember");
		CheckList checklist=new DiaryService().searchCheckList(m.getMemberId());
		
		check.setMemberId(m.getMemberId());
		System.out.println(check);
		
		if(checklist.getMemberId()!=null) {
			int result=new DiaryService().updateCheckList(check);
			response.setContentType("text/html;charset=utf-8");
			
			if(result>0) {
				response.getWriter().append("체크리스트 수정 성공");
			}else {
				response.getWriter().append("체크리스트 수정 실패");
			}
			
			
		}else {
			int result=new DiaryService().insertCheckList(check);
			response.setContentType("text/html;charset=utf-8");
			
			if(result>0) {
				response.getWriter().append("체크리스트 저장 성공");
			}else {
				response.getWriter().append("체크리스트 저장 실패");
			}
		}
        
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
