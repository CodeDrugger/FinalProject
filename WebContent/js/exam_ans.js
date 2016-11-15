window.onload=function(){
	var info = document.getElementById("info");
	info.style.display="none";
	var div_content = document.getElementById("content");
	var amount = document.getElementById("dbamount").value;
	if (amount == 0)
	{
		info.style.display="block";
	}
	else
	{
		for (var i = 1; i <= amount; i++)
		{
			var div_block = document.createElement("div");
			div_block.id = "block" + i;
			div_block.innerHTML = "问题" + i + "：<input type=\"text\" style=\"border:none;margin-bottom:2%\"  value=\"" + ques[i - 1] + "\" readonly=\"readonly\"><br>"
			+ "<textarea readonly=\"readonly\">" + ans[i - 1] + "</textarea>";
			div_content.appendChild(div_block);
		}
		amount++;
	}
}
