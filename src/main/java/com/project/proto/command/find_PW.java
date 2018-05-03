package com.project.proto.command;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.project.proto.dao.Dao;
import com.project.proto.dto.Dto;

public class find_PW implements Command {

	@Override
	public void execute(Model model, Dao dao) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		Dto dto = new Dto();
		dto.setEmployeeNumber(Integer.parseInt(req.getParameter("employeeNumber")));
	
		
		int employeeNumber = dto.getEmployeeNumber();
		
		dto = dao.find_PW(employeeNumber);
			
		if(dto.getEmail() != null && dto.getPassword() != null) {
			sendMail(dto);
		}
		else if(dto.getEmail() == null && dto.getPassword() == null) {
			System.out.println("오류 났어요");
		}
		
	}
	
	private void sendMail(Dto dto) {
		// TODO Auto-generated method stub
			
	
		  String server = "smtp.gmail.com";
		  String sendID = "luck9262@gmail.com";
		  String sendPW = "";
		  String sendMailAddr = "protoType-1@project.test";
		  int smtpPort=465;
		  
		  String recEmailAddr=dto.getEmail();;
		  String sub = "요청하신 비밀번호 입니다.";
		  String cont = "아이디 :"+ dto.getEmail()+"\r\n"+"비밀번호 : "+ dto.getPassword();
		  
		  Properties props = System.getProperties();
		  
		  props.put("mail.smtp.host", server);
		  props.put("mail.smtp.port", smtpPort);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", server);
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		   protected PasswordAuthentication getPasswordAuthentication(){
		    return new PasswordAuthentication(sendID, sendPW);
		   }
		  });
		  
		  session.setDebug(true);
		  
		  Message mimeMessage = new MimeMessage(session);
		  try {
		   mimeMessage.setFrom(new InternetAddress( sendMailAddr ));
		   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recEmailAddr));
		   mimeMessage.setSubject(sub);
		   mimeMessage.setText(cont);
		   Transport.send(mimeMessage);
		  } catch (AddressException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (MessagingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		 }
		
}

