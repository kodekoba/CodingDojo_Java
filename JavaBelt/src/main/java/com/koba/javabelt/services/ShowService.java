package com.koba.javabelt.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.koba.javabelt.models.Show;
import com.koba.javabelt.repositories.ShowRepository;

@Service
public class ShowService {
	private final ShowRepository sRepo;
	
	public ShowService(ShowRepository sRepo) {
		this.sRepo = sRepo;
	}
	
	public List<Show> allShows(){
		return sRepo.findAll();
	}
	public Show createShow(Show show) {
		return sRepo.save(show);
	}
	public Show findShow(Long id) {
		Optional<Show> optionalShow = sRepo.findById(id);
		if(optionalShow.isPresent()) {
			return optionalShow.get();
		} else {
			return null;
		}
	}
	public Show updateShow(Long id, String title, String network) {
		Optional<Show> optionalShow = sRepo.findById(id);
		if(optionalShow.isPresent()) {
			Show show = optionalShow.get();
			show.setTitle(title);
			show.setNetwork(network);
			sRepo.save(show);
			return optionalShow.get();
		} else {
			return null;
		}
	}
	public void deleteShow(Long id) {
		Optional<Show> optionalShow = sRepo.findById(id);
		if(optionalShow.isPresent()) {
			sRepo.deleteById(id);
		}
	}
	public boolean authShow(String title) {
		Show show = sRepo.findByTitle(title);
		if(show != null) {
			return false;
		} else {
			return true;
		}
	}
}
