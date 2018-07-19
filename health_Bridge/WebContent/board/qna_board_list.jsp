<%@page import="vo.PageInfo"%>
<%@page import="vo.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
	ArrayList<BoardBean> articleList=(ArrayList<BoardBean>)request.getAttribute("articleList");
    PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MVC 게시판</title>
<style type="text/css">
#registForm {
	width: 500px;
	height: 600px;
	border: 1px solid red;
	margin: auto;
}

h2 {
	margin-left:20px;
}

table {
	
	width: 100%;
}

#tr_top {
	background-color: #F5F5DC;
	text-align: center;
	margin:0px;
}

#pageList {
	font-size:13px;
	margin: auto;
	width: 500px;
	text-align: center;
}

#emptyArea {
	margin: auto;
	width: 500px;
	text-align: center;
}
</style>
</head>

<body>
	<!-- 게시판 리스트 -->

	<section id="listForm">
		<h2>커뮤니티</h2>
		<button value="글쓰기" onclick="boardWriteForm.bo" style="float:right;margin-bottom:25px" >글쓰기</button>
		<table>
			<% if(articleList != null && listCount > 0){%>

			<tr id="tr_top">
				<td style="width:50px;">번호</td>
				<td style="width:250px;">제목</td>
				<td style="width:70px;">작성자</td>
				<td style="width:70px;">날짜</td>
				<td style="width:50px;">조회수</td>
			</tr>

			<%for(int i=0;i<articleList.size();i++){%>
			<tr >
				<td style="text-align:center;"><%=articleList.get(i).getBOARD_NUM()%></td>

				<td>
					<%if(articleList.get(i).getBOARD_RE_LEV()!=0){ %> <%for(int a=0;a<=articleList.get(i).getBOARD_RE_LEV()*2;a++){ %>
					&nbsp; <%} %>▶<%}else{ %>  <%} %> <a
					href="boardDetail.bo?board_num=<%=articleList.get(i).getBOARD_NUM()%>&page=<%=nowPage%>">
						<%=articleList.get(i).getBOARD_SUBJECT()%>
				</a>
				</td>

				<td style="text-align:center;"><%=articleList.get(i).getBOARD_NAME() %></td>
				<td style="text-align:center;"><%=articleList.get(i).getBOARD_DATE() %></td>
				<td style="text-align:center;"><%=articleList.get(i).getBOARD_READCOUNT() %></td>
			</tr>
			<%} %>
		</table>
	</section>

	<section id="pageList">
		<%if(nowPage<=1){ %>
		[이전]&nbsp;
		<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
		<%} %>

		<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
		[<%=a %>]
		<%}else{ %>
		<a href="boardList.bo?page=<%=a %>">[<%=a %>]
		</a>&nbsp;
		<%} %>
		<%} %>

		<%if(nowPage>=maxPage){ %>
		[다음]
		<%}else{ %>
		<a href="boardList.bo?page=<%=nowPage+1 %>">[다음]</a>
		<%} %>
	</section>
	<%
    }
	else
	{
	%>
	<section id="emptyArea">등록된 글이 없습니다.</section>
	<%
	}
%>

</body>
</html>