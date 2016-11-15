window.onload=function()
{
	window.div_content = document.getElementById("content");
	window.amount = document.getElementById("dbamount").value;
	if (amount == 0)
	{
		amount++;
		var div_block = document.createElement("div");
		div_block.id = "block" + amount;
		div_block.innerHTML = "<div class=\"col-md-5\"><div class=\"panel panel-default\"><div class=\"panel-heading\">
		问题"+i+"</div><div class=\"panel-body\"><textarea row=3></textarea></div></div></div>";
		amount++;
		div_content.appendChild(div_block);
	}
	else
	{
		for (var i = 1; i <= amount; i++)
		{
			var div_block = document.createElement("div");
			div_block.id = "block" + i;
			div_block.innerHTML ="<div class=\"col-md-5\"><div class=\"panel panel-default\"><div class=\"panel-heading\">
			问题"+i+"</div><div class=\"panel-body\"><textarea row=3>"+array[i - 1]+"</textarea></div></div></div>";
			div_content.appendChild(div_block);
		}
		amount++;
	}
}

function newLine()
{
	if (amount < 11)
	{
		var div_block = document.createElement("div");
		div_block.id = "block" + amount;
		div_block.innerHTML = div_block.innerHTML ="<div class=\"col-md-5\"><div class=\"panel panel-default\"><div class=\"panel-heading\">
		问题"+i+"</div><div class=\"panel-body\"><textarea row=3></textarea></div></div></div>";
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
