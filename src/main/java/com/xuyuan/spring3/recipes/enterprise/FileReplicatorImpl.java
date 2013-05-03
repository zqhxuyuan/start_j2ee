package com.xuyuan.spring3.recipes.enterprise;

import java.io.File;
import java.io.IOException;

import org.springframework.scheduling.annotation.Scheduled;

public class FileReplicatorImpl implements FileReplicator {
    /**
	 * @uml.property  name="srcDir"
	 */
    private String srcDir;
    /**
	 * @uml.property  name="destDir"
	 */
    private String destDir;
    /**
	 * @uml.property  name="fileCopier"
	 * @uml.associationEnd  
	 */
    private FileCopier fileCopier;

    /**
	 * @return
	 * @uml.property  name="srcDir"
	 */
    public String getSrcDir() {
        return srcDir;
    }

    /**
	 * @param srcDir
	 * @uml.property  name="srcDir"
	 */
    public void setSrcDir(String srcDir) {
        this.srcDir = srcDir;
        //revaluateDirectories();
    }

    /**
	 * @return
	 * @uml.property  name="destDir"
	 */
    public String getDestDir() {
        return destDir;
    }

    /**
	 * @param destDir
	 * @uml.property  name="destDir"
	 */
    public void setDestDir(String destDir) {
        this.destDir = destDir;
        //revaluateDirectories();
    }

    /**
	 * @param fileCopier
	 * @uml.property  name="fileCopier"
	 */
    public void setFileCopier(FileCopier fileCopier) {
        this.fileCopier = fileCopier;
    }

    //@Scheduled(fixedDelay = 60 * 1000)
    //@Scheduled(fixedRate = 60 * 1000)
    //@Scheduled( cron = " 0 * * * * ? " )
    public synchronized void replicate() throws IOException {
        File[] files = new File(srcDir).listFiles();

        for (File file : files) {
            if (file.isFile()) {
                fileCopier.copyFile(srcDir, destDir, file.getName());
            }
        }
    }

    private void revaluateDirectories() {
        File src = new File(srcDir);
        File dest = new File(destDir);
        if (!src.exists()) src.mkdirs();
        if (!dest.exists()) dest.mkdirs();
    }
}
