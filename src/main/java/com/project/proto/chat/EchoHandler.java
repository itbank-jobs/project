package com.project.proto.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.proto.dto.Dto;

public class EchoHandler extends TextWebSocketHandler{
	private List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionEstablished(session);
		list.add(session);	
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
		String tmp[] = message.getPayload().split(":");

		if(session.getAttributes().get("employeeNumber")!=null) {
			if(tmp[0].equals("chessTable")) {
				System.out.println("체스확인 : "+tmp[0]);
				System.out.println("목적지 : "+tmp[1]);
				System.out.println("보낸넘 : "+tmp[2]);
				System.out.println("왓 : "+tmp[3]);
				System.out.println("왓 : "+tmp[4]);
				for(WebSocketSession sess : list) {				
					if(sess.getAttributes().get("employeeNumber").equals(tmp[1])) {
						if(tmp[3].equals("chessStart")) {
							System.out.println("1");
								if(tmp[4].equals("request")) {
									System.out.println("2");
									sess.sendMessage(new TextMessage(tmp[0]+":"+tmp[1]+":"+tmp[2]+":"+tmp[3]+":"+tmp[4]));	
								}else {
									System.out.println("왓 : "+tmp[5]);
									sess.sendMessage(new TextMessage(tmp[0]+":"+tmp[1]+":"+tmp[2]+":"+tmp[3]+":"+tmp[4]+":"+tmp[5]));
								}
								
						}else {
							System.out.println("체스확인 : "+tmp[0]);
							System.out.println("목적지 : "+tmp[1]);
							System.out.println("보낸넘 : "+tmp[2]);
							System.out.println("왓 : "+tmp[3]);
							System.out.println("왓 : "+tmp[4]);
							System.out.println("왓 : "+tmp[5]);
							
							sess.sendMessage(new TextMessage(tmp[0]+":"+tmp[1]+":"+tmp[2]+":"+tmp[3]+":"+tmp[4]+":"+tmp[5]));
						}
						}
				}
			
			}else{
				System.out.println("목적지 : "+tmp[0]);
				System.out.println("보낸넘 : "+tmp[1]);
				System.out.println("왓 : "+tmp[2]);
				for(WebSocketSession sess : list) {				
					if(sess.getAttributes().get("employeeNumber").equals(tmp[0])) {
						sess.sendMessage(new TextMessage(tmp[1]+":"+tmp[2]));

						}
				}
				
			}
		}else {
			session.getAttributes().put("employeeNumber", tmp[0]);
			session.getAttributes().put("name", tmp[1]);
		}

	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		list.remove(session);
		
	}
	public List<WebSocketSession> getList() {
		return list;
	}


}
