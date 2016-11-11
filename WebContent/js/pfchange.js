window.onload=function(){
	var sex = document.getElementById("sex").value; 
	var sex_nan = document.getElementById("sex_nan");
	var sex_nv = document.getElementById("sex_nv");
	if (sex == "男"){
		sex_nan.checked = "checked";
		sex_nv.checked = "";
	}else if(sex == "女"){
		sex_nan.checked = "";
		sex_nv.checked = "checked";
	}else{
		sex_nan.checked = "";
		sex_nv.checked = "";
	}
	
	var wish_class = document.getElementById("wish_class").value; 
	var wish_class_xueshuo = document.getElementById("wish_class_xueshuo");
	var wish_class_zhuanshuo = document.getElementById("wish_class_zhuanshuo");
	var wish_class_buqueding = document.getElementById("wish_class_buqueding");
	if (wish_class == "学硕"){
		wish_class_xueshuo.checked = "checked";
		wish_class_zhuanshuo.checked = "";
		wish_class_buqueding.checked = "";
	}else if(wish_class == "专硕"){
		wish_class_xueshuo.checked = "";
		wish_class_zhuanshuo.checked = "checked";
		wish_class_buqueding.checked = "";
	}else if(wish_class == "不确定"){
		wish_class_xueshuo.checked = "";
		wish_class_zhuanshuo.checked = "";
		wish_class_buqueding.checked = "checked";
	}else{
		wish_class_xueshuo.checked = "";
		wish_class_zhuanshuo.checked = "";
		wish_class_buqueding.checked = "";
	}
	
	var bein_class = document.getElementById("bein_class").value; 
	var bein_class_baoyan = document.getElementById("bein_class_baoyan");
	var bein_class_kaoyan = document.getElementById("bein_class_kaoyan");
	if (bein_class == "保研"){
		bein_class_baoyan.checked = "checked";
		bein_class_kaoyan.checked = "";
	}else if(bein_class == "考研"){
		bein_class_baoyan.checked = "";
		bein_class_kaoyan.checked = "checked";
	}else{
		bein_class_baoyan.checked = "";
		bein_class_kaoyan.checked = "";
	}
	
	var zhibo = document.getElementById("zhibo").value; 
	var zhibo_shi = document.getElementById("zhibo_shi");
	var zhibo_fou = document.getElementById("zhibo_fou");
	if (zhibo == "是"){
		zhibo_shi.checked = "checked";
		zhibo_fou.checked = "";
	}else if(zhibo == "否"){
		zhibo_shi.checked = "";
		zhibo_fou.checked = "checked";
	}else{
		zhibo_shi.checked = "";
		zhibo_fou.checked = "";
	}
}