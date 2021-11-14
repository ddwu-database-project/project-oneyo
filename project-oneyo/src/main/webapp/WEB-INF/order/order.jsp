<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="model.dto.*" %>
    <%@ page import="model.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>주문 페이지</title>
<style type="text/css">
	div#backbody {
	background-color: #f5f5f0;
	font-size: 13pt;
	min-width: 1480px;
	width: 100%;	
	padding: 50px 0 ;
	}
	
	#frame {
	width: 80%;
	margin: 0 auto;
	padding: 50px 50px;
	background-color: #fff;
	}
	#frame2{
	border-bottom: solid 1px #e0eGeb;
	padding: 20px ;
	}
	
	.home { 
	float: right;
	clear: both;
	}
	table. calculation1{
		clear: both;
		border: solid 1px #e0e0eb;
		border-collapse: collapse;
		background-color: #f5f5f0;
		width:100%;
		font-size:10pt;
	}
	table.calculation th{
		border:solid 1px #e0e0eb;
		padding:10px 0;
		text-align:center;
	}
	table.calculation1 td{
		border:solid 1px #e0e0eb;
		text-align: center;
	}	
	table.calculation2{
		border:solid 1px #e0e0eb;
		border-collapse:collapse;
		background-color:#f5f5f0;
		width:100%;
		font-size:10pt;
	}
	table.calculation2 th{
		border:solid 1px #e0e0eb;
		text-align:center;
	}
	table.calculation2 td{
		border:solid 1px #e0e0eb;
		text-align:center;
	}
	
	.price{
		font-size: 20pt;
		font-weight: bold;
	}
	.lifont{
		font-size: 10pt;
		color: grey;
	}
	.delivery{
		border:solid 1px grey;
		border-collapse: collapse;
		width: 100%;
		font-size: 12pt;
	}
	table.delivery th, td{
		border:solid 1px #e0e0eb;
		padding: 12px 10px;
	}
	.deliverytd{
		font-size: 12pt;
		background-color: #f5f5f0;
	}
	.payArea{
		height:218px;
		position: relative;
		padding: 0 245px 0 0;
		border: 1px solid #777;
		color: #353535;
		line-height: 1.5;
	}
	.payment{
		border-right: solid 1px grey;
		float: left;
		width:100%;
		height:100%;
	}
	.total{
		float: right;
		width: 240px;
		margin: 0 -240px 0 0;
		text-align: right;
		background: #fbfafa;
		font-size: 11pt;
	}
	.btn{
		border:none;
		color:white;
		padding: 5px 10px;
		font-size: 13px;
		cursor: pointer;
		border-radius: 5px;
	}
	.default{
		background-color: #264d73;
		border: solid 1px grey;
		color: #fff;
	}
	.default:hover{
	
	
	
	
		background: #ddd;
	}
	.backBtn{
		background: #fff;
		border: solid 1px grey;
	}
	.btnfloat{
		float:left;
	}
	.btnfloat2{
		float:right;
	}
	.clearboth{
		clear:both;
	}
	</style>
</head>
<body>
<%
	//orderedItems 가져옴
	@SuppressWarnings("unchecked")
	List<CustomMealkit> customMealkitList = (List<CustomMealkit>)request.getAttribute("customMealkitList");
	OrderDAO orderDAO = new OrderDAO();
	Customer c = orderDAO.getCustomerInfo(customMealkitList.get(0).getCustomerId());
	%>

<div id="backbody">
	<div id="frame">
		<form>
			<div id="frame2">
				<span style="font-size: 16pt; font-weight:bold;">커스텀밀키트</span>
				<span class="mypage"> 주문/결제 </span>
				<span></span>
			</div>
			<br/>
			
			<div>
				<table class="calculation1">
				<thead>
					<tr>
						<th colspan="10" style="text-align:left; padding-left:10px;">상품(1)</th>
					</tr>
					
					<tr>
						<th><input type="checkbox" name="checkbox" id="check" /></th>
						<th><span>이미지</span></th>
						<th style="width:550px;"><span>밀키트정보</span></th>
						<th>가격</th>
						<th>수량</th>
						<th style="width:100px;">적립금</th>
						<th>배송구분</th>
						<th>배송비</th>
						<th>합계</th>
					</tr>
					</thead>
					<!-- 주문 per 커스텀 밀키트 목록 -->
					<tbody>
						<%! int totalPrice = 0; %>
						<% for(int i = 0; i < customMealkitList.size(); i++){
								totalPrice += customMealkitList.get(i).getPrice(); %>
							<tr style="height:90px; background-color: #fff;">
								<td style="text-align: left; text-align:center; border-right:none;">
									<input type="checkbox" name="checkbox" />
								</td>
								<td style="border-left: none; border-right: none;">
									<img style="width:45%;" src= "mincho.GIF">
								</td>
								<td style="text-align:left; padding-left: 10px; border-left:none; font-weight: bold;">
								<%= customMealkitList.get(i).getOriginalMealkit().getMkName() %> <!-- 밀키트명 -->
								</td>
								<td><span style="padding-left: 10px;"><%= customMealkitList.get(i).getPrice() %></span>원</td><!-- 가격 -->
								<td style="width: 80px;">
									<span><%= customMealkitList.get(i).getPrice() %></span>원
								</td>
								
								<td>-</td>
								<td>기본배송</td>
								<td>고정</td>
								<td><span><%= customMealkitList.get(i).getQuantity() %></span></td>
							</tr>
						<%} %>
					</tbody>
					<tfoot>
						<tr style="height: 60px;">
							<td colspan="5" style="border-right: none; text-align:left; padding-left: 10px;">
								<span>[기본배송]</span>
							</td>
							<td colspan="5" style="border-right: none; text-align:right; padding-right: 10px;">
								상품금액<span>0</span> + <span>배송비 0 = 합계</span>&nbsp;<span style="font-weight:bold; font-size: 10pt;"><%= totalPrice %>원</span>
							</td>
						</tr>
					</tfoot>
					</table>
					
					<div style="border:solid 1px #e0e0eb; border-right: none; border-left: none; padding: 11px 0; background-color:"><!--  -->
						<img src=" " style="margin-left:5px; position:relative; top:4.5px;">
						<span style="font-size: 10pt; color:red;">밀키트의 옵션 및 수량 변경은 상품 상세 또는 장바구니에서 가능합니다.</span>
					</div>
				</div>
				
				<div style="margin: 10px 0; padding-botton:solid 1px grey;">
					<span style="margin: 0 10px;" class="btnfloat">선택상품을</span>
					<button type="button" class="btn default btnfloat" style="background-color:grey; color:#fff;">삭제하기</button> <!-- 아직기능구현안함 -->
					
					<button type="button" class="btn default btnfloat2" onclick="javascript:history.back()">이전페이지 ></button>
					<span class="clearboth"></span>
				</div>
				<br/><br/>
				
				<!-- 배송지 정보 -->
				<span style="font-size: 12pt; display:inline-block; padding-bottom:10px;">&nbsp;배송정보</span>
				<table class="delivery">
					<thead>
						<tr>
							<td class="deliveryId" >받으시는 분&nbsp;<span style="color:red">*</span></td> <!-- 해당 값 받아와서 새로운 정보로 배송하는 기능은 구현 안하는건가..? -->
							<td><input type="text" value= <% c.getCustomerName(); %>/></td>
						</tr>
						
						<tr>
							<td class="deliveryId">주소&nbsp;<span style="color:red">*</span>
							</td>
							<!--  <td>
								<input type="text" id="postnum1" size="10" maxlength="5" />
								&nbsp;
								<button type="button" style="cursor:pointer; margin-bottom:10px; background-color: #fff; border-width:0px;"></button>
								<input style="margin-bottom:10px;" type="text" id="addr1" size="50" /><br/>
								<input type="text" id="addr2" size="50" />
							</td>
							--> <!-- DAUM post로 우편번호 찾기기능 -->
							<td>
							<input type="text" value= <% c.getAddress(); %> />
							</td>
						</tr>
						
					<tr>
						<td class="deliverytd">휴대전화&nbsp;<span style="color:red;">*</span></td>
						<td>
						<!--<input type="text" size="5" />-<input type="text" size="5" />-<input type="text" size="5" /> -->
						<input type="text" value= <% c.getPhone(); %> />
						</td>
					</tr>
					<tr>
						<td class="deliverytd">이메일&nbsp;<span style="color:red;">*</span></td>
						<!--  <td><input type="text" />@<input id="domainName" type="text" />&nbsp;
						<select id="emailChoice" style="height: 20px;">
							<option>-이메일 선택-</option>
							<option>daum.net</option>
							<option>naver.com</option>
							<option>gmail.com</option>
							<option>nate.com</option>
							<option>hotmail.com</option>
							<option>dongduk.ac.kr</option>
						</select>
						-->
						<td><input type ="text" value=<% c.getEmail(); %> />
 						<span style="font-size: 10pt; color:grey;">
							<p>이메일을 통해 주문처리과정을 보내드립니다.<br/>이메일 주소란에는 반드시 유효한 이메일 주소를 입력해 주세요.</p>
						</span>
					</td>
				</tr>
				
				<tr>
					<td class="deliverytd">배송매세지</td>
					<td><textarea rows="5" cols="100"></textarea></td>
				</tr>
				</thead>			
  				</table>
  				<br/><br/>
			</div>
			
			<table class="calculation2">
				<tr>
					<th>총 상품금액</th>
					<th>총 배송비</th>
					<th style="width:750px; padding:22px 0;"><span>결제예정금액</span></th>
				</tr>
				
				<tr style="background-color:#fff;">
					<td style="padding: 23px 0;"><span class="price"><%= totalPrice %></span>원</td>
					<td>+<span class="price">0</span>원</td>
					<td>=<span class="price"><%= totalPrice %></span>원</td>
				</tr>
			</table>
			<br/><br/>
			
			<div class="payArea">
				<div class="payment">
					<div style="padding: 18px 10px; font-size: 10pt; border-botton: solid 1px #e0e0eb;">
						<input type="radio" name="cardradio" checked><label>카드결제</label>&nbsp;&nbsp;
						<input type="radio" name="cardradio" checked><label>실시간 계좌이체</label>&nbsp;&nbsp;
						<input type="radio" name="cardradio" checked><label>휴대폰 결제</label>&nbsp;&nbsp;
						<input type="radio" name="cardradio" checked><label>무통장 입금</label>&nbsp;&nbsp;
						<input type="radio" name="cardradio" checked><label>에스크로(가상계좌)</label>&nbsp;&nbsp;
					</div>
					<div align="left">
						<img src="mincho.GIF" style="margin-left: 5px; position:relative; top:6px;">
						<span style="font-size: 10pt; color:grey;">최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</span><br/>
						<img src="mincho.GIF" style="margin-left: 5px; position:relative; top:6px;">
						<span style="font-size: 10pt; color:grey;">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span><br/>
					</div>
				</div>
			<div class="total">
				<span style="display:inline-block; padding: 20px 10px;">카드결제 최종결제 금액</span><br/>
				<span style="font-size: 25pt; font-weight: bold; padding: 0px 10px;">0원</span><br/><br/>
				<button type="button" class="btn default" style="width:90%; height:60px; margin-right:10px; font-size:10pt;"></button><!--  -->
			</div>
		</div>
		<br/><br/>
		
		<div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color:#f5f5f0; padding-left:10px;"><!--  -->
			무이자할부 이용안내
		</div>
		<div style="border: solid 1px #e0e0eb; font-size: 12pt; padding-left: 10px;">
			<span>-</span> <span style="font-size:10pt; color:grey;">무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.</span>
			<span>-</span> <span style="font-size:10pt; color:grey;">무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</span>
		</div>
		<br/>
		
		<div style="border: solid 1px #e0e0eb; font-size: 12pt; padding: 10px 0; background-color:#f5f5f0; padding:left:10px;"><!--  -->
			이용안내
		</div>
		<div style="border: solid 1px #e0e0eb; height: 400px; font-size: 12pt; padding-left: 10px;">
			<br/>세금계산서 발행 안내
			<ol style="padding-left: 30px; padding-top: 8px;">
				<li class="lifont">부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
				<li class="lifont">세금계산서는 사업자만 신청하실 수 있습니다.</li>
				<li class="lifont">배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
			</ol><br/>
			부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내
			<ol style="padding-left: 30px; padding-top: 8px;">
				<li class="lifont">변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</li>
				<li class="lifont">신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
				<li class="lifont">상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
			</ol><br/>
			현금영수증 이용안내
			<ol style="padding-left: 30px; padding-top: 8px;">
				<li class="lifont">현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</li>
				<li class="lifont">현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
				<li class="lifont">발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
				<li class="lifont">현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
				<li class="lifont">현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
			</ol><br/>
		</div>
	</form>	
	</div>
</div>


</body>
</html>