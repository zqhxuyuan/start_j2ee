package com.xuyuan.spring3.recipes.dataaccess.vehicle;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * jdbc.JdbcVehicleDao 并没有使用事务控制，通过beans.xml的默认自动提交事务机制，添加/更新/删除会自动提交事务到数据库。
 */
public class Main {

	public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/15/beans.xml");
        VehicleDao vehicleDao = (VehicleDao) context.getBean("vehicleDao1");
        
        Vehicle vehicle = new Vehicle("TEM0001", "Red", 4, 4);
        vehicleDao.insert(vehicle);
        
        Vehicle vehicle1 = new Vehicle("TEM0002", "Blue", 4, 4);
        Vehicle vehicle2 = new Vehicle("TEM0003", "Black", 4, 6);
        vehicleDao.insertBatch(Arrays.asList(new Vehicle[] { vehicle1, vehicle2 }));
        
        List<Vehicle> vehicles = vehicleDao.findAll();
        for (Vehicle v : vehicles) {
            System.out.println("Vehicle No: " + v.getVehicleNo() + "	|	Color: " + v.getColor() + "	|	Wheel: " + v.getWheel() + "	|	Seat: " + v.getSeat());
        }
        
        vehicle = vehicleDao.findByVehicleNo("TEM0001");
        System.out.println("Vehicle No: " + vehicle.getVehicleNo() + "	|	Color: " + vehicle.getColor() + "	|	Wheel: " + vehicle.getWheel() + "	|	Seat: " + vehicle.getSeat());
        
        int count = vehicleDao.countAll();
        System.out.println("Vehicle Count: " + count);
        
        String color = vehicleDao.getColor("TEM0001");
        System.out.println("Color for [TEM0001]: " + color);

        
        //        VehicleInsertOperation operation = 
        //            (VehicleInsertOperation) context.getBean("vehicleInsertOperation");
        //        Vehicle vehicle = new Vehicle("OBJ0001", "Red", 4, 4);
        //        operation.perform(vehicle);

        //        VehicleQueryOperation operation =
        //            (VehicleQueryOperation) context.getBean("vehicleQueryOperation");
        //        Vehicle vehicle = operation.perform("OBJ0001");
        //        System.out.println("Vehicle No: " + vehicle.getVehicleNo());
        //        System.out.println("Color: " + vehicle.getColor());
        //        System.out.println("Wheel: " + vehicle.getWheel());
        //        System.out.println("Seat: " + vehicle.getSeat());

        //        VehicleCountOperation operation =
        //            (VehicleCountOperation) context.getBean("vehicleCountOperation");
        //        int count = operation.perform();
        //        System.out.println("Vehicle Count: " + count);
        
    }
}
