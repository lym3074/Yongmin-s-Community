# Yongmin's Community

first Board Project

# Board Project

---

 먼저, **웹 서비스 구현의 전체적인 흐름**을 설명하는 것이 기업에 필요한 기본 역량을 보여주기에 충분하다고 판단되어 이 포트폴리오를 선택하게 되었습니다. CRUD의 기본이 되는 **게시판 프로젝트**를 진행했으며, 주요 기능으로는 커뮤니티 멤버 모두가 열람 가능한 게시판과 자신이 올렸던 게시물을 관리할 수 있는 페이지가 있습니다. 이 프로젝트를 진행하며 d이론적으로만 파악했던 Spring 프레임워크와 myBatis에 대한 구현 능력을 쌓을 수 있었고, 디자인부터 서비스 기능까지 처음부터 끝까지 진행하여 웹 사이트의 구조를 면밀히 파악할 수 있었습니다.

[🛠 개발 전체 요약](https://www.notion.so/95b321f7fbb4495cbb1d2ae875d66637)

> 목차

---

1. 개발 기간
2. 요구사항 정의
3. 프론트엔드 구현

4. 백엔드 구현

5. 맺음말

# 1. 개발 기간

---

- 총 기간 : 2020.12.04 ~ 2021.01.07

![Board%20Project%20bb2472f8614841c7bab7f067ea44f036/_.pptx_-_PowerPoint_2021-01-09_09.58.45.png](Board%20Project%20bb2472f8614841c7bab7f067ea44f036/_.pptx_-_PowerPoint_2021-01-09_09.58.45.png)

# 2. 요구사항 정의

---

![Board%20Project%20bb2472f8614841c7bab7f067ea44f036/KakaoTalk_20210109_125212956.jpg](Board%20Project%20bb2472f8614841c7bab7f067ea44f036/KakaoTalk_20210109_125212956.jpg)

- 🙎🏻‍♂️**사용자**

    *먼저, 페이지를 이용하는 사용자는 회원과 비회원으로 구분한다.*

    - **비회원**은 게시글을 열람할 수는 있으나, **게시글** **작성, 삭제, 수정**에 관해서는 접근할 수 없다. 만약 비회원이 글 작성 페이지를 요청하면 Controller 동작 이전에 Interceptor preHandler가 실행되어 로그인 페이지로 Redirect시킨다.
     비회원은 식별을 위한 서비스 이용이 가능하고, 가입과 로그인을 거친 비회원은 **회원**이 된다.
    - **회원**은 게시글 CRUD 기능을 이용할 수 있다. 하지만 모든 게시글을 제어하는 것은 아니며, 오직 자신이 올린 게시물만 수정, 삭제가 가능하다. 또한 회원은 Board에서 확장된 기능을 수행하는 myPage를 통해 자신의 정보를 직관적으로 알 수 있다.

- 📑**게시판**
    - **Read** : 회원들이 작성한 게시물을 읽을 수 있다. 페이징을 통해  보기 쉽고 정리된 게시물 리스트를 제공하고 제목 클릭 시 게시물의 상세 페이지로 이동한다.
    ※ **Hit** : 게시물 열람 시 조회수를 증가시킨다. 오류로 인해 페이지 요청이 실패한 경우를 대비해 트랜젝션 처리를 통하여 원자성(Atomicity)을 유지한다.
    - **Write** : 회원들만 이용 가능한 기능으로 제목과 전달하고자 하는 내용을 업로드하여 타인에게 제공할 수 있다.
    - **Update** : 작성자가 오직 자신의 게시물에서 접근할 수 있고, 게시글을 수정할 수 있다.
    - **Delete** : 게시글 삭제의 기능을 수행하며, 이 역시 작성자 본인만 접근한다.
    - **Search :** 검색 타입을 제목과 작성자로 구분하여 리스트에서 게시물 검색 기능을 수행한다.

- ⚙**마이페이지**
    - **Information** : Session에 저장된 회원 개인의 정보(아이디, 이름, 이메일, 가입날짜)를 확인할 수 있다.
    - **Board(Extended)** : 회원 본인이 올린 게시물을 관리할 수 있고, 기존 게시판에서 확장된 기능인 일괄 삭제를 이용할 수 있다.

# 3. Front-End

- **Design 관점**

    기업형 웹 서비스에서 사용자에게 제공할 중요한 요소는 간결함이라고 생각됩니다. 디자인에 사용되는 색상을 3개로 한정하여 깔끔한 디자인을 추구하였고, 유저 관점에서 특별히 눈에 띄어야 하는 부분에 관해서만 동적인 효과를 넣었습니다.
    *(문서화를 위해 지엽적인 페이지 공백은 이미지에서 삭제했습니다. 따라서 문서 이미지와 실제 웹 페이지는 차이가 있음을 알려드립니다.)*

- 홈페이지

    ![Board%20Project%20bb2472f8614841c7bab7f067ea44f036/Hello_YongminLand_-_Chrome_2021-01-09_16.21.46.png](Board%20Project%20bb2472f8614841c7bab7f067ea44f036/Hello_YongminLand_-_Chrome_2021-01-09_16.21.46.png)

    member/home.jsp

    > CSS 주요 기능

    ---

    - **메뉴 Hover**

        ![Board%20Project%20bb2472f8614841c7bab7f067ea44f036/Yongmin_Community_header.css_at_main__lym3074_Yongmin_Community_-_Chrome_2021-01-10_20.37.39.png](Board%20Project%20bb2472f8614841c7bab7f067ea44f036/Yongmin_Community_header.css_at_main__lym3074_Yongmin_Community_-_Chrome_2021-01-10_20.37.39.png)

        header.css

        - 메뉴 hover 시, 제목 하단에 흰색 줄이 양쪽으로 벌어지며 **선택할 메뉴를 인식**할 수 있다.

    ---

    - ID, Password 입력

        ![Board%20Project%20bb2472f8614841c7bab7f067ea44f036/CommunityPrj_-_YM_Community_src_main_webapp_resources_css_home.css_-_Spring_Tool_Suite_4_2021-01-10_21.11.14.png](Board%20Project%20bb2472f8614841c7bab7f067ea44f036/CommunityPrj_-_YM_Community_src_main_webapp_resources_css_home.css_-_Spring_Tool_Suite_4_2021-01-10_21.11.14.png)

1. 가입 페이지(Header 생략)

    ![Board%20Project%20bb2472f8614841c7bab7f067ea44f036/Hello_YongminLand_-_Chrome_2021-01-09_16.13.54.png](Board%20Project%20bb2472f8614841c7bab7f067ea44f036/Hello_YongminLand_-_Chrome_2021-01-09_16.13.54.png)

![Board%20Project%20bb2472f8614841c7bab7f067ea44f036/localhost_8080_board_list_-_Chrome_2021-01-09_16.06.49.png](Board%20Project%20bb2472f8614841c7bab7f067ea44f036/localhost_8080_board_list_-_Chrome_2021-01-09_16.06.49.png)

board/list.jsp

member/myPage.jsp

![Board%20Project%20bb2472f8614841c7bab7f067ea44f036/Hello_YongminLand_-_Chrome_2021-01-09_16.16.54.png](Board%20Project%20bb2472f8614841c7bab7f067ea44f036/Hello_YongminLand_-_Chrome_2021-01-09_16.16.54.png)

1. 이것은 프로젝트다.

# 4. Back-End
