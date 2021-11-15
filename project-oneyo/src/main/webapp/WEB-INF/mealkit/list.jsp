<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
  function filterMealkit() {
    let search = document.getElementById("search").value.toLowerCase().replaceAll(' ','');
    let mkList = document.getElementsByClassName("mkList");
    
    for (let i = 0; i < mkList.length; i++) {
      mealkitName = mkList[i].querySelector("#mkname").innerHTML.replaceAll(' ','');
      console.log("mealkitname = "+mealkitName);
      let ingList = mkList[i].querySelector("#ingList").getElementsByTagName("p");
      
      let ingarr = []
      console.log("����ִ� ingarr = " + ingarr);	
      
      for (let k = 0; k < ingList.length; k++){
    	  ingarr.push(ingList.item(k).innerText.toLowerCase());
    	  
      }
      console.log("��� ���� �� ingarr = " + ingarr);
      
      if (mealkitName.toLowerCase().indexOf(search) != -1 ||
   		  mealkitName.toLowerCase().indexOf(search) != -1  || ingarr.indexOf(search) != -1
   		  ) {
    	  mkList[i].style.display = "inherit"
    	  console.log(ingarr.includes(search) + "if�� ����");
      } else {
    	  mkList[i].style.display = "none"
      }
    }
    
  }
</script>
</head>
<body>
<input type="text" onkeyup="filterMealkit()" id="search" placeholder="�˻�� �Է��ϼ���."/>
<c:forEach var="mk" items="${mealkits}" varStatus="status"> 

	<div class="mkList">
		<a href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${mk.mkId}'/></c:url>">	
		<p id="mkname">${mk.mkName}</p></a>
		<p>Į�θ� : ${mk.defaultCal}</p> 
		<p>���� : ${mk.defaultPrice}</p>
		<div id="ingList">
			<c:forEach var="mkIngs" items="${mk.ingredients}"> 
				<p id="ingname">${mkIngs.getIngName()}</p>
			</c:forEach>
		</div>
	</div>
	<br>
</c:forEach> 
</body>
</html>