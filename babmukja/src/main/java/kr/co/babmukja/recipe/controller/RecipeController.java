package kr.co.babmukja.recipe.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.google.gson.Gson;

import kr.co.babmukja.recipe.service.RecipeService;
import kr.co.babmukja.repository.domain.Capture;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.domain.RecipeFollow;
import kr.co.babmukja.repository.domain.RecipeKeywordName;
import kr.co.babmukja.repository.domain.RecipeLike;
import kr.co.babmukja.repository.domain.RecipePage;
import kr.co.babmukja.repository.domain.RecipeReview;
import kr.co.babmukja.repository.domain.RecipeScrap;
import kr.co.babmukja.repository.domain.Scrapbook;
import kr.co.babmukja.repository.domain.StatusChecker;

@Controller("kr.co.babmukja.recipe.controller.RecipeController")
@RequestMapping("/recipe")
public class RecipeController {

	@Autowired
	private RecipeService service;

	@RequestMapping("/main.do")
	public void main(Model model) {
		List<Recipe> list = service.selectRecipe();
		
		model.addAttribute("recipe", list);
		model.addAttribute("countryrank", service.selectKeywordMost("country").getCountry());
		model.addAttribute("situationrank", service.selectKeywordMost("situation").getSituation());
		model.addAttribute("levelrank", service.selectKeywordMost("level").getLevel());
		model.addAttribute("typerank", service.selectKeywordMost("type").getType());
		model.addAttribute("win", service.selectWinRecipe());
		model.addAttribute("winner", service.selectMemRecipeByRate());
		model.addAttribute("comment",service.selectReviewByRate());
	}

	@RequestMapping("/recipekeyword.do")
	@ResponseBody
	public List<Recipe> recipeSeachByKeywordNo(int keywordNo) {
		return service.selectRecipeByKeyword(keywordNo);
	}

	@RequestMapping("/writeform.do")
	public void writeForm(Model model) {
		model.addAttribute("keyword", service.selectKeyword());
	}

	@RequestMapping("/upload.do")
	@ResponseBody
	public Object upload(FileVO fileVO) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/recipe" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false)
			file.mkdirs();

		MultipartFile mFile = fileVO.getAttach();

		if (mFile.isEmpty()) {
			return null;			
		}
		String uName = UUID.randomUUID().toString() + mFile.getOriginalFilename();
		mFile.transferTo(new File(uploadRoot + path + "/" + uName));

		fileVO.setPath(path);
		fileVO.setOrgname(mFile.getOriginalFilename());
		fileVO.setSysname(uName);

		return new Gson().toJson(fileVO);
	}

	@RequestMapping("/download.do")
	public void download(FileVO fileVO, HttpServletResponse response) throws Exception {
		String uploadRoot = "c:/bit2019/upload";
		String path = fileVO.getPath();
		String sysname = fileVO.getSysname();
		
		File f = new File(uploadRoot + path + "/" + sysname);

		response.setHeader("Content-Type", "image/jpg");

		// 파일을 읽고 사용자에게 전송
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);

		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while (true) {
			int ch = bis.read();
			if (ch == -1)
				break;
			bos.write(ch);
		}

		bis.close();
		fis.close();
		bos.close();
		out.close();
	}

	@RequestMapping("/write.do")
	@ResponseBody
	public void write(Recipe recipe, HttpSession session) {
		Member user = (Member)session.getAttribute("user");		
		recipe.setMemNo(user.getMemNo());		
		service.insertRecipe(recipe,recipe.getKeywords(),recipe.getCautions());		 
	}

	@RequestMapping("/detail.do")
	public ModelAndView detail(ModelAndView mav, int no, HttpSession session, Page page) {
		Recipe recipe = service.selectRecipeByNo(no);
		service.addViewCnt(no);
		if (recipe == null) {
			mav.setViewName("recipe/main");
			return mav;
		}
		RecipeKeywordName recipeKeyword = service.selectKeywordByNo(no);
		mav.setViewName("recipe/detail");

		List<String> cautions = new ArrayList<>();
		for (String key : recipeKeyword.getCaution().split(",")) {
			switch (Integer.parseInt(key)) {
			case 7:
				cautions.add("임산부 주의");
				break;
			case 8:
				cautions.add("영유아 주의");
				break;
			case 9:
				cautions.add("고혈압 주의");
				break;
			case 10:
				cautions.add("육류 포함");
				break;
			case 11:
				cautions.add("돼지고기 포함");
				break;
			case 12:
				cautions.add("노약자 주의");
				break;
			case 13:
				cautions.add("알러지 유발 주의");
				break;
			case 14:
				cautions.add("당뇨 주의");
				break;
			}

		}
		Member user = (Member) session.getAttribute("user");
		if (user != null) {
			StatusChecker checker = new StatusChecker();
			
			checker.setFollowMemNo(recipe.getMemNo());
			checker.setFollowerMemNo(user.getMemNo());

			checker.setMemNo(user.getMemNo());
			checker.setRecipeNo(recipe.getRecipeNo());
			
			StatusChecker resultChecker = service.selectStatusAll(checker);
			if(resultChecker == null) {
				resultChecker = new StatusChecker();
				resultChecker.setFollowStatus("X");
				resultChecker.setLikeStatus("X");
				resultChecker.setScrapStatus("X");
			}else {	
				if(resultChecker.getFollowStatus() == null) {
					resultChecker.setFollowStatus("X");
				}
				if(resultChecker.getLikeStatus() == null) {
					resultChecker.setLikeStatus("X");
				}
				if(resultChecker.getScrapStatus() == null) {
					resultChecker.setScrapStatus("X");
				}
			}
			mav.addObject("followStatus", resultChecker.getFollowStatus());
			mav.addObject("likeStatus", resultChecker.getLikeStatus());
			mav.addObject("scrapStatus",resultChecker.getScrapStatus());
		}
		
		mav.addObject("memRecipe", service.selectRecipeByMem(recipe.getMemNo()));
		mav.addObject("recipe", recipe);
		mav.addObject("keyword", recipeKeyword);
		mav.addObject("cautions", cautions);
		return mav;
	}

	@RequestMapping("/updateform.do")
	public void updateForm(int no, Model model) {
		model.addAttribute("keyword", service.selectKeywordByRecipe(no));	
		model.addAttribute("recipe", service.updateForm(no));
	}

	@RequestMapping("/update.do")
	@ResponseBody
	public void update(Recipe recipe, HttpSession session) {	
		Member user = (Member)session.getAttribute("user");		
		recipe.setMemNo(user.getMemNo());

		service.updateRecipe(recipe,recipe.getKeywords(),recipe.getCautions());
	}

	@RequestMapping("/delete.do")
	public String delete(int no) {
		service.deleteRecipe(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "main.do";
	}

	@RequestMapping("/recipeCommentWrite.do")
	@ResponseBody
	public RecipeReview writeComment(RecipeReview review, HttpSession session) {
		Member user = (Member) session.getAttribute("user");
		review.setMemNo(user.getMemNo());
		service.insertRecipeReview(review);
		service.updateRecipeRating(review.getRecipeNo());
		return service.selectOneReviewByNo(review.getRecipeReviewNo());
	}

	@RequestMapping("/recipeCommentList.do")
	@ResponseBody
	public Map listComment(Page page) {
		Map<String, Object> list = service.selectReviewByNo(page);
		list.put("comment", list.get("list"));
		list.put("pageResult", list.get("pageResult"));
		
		return list;
	}

	@RequestMapping("/commentUpdateForm.do")
	@ResponseBody
	public RecipeReview commentUpdateForm(int no) {
		return service.selectOneReviewByNo(no);
	}

	@RequestMapping("/commentDelete.do")
	@ResponseBody
	public void commentDelete(int no) {
		service.deleteRecipeReview(no);
	}

	@RequestMapping("/updateComment.do")
	@ResponseBody
	public RecipeReview updateComment(RecipeReview review) {
		service.updateRecipeReview(review);
		return service.selectOneReviewByNo(review.getRecipeReviewNo());
	}

	@RequestMapping("/returnReviewData.do")
	@ResponseBody
	public RecipeReview returnReviewData(int no) {
		return service.selectOneReviewByNo(no);
	}

	// 레시피 카테고리 전체목록 가져오기
	@RequestMapping("/cadetailall.do")
	public void cadetailall(Model model, RecipePage page) {
		List<RecipePage> list = service.selectRecipeAll(page);
		
		try {
			List<Integer> cautions = new ArrayList<>();
			for (String key : page.getCaution().split(",")) {
				switch (Integer.parseInt(key)) {
				case 7:
					cautions.add(Integer.parseInt(key));
					break;
				case 8:
					cautions.add(Integer.parseInt(key));
					break;
				case 9:
					cautions.add(Integer.parseInt(key));
					break;
				case 10:
					cautions.add(Integer.parseInt(key));
					break;
				case 11:
					cautions.add(Integer.parseInt(key));
					break;
				case 12:
					cautions.add(Integer.parseInt(key));
					break;
				case 13:
					cautions.add(Integer.parseInt(key));
					break;
				case 14:
					cautions.add(Integer.parseInt(key));
					break;
				}
			}
			for (int i = 0; i < cautions.size(); i++) {
				model.addAttribute("caution" + cautions.get(i), cautions.get(i));
			}

		} catch (Exception e) {

		}

		model.addAttribute("calist", list);
	}

	// 레시피 카테고리 전체 목록 무한스크롤
	@RequestMapping("/cadetailAllScroll.do")
	@ResponseBody
	public List<RecipePage> cadetailAllScroll(RecipePage page) {
		List<RecipePage> list = service.selectRecipeAll(page);
		return list;
	}

	// 레시피 카테고리별 목록 가져오기
	@RequestMapping("/cadetail.do")
	public void cadetail(Model model, RecipePage page) {
		List<RecipePage> list = service.selectRecipeByCate(page);
		model.addAttribute("calist", list);
	}

	// 레시피 카테고리별 목록 무한스크롤
	@RequestMapping("/cadetailScroll.do")
	@ResponseBody
	public List<RecipePage> cadetilScroll(RecipePage page) {
		List<RecipePage> list = service.selectRecipeByCate(page);
		return list;
	}

	// 레시피 좋아요
	@RequestMapping("/like.do")
	@ResponseBody
	public Map like(RecipeLike recipe, HttpSession session) {
		int count = service.selectCountLike(recipe);
		String status = service.selectLikeStatus(recipe);

		Map<String, Object> list = new HashMap<>();

		if (count == 1) {
			if (status.equals("Y")) {
				recipe.setLikeStatus("N");
				service.updateRecipeLike(recipe);
				service.deleteLikeCnt(recipe.getRecipeNo());

				list.put("status", recipe.getLikeStatus());
				list.put("cnt", service.countLikeCnt(recipe.getRecipeNo()));
				return list;

			} else if (status.equals("N")) {
				recipe.setLikeStatus("Y");
				service.updateRecipeLike(recipe);
				service.updateLikeCnt(recipe.getRecipeNo());

				list.put("status", recipe.getLikeStatus());
				list.put("cnt", service.countLikeCnt(recipe.getRecipeNo()));
				return list;
			}
		} else {
			service.insertRecipeLike(recipe);
			service.updateLikeCnt(recipe.getRecipeNo());

			list.put("status", recipe.getLikeStatus());
			list.put("cnt", service.countLikeCnt(recipe.getRecipeNo()));
			return list;
		}
		return list;
	}

	// 레시피 팔로우
	@RequestMapping("/follow.do")
	@ResponseBody
	public int follow(RecipeFollow follow) {
		int count = service.selectCountFollow(follow);
		String status = service.selectFollowStatus(follow);

		if (count == 1) {
			if (status.equals("Y")) {
				follow.setFollowStatus("N");
				service.updateRecipeFollow(follow);
				return 0;

			} else if (status.equals("N")) {
				follow.setFollowStatus("Y");
				service.updateRecipeFollow(follow);
				return 1;
			}
		} else {
			service.insertRecipeFollow(follow);
			return 1;
		}
		return 0;
	}

   
     @RequestMapping("/recipebyno.do")
     @ResponseBody
     public List<Recipe> selectRecipeByNo(int memNo){
    	return service.selectRecipeByMemNo(memNo); 
     }
     
     
     public static File binaryToFile(String binaryFile, String filePath, String fileName) {
    	    if ((binaryFile == null || "".equals(binaryFile)) || (filePath == null || "".equals(filePath))
    	            || (fileName == null || "".equals(fileName))) { return null; }
    	 
    	    FileOutputStream fos = null;
    	 
    	    File fileDir = new File(filePath);
    	    if (!fileDir.exists()) {
    	        fileDir.mkdirs();
    	    }
    	 
    	    File destFile = new File(filePath + fileName);
    	 
    	    byte[] buff = binaryFile.getBytes();
    	    String toStr = new String(buff);
    	    byte[] b64dec = Base64.decodeBase64(buff);
    	 
    	    try {
    	        fos = new FileOutputStream(destFile);
    	        fos.write(b64dec);
    	        fos.close();
    	    } catch (IOException e) {
    	    }
    	 
    	    return destFile;
    	}

     
     @RequestMapping("/capture.do")
     @ResponseBody
     public void screenCapture(Capture capture) throws Exception {
    	 
    	 SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");

    	 String uploadRoot = "C:/bit2019/upload";
 		 String path = "/scrapbook" + sdf.format(new Date());
 		 String uName = UUID.randomUUID().toString() + ".png";
 		 try {
 			 capture.getFile().transferTo(new File(uploadRoot + path + "/", uName));
 		 } catch (Exception e) {
 			 e.printStackTrace();
 			 throw e;
 		 }
    	 String content = "<div class='pageAjax'><img src='/babmukja/recipe/download.do?path="+path+"&sysname="+uName+"'></div>";
    	 
    	 Scrapbook book = new Scrapbook();
    	 book.setContent(content);
    	 book.setScrapNo(capture.getRadioVal());
    	 
    	 RecipeScrap rs = new RecipeScrap();
    	 
    	 rs.setMemNo(capture.getMemNo());
    	 rs.setRecipeNo(capture.getRecipeNo());
    	 rs.setScrapNo(book.getScrapNo());
    	 
    	 service.insertScrapbookContent(book);
    	 service.insertRecipeScrap(rs);
    	 service.updateRecipeScrapCnt(capture.getRecipeNo());
    	 
    	 
    	 
    	 /*
    	 System.out.println(capture.getBase64String());
    	 String data = capture.getBase64String().replaceAll("data:image/png;base64,", ""); 
    	 SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");

    	 String uploadRoot = "C:/bit2019/upload";
 		 String path = "/scrapbook" + sdf.format(new Date());
 		 
 		 String uName = UUID.randomUUID().toString() + ".png";
 		 
    	 File file = binaryToFile(data,uploadRoot + path + "/", uName);
    	 
    	 String content = "<div class='pageAjax'><img src='/babmukja/recipe/download.do?path="+path+"&sysname="+uName+"'></div>";
    	 
    	 Scrapbook book = new Scrapbook();
    	 book.setContent(content);
    	 book.setScrapNo(capture.getRadioVal());
    	 
    	 RecipeScrap rs = new RecipeScrap();
    	 
    	 rs.setMemNo(capture.getMemNo());
    	 rs.setRecipeNo(capture.getRecipeNo());
    	 rs.setScrapNo(book.getScrapNo());
    	 
    	 service.insertScrapbookContent(book);
    	 service.insertRecipeScrap(rs);
    	 service.updateRecipeScrapCnt(capture.getRecipeNo());
    	 */
     }
     

}
