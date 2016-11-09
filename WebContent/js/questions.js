amount = 2;
function newLine()
{
	if (amount < 11)
	{
		var div_block = document.createElement("div");
		div_block.id = "block" + amount;
		div_block.innerHTML = "问题" + amount + "：<input type=\"text\" name=\"q.questions\">";
		amount++;
		var div_content = document.getElementById("content");
		div_content.appendChild(div_block);
	}
	else
	{
		alert("您最多能设置10个问题！");
	}
}