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
		
		//int countResult=Integer.parseInt(request.getParameter("countResult"));
		String checkList=request.getParameter("checkList");
		List<String> list=new Gson().fromJson(checkList, List.class);
 
        // List를 배열로 변환
        int arrListSize = list.size();
        String arrCheckList[] = list.toArray(new String[arrListSize]);
        
        char passport='N',doller='N',resume='N',sim='N',surplus='N',insurance='N',hCheckup='N',
        	vCerificate='N',ticket='N',multitab='N',em='N',roaming='N',aCertificate='N',certificate='N',
        	reservation='N',iLicense='N',creditCard='N',eContact='N',clothing='N',dailyNecessity='N';
        
        for(int i=0;i<arrCheckList.length;i++) {
        	switch(arrCheckList[i]) {
        		case "passport" : passport='Y'; break;
        		case "doller" : doller='Y';break;
        		case "resume" : resume='Y'; break;
        		case "sim" : sim='Y';break;
        		case "surplus" : surplus='Y'; break;
        		case "insurance" : insurance='Y'; break;
        		case "hCheckup" : hCheckup='Y';break;
        		case "vCertificate" : vCerificate='Y';break;
        		case "ticket" : ticket='Y'; break;
        		case "multitab" : multitab='Y'; break;
        		case "em" : em='Y';break;
        		case "roaming" : roaming='Y'; break;
        		case "aCertificate" : aCertificate='Y';break;
        		case "certificate" : certificate='Y';break;
        		case "reservation" : reservation='Y';break;
        		case "iLicense" : iLicense='Y';break;
        		case "creditCard" : creditCard='Y';break;
        		case "eContact" : eContact='Y';break;
        		case "clothing" : clothing='Y';break;
        		case "dailyNecessity" : dailyNecessity='Y'; break;
        	}
        }
        
        HttpSession session=request.getSession();
		Member m=(Member) session.getAttribute("logInMember");
		CheckList checklist=new DiaryService().searchCheckList(m.getMemberId());
		
		CheckList check=new CheckList(m.getMemberId(),passport,doller,resume,sim,surplus,insurance,hCheckup,
								vCerificate,ticket,multitab,em,roaming,aCertificate,certificate,reservation,
								iLicense,creditCard,eContact,clothing,dailyNecessity);
		
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
