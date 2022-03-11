package com.karitoreyes.project.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OroNinjaController {
	@RequestMapping("/gold")
	public String index(HttpSession session, Model model) {
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
			session.setAttribute("messages", new ArrayList<String>());
			model.addAttribute("countToShow", 0);
			model.addAttribute("messagesToShow", new ArrayList<String>());
		}else {
			Integer currentCount = (Integer) session.getAttribute("count");
			@SuppressWarnings("unchecked")
			ArrayList<String> messages = (ArrayList<String>)session.getAttribute("messages");
			model.addAttribute("countToShow", currentCount);
			model.addAttribute("messagesToShow", messages);
		}
		return "index.jsp";
	}
	
	@RequestMapping(value="/result", method=RequestMethod.POST)
	public String result(HttpSession session, @RequestParam(value="option") String option) {
		Random random = new Random();
		Date date = new Date();
		Integer currentCount = (Integer) session.getAttribute("count");
		@SuppressWarnings("unchecked")
		ArrayList<String> messages = (ArrayList<String>)session.getAttribute("messages");
		if(option.equals("farm")) {
			Integer money = random.nextInt(10) + 10;
			session.setAttribute("count", currentCount + money);
			messages.add("<p class='text-success'>You entered a farm and earned "+ money +" gold. (" +date+")</p>");
		}else if(option.equals("cave")) {
			Integer money = random.nextInt(10) + 5;
			session.setAttribute("count", currentCount + money);
			messages.add("<p class='text-success'>You entered a cave and earned "+ money +" gold. (" +date+")</p>");
		}else if(option.equals("house")) {
			Integer money = random.nextInt(3) + 2;
			session.setAttribute("count", currentCount + money);
			messages.add("<p class='text-success'>You entered a house and earned "+ money +" gold. (" +date+")</p>");
		}else if(option.equals("casino")) {
			Integer money = random.nextInt(100) - 50;
			session.setAttribute("count", currentCount + money);
			if(money>=0) {
				messages.add("<p class='text-success'>You entered a casino and earned "+ money +" gold. (" +date+")</p>");
			}else {
				messages.add("<p class='text-danger'>You entered a casino and lost "+ (money*-1) +" gold... Ouch. (" +date+")</p>");
			}
		}
		session.setAttribute("messages", messages);
		return "redirect:/gold";
	}
}