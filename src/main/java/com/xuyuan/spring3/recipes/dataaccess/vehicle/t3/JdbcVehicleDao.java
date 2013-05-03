package com.xuyuan.spring3.recipes.dataaccess.vehicle.t3;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;

import com.xuyuan.spring3.recipes.dataaccess.vehicle.Vehicle;
import com.xuyuan.spring3.recipes.dataaccess.vehicle.VehicleDao;

/**
 *  03_01:JdbcTemplate是线程安全的，可以实例化一次，通过Ioc方式把JdbcTemplate对象注入Dao中。
 *  03_02:Dao继承Spring的JdbcDaoSupport，直接调用getJdbcTemplate()即可获得JdbcTemplate对象。
 *  04:继承SimpleJdbcDaoSupport，调用getSimpleJdbcTemplate()，使用JAVA1.5的一些特性。
 *  05:使用命名参数，而不是占位符。
 */
public class JdbcVehicleDao extends 
	//JdbcDaoSupport
	SimpleJdbcDaoSupport
	implements VehicleDao{

	/**
	private JdbcTemplate jdbcTemplate; 
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) { 
        this.jdbcTemplate = jdbcTemplate; 
    }
    */
    
    public void insert(final Vehicle vehicle) { 
        //String sql = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (?, ?, ?, ?)"; 
        
    	//jdbcTemplate.update(sql, new Object[] { vehicle.getVehicleNo(), vehicle.getColor(), vehicle.getWheel(), vehicle.getSeat() }); 
        
    	//this.getJdbcTemplate().update(sql, new Object[] { vehicle.getVehicleNo(), vehicle.getColor(), vehicle.getWheel(), vehicle.getSeat() });
        
    	//this.getSimpleJdbcTemplate().update(sql, vehicle.getVehicleNo(), vehicle.getColor(), vehicle.getWheel(), vehicle.getSeat());
        
    	String sql = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (:vehicleNo, :color, :wheel, :seat)";
    	
    	/**
    	Map<String, Object> parameters = new HashMap<String, Object>(); 
        parameters.put("vehicleNo", vehicle.getVehicleNo()); 
        parameters.put("color", vehicle.getColor()); 
        parameters.put("wheel", vehicle.getWheel()); 
        parameters.put("seat", vehicle.getSeat());
        this.getSimpleJdbcTemplate().update(sql, parameters);
        //SqlParameterSource parameterSource = new MapSqlParameterSource(parameters);
        */
    	SqlParameterSource parameterSource = new BeanPropertySqlParameterSource(vehicle);
        getSimpleJdbcTemplate().update(sql, parameterSource);
    }
    
    public void insertBatch(final List<Vehicle> vehicles) {
		//String sql = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (?, ?, ?, ?)";
		/**
		this.getJdbcTemplate().batchUpdate(sql, new BatchPreparedStatementSetter() { 
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
		
		List<Object[]> parameters = new ArrayList<Object[]>(); 
        for (Vehicle vehicle : vehicles) { 
            parameters.add(new Object[] { vehicle.getVehicleNo(), vehicle.getColor(), vehicle.getWheel(), vehicle.getSeat() }); 
        } 
        getSimpleJdbcTemplate().batchUpdate(sql, parameters);
        */
    	String sql = "INSERT INTO VEHICLE (VEHICLE_NO, COLOR, WHEEL, SEAT) VALUES (:vehicleNo, :color, :wheel, :seat)"; 
	    List<SqlParameterSource> parameters = new ArrayList<SqlParameterSource>(); 
	    for (Vehicle vehicle : vehicles) { 
	        parameters.add(new BeanPropertySqlParameterSource(vehicle)); 
	    } 
	    getSimpleJdbcTemplate().batchUpdate(sql, parameters.toArray(new SqlParameterSource[0]));
	}
    
	public void update(Vehicle vehicle) {
		String sql = "UPDATE VEHICLE SET COLOR=?, WHEEL=?, SEAT=? WHERE VEHICLE_NO=?"; 
		this.getJdbcTemplate().update(sql, new Object[] { vehicle.getColor(), vehicle.getWheel(), vehicle.getSeat(), vehicle.getVehicleNo() });
	}

	public void delete(Vehicle vehicle) {
		String sql = "DELETE VEHICLE WHERE VEHICLE_NO=?";
		//this.getJdbcTemplate().update(sql, new Object[] { vehicle.getVehicleNo() });
		this.getJdbcTemplate().update(sql,vehicle.getVehicleNo());
	}

	public Vehicle findByVehicleNo(String vehicleNo) {
		String sql = "SELECT * FROM VEHICLE WHERE VEHICLE_NO = ?"; 
        Vehicle vehicle = this.getJdbcTemplate().queryForObject(sql, BeanPropertyRowMapper.newInstance(Vehicle.class), vehicleNo);
        //Vehicle vehicle = getSimpleJdbcTemplate().queryForObject(sql, ParameterizedBeanPropertyRowMapper.newInstance(Vehicle.class), vehicleNo);
        return vehicle;
	}

	public List<Vehicle> findAll() {
		String sql = "SELECT * FROM VEHICLE";
        List<Vehicle> vehicles = this.getJdbcTemplate().query(sql, BeanPropertyRowMapper.newInstance(Vehicle.class));
        //List<Vehicle> vehicles = getSimpleJdbcTemplate().query(sql, ParameterizedBeanPropertyRowMapper.newInstance(Vehicle.class));
        return vehicles;
	}

	public String getColor(String vehicleNo) {
		String sql = "SELECT COLOR FROM VEHICLE WHERE VEHICLE_NO = ?"; 
        //String color = (String) this.getJdbcTemplate().queryForObject(sql, new Object[] { vehicleNo }, String.class);
        String color = this.getSimpleJdbcTemplate().queryForObject(sql, String.class, vehicleNo);
        return color; 
	}

	public int countAll() {
		String sql = "SELECT COUNT(*) FROM VEHICLE"; 
        //int count = this.getJdbcTemplate().queryForInt(sql); 
        int count = this.getSimpleJdbcTemplate().queryForObject(sql, Integer.class);
        return count;
	}
}
