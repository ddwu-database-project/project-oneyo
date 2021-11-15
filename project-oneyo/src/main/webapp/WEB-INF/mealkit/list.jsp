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
    
    for (let i = 0; i < 5; i++) {
      mealkitName = mkList[i].querySelector("#mkname").innerHTML.replaceAll(' ','');
      console.log("mealkitname = "+mealkitName);
      let ingList = mkList[i].querySelector("#ingList").getElementsByTagName("p");
      console.log("ingList = " + ingList);
      let ingarr = []
      
      for (let k = 0; k < ingList.length; k++){
    	  console.log("asdfasd"+ingList.item(k).innerText);
    	  ingarr.push(ingList.item(k).innerText);
    	  
    	  if (arr.includes(search)) {
   	    	  mkList[i].style.display = "inherit"
   	      } else {
   	    	  mkList[i].style.display = "none"
   	      }
      }
      
      if (mealkitName.toLowerCase().indexOf(search) != -1 ||
   		  mealkitName.toLowerCase().indexOf(search) != -1 
   		  ) {
    	  mkList[i].style.display = "inherit"
      } else {
    	  mkList[i].style.display = "none"
      }
    }
    
  }
</script>
</head>
<body>
<input type="text" onkeyup="filterMealkit()" id="search" placeholder="검색어를 입력하세요."/>
<c:forEach var="mk" items="${mealkits}" varStatus="status"> 

	<div class="mkList">
		<a href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${mk.mkId}'/></c:url>">	
		<p id="mkname">${mk.mkName}</p></a>
		<p>칼로리 : ${mk.defaultCal}</p> 
		<p>가격 : ${mk.defaultPrice}</p>
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