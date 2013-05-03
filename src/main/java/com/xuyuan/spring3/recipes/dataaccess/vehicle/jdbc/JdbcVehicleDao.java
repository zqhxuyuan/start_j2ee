package com.xuyuan.spring3.recipes.dataaccess.vehicle.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.xuyuan.spring3.recipes.dataaccess.vehicle.Vehicle;
import com.xuyuan.spring3.recipes.dataaccess.vehicle.VehicleDao;

/**
 * 01:JDBC纯数据库操作 
 */
public class JdbcVehicleDao implements VehicleDao { 
	
    /**
	 * @uml.property  name="dataSource"
	 * @uml.associationEnd  
	 */
    private DataSource dataSource;
    /**
	 * @uml.property  name="sQL_insert"
	 */
    private String SQL_insert = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (?, ?, ?, ?)";
    /**
	 * @uml.property  name="sQL_update"
	 */
    private String SQL_update = "UPDATE VEHICLE SET COLOR=?, WHEEL=?, SEAT=? WHERE VEHICLE_NO = ?";
    /**
	 * @uml.property  name="sQL_delete"
	 */
    private String SQL_delete = "DELETE FROM VEHICLE WHERE VEHICLE_NO = ?";
    /**
	 * @uml.property  name="sQL_findByVehicleNo"
	 */
    private String SQL_findByVehicleNo = "SELECT * FROM VEHICLE WHERE VEHICLE_NO = ?";
    /**
	 * @uml.property  name="sQL_findByColor"
	 */
    private String SQL_findByColor = "SELECT COLOR FROM VEHICLE WHERE VEHICLE_NO = ?";
    /**
	 * @uml.property  name="sQL_findAll"
	 */
    private String SQL_findAll = "SELECT * FROM VEHICLE";
    /**
	 * @uml.property  name="sQL_countAll"
	 */
    private String SQL_countAll = "SELECT COUNT(*) NUM FROM VEHICLE";
    
    /**
	 * @param dataSource
	 * @uml.property  name="dataSource"
	 */
    public void setDataSource(DataSource dataSource) { 
        this.dataSource = dataSource; 
    } 
    
    private void closeConnection(Connection conn){
    	if (conn != null) { 
            try { 
                conn.close(); 
            } catch (SQLException e) {
            } 
        } 
    }
 
    private void executeUpdate(Vehicle vehicle, String action, String sql){
    	System.out.println(sql);
    	Connection conn = null; 
        try { 
            conn = dataSource.getConnection(); 
            PreparedStatement ps = conn.prepareStatement(sql);
            if("insert".equals(action)){
                ps.setString(1, vehicle.getVehicleNo());
                ps.setString(2, vehicle.getColor()); 
                ps.setInt(3, vehicle.getWheel()); 
                ps.setInt(4, vehicle.getSeat()); 
            }else if("update".equals(action)){
            	 ps.setString(1, vehicle.getColor()); 
                 ps.setInt(2, vehicle.getWheel()); 
                 ps.setInt(3, vehicle.getSeat()); 
                 ps.setString(4, vehicle.getVehicleNo()); 
            }else if("delete".equals(action)){
            	 ps.setString(4, vehicle.getVehicleNo()); 
            }
            ps.executeUpdate(); 
            ps.close(); 
        } catch (SQLException e) { 
            throw new RuntimeException(e); 
        } finally { 
            this.closeConnection(conn);
        } 
    }
    
    public void insert(Vehicle vehicle) { 
        this.executeUpdate(vehicle, "insert", SQL_insert);
    } 
 
    public void update(Vehicle vehicle) {
    	this.executeUpdate(vehicle, "update", SQL_update);
    } 
 
    public void delete(Vehicle vehicle) {
    	this.executeUpdate(vehicle, "delete", SQL_delete);
    }
    
	public void insertBatch(List<Vehicle> vehicles) {
		for(Vehicle v : vehicles){
			this.insert(v);
		}
	}
	
    public Vehicle findByVehicleNo(String vehicleNo) { 
        Connection conn = null; 
        try { 
            conn = dataSource.getConnection(); 
            PreparedStatement ps = conn.prepareStatement(SQL_findByVehicleNo); 
            ps.setString(1, vehicleNo); 
 
            Vehicle vehicle = null; 
            ResultSet rs = ps.executeQuery(); 
            if (rs.next()) { //find one
                vehicle = new Vehicle(rs.getString("VEHICLE_NO"), rs.getString("COLOR"), rs.getInt("WHEEL"), rs.getInt("SEAT")); 
            } 
            rs.close(); 
            ps.close(); 
            return vehicle; 
        } catch (SQLException e) { 
            throw new RuntimeException(e); 
        } finally { 
        	this.closeConnection(conn);
        } 
    } 

	public List<Vehicle> findAll() {
		Connection conn = null; 
        try { 
            conn = dataSource.getConnection(); 
            PreparedStatement ps = conn.prepareStatement(SQL_findAll); 
 
            List<Vehicle> vehicles = new ArrayList<Vehicle>();; 
            ResultSet rs = ps.executeQuery(); 
            while (rs.next()) { //find all
                Vehicle vehicle = new Vehicle(rs.getString("VEHICLE_NO"), rs.getString("COLOR"), rs.getInt("WHEEL"), rs.getInt("SEAT"));
                vehicles.add(vehicle);
            } 
            rs.close(); 
            ps.close(); 
            return vehicles; 
        } catch (SQLException e) { 
            throw new RuntimeException(e); 
        } finally { 
        	this.closeConnection(conn);
        } 
	}

	public String getColor(String vehicleNo) {
		Connection conn = null; 
        try { 
            conn = dataSource.getConnection(); 
            PreparedStatement ps = conn.prepareStatement(SQL_findByColor); 
            ps.setString(1, vehicleNo); 
 
            String color = ""; 
            ResultSet rs = ps.executeQuery(); 
            if (rs.next()) { 
                color = rs.getString("COLOR"); 
            } 
            rs.close(); 
            ps.close(); 
            return color; 
        } catch (SQLException e) { 
            throw new RuntimeException(e); 
        } finally { 
        	this.closeConnection(conn);
        } 
	}

	public int countAll() {
		Connection conn = null; 
        try { 
            conn = dataSource.getConnection(); 
            PreparedStatement ps = conn.prepareStatement(SQL_countAll); 

            int count = 0;
            ResultSet rs = ps.executeQuery(); 
            if (rs.next()) { 
            	count = rs.getInt("NUM");
            } 
            rs.close(); 
            ps.close(); 
            return count; 
        } catch (SQLException e) { 
            throw new RuntimeException(e); 
        } finally { 
        	this.closeConnection(conn);
        } 
	} 

}
