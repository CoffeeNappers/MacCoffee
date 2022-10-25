package com.vk.media.camera;

import android.content.Context;
import java.io.File;
/* loaded from: classes2.dex */
public class CameraUtilsEffects {
    public static final String BASE_ENGINE_DATA = "base_engine_data";
    public static final String DATA_MASKS = "masks_urho3d";
    public static final String FILE_DELIM = "/";
    public static final String MASK_FILE = "mask.json";

    private static String rootPath(Context context) {
        return context.getFilesDir().toString();
    }

    private static String makePath(Context context, String path) {
        return rootPath(context) + FILE_DELIM + path;
    }

    public static File allEffectsDir(Context context) {
        return new File(makePath(context, DATA_MASKS));
    }

    public static File effectJson(Context context, String id) {
        return new File(makePath(context, DATA_MASKS) + FILE_DELIM + id + FILE_DELIM + MASK_FILE);
    }

    public static File effectDir(Context context, String id) {
        File file = new File(makePath(context, DATA_MASKS) + FILE_DELIM + id);
        if (!file.exists() && !file.mkdir()) {
            file.mkdir();
        }
        return file;
    }

    public static int effectFilesCount(Context context, String id) {
        return getFilesCount(effectDir(context, id));
    }

    public static File engineDataDir(Context context) {
        return new File(rootPath(context) + FILE_DELIM + BASE_ENGINE_DATA);
    }

    public static boolean engineDataExist(Context context) {
        return engineDataDir(context).exists();
    }

    public static int engineDataFilesCount(Context context) {
        return getFilesCount(engineDataDir(context));
    }

    private static int getFilesCount(File file) {
        File[] files;
        int count = -1;
        if (file != null && file.exists() && file.isDirectory() && (files = file.listFiles()) != null) {
            count = 0;
            for (File f : files) {
                if (f.isDirectory()) {
                    count += getFilesCount(f);
                } else {
                    count++;
                }
            }
        }
        return count;
    }
}
