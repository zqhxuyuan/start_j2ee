package com.xuyuan.struts2.dhtmlx;

/**
 * Struts2结合DHtmlxTree做的树形菜单(云自无心水自闲)
 * http://www.blogjava.net/usherlight/archive/2008/08/07/220756.html
 * localhost:8888/start_j2ee/dhtmlx/tree/treedemo.jsp
 * 
 * 注意:
 * 1.xmlString.jsp的contentType是:text/xml
 * 2.Action中的字符串不能包含xml头:<?xml version='1.0' encoding='iso-8859-1'?>
 * 3.如果是直接loadXML("*.xml")则可以包含xml头
 * 4.xml中必须指定id.
 * 
 * 否则会弹出错误对话框:
 * Error type: DataStructure
 * Description: XML refers to not existing parent
 * @author Administrator
 *
 */
public class TreeMenuAction {
	/**
	 * @uml.property  name="xmlString"
	 */
	private String xmlString;
	
    public String execute() {
        StringBuffer buf = new StringBuffer();
        //指定xml头.错误
        //buf.append("<?xml version='1.0' encoding='iso-8859-1'?>");
        buf.append("<tree id=\"0\">");
        //不包含id,错误
        /**
        buf.append(" <item text=\"Java\">");
        buf.append(" <item text=\"Thinking in java\">");
        buf.append(" <userdata name=\"thisurl\">java_tij.action</userdata>");
        buf.append(" </item>");
        buf.append(" <item text=\"Head first design pattern\">");
        buf.append(" <userdata name=\"thisurl\">java_hfdp.action</userdata>");
        buf.append(" </item>");
        buf.append(" </item>");
        */
        buf.append(" <item text=\"Java\" id=\"java\">");
        buf.append(" <item text=\"Thinking in java\" id=\"tij\">");
        buf.append(" <userdata name=\"thisurl\">java_tij.action</userdata>");
        buf.append(" </item>");
        buf.append(" <item text=\"Head first design pattern\" id=\"hdfd\">");
        buf.append(" <userdata name=\"thisurl\">java_hfdp.action</userdata>");
        buf.append(" </item>");
        buf.append(" </item>");
        buf.append("</tree>");
        xmlString = buf.toString();        
        System.err.println(xmlString);
        return "success";
    }

	/**
	 * @return
	 * @uml.property  name="xmlString"
	 */
	public String getXmlString() {
		return xmlString;
	}

	/**
	 * @param xmlString
	 * @uml.property  name="xmlString"
	 */
	public void setXmlString(String xmlString) {
		this.xmlString = xmlString;
	}

    
}
