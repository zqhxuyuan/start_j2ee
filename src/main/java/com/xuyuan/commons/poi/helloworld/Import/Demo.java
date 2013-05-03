package com.xuyuan.commons.poi.helloworld.Import;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.POIXMLTextExtractor;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;

import com.xuyuan.commons.poi.helloworld.bean.CruiseServiceLocation;

public class Demo {
	// 文件路径
	private static String excel2003FilePath = "C:\\巡航服务地点导入模板.xls";
	private static String excel2007FilePath = "C:\\巡航服务地点导入模板.xlsx";

	private static List<CruiseServiceLocation> extractFromEXCEL2003(String fileName) {
		File excelFile = null;
		InputStream is = null;
		String cellStr = null;
		List<CruiseServiceLocation> list = new ArrayList<CruiseServiceLocation>();
		CruiseServiceLocation csl = null;
		try {
			excelFile = new File(fileName);
			is = new FileInputStream(excelFile);
			HSSFWorkbook excel2003 = new HSSFWorkbook(is);
			HSSFSheet sheet = excel2003.getSheetAt(0);
			for (int j = 0; j < sheet.getLastRowNum(); j++) {
				csl = new CruiseServiceLocation();
				HSSFRow row = sheet.getRow(j);
				if (row == null) {
					continue;
				}
				for (int k = 0; k < row.getLastCellNum(); k++) {
					HSSFCell cell = row.getCell(k);
					if (cell == null) {
						continue;
					}
					if (cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
						cellStr = String.valueOf(cell.getBooleanCellValue());
					} else if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						cellStr = cell.getNumericCellValue() + "";
					} else {
						cellStr = cell.getStringCellValue();
					}
					if (k == 0) {
						csl.setDivision(cellStr);
					} else if (k == 1) {
						csl.setProvince(cellStr);
					} else if (k == 2) {
						csl.setDealerName(cellStr);
					} else if (k == 3) {
						csl.setDealerCode(cellStr);
					} else if (k == 4) {
						csl.setLocation(cellStr);
					}
				}
				list.add(csl);
			}
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e) {
					System.err.println(e);
				}
			}
		}
		return list;
	}

	private static List<CruiseServiceLocation> extractFromEXCEL2007(String fileName) {
		File excelFile = null;
		InputStream is = null;
		StringBuffer content = new StringBuffer();
		String cellStr = null;
		List<CruiseServiceLocation> list = new ArrayList<CruiseServiceLocation>();
		CruiseServiceLocation csl = null;
		try {
			excelFile = new File(fileName);
			is = new FileInputStream(excelFile);
			XSSFWorkbook excel2007 = new XSSFWorkbook(is);
			// System.out.println("文件中sheet页数：" + excel.getNumberOfSheets());
			// for (int i = 0; i < excel.getNumberOfSheets(); i++) {
			XSSFSheet sheet = excel2007.getSheetAt(0);
			// if (sheet == null) {
			// continue;
			// }
			// System.out.println("sheet页面中的行数：" + sheet.getLastRowNum());
			for (int j = 0; j < sheet.getLastRowNum(); j++) {
				csl = new CruiseServiceLocation();
				XSSFRow row = sheet.getRow(j);
				if (row == null) {
					continue;
				}
				// System.out.println("行中的列数：" + row.getLastCellNum());
				for (int k = 0; k < row.getLastCellNum(); k++) {
					XSSFCell cell = row.getCell(k);
					if (cell == null) {
						continue;
					}
					if (cell.getCellType() == XSSFCell.CELL_TYPE_BOOLEAN) {
						// content.append(cell.getBooleanCellValue());
						cellStr = String.valueOf(cell.getBooleanCellValue());
					} else if (cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
						// content.append(cell.getNumericCellValue());
						cellStr = cell.getNumericCellValue() + "";
					} else {
						// content.append(cell.getStringCellValue());
						cellStr = cell.getStringCellValue();
					}
					if (k == 0) {
						csl.setDivision(cellStr);
					} else if (k == 1) {
						csl.setProvince(cellStr);
					} else if (k == 2) {
						csl.setDealerName(cellStr);
					} else if (k == 3) {
						csl.setDealerCode(cellStr);
					} else if (k == 4) {
						csl.setLocation(cellStr);
					}
				}
				list.add(csl);
			}
			// }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e) {
					System.err.println(e);
				}
			}
		}
		return list;
	}

	public static String extractTextFromWord2003(String fileName) {
		File file = new File(fileName);
		InputStream is = null;
		String content = null;
		try {
			is = new FileInputStream(file);
			WordExtractor word = new WordExtractor(is);
			content = word.getText();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e) {
					System.err.println(e);
				}
			}
		}
		return content;
	}

	public static String extractTextFromWord2007(String fileName) {
		String content = null;
		try {
			OPCPackage opcPackage = POIXMLDocument.openPackage(fileName);
			POIXMLTextExtractor word2007 = new XWPFWordExtractor(opcPackage);
			content = word2007.getText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return content;
	}

	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		// List<CruiseServiceLocation> locationList =
		// extractFromEXCEL2007(excel2007FilePath);
		// for (int i = 0; i < locationList.size(); i++) {
		// System.out.println(locationList.get(i));
		// }
		List<CruiseServiceLocation> locationList = extractFromEXCEL2003(excel2003FilePath);
		for (int i = 0; i < locationList.size(); i++) {
			System.out.println(locationList.get(i));
		}
		long end = System.currentTimeMillis();
		System.out.println(end - start);
	}
}
