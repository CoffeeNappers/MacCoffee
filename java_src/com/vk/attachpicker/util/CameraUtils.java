package com.vk.attachpicker.util;

import android.content.Context;
import android.content.pm.PackageManager;
import android.media.MediaScannerConnection;
import android.os.Build;
import android.support.v4.util.Pair;
import com.vk.attachpicker.Picker;
import com.vk.core.util.FileUtils;
import com.vkontakte.android.VKApplication;
import java.io.File;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes2.dex */
public class CameraUtils {
    private static final AtomicInteger requestId = new AtomicInteger(100);
    private static final HashMap<Integer, File> cameraFilesMap = new HashMap<>();
    private static final HashMap<Integer, Boolean> requestTypesMap = new HashMap<>();

    public static Pair<Integer, File> getCameraRequestData(boolean video) {
        int id = requestId.getAndIncrement();
        File file = video ? FileUtils.getVideoFile() : FileUtils.getPhotoFile();
        cameraFilesMap.put(Integer.valueOf(id), file);
        requestTypesMap.put(Integer.valueOf(id), Boolean.valueOf(video));
        return new Pair<>(Integer.valueOf(id), file);
    }

    public static File getFileById(int id) {
        return cameraFilesMap.get(Integer.valueOf(id));
    }

    public static boolean isVideoRequest(int id) {
        Boolean res = requestTypesMap.get(Integer.valueOf(id));
        if (res == null) {
            return false;
        }
        return res.booleanValue();
    }

    public static boolean isRequestValid(int id) {
        return cameraFilesMap.containsKey(Integer.valueOf(id)) && requestTypesMap.containsKey(Integer.valueOf(id));
    }

    public static void addMediaToGallery(Context context, File f, MediaScannerConnection.OnScanCompletedListener listener) {
        try {
            MediaScannerConnection.scanFile(context, new String[]{f.getAbsolutePath()}, null, listener);
        } catch (Exception e) {
        }
    }

    public static boolean isDeviceHasCamera() {
        PackageManager manager = Picker.getContext().getPackageManager();
        boolean hasCamera = manager.hasSystemFeature("android.hardware.camera");
        if (Build.VERSION.SDK_INT >= 17) {
            return hasCamera || manager.hasSystemFeature("android.hardware.camera.any");
        }
        return hasCamera;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.vk.attachpicker.util.CameraUtils$1] */
    public static void savePhotoAsync(final File file) {
        new android.os.AsyncTask<Void, Void, Void>() { // from class: com.vk.attachpicker.util.CameraUtils.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(Void... params) {
                CameraUtils.savePhoto(file);
                return null;
            }
        }.execute(new Void[0]);
    }

    public static File savePhoto(File file) {
        File newFile = FileUtils.getPhotoFile();
        try {
            FileUtils.copyFile(file, newFile);
            addMediaToGallery(VKApplication.context, newFile, null);
            return newFile;
        } catch (Exception e) {
            FileUtils.deleteFile(newFile);
            return null;
        }
    }

    public static File saveVideo(File file) {
        File newFile = FileUtils.getVideoFile();
        try {
            FileUtils.copyFile(file, newFile);
            addMediaToGallery(VKApplication.context, newFile, null);
            return newFile;
        } catch (Exception e) {
            FileUtils.deleteFile(newFile);
            return null;
        }
    }
}
