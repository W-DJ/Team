$(function(){


/*NoticeWriteBtn*/

	/* 공지사항 게시판 리스트 페이지 글쓰기 버튼 시작 /bbs_Notice/noticebbs.jsp */	
	$("#loginAlertBtn").click(function(){		
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
	});	
	
	$("#writeBtn").click(function(){		
		location.href="/bbs_Inquire/write.jsp";
	});
	/* 문의게시판 리스트 페이지 글쓰기 버튼 끝 /bbs/list.jsp */


$("button#noticeBtn").click(function(){
	
	$("iframe#ifrNotice").css({
		"display":"none"
		
	});
});





	/* 문의게시판 리스트 페이지 글쓰기 버튼 시작 /bbs/list.jsp */	
	$("#loginAlertBtn").click(function(){		
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
	});	
	
	$("#writeBtn").click(function(){		
		location.href="/bbs_Inquire/write.jsp";
	});
	/* 문의게시판 리스트 페이지 글쓰기 버튼 끝 /bbs/list.jsp */
	
	
	/* 글쓰기 페이지 게시글 등록 시작 /bbs/write.jsp */
	$("#regBtn").click(function(){
		let subject = $("#subject").val().trim();		
		
		 if (subject == "") {
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else {
			$("#writeFrm").attr("action", "/bbs_Inquire/writeProc.jsp");
			$("#writeFrm").submit();
		}
	
	});	
	
	/* 글쓰기 페이지 게시글 등록 끝 /bbs/write.jsp */
	
	
	
		/* 글쓰기 페이지 게시글 수정 시작 /bbs/modify.jsp */
	$("#modProcBtn").click(function(){
		let subject = $("#subject").val().trim();		
		
		 if (subject == "") {
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else {
			$("#modFrm").attr("action", "/bbs_Inquire/modifyProc.jsp");
			$("#modFrm").submit();
		}
	
	});	
	
	/* 글쓰기 페이지 게시글 수정 끝 /bbs/modify.jsp */
	
	
	
	/* 게시글 삭제버튼 시작 /bbs/read.jsp */
	$("button#delBtn").click(function(){
		
		let chkTF = confirm("게시글을 삭제하시겠습니까?");
		
		if (chkTF) {
			let nowPage = $("input#nowPage").val().trim();
			let num = $("input#num").val().trim();
					
			let p3 = $("#pKeyField").val().trim();  // p3 : keyField
		    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
		    
			let url = "/bbs_Inquire/deleteProc.jsp?";
				url += "num="+num+"&nowPage="+nowPage;
/*				url += "&keyField="+p3;
				url += "&keyWord="+p4;*/
			location.href=url;
		} else {
			alert("취소하셨습니다.");	
		}
		
	});
	/* 게시글 삭제버튼 끝 /bbs/read.jsp */

	
});

	
/* 상세내용 보기 페이지 이동 시작 /bbs/list.jsp => read.jsp */
function read(p1, p2) {
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	let param = "/bbs_Inquire/read.jsp?num="+p1;
	     param += "&nowPage="+p2;
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href=param;
}		
/* 상세내용 보기 페이지 이동 끝 /bbs/list.jsp => read.jsp  */

