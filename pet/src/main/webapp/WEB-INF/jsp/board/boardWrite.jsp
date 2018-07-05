<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.wrap{width:800px;margin:0 auto}
table{border-collapse:collapse;border-spacing:0}
a{text-decoration:none;color:inherit}
a:hover{text-decoration:none}
.button{margin:0;padding:0;width:40px;height:22px;font-size:12px;color:#fff;line-height:20px;border:none;background:#333;cursor:pointer}
</style>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<%@ include file="/WEB-INF/include/include-menuBar.jsp" %>
<script type="text/javascript">
	var gfv_count = 1
	$(document).ready(function(){
	    $("#list").on("click", function(e){ //목록으로 버튼
	        e.preventDefault();//디폴트 액션x
	        fn_openBoardList();
	    });
	     
	    $("#write").on("click", function(e){ //작성하기 버튼
	        e.preventDefault();
	        fn_insertBoard();
	    });
	    $("#addFile").on("click", function(e){ //파일 추가 버튼
	        e.preventDefault();
	        fn_addFile();
	    });
	     
	    $("a[name='delete']").on("click", function(e){ //삭제 버튼
	        e.preventDefault();
	        fn_deleteFile($(this));
	    });
	});
	 
	function fn_openBoardList(){
	    var comSubmit = new ComSubmit();
	    comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
	    comSubmit.submit();
	}
	 
	function fn_insertBoard(){
	    var comSubmit = new ComSubmit("frm");
	    comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
	    comSubmit.submit();
	}
	function fn_addFile(){
	    var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='button' name='delete'>삭제</a></p>";
	    $("#fileDiv").append(str);
	    $("a[name='delete']").on("click", function(e){ //삭제 버튼
	        e.preventDefault();
	        fn_deleteFile($(this));
	    });
	}
	 
	function fn_deleteFile(obj){
	    obj.parent().remove();
	}
</script>
</head>
<body>
<form id="commonForm" name="commonForm"></form>
<div class="wrap">
    <form id="frm" name="frm" enctype="multipart/form-data">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <caption>게시글 작성</caption>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="BOARD_TITLE" name="BOARD_TITLE" class="wdp_90"></input></td>
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="BOARD_CONTENTS" name="BOARD_CONTENTS"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
	    <div id="fileDiv">
            <p>
                <input type="file" id="file" name="file_0">
                <a href="#this" class="btn" id="delete" name="delete">삭제</a>
            </p>
        </div>
		<a href="#this" class="button" id="addFile">파일 추가</a>
        <a href="#this" class="button" id="write" >작성하기</a>
        <a href="#this" class="button" id="list" >목록으로</a>
    </form>
</div>    
</body>
</html>