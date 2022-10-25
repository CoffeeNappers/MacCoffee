package com.vkontakte.android.audio.player;

import android.content.Context;
import android.support.v4.content.ContextCompat;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.player.proxy.FileInfo;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* loaded from: classes2.dex */
public class CacheUtils {
    private static final long MAX_TMP_SPACE = 104857600;
    public static final long MIN_FREE_SPACE = 20971520;

    public static void clearCache(File dir) {
        if (dir.exists()) {
            File[] files = dir.listFiles();
            for (File file : files) {
                file.delete();
            }
        }
    }

    public static void clearOldCache(File dir) {
        File[] files;
        Comparator comparator;
        File file2;
        if (dir == null) {
            files = null;
        } else {
            try {
                files = dir.listFiles();
            } catch (Exception e) {
                L.e(e, new Object[0]);
                return;
            }
        }
        if (files != null) {
            List<File> fileList = new ArrayList<>();
            Collections.addAll(fileList, files);
            comparator = CacheUtils$$Lambda$1.instance;
            Collections.sort(fileList, comparator);
            long filesSize = 0;
            for (int i = 0; i < fileList.size(); i++) {
                filesSize += fileList.get(i).length();
            }
            for (int i2 = fileList.size() - 1; i2 >= 0; i2--) {
                if (filesSize > MAX_TMP_SPACE || i2 >= 4) {
                    File file = fileList.get(i2);
                    if (file.getName().endsWith(".info")) {
                        file2 = new File(file.getParentFile(), file.getName().substring(0, file.getName().length() - 5));
                    } else {
                        file2 = new File(file.getParentFile(), file.getName() + ".info");
                    }
                    filesSize = (filesSize - file.length()) - file2.length();
                    file.delete();
                    file2.delete();
                    L.d("Clear audio file", file);
                    L.d("Clear audio file", file2);
                } else {
                    return;
                }
            }
        }
    }

    public static /* synthetic */ int lambda$clearOldCache$0(File o1, File o2) {
        long x = 0;
        long y = o1 == null ? 0L : o1.lastModified();
        if (o2 != null) {
            x = o2.lastModified();
        }
        if (x < y) {
            return -1;
        }
        return x == y ? 0 : 1;
    }

    public static File getCacheDir(Context context) {
        File[] externalDirs = ContextCompat.getExternalCacheDirs(context);
        if (externalDirs == null || externalDirs.length == 0) {
            return null;
        }
        File fallbackDir = null;
        for (File dir : externalDirs) {
            if (dir != null) {
                clearOldCache(dir);
                if (!Utils.isSdCardPath(dir)) {
                    if (dir.getUsableSpace() <= MIN_FREE_SPACE) {
                        clearCache(dir);
                    } else {
                        return dir;
                    }
                }
                if (fallbackDir == null || fallbackDir.getUsableSpace() < dir.getUsableSpace()) {
                    fallbackDir = dir;
                }
            }
        }
        if (fallbackDir == null) {
            fallbackDir = context.getCacheDir();
        }
        return new File(fallbackDir, "PlayerProxy");
    }

    public static void tryUseCacheForSaveMusic(String mid, File fileOut) {
        try {
            File file = AudioFacade.getTrackTmpFile(mid);
            FileInfo fileInfo = new FileInfo(file);
            boolean fileExists = file.exists();
            if (fileExists) {
                try {
                    fileInfo.load();
                } catch (IOException e) {
                    file.delete();
                    fileExists = false;
                }
            } else {
                fileInfo.delete();
                fileExists = false;
            }
            if (fileExists) {
                List<FileInfo.Part> parts = fileInfo.split(null);
                for (FileInfo.Part part : parts) {
                    if (!part.downloaded) {
                        return;
                    }
                }
                Utils.replaceFile(file, fileOut, false);
            }
        } catch (Exception e2) {
            L.e(e2, new Object[0]);
        }
    }

    public static File getLoadedTmpFile(String mid) {
        try {
            File file = AudioFacade.getTrackTmpFile(mid);
            FileInfo fileInfo = new FileInfo(file);
            boolean fileExists = file.exists();
            if (fileExists) {
                try {
                    fileInfo.load();
                } catch (IOException e) {
                    file.delete();
                    fileExists = false;
                }
            } else {
                fileInfo.delete();
                fileExists = false;
            }
            if (fileExists) {
                List<FileInfo.Part> parts = fileInfo.split(null);
                for (FileInfo.Part part : parts) {
                    if (!part.downloaded) {
                        return null;
                    }
                }
                return file;
            }
        } catch (Exception e2) {
            L.e(e2, new Object[0]);
        }
        return null;
    }
}
