/*============================
 	GalleryController.java
============================*/

package com.test.prj;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GalleryController
{
	@Autowired
	private SqlSession sqlSession;
	
	private static String PATH = "C:\\Final\\FinalProjectApp\\WebContent\\images\\img\\gallery";
	
	@RequestMapping("/gallery.action")
	public String GalleryList(Model model, String moment_id, String group_id, HttpSession session)
	{
		String result = null;
		String user_id = (String)session.getAttribute("user_id");
		
		IGalleryDAO dao = sqlSession.getMapper(IGalleryDAO.class);
		model.addAttribute("galleryList", dao.galleryList(moment_id));
		model.addAttribute("galleryCount", dao.galleryList(moment_id).size());
		model.addAttribute("moment_id", moment_id);
		model.addAttribute("group_id", group_id);
		
		result = "/WEB-INF/view/Gallery.jsp";
		
		return result;
	}
	
	@RequestMapping("/galleryinsertform.action")
	public String GalleryInsertForm(Model model, String moment_id, String group_id, HttpSession session)
	{
		
		String result = null;
		String user_id = (String)session.getAttribute("user_id");
		
		IGalleryDAO dao = sqlSession.getMapper(IGalleryDAO.class);
		
		model.addAttribute("moment_id", moment_id);
		model.addAttribute("group_id", group_id);
		
		result = "/WEB-INF/view/GalleryInsertForm.jsp";
		
		return result;
	}
	
	
	@RequestMapping("/galleryinsert.action")
	public String GalleryInsert(Model model, String moment_id, String group_id, String files, HttpSession session) throws IOException
	{
		String result = null;
		String user_id = (String)session.getAttribute("user_id");
		String member_id = "";
		String participant_id = "";
		String file_realname = "";
		String file_settingname = "";
		
		IGalleryDAO dao = sqlSession.getMapper(IGalleryDAO.class);
		
		member_id = dao.searchMemberId(user_id, group_id);
		participant_id = dao.getPartiId(member_id, moment_id);
		
		String[] realnames = files.split("//");
		String[] settingnames = new String[realnames.length];
		int count = 0;
		
		// 폴더 구성
		File f = new File(PATH);
		
		// 없으면 폴더 생성
		if (!f.exists())
			f.mkdir();
		
		count = dao.galleryCount();
		for (int i = 0; i < realnames.length; i++)
		{
			settingnames[i] =  "SIST_"  + (count + 1) + realnames[i];
			
			// 파일 구성
			File f2 = new File(f, settingnames[i]);		//-- 디렉터리 객체, 파일명
		
			// 파일이 존재하지 않으면 생성
			if (!f2.exists()) 
				f2.createNewFile();
			
			file_realname = realnames[i];
			file_settingname = settingnames[i];
			
			// DB에 파일 정보 저장(인서트)
			dao.addGallery(moment_id, participant_id, file_realname, file_settingname, PATH);
			count++;
		}
		
		result = "redirect:gallery.action?group_id=" + group_id + "&moment_id=" + moment_id;
		
		return result;
	}
	
	@RequestMapping("/gallerypage.action")
	public String GalleryPage(Model model, String group_id, String gallery_id, HttpSession session)
	{
		String result = null;
		String user_id = (String)session.getAttribute("user_id");
		
		IGalleryDAO dao = sqlSession.getMapper(IGalleryDAO.class);
		
		GalleryDTO myGalleryList = dao.myGalleryList(gallery_id);
		ArrayList<GalleryDTO> commentList = dao.GalleryCommentList(gallery_id);
		
		model.addAttribute("myGalleryList", myGalleryList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("countComment", dao.countComment(gallery_id));
		model.addAttribute("group_id", group_id);
		
		result = "/WEB-INF/view/GalleryPage.jsp";
		
		return result;
	}
	
	
	/*
	@RequestMapping("/memberidcount.action")
	public String memberIdCount(String my_id)
	{
		String result = null;
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		result = "/WEB-INF/view/MyIdCountAjax.jsp?count=" + dao.idCount(my_id);
		
		return result;
	}
	
	@RequestMapping("/membernamecount.action")
	public String memberNameInsert(String user_name)
	{
		String result = null;
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		result = "/WEB-INF/view/NameCountAjax.jsp?count=" + dao.nameCount(user_name);
		
		return result;
	}
	
	@RequestMapping(value = "/memberinsert.action", method = RequestMethod.POST)
	public String userInsert(MemberDTO dto)
	{
		String result = null;
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);

		int count = dao.userCount();
		
		String user_id = String.format("US0%s", count + 1);
		dto.setUser_id(user_id);
		dao.addUser(dto.getUser_id());
		
		dao.addUserInformation(dto);
		
		result = "redirect:main.action";
		
		return result;
	}
	*/
	
}
