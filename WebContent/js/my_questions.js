window.onload=function()
{
	window.div_content = document.getElementById("content");
	window.amount = document.getElementById("dbamount").value;
	if (amount == 0)
	{
		amount++;
		var div_block = document.createElement("div");
		div_block.id = "block" + amount;
		div_block.innerHTML = "问题" + amount + "：<input type=\"text\" name=\"q.questions\">";
		amount++;
		div_content.appendChild(div_block);
	}
	else
	{
		for (var i = 1; i <= amount; i++)
		{
			var div_block = document.createElement("div");
			div_block.id = "block" + i;
			div_block.innerHTML = "问题" + i + "：<input type=\"text\" name=\"q.questions\" value=\"" + array[i - 1] + "\">";
			div_content.appendChild(div_block);
		}
		amount++;
	}
	document.getElementById("amounttodb").value = amount - 1;
}
	
function newLine()
{
	if (amount < 11)
	{
		var div_block = document.createElement("div");
		div_block.id = "block" + amount;
		div_block.innerHTML = "问题" + amount + "：<input type=\"text\" name=\"q.questions\">";
		amount++;
		div_content.appendChild(div_block);
	}
	else
	{
		alert("您最多能设置10个问题！");
	}
	document.getElementById("amounttodb").value = amount - 1;
}
function removeLine()
{
	amount--;
	if (amount > 1)
	{
		var div_block = document.getElementById("block" + amount);
		var div_content = document.getElementById("content");
		div_content.removeChild(div_block);
	}
	else
	{
		amount++;
	}
	document.getElementById("amounttodb").value = amount - 1;
}