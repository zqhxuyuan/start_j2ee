<%@ page language="java" contentType="text/html; charset=UTF8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page import="java.io.File" %>
<%
	String dir = "${ctx}/images/thumbs/";
	//dir = "D:/project/_EclipseProjects/start_j2ee/src/main/webapp/extjs3/3.3.1_examples/view/images/thumbs/";
	File file = new File(dir);
	
	String json = "{\"images\":[";
	
	File[] fileEntries = file.listFiles();
	for (File fileInfo : fileEntries) {
		long fileSize = fileInfo.length();
		String myFileName = fileInfo.getName();
		json += "{\"name\":\"" + myFileName + "\",\"size\":" + fileSize + ",\"url\":\"" + dir + myFileName + "\"},";
	}
            
    json += "]}";
    json = json.replace(",]}", "]}");
	out.print(json);
%>
