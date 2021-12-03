const MkNuminOnePage = 9;
const mkList = document.getElementsByClassName("mkList");

function showOtherPage(page){
	for (let i = 0; i < mkList.length; i++){
		if (i >= (page-1)*MkNuminOnePage && i < page*MkNuminOnePage){
			mkList[i].style.display = "inline";
		} else {
			mkList[i].style.display = "none";
		}
	}
}

function showPageMealkits(page, arr){
	for (let i = 0; i < arr.length; i++){
		if (arr.indexOf(arr[i]) >= (page-1)*MkNuminOnePage && arr.indexOf(arr[i]) < page*MkNuminOnePage){
			mkList[arr[i]].style.display = "inline";
		} else {
			mkList[arr[i]].style.display = "none";
		}
	}
}

function resetPageBtn(){
	let pagination = document.querySelector("#pagination");
	if (pagination.hasChildNodes){
		let childern = pagination.querySelector("button");
		pagination.removeChild(childern);
		pagination.innerHTML = "<button>&laquo;</button><button id='raquo'>&raquo;</button>";
	}
}

function calculatePage(){
	resetPageBtn();
	let inlineMkNum = 0;
	let arr = [];
	for (let i = 0; i < mkList.length; i++){
		if (mkList[i].style.display != "none"){
			inlineMkNum += 1;
			arr.push(i);
		}
	}
	console.log("inlineMkNum = "+inlineMkNum);
	let raquo = document.getElementById("raquo");
	let page_num = 0;
	if (inlineMkNum % MkNuminOnePage == 0){
		page_num = inlineMkNum/MkNuminOnePage;
	}
	else {
		page_num = inlineMkNum/MkNuminOnePage + 1;
	}
	for (let i = 1; i <= page_num; i++){
		let page_btn = document.createElement("button");
		page_btn.classList.add("btn_num");
		page_btn.innerText = i;
		page_btn.addEventListener('click', function(event){
			event.preventDefault();
	        showPageMealkits(i, arr);
	    });
		raquo.before(page_btn);
	}
	showPageMealkits(1, arr);
}

$(document).ready(function(){
	let raquo = document.getElementById("raquo");
	let page_num = 0;
	let inlineMkNum = 0;
	for (let i = 0; i < mkList.length; i++){
		if (mkList[i].style.display != "none"){
			inlineMkNum += 1;
		}
	}
	if (inlineMkNum % MkNuminOnePage == 0){
		page_num = inlineMkNum/MkNuminOnePage;
	}
	else {
		page_num = inlineMkNum/MkNuminOnePage + 1;
	}
	console.log("page num = " + page_num);
	for (let i = 1; i <= page_num; i++){
		let page_btn = document.createElement("button");
		page_btn.classList.add("btn_num");
		page_btn.innerText = i;
		page_btn.addEventListener('click', function(event){
	        showOtherPage(i);
	    });
		raquo.before(page_btn);
	}
	for (let i = MkNuminOnePage; i < mkList.length; i++){
		mkList[i].style.display = "none";
	}
});

function filterMealkit() {	
	  let selection = document.getElementById("search-selection");
	  let selection_index = selection.options.selectedIndex;
	  let search_fiter = selection.options[selection_index].value;
	  let search = document.getElementById("search").value.toLowerCase().replaceAll(' ','');
	  if (!search){
		  for (let i = 0; i < mkList.length; i++) {
		      mealkitName = mkList[i].querySelector("#mkname").innerHTML.replaceAll(' ','');
		      mkList[i].style.display = "inline"
		  }
	  }
	  if (window.event.keyCode == 13){
	    for (let i = 0; i < mkList.length; i++) {
	      let mealkitName = mkList[i].querySelector("#mkname").innerHTML.replaceAll(' ','');
	      let ingList = mkList[i].querySelector("#ingList").getElementsByTagName("p");
	      
	      let ingarr = ""
	      
	      for (let k = 0; k < ingList.length; k++){
	    	  ingarr += ingList.item(k).innerText.toLowerCase();
	      }
	      
	      if (search_fiter == "all"){
		      if (mealkitName.toLowerCase().indexOf(search) != -1 ||
		   		  mealkitName.toLowerCase().indexOf(search) != -1  || ingarr.includes(search)
		   		  ) {
		    	  mkList[i].style.display = "inline"
		      } else {
		    	  mkList[i].style.display = "none"
		      }
	      }
	      else if (search_fiter == "ingredients"){
	    	  if (ingarr.includes(search)) {
		    	  mkList[i].style.display = "inline"
		      } else {
		    	  mkList[i].style.display = "none"
		      }
	      }
	      else if (search_fiter == "mealkit_name"){
	    	  if (mealkitName.toLowerCase().indexOf(search) != -1 ||
		   		  mealkitName.toLowerCase().indexOf(search) != -1
		   		  ) {
		    	  mkList[i].style.display = "inline"
		      } else {
		    	  mkList[i].style.display = "none"
		      }
	      }
	    }
  	 }
	calculatePage();
  }

function selectCategory(ctgId){
	let category = "";
	for (let i = 0; i < mkList.length; i++){
		category = mkList[i].querySelector("#ctgId").innerText;
		if (category == ctgId) {
			mkList[i].style.display = "inline"
		 } else {
			mkList[i].style.display = "none"
		 }
	}
	calculatePage();
}

function MealkitAll(){
	document.getElementById("search").value = "";
	filterMealkit();
}

