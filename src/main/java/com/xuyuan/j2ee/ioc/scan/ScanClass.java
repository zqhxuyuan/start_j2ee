package com.xuyuan.j2ee.ioc.scan;

import java.io.IOException;

import com.xuyuan.j2ee.ioc.utils.PackageUtils;
import com.xuyuan.j2ee.ioc.utils.PubConstant;

/**
 * 获得某个包或者子包下的所有class
 * @author ajun
 * @http://blog.csdn.net/ajun_studio
*/
public class ScanClass {

	/**
	 * 获得某个包或者子包下的所有class
	 * @return
	 */
	public static Class<?>[] getScanPackageClasses(){
		String packageLink = PubConstant.getValue("scan-package");
		Class<?>[] clas=null;
		try {
			clas = PackageUtils.getClasses(packageLink);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return clas;
	}
	
	public static void main(String[] args) {
		Class[] clazz = ScanClass.getScanPackageClasses();
		for (Class cla : clazz) {
			System.out.println(cla.getName());
		}
		
	}
}
