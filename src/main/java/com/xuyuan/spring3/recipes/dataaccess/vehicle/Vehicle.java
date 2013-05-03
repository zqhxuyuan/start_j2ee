package com.xuyuan.spring3.recipes.dataaccess.vehicle;

public class Vehicle {
    /**
	 * @uml.property  name="vehicleNo"
	 */
    private String vehicleNo;
    /**
	 * @uml.property  name="color"
	 */
    private String color;
    /**
	 * @uml.property  name="wheel"
	 */
    private int wheel;
    /**
	 * @uml.property  name="seat"
	 */
    private int seat;

    public Vehicle() {
    }

    public Vehicle(String vehicleNo, String color, int wheel, int seat) {
        this.vehicleNo = vehicleNo;
        this.color = color;
        this.wheel = wheel;
        this.seat = seat;
    }

    /**
	 * @return
	 * @uml.property  name="color"
	 */
    public String getColor() {
        return color;
    }

    /**
	 * @return
	 * @uml.property  name="seat"
	 */
    public int getSeat() {
        return seat;
    }

    /**
	 * @return
	 * @uml.property  name="vehicleNo"
	 */
    public String getVehicleNo() {
        return vehicleNo;
    }

    /**
	 * @return
	 * @uml.property  name="wheel"
	 */
    public int getWheel() {
        return wheel;
    }

    /**
	 * @param color
	 * @uml.property  name="color"
	 */
    public void setColor(String color) {
        this.color = color;
    }

    /**
	 * @param seat
	 * @uml.property  name="seat"
	 */
    public void setSeat(int seat) {
        this.seat = seat;
    }

    /**
	 * @param vehicleNo
	 * @uml.property  name="vehicleNo"
	 */
    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }

    /**
	 * @param wheel
	 * @uml.property  name="wheel"
	 */
    public void setWheel(int wheel) {
        this.wheel = wheel;
    }
}
