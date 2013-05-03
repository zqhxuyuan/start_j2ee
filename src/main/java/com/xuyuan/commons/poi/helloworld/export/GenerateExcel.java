package com.xuyuan.commons.poi.helloworld.export;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.poi.POIXMLProperties;
import org.apache.poi.hpsf.DocumentSummaryInformation;
import org.apache.poi.hpsf.SummaryInformation;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.xuyuan.commons.poi.helloworld.bean.Student;

/**
 * 生成Excel示例，2003和2007
 *
 * @author Nanlei
 *
 */
public class GenerateExcel {
	private static String xls2003 = "D:\\student.xls";
	private static String xlsx2007 = "D:\\student.xlsx";
	private static List<Student> studentList = null;
	private static Student[] students = new Student[4];
	/**
	 * 静态块初始化数据
	 */
	static {
		studentList = new ArrayList<Student>();
		students[0] = new Student("张三", "男", 23, "一班", 94);
		students[1] = new Student("李四", "女", 20, "一班", 92);
		students[2] = new Student("王五", "男", 21, "一班", 87);
		students[3] = new Student("赵六", "女", 22, "一班", 83);
		studentList.addAll(Arrays.asList(students));
	}

	/**
	 * 创建2003文件的方法
	 */
	private static void generateExcel2003(String filePath) {
		// 创建工作簿对象
		HSSFWorkbook workbook2003 = new HSSFWorkbook();
		workbook2003.createInformationProperties();
		SummaryInformation si = workbook2003.getSummaryInformation();
		si.setAuthor("Nanlei");
		si.setTitle("学生信息表");
		si.setComments("POI程序测试");
		DocumentSummaryInformation dsi = workbook2003.getDocumentSummaryInformation();
		dsi.setCompany("Roiland");
		// 创建工作表对象并命名
		HSSFSheet sheet = workbook2003.createSheet("学生信息统计表");
		// 遍历集合对象创建行和单元格
		for (int i = 0; i < studentList.size(); i++) {
			// 取出Student对象
			Student student = studentList.get(i);
			// 创建行
			HSSFRow row = sheet.createRow(i);
			// 开始创建单元格并赋值
			HSSFCell nameCell = row.createCell(0);
			nameCell.setCellValue(student.getName());
			HSSFCell genderCell = row.createCell(1);
			genderCell.setCellValue(student.getGender());
			HSSFCell ageCell = row.createCell(2);
			ageCell.setCellValue(student.getAge());
			HSSFCell sclassCell = row.createCell(3);
			sclassCell.setCellValue(student.getSclass());
			HSSFCell scoreCell = row.createCell(4);
			scoreCell.setCellValue(student.getScore());
		}

		// 生成文件
		File file = new File(filePath);
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(file);
			workbook2003.write(fos);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 创建2007文件的方法
	 *
	 * @param filePath
	 */
	private static void generateExcel2007(String filePath) {
		// 创建Excel2007工作簿对象
		XSSFWorkbook workbook2007 = new XSSFWorkbook();
		// 设置核心属性
		POIXMLProperties.CoreProperties props = workbook2007.getProperties().getCoreProperties();
		props.setCreator("Nanlei");
		props.setCategory("POI程序测试");
		props.setTitle("学生信息表");
		// 设置扩展属性
		POIXMLProperties.ExtendedProperties extProps = workbook2007.getProperties().getExtendedProperties();
		// 设置自定义属性
		POIXMLProperties.CustomProperties customProps = workbook2007.getProperties().getCustomProperties();

		// 创建工作表对象并命名
		XSSFSheet sheet = workbook2007.createSheet("学生信息统计表");
		// 设置行列的默认宽度和高度
		sheet.setColumnWidth(0, 32 * 80);// 对A列设置宽度为80像素
		sheet.setColumnWidth(1, 32 * 80);
		sheet.setColumnWidth(2, 32 * 80);
		sheet.setColumnWidth(3, 32 * 80);
		sheet.setColumnWidth(4, 32 * 80);
		// 创建样式
		XSSFFont font = workbook2007.createFont();
		XSSFCellStyle headerStyle = workbook2007.createCellStyle();
		// 设置垂直居中
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		// 设置边框
		headerStyle.setBorderTop(BorderStyle.THIN);
		headerStyle.setBorderBottom(BorderStyle.THIN);
		headerStyle.setBorderLeft(BorderStyle.THIN);
		headerStyle.setBorderRight(BorderStyle.THIN);
		// 字体加粗
		font.setBold(true);
		// 设置长文本自动换行
		headerStyle.setWrapText(true);
		headerStyle.setFont(font);
		XSSFCellStyle cellStyle = workbook2007.createCellStyle();
		// 设置垂直居中
		cellStyle.setAlignment(HorizontalAlignment.CENTER);
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		// 设置边框
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		// 设置长文本自动换行
		cellStyle.setWrapText(true);
		// 创建表头
		XSSFRow headerRow = sheet.createRow(0);
		headerRow.setHeightInPoints(25f);// 设置行高度
		XSSFCell nameHeader = headerRow.createCell(0);
		nameHeader.setCellValue("姓名");
		nameHeader.setCellStyle(headerStyle);
		XSSFCell genderHeader = headerRow.createCell(1);
		genderHeader.setCellValue("性别");
		genderHeader.setCellStyle(headerStyle);
		XSSFCell ageHeader = headerRow.createCell(2);
		ageHeader.setCellValue("年龄");
		ageHeader.setCellStyle(headerStyle);
		XSSFCell classHeader = headerRow.createCell(3);
		classHeader.setCellValue("班级");
		classHeader.setCellStyle(headerStyle);
		XSSFCell scoreHeader = headerRow.createCell(4);
		scoreHeader.setCellValue("成绩");
		scoreHeader.setCellStyle(headerStyle);
		for (int i = 0; i < studentList.size(); i++) {
			XSSFRow row = sheet.createRow(i + 1);
			row.setHeightInPoints(20f);
			Student student = studentList.get(i);
			XSSFCell nameCell = row.createCell(0);
			nameCell.setCellValue(student.getName());
			nameCell.setCellStyle(cellStyle);
			XSSFCell genderCell = row.createCell(1);
			genderCell.setCellValue(student.getGender());
			genderCell.setCellStyle(cellStyle);
			XSSFCell ageCell = row.createCell(2);
			ageCell.setCellValue(student.getAge());
			ageCell.setCellStyle(cellStyle);
			XSSFCell classCell = row.createCell(3);
			classCell.setCellValue(student.getSclass());
			classCell.setCellStyle(cellStyle);
			XSSFCell scoreCell = row.createCell(4);
			scoreCell.setCellValue(student.getScore());
			scoreCell.setCellStyle(cellStyle);
		}
		// 合并班级
		sheet.addMergedRegion(new CellRangeAddress(1, 4, 3, 3));
		// 数据分析行
		int dadaRowNum = sheet.getLastRowNum();
		XSSFRow totalRow = sheet.createRow(dadaRowNum + 1);// 获取已有的行数，加1再出新行
		totalRow.setHeightInPoints(25f);
		XSSFCell analyticsCell = totalRow.createCell(0);
		analyticsCell.setCellValue("数据分析");
		analyticsCell.setCellStyle(headerStyle);
		XSSFCell avgAgeCell = totalRow.createCell(1);
		avgAgeCell.setCellValue("平均年龄");
		avgAgeCell.setCellStyle(headerStyle);
		XSSFCell avgAgeValueCell = totalRow.createCell(2);
		avgAgeValueCell.setCellStyle(headerStyle);
		avgAgeValueCell.setCellFormula("AVERAGE(C2:C" + (dadaRowNum + 1) + ")");
		XSSFCell sumScoreCell = totalRow.createCell(3);
		sumScoreCell.setCellValue("总成绩");
		sumScoreCell.setCellStyle(headerStyle);
		XSSFCell sumScoreValueCell = totalRow.createCell(4);
		sumScoreValueCell.setCellStyle(headerStyle);
		sumScoreValueCell.setCellFormula("SUM(E2:E" + (dadaRowNum + 1) + ")");
		// 生成文件
		File file = new File(filePath);
		OutputStream os = null;
		try {
			os = new FileOutputStream(file);
			workbook2007.write(os);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (os != null) {
				try {
					os.close();
				} catch (IOException e) {
				}
			}
		}
	}

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		generateExcel2003(xls2003);
		generateExcel2007(xlsx2007);
		long end = System.currentTimeMillis();
		System.out.println((end - start) + " ms done!");
	}
}
