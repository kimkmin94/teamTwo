package com.oracle.teamTwo.km;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
//STOMP를 사용하기 위해 EnableWebSocketMessageBroker 임포트
//WebSocketMessageBrokerConfigurer 상속받아 configureMessageBroker 구현	
  private final StompHandler stompHandler;
	
  @Override
	public void configureClientInboundChannel(ChannelRegistration registration) {
		registration.interceptors(stompHandler);
	}
  
  @Override
  public void configureMessageBroker(MessageBrokerRegistry config) {
    config.enableSimpleBroker("/sub");
    config.setApplicationDestinationPrefixes("/pub");
    //메세지 발행 요청 prefix는 /pub
    //메세지 구독 요청 prefix는 /sub
  }

  @Override
  public void registerStompEndpoints(StompEndpointRegistry registry) {
    registry.addEndpoint("/km-websocket").withSockJS();
    //stomp websocket endpoint 주소
    //개발서버 접속 주소 ws://localhost:8282/km-websocket
  }

}