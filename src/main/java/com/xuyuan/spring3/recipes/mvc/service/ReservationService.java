package com.xuyuan.spring3.recipes.mvc.service;

import java.util.Date;
import java.util.List;

import com.xuyuan.spring3.recipes.mvc.domain.PeriodicReservation;
import com.xuyuan.spring3.recipes.mvc.domain.Reservation;
import com.xuyuan.spring3.recipes.mvc.domain.SportType;

public interface ReservationService {
	public List<Reservation> query(String courtName);
	public void save(Reservation reservation);
	public List<Reservation> list();
	
	public List<SportType> getAllSportTypes();
	public SportType getSportType(int sportTypeId);
	
	public void makePeriodic(PeriodicReservation periodicReservation);
	public List<Reservation> findByDate(Date date);
}
