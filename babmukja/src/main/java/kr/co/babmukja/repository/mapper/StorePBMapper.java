package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.PagePbReview;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.ReviewFileVO;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.domain.StorePBCart;
import kr.co.babmukja.repository.domain.StorePBInquire;
import kr.co.babmukja.repository.domain.StorePBLike;
import kr.co.babmukja.repository.domain.StorePBPayment;
import kr.co.babmukja.repository.domain.StorePBReview;

public interface StorePBMapper {
	/*
	 *   editor 이전
	public List<StorePB> selectPBList();
	public void insertpb(StorePB storepb);
	public void insertPBImage(FileVO fileVO);
	public int selectMaxNum();
	public List<StorePB> selectPBMainList();
	
	// 상세조회
	public StorePB selectPBdetail(int pbNo);
	public List<FileVO> selectPBDetailImage(int groupNo);
	
	// 삭제
	public void deletePBByNo(int pbNo);
	*/
	
	public List<StorePB> selectPBStore();
	public List<StorePB> selectPBBestItem();
	public List<StorePB> selectPBStoreList(Pagepb page);
	public StorePB selectPBStoreByNo(int pbNo);
	//public List<StorePB> selectAdminPBList(Pagepb page);
	//public int selectAdminPBListCount();
	//public void insertPBStore(StorePB storepb);
	public void updatePBStore(StorePB storepb);
	//public void deletePBStore(int no);
	public List<StorePBReview> selectPBReviewSelect(StorePBReview storePBReview);
	// public List<ReviewFileVO> selectPBReviewSelectImage(int pbReviewNo);
	public int selectPBStoreCount(Pagepb page);
	public void addViewCnt(int pbNo);
	
	// PB 상품 후기
	public void insertPBReview(StorePBReview reviewpb);
	public void insertPBReviewImage(FileVO fileVO);
	public int selectMaxNum();
	public List<StorePBReview> selectReview(PagePbReview page);
	public List<ReviewFileVO> selectReviewFile(int pbReviewNo);
	public int selectReviewCount(PagePbReview page);
	public List<StorePBReview> selectReviewAjax(PagePbReview page);
	
	// pb 상품 후기 수정관련
	public StorePBReview selectReviewByNo(int pbReviewNo);
	public StorePBReview updatePBReview(StorePBReview storePBReview);
	// pb 상품 후기 삭제
	public void deleteReviewByNo(int pbReviewNo);
	
	
	// PB 상품 문의
	public void insertInquiry(StorePBInquire storePBInquire);
	public List<StorePBInquire> selectPBInquire(PagePbReview page);
	public StorePBInquire selectInquiryByNo(int inquiryNo);
	public void updateInquiry(StorePBInquire storePBInquire);
	public void deleteInquiry(int inquiryNo);
	public int selectInquireCount(PagePbReview page);
	
	// PB 상품 문의 답변
	public void updateInquiryAnswer(StorePBInquire storePBInquire);
	
	// PB 상품 결제
	public void insertPBPayment(StorePBPayment storePBPayment);
	public StorePBPayment selectPBPaymentByNo(int paymentNo);
	public List<StorePBPayment> selectBuyList(int memNo);
	
	// PB 상품 장바구니
	public void insertPBCart(StorePBCart storePBCart);
	public List<StorePBCart> selectPBCartByMember(int memNo);
	// pb 상품 장바구니 삭제
	public void deletePBCart(int cartNo);
	public void updateRatingByMember(StorePB spb);
	
	// PB 상품 좋아요 기능
	public void insertPBLike(StorePBLike pbLike);
	public void updatePBLike(StorePBLike pbLike);
	public void updateLikeCnt(int no);
	public void deleteLikeCnt(int no);
	public int selectCountLike(StorePBLike pbLike);
	public String selectLikeStatus(StorePBLike pbLike);
	public int countLikeCnt(int no);	
}
