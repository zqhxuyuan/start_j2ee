package com.xuyuan.spring3.core.resc;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;

public class ResourceTest {

	// ByteArrayResource代表byte[]数组资源，getInputStream()返回一个ByteArrayInputStream。可多次读取数组资源。
	@Test
	public void testByteArrayResource() {
		System.out.println("--------------------1");
		// A.定义资源
		Resource resource = new ByteArrayResource("Hello World!".getBytes());
		// B.验证资源存在
		if (resource.exists()) {
			// C.访问资源
			dumpStream(resource);
			dumpStream(resource); // 可多次读取数组资源.
		}
		// isOpen方法:返回当前Resource代表的底层资源是否已经打开，
		// 如果返回true，则只能被读取一次然后关闭以避免内存泄漏.
		// 返回false，则可以多次读取资源
		Assert.assertEquals(false, resource.isOpen());
	}

	// InputStreamResource代表java.io.InputStream字节流，即getInputStream()将直接返回该字节流，因此只能读取一次该字节流，即isOpen()永远返回true
	@Test
	public void testInputStreamResource() {
		System.out.println("--------------------2");
		ByteArrayInputStream bis = new ByteArrayInputStream(
				"Hello Worlds...".getBytes());
		Resource resource = new InputStreamResource(bis);
		if (resource.exists()) {
			dumpStream(resource);
			// dumpStream(resource); //NullPointerException
		}
		Assert.assertEquals(true, resource.isOpen());
	}

	// FileSystemResource代表java.io.File文件资源，getInputStream()将返回底层文件的字节流
	@Test
	public void testFileResource() {
		System.out.println("--------------------3");
		File file = new File("D:/test.txt");
		Resource resource = new FileSystemResource(file);
		if (resource.exists()) {
			dumpStream(resource);
			dumpStream(resource); // 可多次读取底层文件的字节流
		}
		Assert.assertEquals(false, resource.isOpen());
	}

	// 使用默认的加载器加载资源，将加载当前ClassLoader类路径上相对于根路径的资源
	@Test
	public void testClasspathResourceByDefaultClassLoader() throws IOException {
		System.out.println("--------------------4");
		Resource resource = new ClassPathResource(
				"com/xuyuan/spring3/core/resc/test.txt");
		if (resource.exists()) {
			dumpStream(resource);
		}
		System.out.println("path:" + resource.getFile().getAbsolutePath());
		Assert.assertEquals(false, resource.isOpen());
	}

	// 使用指定的ClassLoader进行加载资源，将加载指定的ClassLoader类路径上相对于根路径的资源
	@Test
	public void testClasspathResourceByClassLoader() throws IOException {
		System.out.println("--------------------5");
		ClassLoader cl = this.getClass().getClassLoader();
		Resource resource = new ClassPathResource(
				"com/xuyuan/spring3/core/resc/test.txt", cl);
		if (resource.exists()) {
			dumpStream(resource);
		}
		System.out.println("path:" + resource.getFile().getAbsolutePath());
		Assert.assertEquals(false, resource.isOpen());
	}

	@Test
	public void testClasspathResourceByClass() throws IOException {
//		System.out.println("--------------------6");
//		Class clazz = this.getClass();
//		Resource resource1 = new ClassPathResource("cn/javass/spring/chapter4/test1.properties", clazz);
//		if (resource1.exists()) {
//			dumpStream(resource1);
//		}
//		System.out.println("path:" + resource1.getFile().getAbsolutePath());
//		Assert.assertEquals(false, resource1.isOpen());

		System.out.println("--------------------7");
		Resource resource2 = new ClassPathResource("test.txt",this.getClass());
		if (resource2.exists()) {
			dumpStream(resource2);
		}
		System.out.println("path:" + resource2.getFile().getAbsolutePath());
		Assert.assertEquals(false, resource2.isOpen());
	}

	// 访问流的三部曲
	private void dumpStream(Resource resource) {
		InputStream is = null;
		try {
			// 1.获取文件资源
			is = resource.getInputStream();
			// 2.读取资源
			byte[] descBytes = new byte[is.available()];
			is.read(descBytes);
			System.out.println(new String(descBytes));
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				// 3.关闭资源
				is.close();
			} catch (IOException e) {
			}
		}
	}

}
