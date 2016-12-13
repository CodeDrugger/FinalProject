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
			div_block.innerHTML = "<div class=\"ui segment\"><lable>问题:" + array[i-1] +"</label><textarea style=\"border: none;\" rows=\"5\" name=\"a.answers\"></textarea></div>";
			div_content.appendChild(div_block);
		}
		amount++;
	}
}
