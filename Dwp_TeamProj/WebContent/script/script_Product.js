$(function(){
	



	/* 상품 게시글에서 주문 수량 증감 버튼 시작 /bbs/read.jsp */
	$("button#volumnDownBtn").click(function(){
		
		let beforeVol = $("span#orderVolumn").text();
		if(beforeVol>1) {
			$("span#orderVolumn").text(beforeVol-1);
		}
		
	});
	$("button#volumnUpBtn").click(function(){
		
		let beforeVol = $("span#orderVolumn").text();
		beforeVol = parseInt(beforeVol);
		let stockVolumn = $("input[type=hidden]#stockVolumn").val();
		if(beforeVol<stockVolumn) {
			$("span#orderVolumn").text(beforeVol+1);			
		}
		
	});
	/* 상품 게시글에서 주문 수량 증감 버튼 끝 /bbs/read.jsp */
	
	/* 상품 게시글 삭제버튼 시작 /bbs/read.jsp */
	$("button#delBtn").click(function(){
		
		let chkTF = confirm("게시글을 삭제하시겠습니까?");
		
		if (chkTF) {
			let nowPage = $("input#nowPage").val().trim();
			let num = $("input#num").val().trim();
					
			let p3 = $("#pKeyField").val().trim();  // p3 : keyField
		    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
		    
			let url = "/product/prodDelProc.jsp?";
				url += "num="+num+"&nowPage="+nowPage;
				url += "&keyField="+p3;
				url += "&keyWord="+p4;
			location.href=url;
		} else {
			alert("취소하셨습니다.");	
		}
		
	});
	/* 상품 게시글 삭제버튼 끝 /bbs/read.jsp */
	
	/* 상품 게시글 내용보기페이지에서 수정버튼 시작 /bbs/read.jsp */
	$("button#modBtn").click(function(){
	
		let nowPage = $("input#nowPage").val().trim();
		let num = $("input#num").val().trim();
				
		let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
		let url = "/product/prodMod.jsp?";
			url += "num="+num;
			url += "&nowPage="+nowPage;
			url += "&keyField="+p3;
	     	url += "&keyWord="+p4; 
		location.href=url;
	});
	
	/* 상품 게시글 내용보기페이지에서 수정버튼 끝 /bbs/read.jsp */
	
	
	
});

/* 상세내용 보기 페이지 이동 시작 /bbs/list.jsp => read.jsp */
	function read(p1, p2) {
	    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
		let param = "/product/prodRead.jsp?num="+p1;
		     param += "&nowPage="+p2;
		     param += "&keyField="+p3;
		     param += "&keyWord="+p4 ; 
		location.href=param;
	}		
/* 상세내용 보기 페이지 이동 끝 /bbs/list.jsp => read.jsp  */

/* 리스트페이지 페이징 시작 /bbs/list.jsp */
function movePage(p1) {    // 페이지 이동
	
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord

	let param = "/product/prodList.jsp?nowPage="+p1;	    
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href= param;

}
/* 리스트페이지 페이징 끝 /bbs/list.jsp */


/* 리스트페이지 페이징 블럭이동 시작 /bbs/list.jsp */
function moveLeftBlock(p1, p2) {    // 이전 블럭 이동

	let blockNum = parseInt(p1);
	let pagePerBlock = parseInt(p2);	
	//alert("p1 : " + p1 + "\np2 : " + p2);
	
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
	let param = "/product/prodList.jsp?nowPage="+(pagePerBlock*blockNum);
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href=param;
}

function moveRightBlock(p1, p2) {    // 다음 블럭 이동

	let blockNum = parseInt(p1);
	let pagePerBlock = parseInt(p2);	
	//alert("p1 : " + p1 + "\np2 : " + p2);
	
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
	let param = "/product/prodList.jsp?nowPage="+(pagePerBlock*(blockNum-1)+1);
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href=param;
}
/* 리스트페이지 페이징 블럭이동 끝 /bbs/list.jsp */

