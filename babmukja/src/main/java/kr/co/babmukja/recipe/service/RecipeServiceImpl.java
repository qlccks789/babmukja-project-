package kr.co.babmukja.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Keyword;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.domain.RecipeFollow;
import kr.co.babmukja.repository.domain.RecipeKeywordCode;
import kr.co.babmukja.repository.domain.RecipeKeywordName;
import kr.co.babmukja.repository.domain.RecipeLike;
import kr.co.babmukja.repository.domain.RecipePage;
import kr.co.babmukja.repository.domain.RecipeReview;
import kr.co.babmukja.repository.domain.RecipeScrap;
import kr.co.babmukja.repository.domain.Scrapbook;
import kr.co.babmukja.repository.domain.StatusChecker;
import kr.co.babmukja.repository.mapper.RecipeMapper;

@Service("kr.co.babmukja.recipe.service.RecipeService")
public class RecipeServiceImpl implements RecipeService {
	@Autowired
	public RecipeMapper mapper;

	// 조회수 증가
	public void addViewCnt(int no) {
		mapper.addViewCnt(no);
	}

	// 레시피 삽입
	public void insertRecipe(Recipe recipe, List<String> keywords, List<String> cautions) {		
		mapper.insertRecipe(recipe);
		RecipeKeywordCode rk = new RecipeKeywordCode();
		
		for(int i=0; i<keywords.size(); i++) {
			rk.setCountry(Integer.parseInt((keywords.get(0))));
			rk.setSituation(Integer.parseInt((keywords.get(1))));
			rk.setLevel(Integer.parseInt((keywords.get(2))));
			rk.setTime(Integer.parseInt((keywords.get(3))));
			rk.setType(Integer.parseInt((keywords.get(4))));
		}
		StringBuilder cautionsString = new StringBuilder();
		for(int i=0; i < cautions.size(); i++) {
			cautionsString.append(cautions.get(i));
			if(i == cautions.size()-1) {
				break;
			}
			cautionsString.append(",");
		}
		rk.setCaution(cautionsString.toString());
		rk.setRecipeNo(recipe.getRecipeNo());
		mapper.insertKeywordToRecipe(rk);
	}

	// 번호로 레시피 찾기
	public Recipe selectRecipeByNo(int no) {
		return mapper.selectRecipeByNo(no);
	}

	// 수정페이지에 리시피 가져가기
	public Recipe updateForm(int no) {
		return mapper.selectRecipeByNo(no);
	}

	// 레시피 수정
	public void updateRecipe(Recipe recipe, List<String> keywords, List<String> cautions) {
		mapper.updateRecipe(recipe);;
		RecipeKeywordCode rk = new RecipeKeywordCode();
		
		for(int i=0; i<keywords.size(); i++) {
			rk.setCountry(Integer.parseInt((keywords.get(0))));
			rk.setSituation(Integer.parseInt((keywords.get(1))));
			rk.setLevel(Integer.parseInt((keywords.get(2))));
			rk.setTime(Integer.parseInt((keywords.get(3))));
			rk.setType(Integer.parseInt((keywords.get(4))));
		}
		StringBuilder cautionsString = new StringBuilder();
		for(int i=0; i < cautions.size(); i++) {
			cautionsString.append(cautions.get(i));
			if(i == cautions.size()-1) {
				break;
			}
			cautionsString.append(",");
		}
		rk.setCaution(cautionsString.toString());
		rk.setRecipeNo(recipe.getRecipeNo());
		mapper.updateKeywordFromRecipe(rk);
	}
	

	// 레시피 삭제
	public void deleteRecipe(int no) {
		mapper.deleteRecipe(no);
	}

	// 레시피 전체 가져오기
	public List<Recipe> selectRecipe() {
		return mapper.selectRecipe();
	}

	// 레시피 댓글 전체 조회
	public Map selectReviewByNo(Page page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectReviewByNo(page));
		PageResult pageResult = new PageResult(page.getPageNo(), mapper.selectReviewCount(page));
		result.put("pageResult", pageResult);
		return result;
	}
	// 레시피 댓글 전체 수
	public int selectReviewCount(Page page) {
		return mapper.selectReviewCount(page);
	}
	// 레시피 댓글 등록
	public void insertRecipeReview(RecipeReview review) {
		mapper.insertRecipeReview(review);
	}
	// 레시피 댓글 수정
	public void updateRecipeReview(RecipeReview review) {
		mapper.updateRecipeReview(review);
	}
	// 레시피 댓글 하나 가져오기 
	public RecipeReview selectOneReviewByNo(int no) { 
		return mapper.selectOneReviewByNo(no); 
	}	
	// 레시피 댓글 삭제 
	public void deleteRecipeReview(int no) {
		mapper.deleteRecipeReview(no);
	}
	// 댓글 등록될 때 레시피 평점 수정하기
	public void updateRecipeRating(int no) {		
		mapper.updateRecipeRating(no);
	}

	public RecipeKeywordName selectKeywordByNo(int no){
		return mapper.selectKeywordByNo(no);
	}
	public List<Recipe> selectRecipeByKeyword(int no){
		return mapper.selectRecipeByKeyword(no);
	}
	public RecipeKeywordCode selectKeywordMost(String column){
		return mapper.selectKeywordMost(column);
	}
	public List<Keyword> selectKeyword(){
		return mapper.selectKeyword();
	}
	
	// 레시피 카테고리 전체목록 가져오기
	public List<RecipePage> selectRecipeAll(RecipePage page) {	
		return mapper.selectRecipeAll(page);
	}	
	
	// 레시피 카테고리별 목록 가져오기	
	public List<RecipePage> selectRecipeByCate(RecipePage page) {		
		return mapper.selectRecipeByCate(page);
	}
	// 1등 레시피 정보
	public Recipe selectWinRecipe() {
		return mapper.selectWinRecipe();
	}
	// 1등 레시피 댓글
	public List<RecipeReview> selectReviewByRate() {		
		return mapper.selectReviewByRate();
	}
	// 메인 회원 레시피 목록
	public List<Recipe> selectMemRecipeByRate() {
		return mapper.selectMemRecipeByRate();
	}
	
	// 회원 레시피 목록
	public List<Recipe> selectRecipeByMem(int no) {		
		return mapper.selectRecipeByMem(no);
	}

	// 레시피 좋아요 기능
	public void insertRecipeLike(RecipeLike recipe) {
		mapper.insertRecipeLike(recipe);
	}
	
	public int selectCountLike(RecipeLike recipe) {
		return mapper.selectCountLike(recipe);
	}
	
	public void updateLikeCnt(int no) {
		mapper.updateLikeCnt(no);
	}
	public void updateRecipeLike(RecipeLike recipe) {
		mapper.updateRecipeLike(recipe);
	}
	public void deleteLikeCnt(int no) {
		mapper.deleteLikeCnt(no);
	}	
	
	public String selectLikeStatus(RecipeLike recipe) {
		return mapper.selectLikeStatus(recipe);
	}
	public int countLikeCnt(int no) {
		return mapper.countLikeCnt(no);
	}
	
	// 레시피 팔로우
	public void insertRecipeFollow(RecipeFollow follow) {
		mapper.insertRecipeFollow(follow);		
	}

	public int selectCountFollow(RecipeFollow follow) {
		return mapper.selectCountFollow(follow);
	}

	public void updateRecipeFollow(RecipeFollow follow) {
		mapper.updateRecipeFollow(follow);
	}

	public String selectFollowStatus(RecipeFollow follow) {
		return mapper.selectFollowStatus(follow);
	}

	public void updateKeywordFromRecipe(RecipeKeywordCode rk) {
		mapper.updateKeywordFromRecipe(rk);
	}

	public RecipeKeywordCode selectKeywordByRecipe(int no) {		
		return mapper.selectKeywordByRecipe(no);
	}
	
	public List<Recipe> selectRecipeByMemNo(int memNo) {
		return mapper.selectRecipeByMemNo(memNo);
	}
	
	public void insertScrapbookContent(Scrapbook book) {
		mapper.insertScrapbookContent(book);
	}

	@Override
	public void insertRecipeScrap(RecipeScrap sb) {
		mapper.insertRecipeScrap(sb);
	}

	@Override
	public StatusChecker selectStatusAll(StatusChecker checker) {
		return mapper.selectStatusAll(checker);
	}

	@Override
	public void updateRecipeScrapCnt(int recipeNo) {
		mapper.updateRecipeScrapCnt(recipeNo);
		
	}
	
	
}
