package com.xuyuan.spring3.recipes.enterprise;

import java.io.IOException;

public interface FileCopier {
    public void copyFile(String srcDir, String destDir, String filename)
        throws IOException;
}
