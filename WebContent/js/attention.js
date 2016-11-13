window.onload=function(){
	var msg = document.getElementById("msg").value;
	var smit = document.getElementById("submit");
	if (msg == 1){
		smit.value = "已关注";
		smit.disabled = "disabled";
	}
}