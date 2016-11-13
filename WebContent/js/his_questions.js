window.onload=function()
{
	var info = document.getElementById("info");
	info.style.display="none";
	var div_content = document.getElementById("content");
	var amount = document.getElementById("dbamount").value;
	var smit = document.getElementById("submit");
	if (amount == 0)
	{
		info.style.display="block";
		smit.style.display="none";
	}
	else
	{
		for (var i = 1; i <= amount; i++)
		{
			var div_block = document.createElement("div");
			div_block.id = "block" + i;
			div_block.innerHTML = "问题" + i 
			+ "：<input type=\"text\" name=\"a.questions\" value=\"" + array[i - 1] + "\" readonly=\"readonly\"><br>"
			+ "答：<textarea name=\"a.answers\"></textarea>";
			div_content.appendChild(div_block);
		}
		amount++;
	}
}
