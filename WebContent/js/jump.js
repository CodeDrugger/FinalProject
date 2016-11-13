window.onload=function(){
	var form = document.getElementById("form");
	var input = document.getElementById("input");
	var input2=document.getElementById("input2")
	var msg = document.getElementById("msg").value;

	/*}else if(msg == "已关注该学生" || msg == "成功关注该学生" || msg == "已取消关注该学生" 
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
	*/
	if(msg=="成功关注该导师."||meg=="已经关注过该导师.")
	{
		form.action="Show_stu_tea";
		input.name="teas.id";
		input.value="${teas.id}";
		input2.name="id_in";
		input2.value="${stu_select.id}";
	}
	else if(msg=="成功关注该学生."||msg=="已经关注过该学生")
	{
		form.action="Show_tea_stu";
		input.name="stus.id";
		input.value="${stus.id}";
		input2.name="id_in";
		input2.value="${tea_select.id}";
	}
	
}