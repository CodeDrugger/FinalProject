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
			div_block.innerHTML = "<div class=\"col-md-5\"><div class=\"panel panel-default\"><div class=\"panel-heading\">问题:"+i+ques[i - 1]+
			"</div><div class=\"panel-body\"><textarea readonly=\"readonly\">"+ans[i - 1]+"</textarea></div></div></div>";
			div_content.appendChild(div_block);
		}
		amount++;
	}
}
