package com.vkontakte.android.barcode;

import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.Camera;
import android.os.Build;
import android.util.Log;
import com.vk.camera.camera1.CameraUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;
/* loaded from: classes2.dex */
public final class CameraConfigurationUtils {
    private static final int AREA_PER_1000 = 400;
    private static final double MAX_ASPECT_DISTORTION = 0.15d;
    private static final float MAX_EXPOSURE_COMPENSATION = 1.5f;
    private static final int MAX_FPS = 20;
    private static final float MIN_EXPOSURE_COMPENSATION = 0.0f;
    private static final int MIN_FPS = 10;
    private static final int MIN_PREVIEW_PIXELS = 153600;
    private static final Pattern SEMICOLON = Pattern.compile(";");
    private static final String TAG = "CameraConfiguration";

    private CameraConfigurationUtils() {
    }

    public static void setFocus(Camera.Parameters parameters, boolean autoFocus, boolean disableContinuous, boolean safeMode) {
        List<String> supportedFocusModes = parameters.getSupportedFocusModes();
        String focusMode = null;
        if (autoFocus) {
            if (safeMode || disableContinuous) {
                focusMode = findSettableValue("focus mode", supportedFocusModes, "auto");
            } else {
                focusMode = findSettableValue("focus mode", supportedFocusModes, CameraUtils.FOCUS_MODE_CONTINUOUS_PICTURE, "continuous-video", "auto");
            }
        }
        if (!safeMode && focusMode == null) {
            focusMode = findSettableValue("focus mode", supportedFocusModes, "macro", "edof");
        }
        if (focusMode != null) {
            if (focusMode.equals(parameters.getFocusMode())) {
                Log.i(TAG, "Focus mode already set to " + focusMode);
            } else {
                parameters.setFocusMode(focusMode);
            }
        }
    }

    public static void setTorch(Camera.Parameters parameters, boolean on) {
        String flashMode;
        List<String> supportedFlashModes = parameters.getSupportedFlashModes();
        if (on) {
            flashMode = findSettableValue("flash mode", supportedFlashModes, "torch", "on");
        } else {
            flashMode = findSettableValue("flash mode", supportedFlashModes, "off");
        }
        if (flashMode != null) {
            if (flashMode.equals(parameters.getFlashMode())) {
                Log.i(TAG, "Flash mode already set to " + flashMode);
                return;
            }
            Log.i(TAG, "Setting flash mode to " + flashMode);
            parameters.setFlashMode(flashMode);
        }
    }

    public static void setBestExposure(Camera.Parameters parameters, boolean lightOn) {
        float targetCompensation = 0.0f;
        int minExposure = parameters.getMinExposureCompensation();
        int maxExposure = parameters.getMaxExposureCompensation();
        float step = parameters.getExposureCompensationStep();
        if ((minExposure != 0 || maxExposure != 0) && step > 0.0f) {
            if (!lightOn) {
                targetCompensation = MAX_EXPOSURE_COMPENSATION;
            }
            int compensationSteps = Math.round(targetCompensation / step);
            float actualCompensation = step * compensationSteps;
            int compensationSteps2 = Math.max(Math.min(compensationSteps, maxExposure), minExposure);
            if (parameters.getExposureCompensation() == compensationSteps2) {
                Log.i(TAG, "Exposure compensation already set to " + compensationSteps2 + " / " + actualCompensation);
                return;
            }
            Log.i(TAG, "Setting exposure compensation to " + compensationSteps2 + " / " + actualCompensation);
            parameters.setExposureCompensation(compensationSteps2);
            return;
        }
        Log.i(TAG, "Camera does not support exposure compensation");
    }

    public static void setBestPreviewFPS(Camera.Parameters parameters) {
        setBestPreviewFPS(parameters, 10, 20);
    }

    public static void setBestPreviewFPS(Camera.Parameters parameters, int minFPS, int maxFPS) {
        List<int[]> supportedPreviewFpsRanges = parameters.getSupportedPreviewFpsRange();
        Log.i(TAG, "Supported FPS ranges: " + toString((Collection<int[]>) supportedPreviewFpsRanges));
        if (supportedPreviewFpsRanges != null && !supportedPreviewFpsRanges.isEmpty()) {
            int[] suitableFPSRange = null;
            Iterator<int[]> it = supportedPreviewFpsRanges.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                int[] fpsRange = it.next();
                int thisMin = fpsRange[0];
                int thisMax = fpsRange[1];
                if (thisMin >= minFPS * 1000 && thisMax <= maxFPS * 1000) {
                    suitableFPSRange = fpsRange;
                    break;
                }
            }
            if (suitableFPSRange == null) {
                Log.i(TAG, "No suitable FPS range?");
                return;
            }
            int[] currentFpsRange = new int[2];
            parameters.getPreviewFpsRange(currentFpsRange);
            if (Arrays.equals(currentFpsRange, suitableFPSRange)) {
                Log.i(TAG, "FPS range already set to " + Arrays.toString(suitableFPSRange));
                return;
            }
            Log.i(TAG, "Setting FPS range to " + Arrays.toString(suitableFPSRange));
            parameters.setPreviewFpsRange(suitableFPSRange[0], suitableFPSRange[1]);
        }
    }

    public static void setFocusArea(Camera.Parameters parameters) {
        if (parameters.getMaxNumFocusAreas() > 0) {
            Log.i(TAG, "Old focus areas: " + toString((Iterable<Camera.Area>) parameters.getFocusAreas()));
            List<Camera.Area> middleArea = buildMiddleArea(400);
            Log.i(TAG, "Setting focus area to : " + toString((Iterable<Camera.Area>) middleArea));
            parameters.setFocusAreas(middleArea);
            return;
        }
        Log.i(TAG, "Device does not support focus areas");
    }

    public static void setMetering(Camera.Parameters parameters) {
        if (parameters.getMaxNumMeteringAreas() > 0) {
            List<Camera.Area> middleArea = buildMiddleArea(400);
            parameters.setMeteringAreas(middleArea);
            return;
        }
        Log.i(TAG, "Device does not support metering areas");
    }

    private static List<Camera.Area> buildMiddleArea(int areaPer1000) {
        return Collections.singletonList(new Camera.Area(new Rect(-areaPer1000, -areaPer1000, areaPer1000, areaPer1000), 1));
    }

    public static void setVideoStabilization(Camera.Parameters parameters) {
        if (Build.VERSION.SDK_INT >= 15 && parameters.isVideoStabilizationSupported()) {
            if (parameters.getVideoStabilization()) {
                Log.i(TAG, "Video stabilization already enabled");
                return;
            }
            Log.i(TAG, "Enabling video stabilization...");
            parameters.setVideoStabilization(true);
            return;
        }
        Log.i(TAG, "This device does not support video stabilization");
    }

    public static void setBarcodeSceneMode(Camera.Parameters parameters) {
        if ("barcode".equals(parameters.getSceneMode())) {
            Log.i(TAG, "Barcode scene mode already set");
            return;
        }
        String sceneMode = findSettableValue("scene mode", parameters.getSupportedSceneModes(), "barcode");
        if (sceneMode != null) {
            parameters.setSceneMode(sceneMode);
        }
    }

    public static void setZoom(Camera.Parameters parameters, double targetZoomRatio) {
        if (parameters.isZoomSupported()) {
            Integer zoom = indexOfClosestZoom(parameters, targetZoomRatio);
            if (zoom != null) {
                if (parameters.getZoom() == zoom.intValue()) {
                    Log.i(TAG, "Zoom is already set to " + zoom);
                    return;
                }
                Log.i(TAG, "Setting zoom to " + zoom);
                parameters.setZoom(zoom.intValue());
                return;
            }
            return;
        }
        Log.i(TAG, "Zoom is not supported");
    }

    private static Integer indexOfClosestZoom(Camera.Parameters parameters, double targetZoomRatio) {
        List<Integer> ratios = parameters.getZoomRatios();
        Log.i(TAG, "Zoom ratios: " + ratios);
        int maxZoom = parameters.getMaxZoom();
        if (ratios == null || ratios.isEmpty() || ratios.size() != maxZoom + 1) {
            Log.w(TAG, "Invalid zoom ratios!");
            return null;
        }
        double target100 = 100.0d * targetZoomRatio;
        double smallestDiff = Double.POSITIVE_INFINITY;
        int closestIndex = 0;
        for (int i = 0; i < ratios.size(); i++) {
            double diff = Math.abs(ratios.get(i).intValue() - target100);
            if (diff < smallestDiff) {
                smallestDiff = diff;
                closestIndex = i;
            }
        }
        Log.i(TAG, "Chose zoom ratio of " + (ratios.get(closestIndex).intValue() / 100.0d));
        return Integer.valueOf(closestIndex);
    }

    public static void setInvertColor(Camera.Parameters parameters) {
        if ("negative".equals(parameters.getColorEffect())) {
            Log.i(TAG, "Negative effect already set");
            return;
        }
        String colorMode = findSettableValue("color effect", parameters.getSupportedColorEffects(), "negative");
        if (colorMode != null) {
            parameters.setColorEffect(colorMode);
        }
    }

    public static Point findBestPreviewSizeValue(Camera.Parameters parameters, Point screenResolution) {
        List<Camera.Size> rawSupportedSizes = parameters.getSupportedPreviewSizes();
        if (rawSupportedSizes == null) {
            Log.w(TAG, "Device returned no supported preview sizes; using default");
            Camera.Size defaultSize = parameters.getPreviewSize();
            if (defaultSize == null) {
                throw new IllegalStateException("Parameters contained no preview size!");
            }
            return new Point(defaultSize.width, defaultSize.height);
        }
        List<Camera.Size> supportedPreviewSizes = new ArrayList<>(rawSupportedSizes);
        Collections.sort(supportedPreviewSizes, new Comparator<Camera.Size>() { // from class: com.vkontakte.android.barcode.CameraConfigurationUtils.1
            @Override // java.util.Comparator
            public int compare(Camera.Size a, Camera.Size b) {
                int aPixels = a.height * a.width;
                int bPixels = b.height * b.width;
                if (bPixels < aPixels) {
                    return -1;
                }
                if (bPixels > aPixels) {
                    return 1;
                }
                return 0;
            }
        });
        if (Log.isLoggable(TAG, 4)) {
            StringBuilder previewSizesString = new StringBuilder();
            for (Camera.Size supportedPreviewSize : supportedPreviewSizes) {
                previewSizesString.append(supportedPreviewSize.width).append('x').append(supportedPreviewSize.height).append(' ');
            }
            Log.i(TAG, "Supported preview sizes: " + ((Object) previewSizesString));
        }
        double screenAspectRatio = screenResolution.x / screenResolution.y;
        Iterator<Camera.Size> it = supportedPreviewSizes.iterator();
        while (it.hasNext()) {
            Camera.Size supportedPreviewSize2 = it.next();
            int realWidth = supportedPreviewSize2.width;
            int realHeight = supportedPreviewSize2.height;
            if (realWidth * realHeight < MIN_PREVIEW_PIXELS) {
                it.remove();
            } else {
                boolean isCandidatePortrait = realWidth < realHeight;
                int maybeFlippedWidth = isCandidatePortrait ? realHeight : realWidth;
                int maybeFlippedHeight = isCandidatePortrait ? realWidth : realHeight;
                double aspectRatio = maybeFlippedWidth / maybeFlippedHeight;
                double distortion = Math.abs(aspectRatio - screenAspectRatio);
                if (distortion > MAX_ASPECT_DISTORTION) {
                    it.remove();
                } else if (maybeFlippedWidth == screenResolution.x && maybeFlippedHeight == screenResolution.y) {
                    Point exactPoint = new Point(realWidth, realHeight);
                    Log.i(TAG, "Found preview size exactly matching screen size: " + exactPoint);
                    return exactPoint;
                }
            }
        }
        if (!supportedPreviewSizes.isEmpty()) {
            Camera.Size largestPreview = supportedPreviewSizes.get(0);
            Point largestSize = new Point(largestPreview.width, largestPreview.height);
            Log.i(TAG, "Using largest suitable preview size: " + largestSize);
            return largestSize;
        }
        Camera.Size defaultPreview = parameters.getPreviewSize();
        if (defaultPreview == null) {
            throw new IllegalStateException("Parameters contained no preview size!");
        }
        Point defaultSize2 = new Point(defaultPreview.width, defaultPreview.height);
        Log.i(TAG, "No suitable preview sizes, using default: " + defaultSize2);
        return defaultSize2;
    }

    private static String findSettableValue(String name, Collection<String> supportedValues, String... desiredValues) {
        Log.i(TAG, "Requesting " + name + " value from among: " + Arrays.toString(desiredValues));
        Log.i(TAG, "Supported " + name + " values: " + supportedValues);
        if (supportedValues != null) {
            for (String desiredValue : desiredValues) {
                if (supportedValues.contains(desiredValue)) {
                    Log.i(TAG, "Can set " + name + " to: " + desiredValue);
                    return desiredValue;
                }
            }
        }
        Log.i(TAG, "No supported values match");
        return null;
    }

    private static String toString(Collection<int[]> arrays) {
        if (arrays == null || arrays.isEmpty()) {
            return "[]";
        }
        StringBuilder buffer = new StringBuilder();
        buffer.append('[');
        Iterator<int[]> it = arrays.iterator();
        while (it.hasNext()) {
            buffer.append(Arrays.toString(it.next()));
            if (it.hasNext()) {
                buffer.append(", ");
            }
        }
        buffer.append(']');
        return buffer.toString();
    }

    private static String toString(Iterable<Camera.Area> areas) {
        if (areas == null) {
            return null;
        }
        StringBuilder result = new StringBuilder();
        for (Camera.Area area : areas) {
            result.append(area.rect).append(':').append(area.weight).append(' ');
        }
        return result.toString();
    }

    public static String collectStats(Camera.Parameters parameters) {
        return collectStats(parameters.flatten());
    }

    public static String collectStats(CharSequence flattenedParams) {
        StringBuilder result = new StringBuilder(1000);
        result.append("BOARD=").append(Build.BOARD).append('\n');
        result.append("BRAND=").append(Build.BRAND).append('\n');
        result.append("CPU_ABI=").append(Build.CPU_ABI).append('\n');
        result.append("DEVICE=").append(Build.DEVICE).append('\n');
        result.append("DISPLAY=").append(Build.DISPLAY).append('\n');
        result.append("FINGERPRINT=").append(Build.FINGERPRINT).append('\n');
        result.append("HOST=").append(Build.HOST).append('\n');
        result.append("ID=").append(Build.ID).append('\n');
        result.append("MANUFACTURER=").append(Build.MANUFACTURER).append('\n');
        result.append("MODEL=").append(Build.MODEL).append('\n');
        result.append("PRODUCT=").append(Build.PRODUCT).append('\n');
        result.append("TAGS=").append(Build.TAGS).append('\n');
        result.append("TIME=").append(Build.TIME).append('\n');
        result.append("TYPE=").append(Build.TYPE).append('\n');
        result.append("USER=").append(Build.USER).append('\n');
        result.append("VERSION.CODENAME=").append(Build.VERSION.CODENAME).append('\n');
        result.append("VERSION.INCREMENTAL=").append(Build.VERSION.INCREMENTAL).append('\n');
        result.append("VERSION.RELEASE=").append(Build.VERSION.RELEASE).append('\n');
        result.append("VERSION.SDK_INT=").append(Build.VERSION.SDK_INT).append('\n');
        if (flattenedParams != null) {
            String[] params = SEMICOLON.split(flattenedParams);
            Arrays.sort(params);
            for (String param : params) {
                result.append(param).append('\n');
            }
        }
        return result.toString();
    }
}
