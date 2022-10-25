package com.vk.medianative;

import android.content.Context;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
/* loaded from: classes2.dex */
class FFMpegLib {
    static final String LIB_DIRECTORY = "libvideo";
    private final String libDir;
    private final String libPath;
    static final String MAIN_LIB_NAME = "libvkvideoartist.so";
    static final String[] LIBS = {MAIN_LIB_NAME, "libffmpeg.so"};

    /* JADX INFO: Access modifiers changed from: package-private */
    public FFMpegLib(Context context) throws IOException {
        File libFile = getLibFile(context);
        this.libPath = libFile.getAbsolutePath();
        this.libDir = libFile.getParent();
    }

    public String getLibPath() {
        return this.libPath;
    }

    public String getLibDir() {
        return this.libDir;
    }

    private static File getLibFile(Context context) throws IOException {
        String nativeLibraryDir = context.getApplicationInfo().nativeLibraryDir;
        File libFile = new File(nativeLibraryDir, MAIN_LIB_NAME);
        if (!libFile.canExecute()) {
            File internalDir = new File(context.getFilesDir(), LIB_DIRECTORY);
            updateInternalLibs(libFile.getParentFile(), internalDir);
            return new File(internalDir, MAIN_LIB_NAME);
        }
        return libFile;
    }

    private static void updateInternalLibs(File src, File dst) throws IOException {
        String[] strArr;
        if (!dst.exists() && !dst.mkdirs()) {
            throw new IOException("Fail to create internal directory for library");
        }
        for (String lib : LIBS) {
            File srcFile = new File(src, lib);
            if (!srcFile.exists()) {
                throw new IOException(String.format("Library '%s' not found", lib));
            }
            File dstFile = new File(dst, lib);
            if (!dstFile.exists() || srcFile.lastModified() > dstFile.lastModified()) {
                copyFile(srcFile, dstFile);
            }
            if (dstFile.getName().endsWith(".so") && !dstFile.setExecutable(true, true)) {
                throw new IOException("Cannot make video compression library executable");
            }
        }
    }

    private static void copyFile(File src, File dst) throws IOException {
        InputStream in = new FileInputStream(src);
        OutputStream out = new FileOutputStream(dst);
        byte[] buf = new byte[1024];
        while (true) {
            int len = in.read(buf);
            if (len > 0) {
                out.write(buf, 0, len);
            } else {
                in.close();
                out.close();
                return;
            }
        }
    }
}
