package kr.co.babmukja.recipe.service;

import java.util.List;
import java.util.Map;

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

public interface RecipeService {	
	// 레시피 등록
	public void insertRecipe(Recipe recipe, List<String> keywords, List<String> cautions);
	// 레시피 상세
	public Recipe selectRecipeByNo(int no);
	// 레시피 수정폼가기
	public Recipe updateForm(int no);
	// 레시피 수정
	public void updateRecipe(Recipe recipe, List<String> keywords, List<String> cautions);
	// 레시피 삭제
	public void deleteRecipe(int no);
	// 레시피 전체 목록
	public List<Recipe> selectRecipe();
	// 회원 레시피 목록
	public List<Recipe> selectRecipeByMem(int no);
	// 1등 레시피 정보
	public Recipe selectWinRecipe();
	// 1등 레시피 댓글
	public List<RecipeReview> selectReviewByRate();
	// 메인 회원 레시피 목록
	public List<Recipe> selectMemRecipeByRate();	
	// 레시피 조회수 증가
	public void addViewCnt(int no);
	
	// 레시피 팔로우
	public void insertRecipeFollow(RecipeFollow follow);
	public int selectCountFollow(RecipeFollow follow);
	public void updateRecipeFollow(RecipeFollow follow);
	public String selectFollowStatus(RecipeFollow follow);
	
	// 레시피 좋아요
	public void insertRecipeLike(RecipeLike recipe);
	public void updateRecipeLike(RecipeLike recipe);
	public void updateLikeCnt(int no);
	public void deleteLikeCnt(int no);	
	public int selectCountLike(RecipeLike recipe);
	public String selectLikeStatus(RecipeLike recipe);
	public int countLikeCnt(int no);
	
	// 레시피 댓글 조회
	public Map<String, Object> selectReviewByNo(Page page);
	// 레시피 당 댓글 수
	public int selectReviewCount(Page page);
	// 댓글 등록
	public void insertRecipeReview(RecipeReview review);	
	// 댓글 등록될 때 레시피 평점 수정하기
	public void updateRecipeRating(int no);
	// 댓글 수정
	public void updateRecipeReview(RecipeReview review); 
	// 댓글 삭제
	public void deleteRecipeReview(int no);
	// 레시피 댓글 하나 가져오기
	public RecipeReview selectOneReviewByNo(int no);
	
	// 레시피 키워드
	public RecipeKeywordCode selectKeywordMost(String column);
	public List<Keyword> selectKeyword();
	public RecipeKeywordName selectKeywordByNo(int no);
	public List<Recipe> selectRecipeByKeyword(int no);
	public void updateKeywordFromRecipe(RecipeKeywordCode rk);
	
	// 레시피 카테고리별 목록 가져오기
	public List<RecipePage> selectRecipeAll(RecipePage page);
	public List<RecipePage> selectRecipeByCate(RecipePage page);
	
	public RecipeKeywordCode selectKeywordByRecipe(int no);

	//(우중) 회원번호로 레시피 가져오기
	public List<Recipe> selectRecipeByMemNo(int memNo); 
	
	//scrapbook content 
	public void insertScrapbookContent(Scrapbook book);
	public void insertRecipeScrap(RecipeScrap sb);
	
	public StatusChecker selectStatusAll(StatusChecker checker);
	public void updateRecipeScrapCnt(int recipeNo);
}
