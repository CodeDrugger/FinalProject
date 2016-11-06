function resetInput()
{
	var ipt = document.getElementById("input");
	ipt.value = "";
}
function addBenkeOption(val, txt)
{
	var opt = document.createElement("option");
	opt.text = txt;
	opt.value = val;
	benke_major.options.add(opt);
}
function addWishOption(val, txt)
{
	var optn = document.createElement("option");
	optn.text = txt;
	optn.value = val;
	wish_major.options.add(optn);
}
function selectBenkeMajor()
{
	var benke_major = document.getElementById("benke_major");
	var benke_major_len = benke_major.options.length;
	if (benke_major_len > 0)
	{
		for (var i = 0; i < benke_major_len; i++)
		{
			benke_major.options.remove(0);
		}
	}
	var benke_xueyuan = document.getElementById("benke_xueyuan");
	var benke_xueyuan_value = benke_xueyuan.value;
	if (benke_xueyuan_value == "控制科学与工程系") 
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("自动化","自动化");
		addBenkeOption("探测制导与控制技术","探测制导与控制技术");
		addBenkeOption("智能控制技术","智能控制技术");
	}
	else if (benke_xueyuan_value == "航天工程与力学系")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("工科试验班","工科试验班");
		addBenkeOption("工程力学","工程力学");
		addBenkeOption("飞行器设计与工程","飞行器设计与工程");
		addBenkeOption("飞行器环境与生命保障","飞行器环境与生命保障");
		addBenkeOption("复合材料与工程","复合材料与工程");
		addBenkeOption("空间科学与技术","空间科学与技术");
	}
	else if (benke_xueyuan_value == "电子科学与技术系")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("电子科学与技术","电子科学与技术");
		addBenkeOption("电子信息科学与技术","电子信息科学与技术");
		addBenkeOption("光电信息科学与工程","光电信息科学与工程");
		addBenkeOption("光信息科学与技术","光信息科学与技术");
	}
	else if (benke_xueyuan_value == "机电工程学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("机械设计制造及其自动化","机械设计制造及其自动化");
		addBenkeOption("工业设计","工业设计");
		addBenkeOption("飞行器制造工程","飞行器制造工程");
		addBenkeOption("工业工程","工业工程");
		addBenkeOption("机械电子工程","机械电子工程");
		addBenkeOption("广播电视编导","广播电视编导");
		addBenkeOption("广告学","广告学");
		addBenkeOption("数字媒体技术","数字媒体技术");
		addBenkeOption("数字媒体艺术","数字媒体艺术");
	}
	else if (benke_xueyuan_value == "材料科学与工程学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("材料成型及控制工程","材料成型及控制工程");
		addBenkeOption("材料科学与工程","材料科学与工程");
		addBenkeOption("无机非金属材料工程","无机非金属材料工程");
		addBenkeOption("材料物理化学","材料物理化学");
		addBenkeOption("焊接技术与工程","焊接技术与工程");
		addBenkeOption("电子封装技术","电子封装技术");
		addBenkeOption("高分子材料与工程","高分子材料与工程");
		addBenkeOption("材料物理","材料物理");
		addBenkeOption("光电信息与器件","光电信息与器件");
		addBenkeOption("光电信息科学与工程","光电信息科学与工程");
	}
	else if (benke_xueyuan_value == "能源科学与工程学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("热能与动力工程","热能与动力工程");
		addBenkeOption("飞行器动力工程","飞行器动力工程");
		addBenkeOption("核反应堆工程","核反应堆工程");
		addBenkeOption("能源与动力工程","能源与动力工程");
		addBenkeOption("核工程与核技术","核工程与核技术");
	}
	else if (benke_xueyuan_value == "自动化测试与控制系")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("测控技术与仪器","测控技术与仪器");
		addBenkeOption("光电信息工程","光电信息工程");
		addBenkeOption("光电信息科学与工程","光电信息科学与工程");
	}
	else if (benke_xueyuan_value == "电气工程系")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("电气工程及其自动化","电气工程及其自动化");
		addBenkeOption("建筑电气与智能化","建筑电气与智能化");
		addBenkeOption("电气工程技术","电气工程技术");
	}
	else if (benke_xueyuan_value == "物理系")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("应用物理学","应用物理学");
		addBenkeOption("光电信息科学与技术","光电信息科学与技术");
		addBenkeOption("核物理","核物理");
		addBenkeOption("光电信息科学与工程","光电信息科学与工程");
	}
	else if (benke_xueyuan_value == "数学系")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("数学及应用数学","数学及应用数学");
		addBenkeOption("信息与计算科学","信息与计算科学");
		addBenkeOption("统计学","统计学");
	}
	else if (benke_xueyuan_value == "经济与管理学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("经济管理实验班","经济管理实验班");
		addBenkeOption("信息管理与信息系统","信息管理与信息系统");
		addBenkeOption("电子商务","电子商务");
		addBenkeOption("工程管理","工程管理");
		addBenkeOption("工商管理","工商管理");
		addBenkeOption("市场营销","市场营销");
		addBenkeOption("会计学","会计学");
		addBenkeOption("财务管理","财务管理");
		addBenkeOption("金融学","金融学");
		addBenkeOption("国际经济与贸易","国际经济与贸易");
	}
	else if (benke_xueyuan_value == "人文与社会科学学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("社会学","社会学");
		addBenkeOption("汉语言文学","汉语言文学");
	}
	else if (benke_xueyuan_value == "土木工程学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("土木工程","土木工程");
		addBenkeOption("理论与应用力学","理论与应用力学");
		addBenkeOption("城市地下空间工程","城市地下空间工程");
		addBenkeOption("工程管理","工程管理");
	}
	else if (benke_xueyuan_value == "市政环境工程学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("给排水科学与工程","给排水科学与工程");
		addBenkeOption("建筑环境与设备工程","建筑环境与设备工程");
		addBenkeOption("建筑环境与能源应用工程","建筑环境与能源应用工程");
		addBenkeOption("环境工程","环境工程");
		addBenkeOption("环境科学","环境科学");
	}
	else if (benke_xueyuan_value == "建筑学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("建筑学","建筑学");
		addBenkeOption("城市规划","城市规划");
		addBenkeOption("艺术设计","艺术设计");
		addBenkeOption("景观学","景观学");
		addBenkeOption("城乡规划","城乡规划");
		addBenkeOption("环境设计","环境设计");
		addBenkeOption("风景园林","风景园林");
	}
	else if (benke_xueyuan_value == "交通科学与工程学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("道路桥梁与渡河工程","道路桥梁与渡河工程");
		addBenkeOption("交通工程","交通工程");
		addBenkeOption("交通运输","交通运输");
		addBenkeOption("交通信息与控制工程","交通信息与控制工程");
		addBenkeOption("交通设备与交通工程","交通设备与交通工程");
	}
	else if (benke_xueyuan_value == "计算机科学与技术学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("计算机科学与技术","计算机科学与技术");
		addBenkeOption("信息安全","信息安全");
		addBenkeOption("生物信息学","生物信息学");
	}
	else if (benke_xueyuan_value == "软件学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("软件工程","软件工程");
		addBenkeOption("物联网工程","物联网工程");
	}
	else if (benke_xueyuan_value == "法学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("法学","法学");
	}
	else if (benke_xueyuan_value == "外国语学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("英语","英语");
		addBenkeOption("俄语","俄语");
		addBenkeOption("日语","日语");
	}
	else if (benke_xueyuan_value == "电子与信息工程学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("通信工程","通信工程");
		addBenkeOption("电子信息工程","电子信息工程");
		addBenkeOption("信息对抗技术","信息对抗技术");
		addBenkeOption("遥感科学与技术","遥感科学与技术");
		addBenkeOption("电磁场与无线技术","电磁场与无线技术");
	}
	else if (benke_xueyuan_value == "电子与信息工程学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("通信工程","通信工程");
		addBenkeOption("电子信息工程","电子信息工程");
		addBenkeOption("信息对抗技术","信息对抗技术");
		addBenkeOption("遥感科学与技术","遥感科学与技术");
		addBenkeOption("电磁场与无线技术","电磁场与无线技术");
	}
	else if (benke_xueyuan_value == "生命科学与技术学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("生物技术","生物技术");
		addBenkeOption("生物工程","生物工程");
	}
	else if (benke_xueyuan_value == "化工与化学学院")
	{
		addBenkeOption("","-请选择-");
		addBenkeOption("材料化学","材料化学");
		addBenkeOption("应用化学","应用化学");
		addBenkeOption("高分子材料与工程","高分子材料与工程");
		addBenkeOption("化学工程与工艺","化学工程与工艺");
		addBenkeOption("能源化学工程","能源化学工程");
		addBenkeOption("食品科学与工程","食品科学与工程");
	}
}
function selectWishMajor()
{
	var wish_major = document.getElementById("wish_major");
	var wish_major_len = wish_major.options.length;
	if (wish_major_len > 0)
	{
		for (var i = 0; i < wish_major_len; i++)
		{
			wish_major.options.remove(0);
		}
	}
	var wish_xueyuan = document.getElementById("wish_xueyuan");
	var wish_xueyuan_value = wish_xueyuan.value;
	if (wish_xueyuan_value == "航天学院")
	{
		addWishOption("","-请选择-");
		addWishOption("控制科学与工程","控制科学与工程");
		addWishOption("控制工程(全日制工程硕士)","控制工程(全日制工程硕士)");
		addWishOption("力学","力学");
		addWishOption("航空宇航科学与技术","航空宇航科学与技术");
		addWishOption("航天工程(全日制工程硕士)","航天工程(全日制工程硕士)");
		addWishOption("光学工程","光学工程");
		addWishOption("物理电子学","物理电子学");
		addWishOption("微电子学与固体电子学","微电子学与固体电子学");
		addWishOption("光学工程(全日制工程硕士)","光学工程(全日制工程硕士)");
		addWishOption("集成电路工程(全日制工程硕士)","集成电路工程(全日制工程硕士)");
	}
	else if (wish_xueyuan_value == "机电工程学院")
	{
		addWishOption("","-请选择-");
		addWishOption("机械制造及其自动化","机械制造及其自动化");
		addWishOption("机械电子工程","机械电子工程");
		addWishOption("机械设计及理论","机械设计及理论");
		addWishOption("航空宇航制造工程","航空宇航制造工程");
		addWishOption("机械工程(全日制工程硕士)","机械工程(全日制工程硕士)");
		addWishOption("设计学","设计学");
	}
	else if (wish_xueyuan_value == "材料科学与工程学院")
	{
		addWishOption("","-请选择-");
		addWishOption("材料物理与化学","材料物理与化学");
		addWishOption("空间材料与加工","空间材料与加工");
		addWishOption("光电信息科学与工程","光电信息科学与工程");
		addWishOption("材料学","材料学");
		addWishOption("材料加工工程","材料加工工程");
		addWishOption("材料工程","材料工程");
	}
	else if (wish_xueyuan_value == "能源科学与工程学院")
	{
		addWishOption("","-请选择-");
		addWishOption("动力工程及工程热物理","动力工程及工程热物理");
		addWishOption("动力工程(全日制工程硕士)","动力工程(全日制工程硕士)");
	}
	else if (wish_xueyuan_value == "电气工程及自动化学院")
	{
		addWishOption("","-请选择-");
		addWishOption("仪器科学与技术","仪器科学与技术");
		addWishOption("仪器仪表工程(全日制工程硕士)","仪器仪表工程(全日制工程硕士)");
		addWishOption("电气工程","电气工程");
		addWishOption("电气工程(全日制工程硕士)","电气工程(全日制工程硕士)");
	}
	else if (wish_xueyuan_value == "理学院")
	{
		addWishOption("","-请选择-");
		addWishOption("基础数学","基础数学");
		addWishOption("计算数学","计算数学");
		addWishOption("概率论与数理统计","概率论与数理统计");
		addWishOption("应用数学硕士","应用数学硕士");
		addWishOption("运筹学与控制论","运筹学与控制论");
		addWishOption("粒子物理与原子核物理","粒子物理与原子核物理");
		addWishOption("原子与分子物理","原子与分子物理");
		addWishOption("等离子体物理","等离子体物理");
		addWishOption("凝聚态物理","凝聚态物理");
		addWishOption("光学","光学");
	}
	else if (wish_xueyuan_value == "经济与管理学院")
	{
		addWishOption("","-请选择-");
		addWishOption("管理科学与工程","管理科学与工程");
		addWishOption("工商管理","工商管理");
		addWishOption("公共管理","公共管理");
		addWishOption("应用经济学","应用经济学");
		addWishOption("金融硕士","金融硕士");
		addWishOption("工商管理硕士","工商管理硕士");
		addWishOption("会计硕士","会计硕士");
		addWishOption("科学技术史","科学技术史");
	}
	else if (wish_xueyuan_value == "人文与社会科学学院")
	{
		addWishOption("","-请选择-");
		addWishOption("科学技术哲学","科学技术哲学");
		addWishOption("政治经济学","政治经济学");
		addWishOption("世界经济","世界经济");
		addWishOption("国际贸易学","国际贸易学");
		addWishOption("社会学","社会学");
		addWishOption("社会工作","社会工作");
	}
	else if (wish_xueyuan_value == "土木工程学院")
	{
		addWishOption("","-请选择-");
		addWishOption("土木工程","土木工程");
		addWishOption("力学","力学");
		addWishOption("建筑与土木工程","建筑与土木工程");
	}
	else if (wish_xueyuan_value == "市政环境工程学院")
	{
		addWishOption("","-请选择-");
		addWishOption("微生物学","微生物学");
		addWishOption("环境科学与工程","环境科学与工程");
		addWishOption("市政工程","市政工程");
		addWishOption("流体力学","流体力学");
		addWishOption("供热、供燃气、通风及空调工程","供热、供燃气、通风及空调工程");
		addWishOption("水力学及河流动力学","水力学及河流动力学");
		addWishOption("环境工程","环境工程");
	}
	else if (wish_xueyuan_value == "建筑学院")
	{
		addWishOption("","-请选择-");
		addWishOption("建筑设计及其理论","建筑设计及其理论");
		addWishOption("建筑技术科学","建筑技术科学");
		addWishOption("建筑历史与理论","建筑历史与理论");
		addWishOption("室内设计","室内设计");
		addWishOption("城乡规划学","城乡规划学");
		addWishOption("风景园林学","风景园林学");
		addWishOption("设计艺术学","设计艺术学");
		addWishOption("城市规划硕士","城市规划硕士");
		addWishOption("风景园林硕士","风景园林硕士");
	}
	else if (wish_xueyuan_value == "交通科学与工程学院")
	{
		addWishOption("","-请选择-");
		addWishOption("交通运输工程","交通运输工程");
		addWishOption("桥梁与隧道工程","桥梁与隧道工程");
		addWishOption("交通运输工程","交通运输工程");
		addWishOption("建筑与土木工程","建筑与土木工程");
	}
	else if (wish_xueyuan_value == "计算机科学与技术学院")
	{
		addWishOption("","-请选择-");
		addWishOption("计算机科学与技术","计算机科学与技术");
		addWishOption("计算机技术(工程硕士)","计算机技术(工程硕士)");
		addWishOption("软件工程","软件工程");
		addWishOption("网络空间安全","网络空间安全");
	}
	else if (wish_xueyuan_value == "软件学院")
	{
		addWishOption("","-请选择-");
		addWishOption("软件工程(全日制工程硕士)","软件工程(全日制工程硕士)");
	}
	else if (wish_xueyuan_value == "法学院")
	{
		addWishOption("","-请选择-");
		addWishOption("法学","法学");
		addWishOption("刑法学","刑法学");
	}
	else if (wish_xueyuan_value == "外国语学院")
	{
		addWishOption("","-请选择-");
		addWishOption("外国语言学及应用语言学(英语)","外国语言学及应用语言学(英语)");
		addWishOption("英语语言文学","英语语言文学");
		addWishOption("外国语言学及应用语言学(俄语)","外国语言学及应用语言学(俄语)");
		addWishOption("俄语语言文学","俄语语言文学");
		addWishOption("翻译硕士","翻译硕士");
	}
	else if (wish_xueyuan_value == "电子与信息工程学院")
	{
		addWishOption("","-请选择-");
		addWishOption("信息与通信工程","信息与通信工程");
		addWishOption("电磁场与微波技术","电磁场与微波技术");
		addWishOption("信息与通信工程(全日制工程硕士)","信息与通信工程(全日制工程硕士)");
		addWishOption("电磁场与微波技术(全日制工程硕士)","电磁场与微波技术(全日制工程硕士)");
	}
	else if (wish_xueyuan_value == "生命科学与技术学院")
	{
		addWishOption("","-请选择-");
		addWishOption("生物学","生物学");
		addWishOption("生物医学工程","生物医学工程");
		addWishOption("生物工程","生物工程");
	}
	else if (wish_xueyuan_value == "化工与化学学院")
	{
		addWishOption("","-请选择-");
		addWishOption("化学工程与技术","化学工程与技术");
		addWishOption("化学工程(全日制工程硕士)","化学工程(全日制工程硕士)");
		addWishOption("食品科学与工程","食品科学与工程");
		addWishOption("化学","化学");
	}
	else if (wish_xueyuan_value == "马克思主义学院")
	{
		addWishOption("","-请选择-");
		addWishOption("马克思主义哲学","马克思主义哲学");
		addWishOption("马克思主义理论","马克思主义理论");
	}
	else if (wish_xueyuan_value == "马克思主义学院")
	{
		addWishOption("","-请选择-");
		addWishOption("体育教育训练学","体育教育训练学");
	}
}
