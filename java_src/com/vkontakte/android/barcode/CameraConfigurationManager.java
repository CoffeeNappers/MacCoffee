package com.vkontakte.android.barcode;

import android.hardware.Camera;
import android.util.Log;
import java.util.Iterator;
import java.util.List;
/* loaded from: classes2.dex */
public class CameraConfigurationManager {
    private static final String TAG = "CameraConfiguration";
    static final int ZOOM = 2;

    private CameraConfigurationManager() {
    }

    public static void configure(Camera camera) {
        try {
            Camera.Parameters parameters = camera.getParameters();
            List<Camera.Size> sizes = parameters.getSupportedPreviewSizes();
            Camera.Size chosenSize = null;
            Iterator<Camera.Size> it = sizes.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Camera.Size size = it.next();
                if (size.width == 640) {
                    chosenSize = size;
                    break;
                } else if (size.width < 640 && (chosenSize == null || chosenSize.width < size.width)) {
                    chosenSize = size;
                }
            }
            if (chosenSize != null) {
                parameters.setPreviewSize(chosenSize.width, chosenSize.height);
            }
            configureAdvanced(parameters);
            camera.setParameters(parameters);
        } catch (Exception x) {
            Log.e("vk", "Error setting camera parameters!", x);
        }
    }

    private static void configureAdvanced(Camera.Parameters parameters) {
        CameraConfigurationUtils.setBestPreviewFPS(parameters);
        CameraConfigurationUtils.setBarcodeSceneMode(parameters);
        CameraConfigurationUtils.setVideoStabilization(parameters);
        CameraConfigurationUtils.setMetering(parameters);
        CameraConfigurationUtils.setZoom(parameters, 2.0d);
    }

    private static void logAllParameters(Camera.Parameters parameters) {
        String[] split;
        if (Log.isLoggable(TAG, 4)) {
            for (String line : CameraConfigurationUtils.collectStats(parameters).split("\n")) {
                Log.i(TAG, line);
            }
        }
    }
}
