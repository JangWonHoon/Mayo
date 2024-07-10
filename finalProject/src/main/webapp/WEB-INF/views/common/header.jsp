<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <title>Document</title>
  <style>
    @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

html {
    font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body, ul, li, h1 {
    margin:0;
    padding:0;
    list-style:none;
}

a {
    color:inherit;
    text-decoration:none;
}

/* 라이브러리 */
.con {
    margin:0 auto;
}

.img-box > img {
    width:100%;
    display:block;
}

.row::after {
    content:"";
    display:block;
    clear:both;
}

.cell {
    float:left;
    box-sizing:border-box;
}

.cell-right {
    float:right;
    box-sizing:border-box;
}

.margin-0-auto {
    margin:0 auto;
}

.block {
    display:block;
}

.inline-block {
    display:inline-block;
}

.text-align-center {
    text-align:center;
}

.line-height-0-ch-only {
    line-height:0;
}

.line-height-0-ch-only > * {
    line-height:normal;
}

.relative {
    position:relative;
}

.absolute-left {
    position:absolute;
    left:0;
}

.absolute-right {
    position:absolute;
    right:0;
}

.absolute-middle {
    position:absolute;
    top:50%;
    transform:translateY(-50%);
}

.width-100p {
    width:100%;
}

.table {
    display:table;
}

.table-cell {
    display:table-cell;
}

.vertical-align-top {
    vertical-align:top;
}

.vertical-align-middle {
    vertical-align:middle;
}

.vertical-align-bottom {
    vertical-align:bottom;
}

/* 커스텀 */

.con {
    width:1180px;
}

.con-min-width {
    min-width:1180px;
}

/* 반응형 레이아웃 */
/*
.con {
    max-width:1150px;
}

.con-min-width {
    min-width:320px;

html, body {
    overflow-x:hidden;
}
*/

body {background:rgb(255, 255, 255);}

header {    
    background:-webkit-linear-gradient(rgb(91, 143, 255) 50px,rgba(40, 139, 143, 0.2) 50px);
    transition: 0.3s ease-in;
    height:50px;
    overflow:hidden;
}

nav {width:960px; margin:0 auto;}
nav > ul {display: flex; align-items: center;}
nav > ul > li {float:left; line-height:50px; margin-right:130px; position: relative;}
nav > ul > li ul{ width:100%; opacity:0; position: absolute; transition:0.3s 0.2s;}
nav > ul > li ul li{white-space:nowrap;}

nav > ul > li:hover ul{opacity:1; }

.login-menu { margin-left: auto; }

  </style>
</head>
<body>
  <header>
    <nav>
        <ul class="clearfix">
            <li>메뉴 1
                <ul>
                    <li>상세 1</li>
                    <li>상세 2</li>
                </ul>
            </li>
            <li>상좀~!
                <ul>
                    <li><a href="list.st">사앙저엄</a></li>
                    <li>상세 2</li>
                    <li>상세 3</li>
                    <li>상세 4</li>
                </ul>
            </li>
            <li>리뷰게시판
                <ul>
                    <li><a href="test.re">리뷰게시판</a></li>
                    <li><a href="list.re">클론게시판(test) </a></li>
                    <li><a href="rank.ra">랭킹</a></li>
                </ul>
            </li>
            <li>메뉴 4
                <ul>
                    <li><a href="list.fr">자유 게시판</a></li>
                    <li><a href="list.cs">고객 센터</li>
                    <li>상세 3</li>
                </ul>
            </li>
            <c:choose>
                <c:when test="${not empty loginUser}">
                    <li class="login-menu">
                        <c:out value="${loginUser.memberNick}"/>님 환영!
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/mypage.me">마이페이지</a></li>
                            <li><a href="${pageContext.request.contextPath}/logout.me">로그아웃</a></li>
                        </ul>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="login-menu"><a href="${pageContext.request.contextPath}/login.me">로그인</a>
					    <ul>
					        <li><a href="${pageContext.request.contextPath}/login.me">로그인하기</a></li>
					    </ul>
					</li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
  </header>

  <script>
    $(function(){
        var $firstmenu = $('nav > ul > li'),
            $header = $('header');
        $firstmenu.mouseenter(function(){
           $header.stop().animate({height:'300px'},200);
        })
        .mouseleave(function(){
            $header.stop().animate({height:'50px'},200);
        });
    });
  </script>
</body>
</html>
