package com.project.proto.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

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
		
		if(session.getAttributes().get("id")!=null) {
			String tmp[] = message.getPayload().split(":",2);	
			System.out.println("1 : "+tmp[0]);
			System.out.println("2 : "+tmp[1]);
			for(WebSocketSession sess : list) {				
				if(sess.getAttributes().get("id").equals(tmp[0])) {
					sess.sendMessage(new TextMessage(tmp[0]+":"+tmp[1]));
					}
			}
		}else {
			session.getAttributes().put("id", message.getPayload());
		}
		
	
		
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		list.remove(session);
		
	}


}
