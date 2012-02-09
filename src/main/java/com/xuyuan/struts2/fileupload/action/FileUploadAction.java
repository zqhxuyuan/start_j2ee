package com.xuyuan.struts2.fileupload.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * <s:file/>不仅绑定了name对应的File变量xx,还有xxContentType,xxxFileName
 *
 * 使用到了Servlet容器相关的API,需要在pom.xml中加入Servlet API依赖.
 *
 * ServletAPI相关的路径问题:
 *   由于采用Maven:
 *   ServletActionContext.getServletContext().getRealPath("/")
 *   获取到的路径是:项目名称的webapp:
 *   D:\project\_EclipseProjects\start_struts2\src\main\webapp
 *
 * 所以需要手动在webapp下创建UploadImages文件夹,否则会报错文件找不到.
 *
 * 临时文件上传到了哪里?
 *   如果没有配置struts.properties中关于文件上传的设置,默认文件上传到了target/work下的临时文件.
 *
 *   查看日志信息,可以得到验证:
 * 	 Unable to find 'struts.multipart.saveDir' property setting. Defaulting to javax.servlet.context.tempdir
 *   saveDir=D:\project\_EclipseProjects\start_struts2\target\work
 *
 *   配置struts.multipart.saveDir=/tmp
 *   一般情况下如果不做特殊配置window会上传到C:/tmp,没有则创建tmp文件夹.
 *
 * @author max
 * http://www.blogjava.net/max/archive/2007/03/21/105124.html
 */
public class FileUploadAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 16 * 1024 ;

	private File userImage;

	private String userImageContentType;
	private String userImageFileName;

	public String jqueryFileUpload(){
		this.uploadFile();
		return null;
	}
	
	public String execute(){
		this.uploadFile();
		return SUCCESS;
	}

	//复制上传的文件 到指定目录下,用来在上传成功页面显示上传的图片
	public void uploadFile(){
		String filepath = ServletActionContext.getServletContext().getRealPath("/UploadImages") + "/" + userImageFileName;
	    File imageFile = new File(filepath);
	    copy(userImage, imageFile);
	}

	//programmatically validate
	/**
	public void validate(){
		String type = this.getUserImageContentType();
		if(!"image/png".equals(type)){
			this.addFieldError(userImageContentType, "upload file type must be image type..");
		}
	}
	*/

	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst), BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String getExtention(String fileName) {
        int pos = fileName.lastIndexOf(".");
        return fileName.substring(pos);
   }

	public File getUserImage() {
		return userImage;
	}
	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}

	public String getUserImageContentType() {
		return userImageContentType;
	}
	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}

	public String getUserImageFileName() {
		return userImageFileName;
	}
	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}
}
