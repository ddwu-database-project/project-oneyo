function filterMealkit() {
	  let selection = document.getElementById("search-selection");
	  let selection_index = selection.options.selectedIndex;
	  let search_fiter = selection.options[selection_index].value;
	  let search = document.getElementById("search").value.toLowerCase().replaceAll(' ','');
	  let mkList = document.getElementsByClassName("mkList");
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
console.log("Adfasd");
  }

function selectCategory(ctgId){
	let category = "";
	let mkList = document.getElementsByClassName("mkList");
	for (let i = 0; i < mkList.length; i++){
		category = mkList[i].querySelector("#ctgId").innerText;
		if (category == ctgId) {
			mkList[i].style.display = "inline"
		 } else {
			mkList[i].style.display = "none"
		 }
	}
	
}