package com.danikula.videocache;

import android.content.Context;
import android.os.Environment;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import java.io.File;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes.dex */
final class StorageUtils {
    private static final String INDIVIDUAL_DIR_NAME = "video-cache";
    private static final Logger LOG = LoggerFactory.getLogger("StorageUtils");

    StorageUtils() {
    }

    public static File getIndividualCacheDirectory(Context context) {
        File cacheDir = getCacheDirectory(context, true);
        return new File(cacheDir, INDIVIDUAL_DIR_NAME);
    }

    private static File getCacheDirectory(Context context, boolean preferExternal) {
        String externalStorageState;
        File appCacheDir = null;
        try {
            externalStorageState = Environment.getExternalStorageState();
        } catch (NullPointerException e) {
            externalStorageState = "";
        }
        if (preferExternal && "mounted".equals(externalStorageState)) {
            appCacheDir = getExternalCacheDir(context);
        }
        if (appCacheDir == null) {
            appCacheDir = context.getCacheDir();
        }
        if (appCacheDir == null) {
            String cacheDirPath = "/data/data/" + context.getPackageName() + "/cache/";
            LOG.warn("Can't define system cache directory! '" + cacheDirPath + "%s' will be used.");
            return new File(cacheDirPath);
        }
        return appCacheDir;
    }

    private static File getExternalCacheDir(Context context) {
        File dataDir = new File(new File(Environment.getExternalStorageDirectory(), "Android"), "data");
        File appCacheDir = new File(new File(dataDir, context.getPackageName()), AudioContentProviderConstants.CACHE_PATH);
        if (!appCacheDir.exists() && !appCacheDir.mkdirs()) {
            LOG.warn("Unable to create external cache directory");
            return null;
        }
        return appCacheDir;
    }
}
