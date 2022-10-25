package com.facebook.soloader;

import com.vk.media.camera.CameraUtilsEffects;
import java.io.File;
import java.io.IOException;
import java.util.Collection;
/* loaded from: classes.dex */
public class DirectorySoSource extends SoSource {
    public static final int ON_LD_LIBRARY_PATH = 2;
    public static final int RESOLVE_DEPENDENCIES = 1;
    protected final int flags;
    protected final File soDirectory;

    public DirectorySoSource(File soDirectory, int flags) {
        this.soDirectory = soDirectory;
        this.flags = flags;
    }

    @Override // com.facebook.soloader.SoSource
    public int loadLibrary(String soName, int loadFlags) throws IOException {
        return loadLibraryFrom(soName, loadFlags, this.soDirectory);
    }

    protected int loadLibraryFrom(String soName, int loadFlags, File libDir) throws IOException {
        File soFile = new File(libDir, soName);
        if (!soFile.exists()) {
            return 0;
        }
        if ((loadFlags & 1) != 0 && (this.flags & 2) != 0) {
            return 2;
        }
        if ((this.flags & 1) != 0) {
            String[] dependencies = getDependencies(soFile);
            for (String dependency : dependencies) {
                if (!dependency.startsWith(CameraUtilsEffects.FILE_DELIM)) {
                    SoLoader.loadLibraryBySoName(dependency, loadFlags | 1);
                }
            }
        }
        System.load(soFile.getAbsolutePath());
        return 1;
    }

    private static String[] getDependencies(File soFile) throws IOException {
        return MinElf.extract_DT_NEEDED(soFile);
    }

    @Override // com.facebook.soloader.SoSource
    public File unpackLibrary(String soName) throws IOException {
        File soFile = new File(this.soDirectory, soName);
        if (soFile.exists()) {
            return soFile;
        }
        return null;
    }

    @Override // com.facebook.soloader.SoSource
    public void addToLdLibraryPath(Collection<String> paths) {
        paths.add(this.soDirectory.getAbsolutePath());
    }
}
