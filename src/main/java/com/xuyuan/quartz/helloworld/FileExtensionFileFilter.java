package com.xuyuan.quartz.helloworld;

import java.io.File;
import java.io.FileFilter;

public class FileExtensionFileFilter implements FileFilter {
	private String extension;// 文件后缀

	public FileExtensionFileFilter(String extension) {
		this.extension = extension;
	}

	public boolean accept(File file) {// 只接受指定后缀的文件
		// Lowercase the filename for easier comparison
		String lCaseFilename = file.getName().toLowerCase();// 小写化
		return (file.isFile() && (lCaseFilename.indexOf(extension) > 0)) ? true : false;
	}
}