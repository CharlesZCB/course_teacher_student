package com.cn.test;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.Test;

import com.sun.mail.util.MailSSLSocketFactory;
import com.sun.xml.internal.bind.v2.runtime.output.IndentingUTF8XmlOutput;

public class EmailTest {
	@Test
	public void password(String name,String email,String sex,Integer sid) throws MessagingException, GeneralSecurityException {
		name="t1";
		email="2365956483@qq.com";
		sex="女";
		sid=1;
        Properties props = new Properties();
        // 开启debug调试
        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.qq.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");

        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);
        Session session = Session.getInstance(props);
        String chenwei=null;
        if(sex=="男"){
        	chenwei="先生";
        }
        else {
			chenwei="女士";
		}

        Message msg = new MimeMessage(session);
        msg.setSubject("密码重置信息");
        StringBuilder builder = new StringBuilder();
        builder.append(name+chenwei+":请登陆以下链接重置密码："+"http://19kj699542.iask.in:19026/ssm2/front/passget?uid="+sid);
        msg.setText(builder.toString());
        msg.setFrom(new InternetAddress("2365956483@qq.com"));
        Transport transport = session.getTransport();
        transport.connect("smtp.qq.com", "2365956483@qq.com", "fvlvsrtcblclebab");
        transport.sendMessage(msg, new Address[] { new InternetAddress(email) });
        transport.close();
    }
}
