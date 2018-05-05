package com.project.proto.command;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.project.proto.dao.Dao;
import com.project.proto.dto.Dto;

public class find_PW implements Command {

	@Override
	public void execute(Model model, Dao dao) {

		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse res = (HttpServletResponse) map.get("res");
		Dto dto = new Dto();
		try {
			PrintWriter out = res.getWriter();

			dto.setEmployeeNumber(Integer.parseInt(req.getParameter("employeeNumber")));
			int employeeNumber = dto.getEmployeeNumber();
			
			dto = dao.find_PW(employeeNumber);
			if(dto != null) {
			out.print(dto.getEmail()); 
			}else {
				out.print("not");
			}
			out.flush();
			out.close();

			

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		if (dto != null) {
			System.out.println("메세지 전송함 확인 바람");
			sendMail(dto);
		}
	}

	/*
	 * Dto dto = new Dto();
	 * dto.setEmployeeNumber(Integer.parseInt(req.getParameter("employeeNumber")));
	 * int employeeNumber = dto.getEmployeeNumber();
	 * 
	 * 
	 * dto = dao.find_PW(employeeNumber);
	 * 
	 * if(dto != null) { sendMail(dto);
	 * 
	 * String email = dto.getEmail();
	 * 
	 * } else{ System.out.println("dto : "+dto); }
	 */

	private void sendMail(Dto dto) {
		// TODO Auto-generated method stub


		String server = "smtp.gmail.com";
		String sendID = "Jobs.Project.Proto@gmail.com";
		String sendPW = "itbank!@#";
		String sendMailAddr = "GoodLuck@Your.Future";
		int smtpPort = 465;

		String recEmailAddr = dto.getEmail();
		String sub = "요청하신 비밀번호 입니다.";
		String cont = "요청하신 비밀번호 는 : " + dto.getPassword() + " 입니다.";

		Properties props = System.getProperties();

		props.put("mail.smtp.host", server);
		props.put("mail.smtp.port", smtpPort);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", server);

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sendID, sendPW);
			}
		});

		session.setDebug(true);

		Message mimeMessage = new MimeMessage(session);
		try {
			mimeMessage.setFrom(new InternetAddress(sendMailAddr));
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
