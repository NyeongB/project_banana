/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.banana.controller;



import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@Controller
public class FileController
{
	@Autowired
	private SqlSession SqlSession;

	@RequestMapping(value = "/filetest.action", method = RequestMethod.POST)
	public String join(Model model, HttpServletRequest request)
	{
		String view = null;

		
		
		
		HttpSession session = request.getSession();
		String root = session.getServletContext().getRealPath("/");
		//System.out.println("root : " + root);
		String savePath = root + "pds" + File.separator + "image";
		//System.out.println("savePath : " + savePath);
		File dir = new File(savePath);
		
		// 폴더만들기
		if(!dir.exists())
			dir.mkdirs();
		
		String encType = "UTF-8";
		int maxFileSize = 5*1024*1024;
		String imagePath =null;
		String saveFileName =null;
		try
		{
			MultipartRequest req = null;
			req = new MultipartRequest(request, savePath, maxFileSize, encType
					, new DefaultFileRenamePolicy());
			
			String text = req.getParameter("text");
			//System.out.println(text);
			String file = req.getParameter("upload");
			//System.out.println(file);
			 saveFileName = req.getFilesystemName("upload");
			//System.out.println("saveFileName : " + saveFileName);
			
			
			String cp = request.getContextPath();
			 imagePath = cp + "/pds/image";
			
			
			model.addAttribute("saveFileName", saveFileName);
			model.addAttribute("imagePath", imagePath);
			/*
			ImageDTO dto = new ImageDTO();
			int maxNum = dao.getNumMax();
			
			dto.setNum(maxNum + 1);
			dto.setUserId(info.getUserId());
			dto.setSaveFileName(saveFileName);
			dto.setSubject(subject);
			
			dao.insertData(dto);
			*/
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		System.out.println(imagePath+"/"+saveFileName);
		view = "/FileTest2.jsp";

		return view;
	}

}
