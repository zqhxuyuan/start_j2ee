package com.xuyuan.j2ee.ioc.utils;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

/**
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
 */
public class PackageUtils {

	/**
	 * 扫描给定包及子包内的所有类
	 * 
	 * @param packageName 给定的包名
	 * @return The classes
	 * @throws ClassNotFoundException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public static Class[] getClasses(String packageName)
			throws ClassNotFoundException, IOException {
		Class cla = PackageUtils.class;
		ArrayList<Class> classes = new ArrayList<Class>();
		String[] packages = packageName.split(",");
		for(String pack : packages){
			String path = pack.replace('.', '/');
			Enumeration<URL> resources = cla.getClassLoader().getResources(path);
			List<File> dirs = new ArrayList<File>();

			while (resources.hasMoreElements()) {
				URL resource = resources.nextElement();
				dirs.add(new File(resource.getFile()));
			}
			
			for (File directory : dirs) {
				classes.addAll(findClasses(directory, pack));
			}
		}
		return classes.toArray(new Class[classes.size()]);
	}

	/**
	 * 找到制定包内的所有class文件
	 * 
	 * @param directory 目录名称
	 * @param packageName 包名称
	 * @return The classes
	 * @throws ClassNotFoundException
	 */
	@SuppressWarnings("unchecked")
	private static List<Class> findClasses(File directory, String packageName) throws ClassNotFoundException {
		List<Class> classes = new ArrayList<Class>();
		if (!directory.exists()) {
			return classes;
		}
		File[] files = directory.listFiles();
		for (File file : files) {
			if (file.isDirectory()) {
				classes.addAll(findClasses(file,packageName + "." + file.getName()));
			} else if (file.getName().endsWith(".class")) {
				classes.add(Class.forName(packageName+ '.'+ file.getName().substring(0,file.getName().length() - 6)));
			}
		}
		return classes;
	}

	/**
	 * @throws IOException
	 * @throws ClassNotFoundException
	 */
	public static void main(String[] args) throws Exception {
		String packageName = "com.xuyuan.j2ee.ioc.utils,com.xuyuan.j2ee.ioc.test";
		String[] packages =  packageName.split(",");
		for(String pack : packages){
			System.out.println(pack);
			Class[] clas = PackageUtils.getClasses(pack);
			for (Class cla : clas) {
				System.out.println("	" + cla.getName());
			}
		}
	}

}

