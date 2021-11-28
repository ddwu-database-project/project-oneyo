<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>O!NEYO - 회원가입</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<c:url value='/assets/img/apple-icon.png' />">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/img/oneyo_fav.ico' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/templatemo.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/custom.css' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/mystyle.css' />">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css' />">	
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    

  
	function customerCreate() {
		// 형식 검토 과정
		var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(emailExp.test(form.email.value)==false) {
			alert("이메일 형식이 올바르지 않습니다.");
			form.email.focus();
			return false;
		}
		if (form.password.value == "") {
			alert("비밀번호를 입력하십시오.");
			form.password.focus();
			return false;
		}
		if (form.password.value != form.password2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			form.name.focus();
			return false;
		}
		if (form.name.value == "") {
			alert("이름을 입력하십시오.");
			form.name.focus();
			return false;
		}
		var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if(phoneExp.test(form.phone.value)==false) {
			alert("전화번호 형식이 올바르지 않습니다.");
			form.phone.focus();
			return false;
		}
		if (form.address.value == "") {
			alert("주소를 입력하십시오.");
			form.address.focus();
			return false;
		}
	
		form.submit();
	}
	
	function searchIng() {
		window.open("/project-oneyo/ingredient/search", "검색", "width=400px, height=500px");
	}
	
	function setChildValue(name, id){
		const search = document.getElementById("search");
		
		const spans = document.getElementsByTagName("span");
		let exist = 0;
	    for (let i = 0; i < spans.length; i++) {
    		console.log(spans[i].innerText);
	    	if ((name + " ") === spans[i].innerText) {
	    		exist = 1;
	    		break;
	    	}
	    }
		
		if (!exist) {
			const allergy = document.createElement("span");
			
			const hiddenInput = document.createElement("input");
			hiddenInput.style.display = "none";
			hiddenInput.name = "allergy";
			hiddenInput.value = id;
			hiddenInput.className = "allergy"
			
			const td = search.parentNode;
			td.insertBefore(allergy, search)
			td.insertBefore(hiddenInput, search)
			
		    allergy.innerText = name + " ";
		}
	}
	
	function resetData(){
		const spans = document.getElementsByTagName("span");
		let len = spans.length;
	    for (let i = 0; i < len; i++) {
	      spans[0].remove();
	    }
	    const input = document.getElementsByClassName("allergy");
	    len = input.length;
	    for (let i = 0; i < len; i++) {
	    	input[0].remove();
	    }
	}
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	</script>
</head>

<body>
 <%@include file="/WEB-INF/base/header.jsp" %>
    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">Sign Up</h1>
        </div>
    </div>

    <c:if test="${registerFailed}">
	  <br><p class="failMsg"><c:out value="${exception.getMessage()}" /></p>
	</c:if>

    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form name="form" class="col-md-9 m-auto" method="post" role="form" action="<c:url value='/customer/register' />">
                <div class="mb-3">
                    <label for="inputsubject">Email</label>
                    <input type="text" class="form-control mt-1" id="subject" name="email" placeholder="Email">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Password</label>
                  <input type="password" class="form-control mt-1" id="subject" name="password" placeholder="Password">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Confirm Password</label>
                  <input type="password" class="form-control mt-1" id="subject" name="password2" placeholder="Confirm Password">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Name</label>
                  <input type="text" class="form-control mt-1" id="subject" name="name" placeholder="Name">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Phone</label>
                  <input type="text" class="form-control mt-1" id="subject" name="phone" placeholder="Phone">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Address</label>
                  <input type="button" class="btn btn-success btn-xs" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
    				<input type="text" class="form-control mt-1" id="sample6_postcode" name="address1" placeholder="우편번호">
				
					<input type="text" class="form-control mt-1" id="sample6_address" name="address2" placeholder="주소"><br>
					<input type="text" class="form-control mt-1" id="sample6_detailAddress" name="address3" placeholder="상세주소">
					<input type="text" class="form-control mt-1" id="sample6_extraAddress" placeholder="참고항목">
    				
    				
                 <!-- <input type="text" class="form-control mt-1" id="subject" name="address" placeholder="Address"> -->
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Allergy</label>
                  <table>
                    <tr>
                      <td id="allergyTd">
                        <input id ="search" type="button" value="+" onClick="searchIng()" class="ag">
                        <input type="button" value="reset" onClick="resetData()" class="ag">
                      </td>
                    </tr>
                  </table>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-success btn-lg px-3" onClick="customerCreate()">Sign Up</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Contact -->

<%@include file="/WEB-INF/base/footer.jsp"%>

    <!-- Start Script -->
    <script src="<c:url value='/assets/js/jquery-1.11.0.min.js' />"></script>
    <script src="<c:url value='/assets/js/jquery-migrate-1.2.1.min.js' />"></script>
    <script src="<c:url value='/assets/js/bootstrap.bundle.min.js' />"></script>
    <script src="<c:url value='/assets/js/templatemo.js' />"></script>
    <script src="<c:url value='/assets/js/custom.js' />"></script>
    <script src="<c:url value='/assets/js/fade-in.js' />"></script>
    <!-- End Script -->
</body>

</html>