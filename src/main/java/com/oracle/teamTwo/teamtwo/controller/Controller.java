package com.oracle.teamTwo.teamtwo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.teamTwo.jy.service.JyChallengeService;
import com.oracle.teamTwo.teamtwo.service.ttService;

@org.springframework.stereotype.Controller
public class Controller {
	@Autowired
	private ttService tts;
	
	@GetMapping(value = "nav")
	public String main() {
		return "teamtwo/nav";
	}
	
	@GetMapping("updateState")
	@ResponseBody
	public int updateState() {
		int updateState = tts.updateState();
		return updateState;
	}
}
