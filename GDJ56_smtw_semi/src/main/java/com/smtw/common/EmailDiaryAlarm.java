package com.smtw.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class EmailDiaryAlarm {
	public static String gmailSend(String[] arrmemberEmail) {
        String user = "showmetheway.56@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "mrntzrwfzxsgqgxn"; // 패스워드

        String result=""; //성공실패여부
        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
       
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {//그냥 외우는 로직 이해불가
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        
        
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            InternetAddress[] diaryAlarm=new InternetAddress[arrmemberEmail.length];
           
            for(int i=0;i<arrmemberEmail.length;i++) {
				diaryAlarm[i]=new InternetAddress(arrmemberEmail[i]);
            }
            
            //수신자메일주소 (다수)
            message.setRecipients(Message.RecipientType.TO, diaryAlarm);
			 
            // Subject
            message.setSubject("[Show Me The Way] ★★ 두근두근 출국 10일전!!! ★★ "); //메일 제목을 입력

            // Text
            message.setText("두근두근 출국 10일전입니다!!!!! 완벽히 준비 되었는지 다시 한번 확인하세요!"); //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            result="메일 전송 성공";
            
			} catch (AddressException e) { // TODO Auto-generated catch block
				e.printStackTrace(); 
				result="메일 전송 실패";
			} catch (MessagingException e){ // TODO Auto-generated
				e.printStackTrace(); 
				result="메일 전송 실패";
			 }
			 
        	return result; 
    }
}
