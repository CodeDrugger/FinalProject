window.onload=function(){
	var form = document.getElementById("form");
	var input = document.getElementById("input");
	var msg = document.getElementById("msg").value;
	if (msg == "文件上传成功.."){
		
		form.action = "Show_tea";
		input.name = "teac.id";
		input.value = "${id }"
	}else if (msg == "文件上传成功."){
		form.action = "Show_stu";
		input.name = "stuc.id";
		input.value = "${id }"
	}else if(msg == "已关注该学生" || msg == "成功关注该学生" || msg == "已取消关注该学生" 
	|| msg == "您的名额已满" || msg == "该学生已完成互选生" || msg == "选择学生成功")
	{
		form.action = "Mystu";
		input.name = "id_in";
		input.value = "${student_id}";
	}else if(msg == "成功关注该学生" || msg == "成功关注该学生" || msg == "成功关注该学生" 
	|| msg == "成功关注该学生" || msg == "成功关注该学生" || msg == "成功关注该学生" 
	|| msg == "成功关注该学生" || msg == "成功关注该学生" || msg == "成功关注该学生" )
	{
		form.action = "Mytea";
		input.name = "id_in";
		input.value = "${teacher_id}";
	}
}