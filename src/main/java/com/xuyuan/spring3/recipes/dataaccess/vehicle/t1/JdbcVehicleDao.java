package com.xuyuan.spring3.recipes.dataaccess.vehicle.t1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;

import com.xuyuan.spring3.recipes.dataaccess.vehicle.Vehicle;
import com.xuyuan.spring3.recipes.dataaccess.vehicle.VehicleDao;

/**
 * 02:DataSource注入Dao中，通过DataSource构建Spring提供的JdbcTemplate简化CRUD调用方法的操作。 
 */
public class JdbcVehicleDao implements VehicleDao{
	
	/**
	 * @uml.property  name="dataSource"
	 * @uml.associationEnd  
	 */
	private DataSource dataSource;
    /**
	 * @param dataSource
	 * @uml.property  name="dataSource"
	 */
    public void setDataSource(DataSource dataSource) { 
        this.dataSource = dataSource; 
    } 
	 
	public void insert(final Vehicle vehicle) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource); 
		 
        jdbcTemplate.update(new PreparedStatementCreator() {
        	public PreparedStatement createPreparedStatement(Connection conn) throws SQLException { 
		        String sql = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (?, ?, ?, ?)"; 
		        PreparedStatement ps = conn.prepareStatement(sql); 
		        ps.setString(1, vehicle.getVehicleNo()); 
		        ps.setString(2, vehicle.getColor()); 
		        ps.setInt(3, vehicle.getWheel()); 
		        ps.setInt(4, vehicle.getSeat()); 
		        return ps; 
        	}
        });
        
        /**
        String sql = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (?, ?, ?, ?)"; 
        jdbcTemplate.update(sql, new PreparedStatementSetter() { 
            public void setValues(PreparedStatement ps) throws SQLException { 
                ps.setString(1, vehicle.getVehicleNo()); 
                ps.setString(2, vehicle.getColor()); 
                ps.setInt(3, vehicle.getWheel()); 
                ps.setInt(4, vehicle.getSeat()); 
            } 
        });
        */
        
        /**
        String sql = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (?, ?, ?, ?)"; 
        jdbcTemplate.update(sql, new Object[] { vehicle.getVehicleNo(), vehicle.getColor(),vehicle.getWheel(), vehicle.getSeat() });
        */
	}

	public void update(final Vehicle vehicle) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "UPDATE VEHICLE SET COLOR=?, WHEEL=?, SEAT=? WHERE VEHICLE_NO=?";
		
        jdbcTemplate.update(sql, new PreparedStatementSetter() { 
            public void setValues(PreparedStatement ps) throws SQLException { 
                ps.setString(1, vehicle.getColor()); 
                ps.setInt(2, vehicle.getWheel()); 
                ps.setInt(3, vehicle.getSeat());
                ps.setString(4, vehicle.getVehicleNo());
            } 
        });
	}

	public void delete(Vehicle vehicle) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "DELETE VEHICLE WHERE VEHICLE_NO=?";
		
		jdbcTemplate.update(sql, new Object[] { vehicle.getVehicleNo() });
	}

	public Vehicle findByVehicleNo(String vehicleNo) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM VEHICLE WHERE VEHICLE_NO = ?";
		
        final Vehicle vehicle = new Vehicle(); 
        jdbcTemplate.query(sql, new Object[]{vehicleNo}, new RowCallbackHandler() { 
            public void processRow(ResultSet rs) throws SQLException { 
                vehicle.setVehicleNo(rs.getString("VEHICLE_NO")); 
                vehicle.setColor(rs.getString("COLOR")); 
                vehicle.setWheel(rs.getInt("WHEEL")); 
                vehicle.setSeat(rs.getInt("SEAT")); 
            } 
        });
        
        //Vehicle vehicle = (Vehicle) jdbcTemplate.queryForObject(sql,  new Object[] { vehicleNo }, new VehicleRowMapper());
        
        //BeanPropertyRowMapper<Vehicle> vehicleRowMapper = BeanPropertyRowMapper.newInstance(Vehicle.class); 
        //Vehicle vehicle = jdbcTemplate.queryForObject(sql, vehicleRowMapper, vehicleNo); 
        return vehicle;
	}

	public void insertBatch(final List<Vehicle> vehicles) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (?, ?, ?, ?)"; 
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() { 
            public int getBatchSize() { 
                return vehicles.size(); 
            } 
            public void setValues(PreparedStatement ps, int i) throws SQLException { 
                Vehicle vehicle = vehicles.get(i); 
                ps.setString(1, vehicle.getVehicleNo()); 
                ps.setString(2, vehicle.getColor()); 
                ps.setInt(3, vehicle.getWheel()); 
                ps.setInt(4, vehicle.getSeat()); 
            } 
        });
	}

	public List<Vehicle> findAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT * FROM VEHICLE"; 
 
        List<Vehicle> vehicles = new ArrayList<Vehicle>(); 
        List<Map<String,Object>> rows = jdbcTemplate.queryForList(sql); 
        for (Map<String, Object> row : rows) { 
            Vehicle vehicle = new Vehicle(); 
            vehicle.setVehicleNo((String) row.get("VEHICLE_NO")); 
            vehicle.setColor((String) row.get("COLOR")); 
            vehicle.setWheel((Integer) row.get("WHEEL")); 
            vehicle.setSeat((Integer) row.get("SEAT")); 
            vehicles.add(vehicle); 
        }
        //RowMapper<Vehicle> rm = BeanPropertyRowMapper.newInstance(Vehicle.class); 
        //List<Vehicle> vehicles = jdbcTemplate.query(sql, rm);
        return vehicles;
	}

	public String getColor(String vehicleNo) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT COLOR FROM VEHICLE WHERE VEHICLE_NO = ?"; 
 
        String color = (String) jdbcTemplate.queryForObject(sql, new Object[] { vehicleNo }, String.class); 
        return color; 
	}

	public int countAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT COUNT(*) FROM VEHICLE"; 
 
        int count = jdbcTemplate.queryForInt(sql); 
        return count; 
	}

}
