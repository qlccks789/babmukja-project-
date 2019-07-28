package kr.co.babmukja.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PBPageResult;
import kr.co.babmukja.common.page.PBReviewPageResult;
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
import kr.co.babmukja.repository.mapper.StorePBMapper;

@Service("kr.co.babmukja.store.service.StorePBService")
public class StorePBServiceImpl implements StorePBService{

	@Autowired
	private StorePBMapper mapper;

	public List<StorePB> selectPBStore() {
		return mapper.selectPBStore();
	}
	
	public List<StorePB> selectPBBestItem() {
		return mapper.selectPBBestItem();
	}
	
	public void addViewCnt(int pbNo) {
		mapper.addViewCnt(pbNo);
	}
	
	public Map<String, Object> selectPBStoreList(Pagepb page) {
		Map<String, Object> map = new HashMap<>();
		map.put("sortType", page.getSortType());
		map.put("list", mapper.selectPBStoreList(page));
		map.put("pageResult", new PBPageResult(page.getPageNo(), mapper.selectPBStoreCount(page)));
		return map;
	}
	
	public StorePB selectPBStoreByNo(int pbNo) {
		return mapper.selectPBStoreByNo(pbNo);
	}
	
	public StorePB updateFormPBStore(int pbNo) {
		return mapper.selectPBStoreByNo(pbNo);
	}
	
	public void updatePBStore(StorePB storepb) {
		mapper.updatePBStore(storepb);
	}
	
	public void insertPBReview(StorePBReview reviewpb,StorePB spb) {
		mapper.insertPBReview(reviewpb);
		mapper.updateRatingByMember(spb);
	}
	
	public void insertPBReviewImage(FileVO fileVO) {
		mapper.insertPBReviewImage(fileVO);
	}
	
	public int getMax() {
		return mapper.selectMaxNum();
	}
	
	public int selectPBStoreCount(Pagepb page) {
		return mapper.selectPBStoreCount(page);
	}
	
	// 후기
	public List<StorePBReview> selectPBReviewSelect(StorePBReview storePBReview) {
		return mapper.selectPBReviewSelect(storePBReview);
	}
	
	public int selectReviewCount(PagePbReview page) {
		return mapper.selectReviewCount(page);
	}
	
//	public Map<String, Object> selectReviewByNo(PagePbReview page) {
//		Map<String, Object> result = new HashMap<>();
//		List<ReviewMap> reviewMap = new ArrayList<>();
//		List<StorePBReview> reviewList = mapper.selectReview(page);
//		for (StorePBReview pb : reviewList) {
//			List<ReviewFileVO> reviewFileList = mapper.selectReviewFile(pb.getPbReviewNo());
//			ReviewMap rm = new ReviewMap();
//			rm.setReviewFile(reviewFileList);
//			rm.setReviewList(pb);
//			rm.setMember(pb.getMember());
//			reviewMap.add(rm);
//		}
//		result.put("list", mapper.selectReview(page));
//		result.put("pageResult", new PBReviewPageResult(page.getPageNo(), mapper.selectReviewCount(page)));
//		result.put("reviewMap", reviewMap);
//		return result;
//	}
	public List<StorePBReview> selectReview(PagePbReview page) {
		return mapper.selectReview(page);
	}
	
	public Map<String, Object> selectReviewAjax(PagePbReview page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectReviewAjax(page));
		result.put("pageResult", new PBReviewPageResult(page.getPageNo(), mapper.selectReviewCount(page)));
		return result;
	}
	
	public List<ReviewFileVO> selectReviewFile(int pbReviewNo) {
		return mapper.selectReviewFile(pbReviewNo);
	}
	
	public StorePBReview selectReviewByNo(int pbReviewNo) {
		return mapper.selectReviewByNo(pbReviewNo);
	}
	
	public void deleteReviewByNo(int pbReviewNo) {
		mapper.deleteReviewByNo(pbReviewNo);
	}
	
	// 후기 페이징
	
	
	
	// pb 후기 수정
	
	public StorePBReview updatePBReview(StorePBReview storePBReview) {
		return mapper.updatePBReview(storePBReview);
	}
	
//	public List<ReviewFileVO> selectPBReviewSelectImage(int pbReivewNo) {
//		return mapper.selectPBReviewSelectImage(pbReivewNo);
//	}
	
	
	// PB 상품 문의
	public void insertInquiry(StorePBInquire storePBInquire) {
		mapper.insertInquiry(storePBInquire);
	}
	
	// pb 상품 문의 조회
	public Map<String, Object> selectPBInquire(PagePbReview page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectPBInquire(page));
		result.put("pageResult", new PBReviewPageResult(page.getPageNo(), mapper.selectInquireCount(page)));
		return result;
	}
	
	
	public StorePBInquire selectInquiryByNo(int inquiryNo) {
		return mapper.selectInquiryByNo(inquiryNo);
	}
	
	public void updateInquiry(StorePBInquire storePBInquire) {
		mapper.updateInquiry(storePBInquire);
	}
	
	public void deleteInquiry(int inquiryNo) {
		mapper.deleteInquiry(inquiryNo);
	}
	
	// PB 상품 문의 답변
	
	public void updateInquiryAnswer(StorePBInquire storePBInquire) {
		mapper.updateInquiryAnswer(storePBInquire);
	}
	
	// pb 상품 결제
	public void insertPBPayment(StorePBPayment storePBPayment) {
		mapper.insertPBPayment(storePBPayment);
	}
	
	public StorePBPayment selectPBPaymentByNo(int paymentNo) {
		return mapper.selectPBPaymentByNo(paymentNo);
	}
	
	public List<StorePBPayment> selectBuyList(int memNo) {
		return mapper.selectBuyList(memNo);
	}
	
	// pb 상품 장바구니
	
	public void insertPBCart(StorePBCart storePBCart) {
		mapper.insertPBCart(storePBCart);
	}
	
	public List<StorePBCart> selectPBCartByMember(int memNo) {
		return mapper.selectPBCartByMember(memNo);
	}
	
	public void deletePBCart(int cartNo) {
		mapper.deletePBCart(cartNo);
	}
	
	// pb 상품 좋아요
	public void insertPBLike(StorePBLike pbLike) {
		mapper.insertPBLike(pbLike);
	}
	public void updatePBLike(StorePBLike pbLike) {
		mapper.updatePBLike(pbLike);
	}
	public void updateLikeCnt(int no) {
		mapper.updateLikeCnt(no);
	}
	public void deleteLikeCnt(int no) {
		mapper.deleteLikeCnt(no);
	}
	public int selectCountLike(StorePBLike pbLike) {
		return mapper.selectCountLike(pbLike);
	}
	public String selectLikeStatus(StorePBLike pbLike) {
		return mapper.selectLikeStatus(pbLike);
	}
	public int countLikeCnt(int no) {
		return mapper.countLikeCnt(no);
	}
}
