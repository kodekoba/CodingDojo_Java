package com.koba.javabelt.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koba.javabelt.models.Rating;
import com.koba.javabelt.models.Show;
import com.koba.javabelt.models.User;
import com.koba.javabelt.services.RatingService;
import com.koba.javabelt.services.ShowService;
import com.koba.javabelt.services.UserService;

@Controller
public class ShowsController {
	private final UserService uServ;
	private final ShowService sServ;
	private final RatingService rServ;
	
	public ShowsController(UserService uServ, ShowService sServ, RatingService rServ) {
		this.uServ = uServ;
		this.sServ = sServ;
		this.rServ = rServ;
	}
	
	@RequestMapping("/shows")
	public String allShows(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long id = (Long) session.getAttribute("userId");
		User u = uServ.findUserById(id);
		model.addAttribute("user", u);
		
		List<Show> shows = sServ.allShows();
		model.addAttribute("shows", shows);
		return "/allShows.jsp";
	}
	
	@RequestMapping("/shows/new")
	public String newShow(@ModelAttribute("show") Show show) {
		return "/new.jsp";
	}
	@RequestMapping(value="/shows/create", method=RequestMethod.POST)
	public String createShow(@Valid @ModelAttribute("show") Show show, BindingResult result, @RequestParam(value="title") String title) {
		boolean isAuth = sServ.authShow(title);
		if(isAuth) {
			if (result.hasErrors()) {
	            return "/new.jsp";
	        } else {
	        		sServ.createShow(show);
	        		return "redirect:/shows";
	        }
		} else {
			return "redirect:/showError";
		}
	}
	@RequestMapping("/showError")
	public String flashMessages(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", "Show already added");
        return "redirect:/shows/new";
	}
	
	// ADD MODEL ATTRIBUTE FOR RATING FOR FORM
	@RequestMapping("/shows/{id}")
	public String showShow(@PathVariable("id") Long id, Model model, @ModelAttribute("rating") Rating rating, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		User u = uServ.findUserById(userId);
		model.addAttribute("user", u);
		
		Show show = sServ.findShow(id);
		model.addAttribute("show", show);
		
		List<Rating> ratings = rServ.findRatingsByShow(sServ.findShow(id));
		model.addAttribute("ratings", ratings);
		
		return "/showShow.jsp";
	}
	@RequestMapping(value="/shows/{id}/rate", method=RequestMethod.POST)
	public String rateShow(@RequestParam(value="value") double value, @PathVariable("id") Long id, @Valid @ModelAttribute("rating") Rating rating, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
            return "/showShow.jsp";
        } else {
        		Long userId = (Long) session.getAttribute("userId");
        		User u = uServ.findUserById(userId);
        		Rating thisRating = new Rating(value, u, sServ.findShow(id));
        		rServ.createRating(thisRating);
        		return "redirect:/shows/" + id;
        }
	}
	
	@RequestMapping("shows/{id}/edit")
	public String editShow(@PathVariable("id") Long id, @ModelAttribute("show") Show show, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("userId");
		User u = uServ.findUserById(userId);
		model.addAttribute("user", u);
		
		Show thisShow = sServ.findShow(id);
		model.addAttribute("show", thisShow);
		return "/editShow.jsp";
	}
	@RequestMapping(value="/shows/{id}/update", method=RequestMethod.POST)
	public String updateShow(@PathVariable("id") Long id, @Valid @ModelAttribute("show") Show show, BindingResult result, @RequestParam(value="title") String title, @RequestParam(value="network") String network) {
		if (title == null) {
			return "redirect:/missing/" + id;
        } 
		if (network == null){
        	return "redirect:/missing/" + id;
        }
		if(result.hasErrors()) {
			return "/editShow.jsp";
		} else {
			sServ.updateShow(show.getId(), show.getTitle(), show.getNetwork());
			return "redirect:/shows";
		}
	}
	
	@RequestMapping("/missing/{id}")
	public String flash(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", "Title and Network must be filled");
        return "redirect:/shows/" + id + "/update";
	}
	
	@RequestMapping("/shows/{id}/delete")
	public String delShow(@PathVariable("id") Long id) {
		sServ.deleteShow(id);
		return "redirect:/shows";
	}
}
