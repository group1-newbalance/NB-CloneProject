package manager.service;

import java.util.List;

import member.domain.MemberDTO;



public class MemberView { 
   // 목록 list + 페이징처리 pageBlock

   // list
   private List<MemberDTO> memberList; // 방명록 목록을 저장할 ArrayList<> list

   // PageBlock
   private int memberTotalCount;   // 총 게사글 수   
   private int pageTotalCount;      // 총페이지 수
   private int currentPageNumber;   // 현재 페이지 번호
   private int memberCountPerPage; // 한 페이지에 출력할 회원정보 수
   private int firstRow;            // 시작
   private int endRow;              // 끝

   // 생성자
   public MemberView(
         List<MemberDTO> memberList,
         int memberTotalCount, 
         int currentPageNumber,
         int memberCountPerPage, 
         int startRow, int endRow) {

      this.memberList = memberList;
      this.memberTotalCount = memberTotalCount;
      this.currentPageNumber = currentPageNumber;
      this.memberCountPerPage = memberCountPerPage;
      this.firstRow = startRow;
      this.endRow = endRow;

      // 총 페이지수를 계산하는 메소드
      calculatePageTotalCount();
   }

   // 총페이지수를 계산해서 반환하는 메서드 
   private void calculatePageTotalCount() {
      if (memberTotalCount == 0) {
         pageTotalCount = 0;
      } else {
         /*
          * pageTotalCount = messageTotalCount / messageCountPerPage;
          *  if (messageTotalCount % messageCountPerPage > 0) 
          *  { pageTotalCount++; }
          */
         pageTotalCount =
               (int)( Math.ceil((double)memberTotalCount / memberCountPerPage ));
      }
   }


   public List<MemberDTO> getMemeberList() {
      return memberList;
   }

   public int getMemeberTotalCount() {
      return memberTotalCount;
   }

   public int getPageTotalCount() {
      return pageTotalCount;
   }

   public int getCurrentPageNumber() {
      return currentPageNumber;
   }

   public int getMemeberCountPerPage() {
      return memberCountPerPage;
   }

   public int getFirstRow() {
      return firstRow;
   }

   public int getEndRow() {
      return endRow;
   }

   // 추가 
   public boolean isEmpty() {
      return this.memberTotalCount == 0 ;
   }

}