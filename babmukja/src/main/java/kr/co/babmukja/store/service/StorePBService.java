package kr.co.babmukja.store.service;

import java.util.List;
import java.util.Map;

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

public interface StorePBService {
	/*
	 *   editor 이전
	public List<StorePB> selectPBList();
	public void insertpb(StorePB storepb);
	public void insertPBImage(FileVO fileVO);
	public int getMax();
	public List<StorePB> selectPBMainList();
	
	// 상세조회
	public StorePB selectPBdetail(int pbNo);
	public List<FileVO> selectPBDetailImage(int groupNo);
	
	// 삭제
	public void deletePBByNo(int pbNo);
	*/
	
	public List<StorePB> selectPBStore();
	public List<StorePB> selectPBBestItem();
	public Map<String, Object> selectPBStoreList(Pagepb page);
	public StorePB selectPBStoreByNo(int pbNo);
	// public Map<String, Object> selectAdminPBList(Pagepb page);
	//public void insertPBStore(StorePB storepb);
	public StorePB updateFormPBStore(int pbNo);
	public void updatePBStore(StorePB storepb);
	//public void deletePBStore(int no);
	public int selectPBStoreCount(Pagepb page);
	public void addViewCnt(int pbNo);
	
	// 후기
	public void insertPBReview(StorePBReview reviewpb,StorePB spb);
	public void insertPBReviewImage(FileVO fileVO);
	public int getMax();
	public List<StorePBReview> selectPBReviewSelect(StorePBReview storePBReview);
	//public List<ReviewFileVO> selectPBReviewSelectImage(int pbReivewNo);
	public List<StorePBReview> selectReview(PagePbReview page);
	public List<ReviewFileVO> selectReviewFile(int pbReviewNo); 
	public StorePBReview selectReviewByNo(int pbReviewNo);
	public void deleteReviewByNo(int pbReviewNo);
	public StorePBReview updatePBReview(StorePBReview storePBReview);
	public int selectReviewCount(PagePbReview page);
	public Map<String, Object> selectReviewAjax(PagePbReview page);
	
	// pb 상품 문의
	public void insertInquiry(StorePBInquire storePBInquire);
	public Map<String, Object> selectPBInquire(PagePbReview page);
	public StorePBInquire selectInquiryByNo(int inquiryNo);
	public void updateInquiry(StorePBInquire storePBInquire);
	public void deleteInquiry(int inquiryNo);
	
	// pb 상품 문의 답변
	public void updateInquiryAnswer(StorePBInquire storePBInquire);
	
	// pb 상품 결제
	public void insertPBPayment(StorePBPayment storePBPayment);
	public StorePBPayment selectPBPaymentByNo(int paymentNo);
	public List<StorePBPayment> selectBuyList(int memNo);
	
	// pb 상품 장바구니
	public void insertPBCart(StorePBCart storePBCart);
	public List<StorePBCart> selectPBCartByMember(int memNo);
	public void deletePBCart(int cartNo);
	
	// pb 상품 좋아요
	public void insertPBLike(StorePBLike pbLike);
	public void updatePBLike(StorePBLike pbLike);
	public void updateLikeCnt(int no);
	public void deleteLikeCnt(int no);
	public int selectCountLike(StorePBLike pbLike);
	public String selectLikeStatus(StorePBLike pbLike);
	public int countLikeCnt(int no);	
}
