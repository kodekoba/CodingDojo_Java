package com.koba.javabelt.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.koba.javabelt.models.Rating;
import com.koba.javabelt.models.Show;

@Repository
public interface RatingRepository extends CrudRepository<Rating, Long>{
	List<Rating> findAll();
	List<Rating> findByShowOrderByValueAsc(Show show);
}
