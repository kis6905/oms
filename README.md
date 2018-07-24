## 개요
* Open Object Management System
* 법카 내역 관리, excel 다운로드
* 지출 결의 결재, excel 다운로드

## 기술 스택
* Spring legacy(4.x)
* Spring Security
* Web push(주석 처리)

## 이슈
* 지출 결의 영수증 실물이 필요하다 하여, 영수증 업로드 기능은 구현했으나 의미 없음.<br/>
  그로 인해 사용성이 매우 떨어짐.<br/>
  그나마 원격으로 결재하는 기능이 이 프로젝트의 존재 의미.
* 결재 요청을 받으면 Web Push로 알림을 주려 했으나, SSL 인증서가 필요하다.(local에서는 테스트 됨)<br/>
  SSL 인증서 너무 비싸다. 돈이 없다.<br/>
  무료 발급 site가 있는지 확인해 봐야겠다.
* Front(javascript) 쪽 소스 정리를 해야한다. 귀찮아서 안 하고 있는데... 평생 안 할듯?
