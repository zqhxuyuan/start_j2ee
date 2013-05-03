package com.xuyuan.spring3.recipes.enterprise;

import java.io.IOException;

/**
 * 文件复制
 */
public interface FileReplicator {
    /**
	 * @uml.property  name="srcDir"
	 */
    public String getSrcDir();
    /**
	 * @param srcDir
	 * @uml.property  name="srcDir"
	 */
    public void setSrcDir(String srcDir);
    /**
	 * @uml.property  name="destDir"
	 */
    public String getDestDir();
    /**
	 * @param destDir
	 * @uml.property  name="destDir"
	 */
    public void setDestDir(String destDir);
    public void replicate() throws IOException;
}
