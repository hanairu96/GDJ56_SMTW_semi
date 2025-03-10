# [세미 프로젝트] Show Me The Way

- Show Me The Way는 워킹홀리데이 관련 정보 제공 및 친구 맺기 등을 할 수 있는 워킹홀리데이 사이트입니다.
- 기본적으로 JSP와 Servlet, JDBC를 이용해 구현했습니다.

## 1. 제작 기간 및 참여 인원
- 기간: 2022.10.17~2022.12.23
- 인원: 6명

## 2. 개발 환경
- 프로그래밍 언어: Java 11, JavaScript
- 프레임워크: MyBatis, Bootstrap
- 라이브러리: jQuery, Lombok, JSTL, Gson, JavaMail
- IDE: Eclipse, SQL Developer
- DBMS: Oracle Database
- WAS: Apache Tomcat v9.0
- 기타 웹 기술: JSP, Ajax
- 버전 관리: GitHub

## 3. 화면
<img src="https://github.com/hanairu96/GDJ56_SMTW_semi/assets/118409554/3f4a0928-e1bf-4275-a043-e7f986fdbde9"/>
<img src="https://github.com/hanairu96/GDJ56_SMTW_semi/assets/118409554/bf7a83db-2cf2-4910-ae22-22667ebef41b"/>

## 4. ERD 설계
<img src="https://user-images.githubusercontent.com/118409554/221806784-fcba7710-736e-475e-89d1-a81b173003d7.png"/>

- ERD는 ERDCloud 사이트를 사용했습니다.

## 5. 담당한 기능
- 제작자 소개 페이지
- 워홀 프렌즈 구하기 게시판
- 친구 신청 기능
- 관리자 페이지(회원 관리 및 검색, Q&A 관리, 쪽지함)
- 권한 없는 접근 시 에러 메시지(Filter 사용)

## 6. 구현한 기능 설명
<details>
  <summary><b>1. 친구 신청</b></summary>

####
- [friendsApply.jsp](https://github.com/hanairu96/GDJ56_SMTW_semi/blob/master/GDJ56_smtw_semi/src/main/webapp/views/friends/friendsApply.jsp)
  - 친구 신청하기 버튼을 누르면 나오는 자기소개글 입력 창이다.
  - form의 textarea에 자기소개글을 입력하고 신청 버튼을 누르면 apply() 메소드가 실행된다.
  - 다시 확인 버튼을 클릭하면 form이 submit된다.
  - form의 action 속성에 적힌 매핑 주소 값을 가진 서블릿으로 이동한다.
- [FriendsApplyEndServlet.java](https://github.com/hanairu96/GDJ56_SMTW_semi/blob/master/GDJ56_smtw_semi/src/main/java/com/smtw/friends/controller/FriendsApplyEndServlet.java)
  - doGet 메소드에서 request.getParameter() 메소드로 form에 입력한 값들을 받는다.
  - 받아온 값들을 이용하여 Builder 패턴으로 ApplyFriends 객체를 생성한다.
  - 해당 객체를 매개변수로 하는 Service의 메소드를 호출하고 그 메소드는 다시 Dao의 메소드를 호출한다.
  - [Dao](https://github.com/hanairu96/GDJ56_SMTW_semi/blob/master/GDJ56_smtw_semi/src/main/java/com/smtw/friends/model/dao/FriendsDao.java)에서는 Connection 객체의 prepareStatement() 메소드에 SQL문을 대입하고 executeUpdate()로 SQL문을 실행한다.
  - SQL문의 결과로 APPLY_FRIENDS 테이블에 새로운 컬럼이 INSERT된다.
  - 최종적으로 서블릿에서는 메소드의 결과에 따라 HttpServletRequest의 getRequestDispatcher()에 입력한 주소로 요청을 보내 이동시킨다.

</details>

<details>
  <summary><b>2. 권한 없는 접근 시 에러 메시지</b></summary>

####
- [AdminCheckFilter.java](https://github.com/hanairu96/GDJ56_SMTW_semi/blob/master/GDJ56_smtw_semi/src/main/java/com/smtw/common/filter/AdminCheckFilter.java)
  - Filter 인터페이스를 구현하는 필터 클래스이다.
  - @WebFilter()에 "/admin/*"를 적어서 admin의 하위 주소로 접근 시 필터가 작동되게 한다.
  - doFilter() 메소드에서 HttpSession 인터페이스를 이용해 session을 생성한다.
  - session에서 이름이 logInMember인 것을 찾고 Member 타입으로 형변환을 하여 logInMember 객체를 생성한다.
  - logInMember 객체의 id가 ADMIN이면 chain.doFilter(request, response)를 호출하고 최초 요청된 서블릿을 실행시킨다.
  - id가 ADMIN이 아니면 커스텀 예외인 [AccessException](https://github.com/hanairu96/GDJ56_SMTW_semi/blob/master/GDJ56_smtw_semi/src/main/java/com/smtw/common/exception/AccessException.java)로 throw시킨다.
- [web.xml](https://github.com/hanairu96/GDJ56_SMTW_semi/blob/master/GDJ56_smtw_semi/src/main/webapp/WEB-INF/web.xml)
  - error-page 태그에 AccessException 예외가 발생하면 accessError.jsp로 이동하도록 작성한다.
- [accessError.jsp](https://github.com/hanairu96/GDJ56_SMTW_semi/blob/master/GDJ56_smtw_semi/src/main/webapp/views/common/error/accessError.jsp)
  - alert()로 잘못된 접근임을 알린 뒤 exception.getMessage()로 AccessException의 메시지를 보여준다.
  - 메시지를 보여주고 setTimeout() 메소드을 통해 3초 뒤 프로젝트 Path로 페이지를 이동시킨다.
</details>

## 7. 트러블 슈팅
<details>
  <summary><b>자동 submit 문제</b></summary>

#### 문제
- form의 button을 클릭하면 confirm()으로 정말로 신청할 것인지 여부를 묻는 메시지가 뜨고, 확인 버튼을 눌러야 submit되도록 구상함
- 그러나 취소 버튼을 눌러도 submit이 되는 문제가 발생
#### 원인
- form 안에 있는 button 태그는 별도로 지정하지 않으면 type="submit"으로 지정되도록 원래부터 구현되어 있음
#### 해결
- form의 의도치 않은 submit를 막으려면 아래의 두 가지 방법 사용이 가능
  - button 태그에 type="button"을 추가
  - form 태그에 onsubmit="return false;"을 추가해 기본적으로 submit이 되지 않도록 함
- onsubmit="return false;"을 추가한 후 confirm의 결과가 true일 때만 submit()이 실행되도록 구현해 해결함

<div markdown="1">

```javascript
<form action="<%=request.getContextPath() %>/friends/friendsApplyEnd.do" onsubmit="return false;">
  //생략
  <button onclick="apply(this.form);">신청</button>
</form>
```
```javascript
const apply=(f)=>{
  //생략
  let check=confirm("정말로 친구 신청을 등록하시겠습니까?");
  if(check){
    f.submit();
  }
}
```

</div>
</details>

## 8. 회고
#### 만족한 점
- 첫 프로젝트를 별 다른 문제 없이 완성한 점
#### 아쉬운 점
- ajax를 사용해보지 못한 점
- 사이트에서 디자인적으로 미흡한 부분이 일부 존재한 점
