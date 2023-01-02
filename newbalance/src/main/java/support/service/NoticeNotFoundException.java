package support.service;

import manager.service.ServiceException;

// 사용자 정의 예외 클래스
// 메시지를 찾을 수 없을 경우에 예외 발생시킨다. 
public class NoticeNotFoundException extends ServiceException{
    
    public NoticeNotFoundException(String notice) {
       super(notice);
    }
    
}