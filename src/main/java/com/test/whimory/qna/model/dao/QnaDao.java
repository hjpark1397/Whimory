package com.test.whimory.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.whimory.common.Paging;
import com.test.whimory.common.SearchDate;
import com.test.whimory.qna.model.vo.QnaAnswer;
import com.test.whimory.qna.model.vo.QnaQuestion;

@Repository("qnaDao")
public class QnaDao {
	@Autowired
	SqlSessionTemplate sqlSession;	// Spring DI
	
	// qna 질문 리스트 전체 조회
	public ArrayList<QnaQuestion> selectList(Paging page){
		List<QnaQuestion> list = sqlSession.selectList("qnaMapper.selectList", page);
		return (ArrayList<QnaQuestion>) list;
	}
	
	// 질문 글 번호로 상세보기 처리
	public QnaQuestion selectOne(int qq_no) {
		return sqlSession.selectOne("qnaMapper.selectOne", qq_no);
	}
	
	// 질문 등록
	public int insertQuestion(QnaQuestion question) {
		return sqlSession.insert("qnaMapper.insertQuestion", question);
	}
	
	// 질문 수정
	public int updateQuestion(QnaQuestion question) {
		return sqlSession.update("qnaMapper.updateQuestion", question);
	}
	
	// 질문 삭제
	public int deleteQuestion(int qq_no) {
		return sqlSession.delete("qnaMapper.deleteQuestion", qq_no);
	}
	
	// 답변 등록
	public int insertAnswer(QnaAnswer answer) {
		return sqlSession.insert("qnaMapper.insertAnswer", answer);
	}
	
	// 답변 삭제
	public int deleteAnswer(int qa_no) {
		return sqlSession.delete("qnaMapper.deleteAnswer", qa_no);
	}
	
	public int selectListCount() {
		return sqlSession.selectOne("qnaMapper.selectListCount");
	}
	
	// 작성자로 질문 검색
	public ArrayList<QnaQuestion> selectSearchWriter(String keyword){
		List<QnaQuestion> list = sqlSession.selectList("qnaMapper.selectSearchWriter", keyword);
		return (ArrayList<QnaQuestion>) list;
	}
	
	// 제목으로 질문 검색
	public ArrayList<QnaQuestion> selectSearchTitle(String keyword){
		List<QnaQuestion> list = sqlSession.selectList("qnaMapper.selectSearchTitle", keyword);
		return (ArrayList<QnaQuestion>) list;
	}
	
	// 질문 분류로 질문 검색
	public ArrayList<QnaQuestion> selectSearchCategory(String keyword){
		List<QnaQuestion> list = sqlSession.selectList("qnaMapper.selectSearchCategory", keyword);
		return (ArrayList<QnaQuestion>) list;
	}
	
	// 질문 등록 날짜로 질문 검색
	public ArrayList<QnaQuestion> selectSearchDate(SearchDate sdate){
		List<QnaQuestion> list = sqlSession.selectList("qnaMapper.selectSearchDate", sdate);
		return (ArrayList<QnaQuestion>) list;
	}
	
	// 답변 조회
	public ArrayList<QnaAnswer> selectAnswerList(int qq_no){
		List<QnaAnswer> list = sqlSession.selectList("qnaMapper.selectAnswerList", qq_no);
		return (ArrayList<QnaAnswer>) list; 
	}

	// 답변 여부 y 업데이트
	public int updateQqyn(int qq_no) {
		return sqlSession.update("qnaMapper.updateQqyn", qq_no);
	}
	
	// 답변 여부 n 업데이트
	public int updateQQYN(int qq_no) {
		return sqlSession.update("qnaMapper.updateQQYN", qq_no);
	}
}
