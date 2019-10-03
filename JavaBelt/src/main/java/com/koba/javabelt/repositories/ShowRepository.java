package com.koba.javabelt.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.koba.javabelt.models.Show;

@Repository
public interface ShowRepository extends CrudRepository<Show, Long> {
	List<Show> findAll();
	Show findByTitle(String title);
}
