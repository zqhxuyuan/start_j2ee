package com.xuyuan.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {

	//格式化
	static String YMD = "yyyy-MM-dd";
	static String YMDHMS = "yyyy-MM-dd HH:mm:ss";
	static String YMDHMS_NOBLANK = "yyyy-MM-dd HH:mm:ss";

	// 当前时间的表示方式
	static Date nowDate = new Date();
	static Timestamp nowTimestamp = new Timestamp(System.currentTimeMillis());
	static String myDate = "2012-12-13";
	static String myTime = "2012-12-13 14:15:16";

	public static String formatDate(String format, Date date){
		String dateStr = new SimpleDateFormat(format).format(date);
		System.out.println(dateStr);
		return dateStr;
	}
	public static String formatTimestamp(String format, Timestamp timestamp){
		String dateStr = new SimpleDateFormat(format).format(timestamp);
		System.out.println(dateStr);
		return dateStr;
	}
	
	public static Date parseDateStr(String format, String dateStr) throws Exception{
		Date date = new SimpleDateFormat(format).parse(dateStr);
		System.out.println(date);
		return date;
	}
	
	public static void main(String[] args) throws Exception {
		TimeUtil.formatDate(TimeUtil.YMD, nowDate);
		TimeUtil.formatDate(TimeUtil.YMDHMS, nowDate);
		TimeUtil.formatDate(TimeUtil.YMD, nowTimestamp);
		TimeUtil.formatDate(TimeUtil.YMDHMS, nowTimestamp);
		
		TimeUtil.parseDateStr(TimeUtil.YMD, myDate);
		TimeUtil.parseDateStr(TimeUtil.YMDHMS, myTime);
		
		//1340590874034
		//1340678290812
		long now = System.currentTimeMillis();
		System.out.println(now);
		
		Date d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		System.out.println(d);
		
		String s = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		System.out.println(s);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		String strDateTo = "2012/6/26";
        Date dateTo = formatter.parse(strDateTo);
        System.out.println(dateTo);
        
       String nows= new SimpleDateFormat("HH-mm-ss").format(new Date());
       System.out.println(nows);
       System.out.println("------------");
       
       //Date eight = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2012-6-26 08:30:00");
       Date eight = new SimpleDateFormat("HH:mm:ss").parse("18:30:00");
       Date NOW = new SimpleDateFormat("HH:mm:ss").parse(new SimpleDateFormat("HH:mm:ss").format(new Date()));
       if(eight.before(NOW)){
    	   System.out.println("BEFORE");
       }else{
    	   System.out.println("AFTER");
       }
	}
}
