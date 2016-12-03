package service;
import domain.*;
public class SendMail {
	public void send_mail(String receiver,String title,String message){
		Mail mail = new Mail();  
        mail.setHost("smtp.163.com"); // 设置邮件服务器,如果不用163的,自己找找看相关的  
        mail.setSender("15636811081@163.com");  
        mail.setReceiver(receiver); // 接收人  
        mail.setUsername("15636811081@163.com"); // 登录账号,一般都是和邮箱名一样吧  
        mail.setPassword("dai5512662"); // 发件人邮箱的登录密码  
        mail.setSubject(title);  
        mail.setMessage(message);  
        new MailUtil().send(mail);  
	}
}
