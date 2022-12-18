package com.smtw.countrypageinfo.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smtw.country.model.vo.CountryPageInfo;
import com.smtw.countrypageinfo.model.service.CountryPageInfoService;

/**
 * Servlet implementation class UpdateCountryInfoServlet
 */
@WebServlet("/countryinfo/updatecoinfo.do")
public class UpdateCountryInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCountryInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path=request.getServletContext().getRealPath("/upload/");
		
		MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"UTF-8",new DefaultFileRenamePolicy());
		
		Enumeration e=mr.getFileNames();
		String pic="";
		if(e.hasMoreElements()) {
			String filename=(String)e.nextElement();
			pic = mr.getFilesystemName(filename);
		}
		
		
		String name=mr.getParameter("nName");
		String lang=mr.getParameter("langagecountry");
		String urban=mr.getParameter("urban");
		String money=mr.getParameter("moneycountry");
		String elect=mr.getParameter("elect");
		String google=mr.getParameter("contryaddress");
		String eng=mr.getParameter("engcity");
		String clock=mr.getParameter("clockchange");
		
		CountryPageInfo cp=CountryPageInfo.builder()
				.nName(name)
				.cPic(pic)
				.cLanguage(lang)
				.urban(urban)
				.money(money)
				.elect(elect)
				.mapAddress(google)
				.englishName(eng)
				.clock(clock)
				.build();
		int result=new CountryPageInfoService().updateInfo(cp);
		String msg="",loc="";
		if(result>0) {
			msg="수정이 완료되었습니다.";
			loc="/countryinfo/searchAll.do?nName="+name;
			request.getSession().setAttribute("country", cp);
		}else {
			msg="수정을 실패하였습니다. 다시 시도해주세요";
			loc="/countryinfo/updatego.do?nName="+cp.getNName();
			
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
