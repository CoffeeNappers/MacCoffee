package com.vk.camera.camera1;

import android.annotation.TargetApi;
import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.Camera;
import android.os.Build;
import android.util.Log;
import com.facebook.imagepipeline.common.RotationOptions;
import com.my.target.ads.instream.InstreamAd;
import com.vk.core.util.Device;
import java.util.List;
import java.util.StringTokenizer;
/* loaded from: classes2.dex */
public class CameraUtils {
    private static final String AUTO_EXPOSURE_LOCK_SUPPORTED = "auto-exposure-lock-supported";
    private static final String AUTO_WHITE_BALANCE_LOCK_SUPPORTED = "auto-whitebalance-lock-supported";
    public static final String FOCUS_MODE_CONTINUOUS_PICTURE = "continuous-picture";
    public static final boolean HAS_CAMERA_FOCUS_AREA;
    public static final boolean HAS_CAMERA_METERING_AREA;
    private static final int MAX_IMAGE_SIZE = 1280;
    private static final String TAG = "Util";
    public static final String TRUE = "true";

    static {
        boolean z = true;
        HAS_CAMERA_FOCUS_AREA = Build.VERSION.SDK_INT >= 14;
        if (Build.VERSION.SDK_INT < 14) {
            z = false;
        }
        HAS_CAMERA_METERING_AREA = z;
    }

    public static boolean isSupported(String value, List<String> supported) {
        return supported != null && supported.indexOf(value) >= 0;
    }

    public static boolean isAutoExposureLockSupported(Camera.Parameters params) {
        return "true".equals(params.get(AUTO_EXPOSURE_LOCK_SUPPORTED));
    }

    public static boolean isAutoWhiteBalanceLockSupported(Camera.Parameters params) {
        return "true".equals(params.get(AUTO_WHITE_BALANCE_LOCK_SUPPORTED));
    }

    @TargetApi(14)
    public static boolean isMeteringAreaSupported(Camera.Parameters params) {
        return HAS_CAMERA_METERING_AREA && params.getMaxNumMeteringAreas() > 0;
    }

    @TargetApi(14)
    public static boolean isFocusAreaSupported(Camera.Parameters params) {
        return HAS_CAMERA_FOCUS_AREA && params.getMaxNumFocusAreas() > 0 && isSupported("auto", params.getSupportedFocusModes());
    }

    private CameraUtils() {
    }

    public static Bitmap rotate(Bitmap b, int degrees) {
        return rotateAndMirror(b, degrees, false);
    }

    public static Bitmap rotateAndMirror(Bitmap b, int degrees, boolean mirror) {
        if ((degrees != 0 || mirror) && b != null) {
            Matrix m = new Matrix();
            if (mirror) {
                m.postScale(-1.0f, 1.0f);
                degrees = (degrees + InstreamAd.DEFAULT_VIDEO_QUALITY) % InstreamAd.DEFAULT_VIDEO_QUALITY;
                if (degrees == 0 || degrees == 180) {
                    m.postTranslate(b.getWidth(), 0.0f);
                } else if (degrees == 90 || degrees == 270) {
                    m.postTranslate(b.getHeight(), 0.0f);
                } else {
                    throw new IllegalArgumentException("Invalid degrees=" + degrees);
                }
            }
            if (degrees != 0) {
                m.postRotate(degrees, b.getWidth() / 2.0f, b.getHeight() / 2.0f);
            }
            try {
                Bitmap b2 = Bitmap.createBitmap(b, 0, 0, b.getWidth(), b.getHeight(), m, true);
                if (b != b2) {
                    b.recycle();
                    return b2;
                }
                return b;
            } catch (OutOfMemoryError e) {
                return b;
            }
        }
        return b;
    }

    public static boolean equals(Object a, Object b) {
        return a == b || (a != null && a.equals(b));
    }

    public static int clamp(int x, int min, int max) {
        if (x > max) {
            return max;
        }
        return x < min ? min : x;
    }

    public static int getDisplayRotation(Activity activity) {
        int rotation = activity.getWindowManager().getDefaultDisplay().getRotation();
        switch (rotation) {
            case 0:
            default:
                return 0;
            case 1:
                return 90;
            case 2:
                return RotationOptions.ROTATE_180;
            case 3:
                return RotationOptions.ROTATE_270;
        }
    }

    public static int getDisplayOrientation(int degrees, int cameraId) {
        Camera.CameraInfo info = new Camera.CameraInfo();
        Camera.getCameraInfo(cameraId, info);
        if (info.facing == 1) {
            int result = (info.orientation + degrees) % InstreamAd.DEFAULT_VIDEO_QUALITY;
            return (360 - result) % InstreamAd.DEFAULT_VIDEO_QUALITY;
        }
        int result2 = ((info.orientation - degrees) + InstreamAd.DEFAULT_VIDEO_QUALITY) % InstreamAd.DEFAULT_VIDEO_QUALITY;
        return result2;
    }

    public static int getCameraOrientation(int cameraId) {
        Camera.CameraInfo info = new Camera.CameraInfo();
        Camera.getCameraInfo(cameraId, info);
        return info.orientation;
    }

    public static int getCameraPictureRotation(int orientation, int cameraId) {
        Camera.CameraInfo info = new Camera.CameraInfo();
        Camera.getCameraInfo(cameraId, info);
        int orientation2 = ((orientation + 45) / 90) * 90;
        if (info.facing == 1) {
            int rotation = ((info.orientation - orientation2) + InstreamAd.DEFAULT_VIDEO_QUALITY) % InstreamAd.DEFAULT_VIDEO_QUALITY;
            return rotation;
        }
        int rotation2 = (info.orientation + orientation2) % InstreamAd.DEFAULT_VIDEO_QUALITY;
        return rotation2;
    }

    public static Camera.Size getOptimalPhotoPictureSize4x3(Camera.Parameters parameters) {
        return determineBestSize(parameters.getSupportedPictureSizes(), 4, 3);
    }

    public static Camera.Size getOptimalPhotoPictureSize(Camera.Parameters parameters, int w, int h) {
        return determineBestSize(parameters.getSupportedPictureSizes(), w, h);
    }

    public static Camera.Size getOptimalPhotoPreviewSize(Camera.Parameters parameters) {
        return determineBestSize(parameters.getSupportedPreviewSizes(), 4, 3);
    }

    public static Camera.Size getOptimalVideoPreviewSize(Camera.Parameters parameters, int width, int height) {
        return determineBestSize(parameters.getSupportedPreviewSizes(), width, height);
    }

    private static Camera.Size determineBestSize(List<Camera.Size> sizes, int originalWidth, int originalHeight) {
        Camera.Size bestSize = null;
        int numOfSizes = sizes.size();
        int gcd = gcd(originalWidth, originalHeight);
        int width = originalWidth / gcd;
        int height = originalHeight / gcd;
        for (int i = 0; i < numOfSizes; i++) {
            Camera.Size size = sizes.get(i);
            if (size.width != originalWidth || size.height != originalHeight) {
                boolean isDesireRatio = size.width / width == size.height / height;
                boolean isBetterSize = bestSize == null || (size.width > bestSize.width && size.height <= 1280);
                if (isDesireRatio && isBetterSize && size.width <= 1280) {
                    bestSize = size;
                }
            } else {
                return size;
            }
        }
        if (bestSize == null) {
            Log.d(TAG, "cannot find the best camera size");
            Camera.Size size2 = sizes.get(sizes.size() - 1);
            return size2;
        }
        Camera.Size size3 = bestSize;
        return size3;
    }

    public static int gcd(int a, int b) {
        while (b != 0) {
            int tmp = a % b;
            a = b;
            b = tmp;
        }
        return a;
    }

    public static void dumpParameters(Camera.Parameters parameters) {
        String flattened = parameters.flatten();
        StringTokenizer tokenizer = new StringTokenizer(flattened, ";");
        Log.d("tmp", "Dump all camera parameters:");
        while (tokenizer.hasMoreElements()) {
            Log.d("tmp", tokenizer.nextToken());
        }
    }

    public static void rectFToRect(RectF rectF, Rect rect) {
        rect.left = Math.round(rectF.left);
        rect.top = Math.round(rectF.top);
        rect.right = Math.round(rectF.right);
        rect.bottom = Math.round(rectF.bottom);
    }

    public static void prepareMatrix(Matrix matrix, boolean mirror, int displayOrientation, int viewWidth, int viewHeight) {
        matrix.setScale(mirror ? -1.0f : 1.0f, 1.0f);
        if (Device.isNexus5X() && !mirror) {
            matrix.postScale(-1.0f, -1.0f);
        }
        matrix.postRotate(displayOrientation);
        matrix.postScale(viewWidth / 2000.0f, viewHeight / 2000.0f);
        matrix.postTranslate(viewWidth / 2.0f, viewHeight / 2.0f);
    }
}
