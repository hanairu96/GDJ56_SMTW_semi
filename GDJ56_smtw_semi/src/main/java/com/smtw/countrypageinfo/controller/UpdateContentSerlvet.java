package com.smtw.countrypageinfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smtw.country.model.vo.CountryPage;
import com.smtw.countrypageinfo.model.service.CountryPageInfoService;

/**
 * Servlet implementation class UpdateContentSerlvet
 */
@WebServlet("/countryinfo/updatecontent.do")
public class UpdateContentSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateContentSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name=request.getParameter("nName");
		String info=request.getParameter("coareainfo");
		String visa=request.getParameter("wkvisa");
		String safe=request.getParameter("safebady");
		String stay=request.getParameter("homestay");
		String job=request.getParameter("getjob");
			CountryPage cc=CountryPage.builder()
					.nName(name)
					.nInfo(info)
					.nVisa(visa)
					.nSafety(safe)
					.nSettle(stay)
					.nJob(job)
					.build();
		int result=new CountryPageInfoService().updateContent(cc);
		String msg="",loc="";
		if(result>0) {
			msg="정보수정이 정상적으로 완료되었습니다.";
			loc="/countryinfo/searchAll.do?nName="+name;
		}else {
			msg="수정을 실패하였습니다. 다시 시도해주세요.";
			loc="/countryinfo/goUpdateContent.do";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
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
