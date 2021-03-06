<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/include-header.jsp" %>
<style>
div#content{
	background-color:lightgray;
	display:none;
	width:400px;
}
div#wapper{
	position:relative;
}
</style>
<script src='<c:url value="../js/jquery/jquery-3.3.1.js"/>'></script>
<script src='<c:url value="../js/jquery.min.js"/>'></script>
<script src='<c:url value="../js/ajax.js"/>'></script>
<script type="text/javascript" src="../js/jquery.oLoader.min.js"></script>
<script>
	$(function(){
		$(".delBtn").on("click",function(e){
			e.preventDefault();
			var $obj=(this.parentNode.parentNode.children[0].innerText);
			var tr = (this.parentNode.parentNode);
			commonModule.fn_ajax({ID:$obj},"<c:url value='/admin/deleteMember.do' />",
					  function(data){
						tr.remove();
					},function(){
						
					});
				}
			);	

		$(".paaroBtn").on("click", function(e){
			e.preventDefault();
			var auth =(this.parentNode.parentNode.children[4].innerText);
			var val = (this.parentNode.parentNode.children[4].firstChild);
			var $obj=(this.parentNode.parentNode.children[0].innerText);
			var url = "<c:url value='/admin/authorize.do' />";
			if(auth=="N"){	
				commonModule.fn_ajax({ID:$obj},url,
				  function(data){
					val.text=data.result;
				},function(){
					
				});
			}else{
				commonModule.fn_ajax({ID:$obj},"<c:url value='/admin/delAuthority.do' />",
				  function(data){
					val.text=data.result;
				  },function(){
							 	
				  });
			}
		});
	});
</script>
</head>
<body>
<h2>회원 목록</h2>
<p align="right"><font size="2em">탈퇴 버튼 클릭시 바로 탈퇴 됩니다. 신중하게 클릭해주세요.</font></p>
<table class=member_list style="border:1px solid #ccc;width:100% ">
    <thead>
        <tr>
            <th scope="col">아이디</th>
            <th scope="col">이름</th>
            <th scope="col">핸드폰번호</th>
            <th scope="col">이메일</th>
            <th scope="col">권한</th>
            <th scope="col">탈퇴</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list }" var="row">
                    <tr>
                        <td>${row.USER_ID }
                        <input type="hidden" id="ID" class="ID" value="${row.USER_ID }"></td>
                        <td>${row.USER_NM }</td>
                        <td>${row.USER_PHONE }</td>
                        <td>${row.USER_EMAIL }</td>
                        <td id="paaro"><a href="javascript:void(0);" class="paaroBtn">${row.USER_AUTH }</a>
                        <input type="hidden" class="PAARO" value="${row.USER_AUTH }"></td>
                        <td><a href="javascript:void(0);"  class="delBtn" id="del">탈퇴</a></td>
                    </tr>
                </c:forEach>
            </c:when>
        	<c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>         
    </tbody>
</table>
   <br/>
<%@ include file="/WEB-INF/include/include-body.jsp" %>
</body>
</html>
