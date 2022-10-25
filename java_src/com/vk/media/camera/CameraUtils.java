package com.vk.media.camera;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.ImageFormat;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.hardware.Camera;
import android.media.CamcorderProfile;
import android.media.MediaRecorder;
import android.os.Build;
import android.os.Environment;
import android.util.Log;
import com.vk.media.utils.RenderHelpers;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;
import java.util.Arrays;
/* loaded from: classes2.dex */
public class CameraUtils {
    public static final int MEDIA_ERROR = 1000;
    public static final int MEDIA_ERROR_ENCODER = 1001;
    public static final int MEDIA_ERROR_EXTRA_AUDIO = 1;
    public static final int MEDIA_ERROR_EXTRA_VIDEO = 2;
    private static final int OUTPUT_FORMAT = 17;
    private static final String PNG_EXT = ".png";
    private static final int RENDER_FORMAT = 4;
    private static final String YUV_EXT = ".yuv";
    private static final String TAG = CameraUtils.class.getSimpleName();
    static final String[] DEVICE_MODELS_FLIP_FRONT = {"Nexus 6", "Swift 2 X"};
    static final String[] DEVICE_MODELS_FLIP_BACK = {"Nexus 5X"};

    /* loaded from: classes2.dex */
    public interface FrameObserver {
        void onFrameCaptured(Camera camera, byte[] bArr, int i, int i2, int i3);
    }

    /* loaded from: classes2.dex */
    public interface FrameReader {
        void clear();

        void pull(Frame frame);

        void setTexture(RenderHelpers.RenderTexture renderTexture);
    }

    /* loaded from: classes2.dex */
    public interface Recorder {

        /* loaded from: classes2.dex */
        public interface OnRecordFrame {
            long onRecord(Frame frame);
        }

        boolean isRecording();

        boolean prepare();

        void release();

        void setMaxDuration(int i);

        void setOnErrorListener(MediaRecorder.OnErrorListener onErrorListener);

        void setOnInfoListener(MediaRecorder.OnInfoListener onInfoListener);

        void setOrientationHint(int i);

        void setOutputFile(File file);

        void setProfile(CamcorderProfile camcorderProfile);

        boolean start();

        void stop();
    }

    public static int getCameraFormat() {
        return 17;
    }

    public static boolean useYUVRender() {
        return false;
    }

    public static int getFrameSize(int width, int height, int format) {
        int bitsPerPixel = ImageFormat.getBitsPerPixel(format);
        long sizeInBits = width * height * bitsPerPixel;
        return ((int) Math.ceil(sizeInBits / 8.0d)) + 1;
    }

    public static String getFrameFileName(String ext) {
        return Environment.getExternalStorageDirectory().getPath() + CameraUtilsEffects.FILE_DELIM + "frame" + ext;
    }

    public static void dumpFrame(ByteBuffer data) {
        BufferedOutputStream bos = null;
        if (data != null) {
            try {
                if (data.remaining() != 0) {
                    String path = getFrameFileName(YUV_EXT);
                    Log.d(TAG, "save frame to " + path);
                    BufferedOutputStream bos2 = new BufferedOutputStream(new FileOutputStream(path));
                    try {
                        bos2.write(data.array());
                        bos2.flush();
                        bos = bos2;
                    } catch (Exception e) {
                        bos = bos2;
                        if (bos == null) {
                            return;
                        }
                        try {
                            bos.close();
                            return;
                        } catch (Exception e2) {
                            return;
                        }
                    } catch (Throwable th) {
                        th = th;
                        bos = bos2;
                        if (bos != null) {
                            try {
                                bos.close();
                            } catch (Exception e3) {
                            }
                        }
                        throw th;
                    }
                }
            } catch (Exception e4) {
            } catch (Throwable th2) {
                th = th2;
            }
        }
        if (bos != null) {
            try {
                bos.close();
            } catch (Exception e5) {
            }
        }
    }

    public static void dumpFrame(byte[] data, int width, int height) {
        YuvImage yuv = new YuvImage(data, 17, width, height, null);
        Rect rect = new Rect(0, 0, width, height);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        yuv.compressToJpeg(rect, 100, output);
        byte[] byt = output.toByteArray();
        FileOutputStream fos = null;
        try {
            String path = getFrameFileName(".yuv.png");
            Log.d(TAG, "save yuv frame to " + path);
            File file = new File(path);
            FileOutputStream fos2 = new FileOutputStream(file);
            try {
                fos2.write(byt);
                fos2.close();
                if (fos2 == null) {
                    return;
                }
                try {
                    fos2.close();
                } catch (Exception e) {
                }
            } catch (Exception e2) {
                fos = fos2;
                if (fos == null) {
                    return;
                }
                try {
                    fos.close();
                } catch (Exception e3) {
                }
            } catch (Throwable th) {
                th = th;
                fos = fos2;
                if (fos != null) {
                    try {
                        fos.close();
                    } catch (Exception e4) {
                    }
                }
                throw th;
            }
        } catch (Exception e5) {
        } catch (Throwable th2) {
            th = th2;
        }
    }

    public static void dumpFrame(int[] data, int width, int height) {
        FileOutputStream fos;
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.RGB_565);
        bitmap.setPixels(data, 0, width, 0, 0, width, height);
        FileOutputStream fos2 = null;
        try {
            String path = getFrameFileName(PNG_EXT);
            Log.d(TAG, "save rgb frame to " + path);
            fos = new FileOutputStream(path);
        } catch (Exception e) {
        } catch (Throwable th) {
            th = th;
        }
        try {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, fos);
            if (fos != null) {
                try {
                    fos.close();
                } catch (Exception e2) {
                }
            }
        } catch (Exception e3) {
            fos2 = fos;
            if (fos2 != null) {
                try {
                    fos2.close();
                } catch (Exception e4) {
                }
            }
        } catch (Throwable th2) {
            th = th2;
            fos2 = fos;
            if (fos2 != null) {
                try {
                    fos2.close();
                } catch (Exception e5) {
                }
            }
            throw th;
        }
    }

    public static byte[] makeJpeg(Frame frame) {
        if (frame.exists()) {
            convertABGRtoARGB(frame);
            Bitmap bitmap = Bitmap.createBitmap(frame.getPixels().array(), frame.getWidth(), frame.getHeight(), Bitmap.Config.ARGB_8888);
            if (bitmap != null) {
                ByteArrayOutputStream stream = new ByteArrayOutputStream();
                bitmap.compress(Bitmap.CompressFormat.JPEG, 86, stream);
                return stream.toByteArray();
            }
        }
        return null;
    }

    private static void convertABGRtoARGB(Frame frame) {
        int width = frame.getWidth();
        int height = frame.getHeight();
        int[] pixels = frame.getPixels().array();
        for (int i = 0; i < height; i++) {
            int position = i * width;
            for (int j = 0; j < width; j++) {
                int p = pixels[position];
                int a = (p >> 24) & 255;
                int b = (p >> 16) & 255;
                int g = (p >> 8) & 255;
                int r = p & 255;
                pixels[position] = Color.argb(a, r, g, b);
                position++;
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class Settings {
        public static final float HI_FPS = 30.0f;
        public static final int HI_HEIGHT = 720;
        public static final int HI_WIDTH = 1280;
        private static final String KEY_USE_LOW_RESOLUTION = "low_profile";
        public static final float LOW_FPS = 25.0f;
        public static final int LOW_HEIGHT = 480;
        public static final int LOW_WIDTH = 640;
        private static final String NAME = "camera_settings";
        private int mMaxCameraFrameResolution;
        private SharedPreferences mPreferences;

        public Settings(Context context, int maxResolution) {
            this.mPreferences = context.getSharedPreferences(NAME, 0);
            this.mMaxCameraFrameResolution = maxResolution;
        }

        public CamcorderProfile getVideoProfile(int cameraId) {
            CamcorderProfile p;
            CamcorderProfile p2 = null;
            try {
                if (useLowProfile()) {
                    if (CamcorderProfile.hasProfile(cameraId, 4)) {
                        p = CamcorderProfile.get(cameraId, 4);
                    } else {
                        p = CamcorderProfile.get(cameraId, 0);
                    }
                    if (p != null) {
                        p.videoFrameWidth = LOW_WIDTH;
                        p.videoFrameHeight = LOW_HEIGHT;
                    }
                } else {
                    p = getVideoProfileDefault(cameraId);
                }
                if (p == null && CamcorderProfile.hasProfile(cameraId, 0)) {
                    p2 = CamcorderProfile.get(cameraId, 0);
                    p2.videoFrameWidth = LOW_WIDTH;
                    p2.videoFrameHeight = LOW_HEIGHT;
                    return p2;
                }
                return p;
            } catch (Exception e) {
                Log.d(CameraUtils.TAG, "empty camera profile" + e.toString());
                return p2;
            }
        }

        public CamcorderProfile getVideoProfileDefault(int cameraId) {
            if (CamcorderProfile.hasProfile(cameraId, 5)) {
                CamcorderProfile p = CamcorderProfile.get(cameraId, 5);
                return p;
            } else if (CamcorderProfile.hasProfile(cameraId, 4)) {
                CamcorderProfile p2 = CamcorderProfile.get(cameraId, 4);
                return p2;
            } else if (!CamcorderProfile.hasProfile(cameraId, 7)) {
                return null;
            } else {
                CamcorderProfile p3 = CamcorderProfile.get(cameraId, 7);
                return p3;
            }
        }

        public void setUseLowResolution() {
            if (this.mPreferences != null) {
                SharedPreferences.Editor editor = this.mPreferences.edit();
                editor.putBoolean(KEY_USE_LOW_RESOLUTION, true);
                editor.apply();
            }
        }

        public float getFps() {
            return useLowProfile() ? 25.0f : 30.0f;
        }

        private boolean useLowProfile() {
            return false;
        }
    }

    /* loaded from: classes2.dex */
    public static class Frame {
        private IntBuffer mPixels = null;
        private int mWidth = 0;
        private int mHeight = 0;
        private int mRotation = 0;
        private long mTimestamp = 0;

        public void pull(Frame frame) {
            if (exists()) {
                frame.resize(this.mWidth, this.mHeight);
                this.mPixels.rewind();
                frame.mPixels.rewind();
                System.arraycopy(this.mPixels.array(), 0, frame.mPixels.array(), 0, this.mPixels.limit());
                frame.mTimestamp = this.mTimestamp;
                frame.mWidth = this.mWidth;
                frame.mHeight = this.mHeight;
            }
        }

        public IntBuffer getPixels() {
            this.mPixels.rewind();
            return this.mPixels;
        }

        public int getWidth() {
            return this.mWidth;
        }

        public int getHeight() {
            return this.mHeight;
        }

        public boolean exists() {
            return this.mHeight * this.mWidth > 0;
        }

        public long getTimestamp() {
            return this.mTimestamp;
        }

        public void setTimestamp(long timestamp) {
            this.mTimestamp = timestamp;
        }

        public void setRotation(int rotation) {
            if (this.mRotation != rotation) {
                if (rotation == 90 || rotation == 270) {
                    int tmp = this.mWidth;
                    this.mWidth = this.mHeight;
                    this.mHeight = tmp;
                }
                this.mRotation = rotation;
            }
        }

        public boolean resize(int width, int height) {
            if (this.mWidth * this.mHeight != width * height) {
                this.mWidth = width;
                this.mHeight = height;
                this.mPixels = IntBuffer.allocate(this.mWidth * this.mHeight);
                return true;
            }
            return false;
        }

        public void clear() {
            if (this.mWidth * this.mHeight > 0) {
                Arrays.fill(this.mPixels.array(), 0);
            }
            this.mTimestamp = 0L;
        }
    }

    public static boolean hasVerticalFlipByModel(boolean backCamera) {
        String[] strArr;
        String[] strArr2;
        String model = Build.MODEL;
        if (backCamera) {
            for (String mo : DEVICE_MODELS_FLIP_BACK) {
                if (model.contains(mo)) {
                    return true;
                }
            }
        } else {
            for (String mo2 : DEVICE_MODELS_FLIP_FRONT) {
                if (model.contains(mo2)) {
                    return true;
                }
            }
        }
        return false;
    }
}
