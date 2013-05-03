package com.xuyuan.spring3.recipes.mvc.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.xuyuan.spring3.recipes.mvc.domain.PeriodicReservation;
import com.xuyuan.spring3.recipes.mvc.domain.Player;
import com.xuyuan.spring3.recipes.mvc.domain.Reservation;
import com.xuyuan.spring3.recipes.mvc.domain.SportType;

public class ReservationServiceImpl implements ReservationService { 
	 
    public static final SportType TENNIS = new SportType(1, "Tennis"); 
    public static final SportType SOCCER = new SportType(2, "Soccer"); 
 
    /**
	 * @uml.property  name="reservations"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="com.xuyuan.spring3.recipes.mvc.domain.Reservation"
	 */
    private List<Reservation> reservations; 
 
    public ReservationServiceImpl() { 
        reservations = new ArrayList<Reservation>(); 
        reservations.add(new Reservation("Tennis #1", new GregorianCalendar(2008, 0, 14).getTime(), 16, new Player("Roger", "N/A"), TENNIS)); 
        reservations.add(new Reservation("Tennis #2", new GregorianCalendar(2008, 0, 14).getTime(), 20, new Player("James", "N/A"), TENNIS)); 
    } 
 
	@Override
	public List<Reservation> list() {
		List<Reservation> result = new ArrayList<Reservation>(); 
        for (Reservation reservation : reservations) { 
        	result.add(reservation); 
        } 
        return result; 
	} 
	
    public List<Reservation> query(String courtName) { 
        List<Reservation> result = new ArrayList<Reservation>(); 
        for (Reservation reservation : reservations) { 
            if (reservation.getCourtName().equals(courtName)) { 
                result.add(reservation); 
            } 
        } 
        return result; 
    }

	@Override
	public void save(Reservation reservation) {
		reservations.add(reservation);
	}

	@Override
	public List<SportType> getAllSportTypes() {
		return Arrays.asList(new SportType[] { TENNIS, SOCCER });
	}

	public SportType getSportType(int sportTypeId) { 
        switch (sportTypeId) { 
        case 1: 
            return TENNIS; 
        case 2: 
            return SOCCER; 
        default: 
            return null; 
        } 
    }

	@Override
	public void makePeriodic(PeriodicReservation periodicReservation) {
		Calendar fromCalendar = Calendar.getInstance(); 
        fromCalendar.setTime(periodicReservation.getFromDate()); 
 
        Calendar toCalendar = Calendar.getInstance(); 
        toCalendar.setTime(periodicReservation.getToDate());
        
        while (fromCalendar.before(toCalendar)) { 
            Reservation reservation = new Reservation(); 
            reservation.setCourtName(periodicReservation.getCourtName()); 
            reservation.setDate(fromCalendar.getTime()); 
            reservation.setHour(periodicReservation.getHour()); 
            reservation.setPlayer(periodicReservation.getPlayer()); 
            save(reservation); 
 
            fromCalendar.add(Calendar.DATE, periodicReservation.getPeriod()); 
        }
	} 
	
	public List<Reservation> findByDate(Date date) { 
        List<Reservation> result = new ArrayList<Reservation>(); 
        for (Reservation reservation : reservations) {
        	if (reservation.getDate().equals(date)) { 
                result.add(reservation); 
            } 
        } 
        return result; 
    } 
}
