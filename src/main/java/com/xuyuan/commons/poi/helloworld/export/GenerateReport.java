package com.xuyuan.commons.poi.helloworld.export;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.xuyuan.commons.poi.helloworld.bean.CruiseServiceLocation;

public class GenerateReport {
	private static String fileName = "D:\\exceltest.xlsx";
	private static List<CruiseServiceLocation> cruiseServiceLocationList = null;
	private static CruiseServiceLocation csl[] = new CruiseServiceLocation[21];

	static {
		cruiseServiceLocationList = new ArrayList<CruiseServiceLocation>();
		csl[0] = new CruiseServiceLocation("T001", "北京市", "北京总部", "bj", "清华大学", 20);
		csl[1] = new CruiseServiceLocation("T001", "北京市", "北京总部", "bj", "北京大学", 30);
		csl[2] = new CruiseServiceLocation("T001", "北京市", "海淀经销商", "bjhd", "西直门", 15);
		csl[3] = new CruiseServiceLocation("T001", "北京市", "海淀经销商", "bjhd", "首都机场", 50);
		csl[4] = new CruiseServiceLocation("T001", "北京市", "海淀经销商", "bjhd", "中关村", 23);
		csl[5] = new CruiseServiceLocation("T001", "北京市", "东城经销商", "bjdc", "北京火车站", 4);
		csl[6] = new CruiseServiceLocation("T001", "北京市", "东城经销商", "bjdc", "北京西站", 12);
		csl[7] = new CruiseServiceLocation("T001", "辽宁省", "大连经销商", "lndl", "河口软件园", 15);
		csl[8] = new CruiseServiceLocation("T001", "辽宁省", "大连经销商", "lndl", "七贤岭腾飞软件园", 13);
		csl[9] = new CruiseServiceLocation("T001", "辽宁省", "大连经销商", "lndl", "高新园区信达街", 11);
		csl[10] = new CruiseServiceLocation("T001", "辽宁省", "大连第二经销商", "lndl2", "数码广场", 8);
		csl[11] = new CruiseServiceLocation("T001", "辽宁省", "大连第二经销商", "lndl2", "马栏广场", 17);
		csl[12] = new CruiseServiceLocation("T001", "辽宁省", "大连第二经销商", "lndl2", "五一广场", 12);
		csl[13] = new CruiseServiceLocation("T001", "辽宁省", "沈阳经销商", "lnsy", "沈阳故宫", 16);
		csl[14] = new CruiseServiceLocation("T001", "辽宁省", "沈阳经销商", "lnsy", "沈阳北站", 4);
		csl[15] = new CruiseServiceLocation("T001", "吉林省", "长春经销商", "jlcc", "吉林大学", 4);
		csl[16] = new CruiseServiceLocation("T001", "吉林省", "长春经销商", "jlcc", "长春火车站", 4);
		csl[17] = new CruiseServiceLocation("T002", "黑龙江省", "哈尔滨经销商", "hljhrb", "哈工大", 12);
		csl[18] = new CruiseServiceLocation("T002", "黑龙江省", "齐齐哈尔经销商", "hljqqhr", "火车站", 21);
		csl[19] = new CruiseServiceLocation("T003", "河北省", "石家庄经销商", "hbsjz", "火车站", 4);
		csl[20] = new CruiseServiceLocation("", "", "", "", "", 0);// 合并算法捕捉最后一行有问题，增补一行无效数据，计算时去除
		cruiseServiceLocationList.addAll(Arrays.asList(csl));
	}

	public static void generate() {
		// 创建工作簿
		XSSFWorkbook workbook = new XSSFWorkbook();
		// 创建工作表
		XSSFSheet sheet = workbook.createSheet("巡航服务统计报表");
		sheet.setColumnWidth(0, 32 * 80);
		sheet.setColumnWidth(1, 32 * 80);
		sheet.setColumnWidth(2, 32 * 140);
		sheet.setColumnWidth(3, 32 * 80);
		sheet.setColumnWidth(4, 32 * 180);
		// 单元格样式
		XSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setWrapText(true);
		style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		style.setBorderRight(XSSFCellStyle.BORDER_THIN);
		style.setBorderTop(XSSFCellStyle.BORDER_THIN);
		// 加粗居中样式
		XSSFFont font = workbook.createFont();
		font.setBold(true);
		XSSFCellStyle biStyle = workbook.createCellStyle();
		biStyle.setFont(font);
		biStyle.setAlignment(HorizontalAlignment.CENTER);
		biStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		biStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN);
		biStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);
		biStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);
		biStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);
		// 制作表头
		XSSFRow header = sheet.createRow(0);
		XSSFCell divisionHeader = header.createCell(0);
		divisionHeader.setCellValue("事业部");
		divisionHeader.setCellStyle(style);
		XSSFCell provinceHeader = header.createCell(1);
		provinceHeader.setCellValue("省份");
		provinceHeader.setCellStyle(style);
		XSSFCell dealerNameHeader = header.createCell(2);
		dealerNameHeader.setCellValue("经销商");
		dealerNameHeader.setCellStyle(style);
		XSSFCell dealerCodeHeader = header.createCell(3);
		dealerCodeHeader.setCellValue("经销商代码");
		dealerCodeHeader.setCellStyle(style);
		XSSFCell locationHeader = header.createCell(4);
		locationHeader.setCellValue("巡航地点");
		locationHeader.setCellStyle(style);
		XSSFCell milesHeader = header.createCell(5);
		milesHeader.setCellValue("里程");
		milesHeader.setCellStyle(style);

		// 合计量的计算
		CruiseServiceLocation cslTotal = null;
		List<CruiseServiceLocation> cslList = new ArrayList<CruiseServiceLocation>();
		// 合并计算控制
		double totalDealer = 0;
		double totalProvince = 0;
		double totalDivision = 0;
		int locationNum = 0;
		// 循环遍历List
		for (int i = 0; i < cruiseServiceLocationList.size(); i++) {
			cslList.add(cruiseServiceLocationList.get(i));
			// 是否是最后一条记录的开关
			boolean last = (i == cruiseServiceLocationList.size() - 1);
			// 取出相邻的两条记录进行比较
			CruiseServiceLocation csl1 = null;
			CruiseServiceLocation csl2 = null;
			if (!last) {
				csl1 = cruiseServiceLocationList.get(i);
				csl2 = cruiseServiceLocationList.get(i + 1);
			} else {
				// 防止最后一条记录无法加入集合
				csl1 = cruiseServiceLocationList.get(i);
				if (cruiseServiceLocationList.size() != 1)
					csl2 = cruiseServiceLocationList.get(i - 1);
				else
					csl2 = cruiseServiceLocationList.get(i);
			}
			// 开始处理
			if (csl1.getDealerName().equals(csl2.getDealerName())) {
				locationNum++;
				totalDealer += csl1.getMiles();
			} else {
				locationNum++;
				totalDealer += csl1.getMiles();
				cslTotal = new CruiseServiceLocation();
				cslTotal.setTotalDealer(totalDealer);
				cslTotal.setLocationNum(locationNum);
				cslList.add(cslTotal);
				totalDealer = 0;
				locationNum = 0;
			}
			if (csl1.getProvince().equals(csl2.getProvince())) {
				totalProvince += csl1.getMiles();
			} else {
				totalProvince += csl1.getMiles();
				cslTotal = new CruiseServiceLocation();
				cslTotal.setTotalProvince(totalProvince);
				cslList.add(cslTotal);
				totalProvince = 0;
			}
			if (csl1.getDivision().equals(csl2.getDivision())) {
				totalDivision += csl1.getMiles();
			} else {
				totalDivision += csl1.getMiles();
				cslTotal = new CruiseServiceLocation();
				cslTotal.setTotalDivision(totalDivision);
				cslList.add(cslTotal);
				totalDivision = 0;
			}
		}
		// 省份合计和事业部合计时跨行的计算数据
		int comboProvince = 0;
		int comboDivision = 0;
		List<Integer> indexComboProvice = new ArrayList<Integer>();
		List<Integer> indexComboDivision = new ArrayList<Integer>();
		for (int i = 0; i < cslList.size() - 4; i++) {
			CruiseServiceLocation csl = cslList.get(i);
			XSSFRow row = sheet.createRow(i + 1);
			if (csl.getDivision() != null) {
				XSSFCell divisionCell = row.createCell(0);
				divisionCell.setCellValue(csl.getDivision());
				divisionCell.setCellStyle(style);
				XSSFCell provinceCell = row.createCell(1);
				provinceCell.setCellValue(csl.getProvince());
				provinceCell.setCellStyle(style);
				XSSFCell dealerNameCell = row.createCell(2);
				dealerNameCell.setCellValue(csl.getDealerName());
				dealerNameCell.setCellStyle(style);
				XSSFCell dealerCodeCell = row.createCell(3);
				dealerCodeCell.setCellValue(csl.getDealerCode());
				dealerCodeCell.setCellStyle(style);
				XSSFCell locationCell = row.createCell(4);
				locationCell.setCellValue(csl.getLocation());
				locationCell.setCellStyle(style);
				XSSFCell milesCell = row.createCell(5);
				milesCell.setCellValue(csl.getMiles());
				milesCell.setCellStyle(style);
			}
			if (csl.getTotalDealer() != 0) {
				row.createCell(0).setCellStyle(style);
				row.createCell(1).setCellStyle(style);
				XSSFCell t_dealer = row.createCell(2);
				t_dealer.setCellValue("经销商合计");
				t_dealer.setCellStyle(biStyle);
				sheet.addMergedRegion(new CellRangeAddress(i + 1, i + 1, 2, 4));
				XSSFCell t_dealer_value = row.createCell(5);
				t_dealer_value.setCellValue(csl.getTotalDealer());
				t_dealer_value.setCellStyle(biStyle);
				sheet.addMergedRegion(new CellRangeAddress(i - csl.getLocationNum() + 1, i, 2, 2));
				sheet.addMergedRegion(new CellRangeAddress(i - csl.getLocationNum() + 1, i, 3, 3));
			}
			if (csl.getTotalProvince() != 0) {
				XSSFCell t_province = row.createCell(1);
				row.createCell(0).setCellStyle(style);
				row.createCell(3).setCellStyle(style);
				row.createCell(4).setCellStyle(style);
				t_province.setCellValue("省份合计");
				t_province.setCellStyle(biStyle);
				sheet.addMergedRegion(new CellRangeAddress(i + 1, i + 1, 1, 4));
				XSSFCell t_province_value = row.createCell(5);
				t_province_value.setCellValue(csl.getTotalProvince());
				t_province_value.setCellStyle(biStyle);
				indexComboProvice.add(i);
				// 合并行
				if (comboProvince == 0) {
					sheet.addMergedRegion(new CellRangeAddress(1, i, 1, 1));
				} else if (comboProvince == 1) {
					sheet.addMergedRegion(new CellRangeAddress(indexComboProvice.get(comboProvince - 1) + comboProvince + 1, i, 1, 1));
				} else {
					sheet.addMergedRegion(new CellRangeAddress(indexComboProvice.get(comboProvince - 1) + comboProvince, i, 1, 1));
				}
				comboProvince++;
			}
			if (csl.getTotalDivision() != 0) {
				XSSFCell t_division = row.createCell(0);
				row.createCell(1).setCellStyle(style);
				row.createCell(2).setCellStyle(style);
				row.createCell(3).setCellStyle(style);
				row.createCell(4).setCellStyle(style);
				t_division.setCellValue("事业部合计");
				t_division.setCellStyle(biStyle);
				sheet.addMergedRegion(new CellRangeAddress(i + 1, i + 1, 0, 4));
				XSSFCell t_division_value = row.createCell(5);
				t_division_value.setCellValue(csl.getTotalDivision());
				t_division_value.setCellStyle(biStyle);
				indexComboDivision.add(i);
				// 合并行
				if (comboDivision == 0) {
					sheet.addMergedRegion(new CellRangeAddress(1, i, 0, 0));
				} else if (comboDivision == 1) {
					sheet.addMergedRegion(new CellRangeAddress(indexComboDivision.get(comboDivision - 1) + comboDivision + 1, i, 0, 0));
				} else {
					sheet.addMergedRegion(new CellRangeAddress(indexComboDivision.get(comboDivision - 1) + comboDivision, i, 0, 0));
				}
				comboDivision++;
			}

		}
		// 生成文件
		File file = new File(fileName);
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(file);
			workbook.write(fos);
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

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		generate();
		long end = System.currentTimeMillis();
		System.out.println((end - start) + "ms done!");
	}
}
