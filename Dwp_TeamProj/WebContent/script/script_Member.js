
$(function(){
//이메일 주소 병합 소스 만들기 시작
	$("button#joinBtn").click(function(){
	let uEmail1 = $("input#uEmail1").val();
	let uEmail2 = $("input#uEmail2").val();
	let uEmail =uEmail1+"@"+uEmail2;
	$("input#uEmail").val(uEmail);
	 // 주소 병합 소스만들기 시작
     //이메일 주소 병합 소스 만들기 끝
    
     
      let postcode = $("input#postcode").val().trim();
      let address= $("input#address").val().trim();
      let detailAddress =$("input#detailAddress").val().trim();
      let extraAddress = $("input#extraAddress").val().trim();
      let uAddr=  "("+postcode+")"+ address +detailAddress + extraAddress;
      $("input#uAddr").val(uAddr);

    // 주소 병합 소스만들기 끝
	});
	
	$("button#modBtn").click(function(){
	let uEmail1 = $("input#uEmail1").val();
	let uEmail2 = $("input#uEmail2").val();
	let uEmail =uEmail1+"@"+uEmail2;
	$("input#uEmail").val(uEmail);
	 // 주소 병합 소스만들기 시작
     //이메일 주소 병합 소스 만들기 끝
    
     
      let postcode = $("input#postcode").val().trim();
      let address= $("input#address").val().trim();
      let detailAddress =$("input#detailAddress").val().trim();
      let extraAddress = $("input#extraAddress").val().trim();
      let uAddr=  "("+postcode+")"+ address +detailAddress + extraAddress;
      $("input#uAddr").val(uAddr);

    // 주소 병합 소스만들기 끝
	
	});
     // 이메일 선택요소 시작
     $("select#valSel").change(function(){
     $("input#uEmail2").val($(this).val());
   
     // 이메일 선택요소 시작
	

     });
     

     // 정방향 전체 체크 적용 시작 //
		
      $("input#chkAll").click(function(){
	  let chkToF =  $(this).prop("checked");
	  $("input.useAgree").prop("checked",chkToF);
	});
    // 정방향 전체 체크 적용 끝 //


	
	// 무료배송, 할인쿠폰 등 혜택/정보 수신 동의 정방향 전체 체크 적용 끝  //

	  $("input#chkAll2").click(function(){
	  let chkToF =  $(this).prop("checked");
	  $("input.socialAgree").prop("checked",chkToF);
       });
    // 무료배송, 할인쿠폰 등 혜택/정보 수신 동의 정방향 전체 체크 적용 끝   //
	 
	// 역방향 전체 체크 적용 //
	$(".joinAgree .termArea input[type=checkbox]").click(function(){
		
		let  boolChk = false;				

		let chk0 =$(".joinAgree .termArea").eq(0).find("input").prop("checked");
		let chk1 =$(".joinAgree .termArea").eq(1).find("input").prop("checked");
		let chk2 =$(".joinAgree .termArea").eq(2).find("input").prop("checked");
		let chk3 =$(".joinAgree .termArea").eq(3).find("input").prop("checked");
		let chk4 =$(".joinAgree .termArea").eq(4).find("input").prop("checked");
		
		// .eq(인덱스번호)  => 형제요소들의 인덱스번호에 해당하는 대상을 선택, eq = equal
		//let str = "chk0 : " + chk0 + "\nchk1 : " + chk1 + "\nchk2 : " + chk2;
		//alert(str);
		
		if (chk0 && chk1 && chk2 && chk3 && chk4) {
			boolChk = true;    // 3개의 약관 모두 체크 되었을 때 실행됨.
		}
		
		$(".joinAgree input#chkAll").prop("checked", boolChk);
	});
  
    $("button#joinBtn").click(function(){
	let chk0 =$(".joinAgree .termArea").eq(0).find("input").prop("checked");
	let chk1 =$(".joinAgree .termArea").eq(1).find("input").prop("checked");
	let chk4 =$(".joinAgree .termArea").eq(4).find("input").prop("checked");
	
	if(chk0 == false){
		alert("이용약관 동의(필수)체크해주세요");
		$(".joinAgree .termArea").eq(0).find("input").css({"outline" : "3px solid #f00"});
		$(".joinAgree .termArea").eq(0).focus();
	} 
	else if(chk1 == false){
		alert("개인정보 수집 · 이용동의(필수)체크해주세요");
		$(".joinAgree .termArea").eq(0).find("input").css({"outline" : "3px solid #f00"});

	}
	else if(chk4 == false){
		alert("본인은 만14세이상입니다(필수)체크해주세요");
		$(".joinAgree .termArea").eq(0).find("input").css({"outline" : "3px solid #f00"});
	} else{
		$("form#joinFrm").attr("action","/Member/Join_Proc.jsp").submit();
	}
    });
});
