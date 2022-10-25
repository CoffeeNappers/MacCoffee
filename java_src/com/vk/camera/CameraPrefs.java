package com.vk.camera;

import com.vk.attachpicker.util.Prefs;
/* loaded from: classes2.dex */
public class CameraPrefs extends Prefs {
    private static final String KEY_USE_FRONT_CAMERA = "use_front_camera";
    private static final String KEY_USE_MEDIA_RECORDER = "use_media_recorder";
    private static volatile CameraPrefs instance;

    public static CameraPrefs instance() {
        if (instance == null) {
            synchronized (CameraPrefs.class) {
                if (instance == null) {
                    instance = new CameraPrefs();
                }
            }
        }
        return instance;
    }

    private CameraPrefs() {
        super("camera_prefs");
    }

    public boolean useMediaRecorder() {
        return getBoolean(KEY_USE_MEDIA_RECORDER);
    }

    public void useMediaRecorder(boolean useMediaRecorder) {
        edit().putBoolean(KEY_USE_MEDIA_RECORDER, useMediaRecorder).apply();
    }

    public boolean useFrontCamera() {
        return getBoolean(KEY_USE_FRONT_CAMERA, true);
    }

    public void useFrontCamera(boolean useFrontCamera) {
        edit().putBoolean(KEY_USE_FRONT_CAMERA, useFrontCamera).apply();
    }
}
