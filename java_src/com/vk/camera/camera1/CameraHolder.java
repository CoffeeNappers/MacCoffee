package com.vk.camera.camera1;

import android.hardware.Camera;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.vk.camera.camera1.CameraManager;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
/* loaded from: classes2.dex */
public class CameraHolder {
    private static final boolean DEBUG_OPEN_RELEASE = true;
    private static final int KEEP_CAMERA_TIMEOUT = 3000;
    private static final int RELEASE_CAMERA = 1;
    private static final String TAG = "CameraHolder";
    private static CameraHolder sHolder;
    private int mBackCameraId;
    private CameraManager.CameraProxy mCameraDevice;
    private int mCameraId = -1;
    private boolean mCameraOpened;
    private int mFrontCameraId;
    private final Handler mHandler;
    private final Camera.CameraInfo[] mInfo;
    private long mKeepBeforeTime;
    private final int mNumberOfCameras;
    private Camera.Parameters mParameters;
    private static ArrayList<OpenReleaseState> sOpenReleaseStates = new ArrayList<>();
    private static SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class OpenReleaseState {
        String device;
        int id;
        String[] stack;
        long time;

        private OpenReleaseState() {
        }
    }

    private static synchronized void collectState(int id, CameraManager.CameraProxy device) {
        synchronized (CameraHolder.class) {
            OpenReleaseState s = new OpenReleaseState();
            s.time = System.currentTimeMillis();
            s.id = id;
            if (device == null) {
                s.device = "(null)";
            } else {
                s.device = device.toString();
            }
            StackTraceElement[] stack = Thread.currentThread().getStackTrace();
            String[] lines = new String[stack.length];
            for (int i = 0; i < stack.length; i++) {
                lines[i] = stack[i].toString();
            }
            s.stack = lines;
            if (sOpenReleaseStates.size() > 10) {
                sOpenReleaseStates.remove(0);
            }
            sOpenReleaseStates.add(s);
        }
    }

    private static synchronized void dumpStates() {
        synchronized (CameraHolder.class) {
            for (int i = sOpenReleaseStates.size() - 1; i >= 0; i--) {
                OpenReleaseState s = sOpenReleaseStates.get(i);
                String date = sDateFormat.format(new Date(s.time));
                Log.d(TAG, "State " + i + " at " + date);
                Log.d(TAG, "mCameraId = " + s.id + ", mCameraDevice = " + s.device);
                Log.d(TAG, "Stack:");
                for (int j = 0; j < s.stack.length; j++) {
                    Log.d(TAG, "  " + s.stack[j]);
                }
            }
        }
    }

    public static synchronized CameraHolder instance() {
        CameraHolder cameraHolder;
        synchronized (CameraHolder.class) {
            if (sHolder == null) {
                sHolder = new CameraHolder();
            }
            cameraHolder = sHolder;
        }
        return cameraHolder;
    }

    /* loaded from: classes2.dex */
    private class MyHandler extends Handler {
        MyHandler(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    synchronized (CameraHolder.this) {
                        if (!CameraHolder.this.mCameraOpened) {
                            CameraHolder.this.release();
                        }
                    }
                    return;
                default:
                    return;
            }
        }
    }

    private CameraHolder() {
        this.mBackCameraId = 0;
        this.mFrontCameraId = 1;
        HandlerThread ht = new HandlerThread(TAG);
        ht.start();
        this.mHandler = new MyHandler(ht.getLooper());
        this.mNumberOfCameras = Camera.getNumberOfCameras();
        this.mInfo = new Camera.CameraInfo[this.mNumberOfCameras];
        for (int i = 0; i < this.mNumberOfCameras; i++) {
            this.mInfo[i] = new Camera.CameraInfo();
            Camera.getCameraInfo(i, this.mInfo[i]);
        }
        for (int i2 = 0; i2 < this.mNumberOfCameras; i2++) {
            if (this.mBackCameraId == -1 && this.mInfo[i2].facing == 0) {
                this.mBackCameraId = i2;
            } else if (this.mFrontCameraId == -1 && this.mInfo[i2].facing == 1) {
                this.mFrontCameraId = i2;
            }
        }
    }

    public int getNumberOfCameras() {
        return this.mNumberOfCameras;
    }

    public Camera.CameraInfo[] getCameraInfo() {
        return this.mInfo;
    }

    public synchronized CameraManager.CameraProxy open(int cameraId) throws CameraHardwareException {
        collectState(cameraId, this.mCameraDevice);
        if (this.mCameraOpened) {
            Log.e(TAG, "double open");
            dumpStates();
        }
        if (this.mCameraOpened) {
            throw new RuntimeException("Camera is already opened");
        }
        if (this.mCameraDevice != null && this.mCameraId != cameraId) {
            this.mCameraDevice.release();
            this.mCameraDevice = null;
            this.mCameraId = -1;
        }
        if (this.mCameraDevice == null) {
            try {
                Log.v(TAG, "open camera " + cameraId);
                this.mCameraDevice = CameraManager.instance().cameraOpen(cameraId);
                this.mCameraId = cameraId;
                this.mParameters = this.mCameraDevice.getParameters();
                this.mCameraOpened = true;
                this.mHandler.removeMessages(1);
                this.mKeepBeforeTime = 0L;
            } catch (RuntimeException e) {
                Log.e(TAG, "fail to connect Camera", e);
                throw new CameraHardwareException(e);
            }
        } else {
            try {
                this.mCameraDevice.reconnect();
                this.mCameraDevice.setParameters(this.mParameters);
                this.mCameraOpened = true;
                this.mHandler.removeMessages(1);
                this.mKeepBeforeTime = 0L;
            } catch (Exception e2) {
                Log.e(TAG, "reconnect failed.");
                throw new CameraHardwareException(e2);
            }
        }
        return this.mCameraDevice;
    }

    public synchronized CameraManager.CameraProxy tryOpen(int cameraId) {
        CameraManager.CameraProxy cameraProxy = null;
        synchronized (this) {
            try {
                if (!this.mCameraOpened) {
                    cameraProxy = open(cameraId);
                }
            } catch (CameraHardwareException e) {
                if ("eng".equals(Build.TYPE)) {
                    throw new RuntimeException(e);
                }
            }
        }
        return cameraProxy;
    }

    public synchronized void release() {
        collectState(this.mCameraId, this.mCameraDevice);
        if (this.mCameraDevice != null) {
            long now = System.currentTimeMillis();
            if (now < this.mKeepBeforeTime) {
                if (this.mCameraOpened) {
                    this.mCameraOpened = false;
                    this.mCameraDevice.stopPreview();
                }
                this.mHandler.sendEmptyMessageDelayed(1, this.mKeepBeforeTime - now);
            } else {
                this.mCameraOpened = false;
                this.mCameraDevice.release();
                this.mCameraDevice = null;
                this.mParameters = null;
                this.mCameraId = -1;
            }
        }
    }

    public void keep() {
        keep(3000);
    }

    public synchronized void keep(int time) {
        this.mKeepBeforeTime = System.currentTimeMillis() + time;
    }

    public int getBackCameraId() {
        return this.mBackCameraId;
    }

    public int getFrontCameraId() {
        return this.mFrontCameraId;
    }

    public Camera.Parameters getParameters() {
        return this.mParameters;
    }

    public boolean currentCameraFrontal() {
        return this.mCameraId == this.mFrontCameraId;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0034, code lost:
        if (r0.get(0).equals("off") != false) goto L23;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean currentCameraHasFlash() {
        /*
            r6 = this;
            r4 = 1
            r3 = 0
            android.hardware.Camera$Parameters r2 = r6.mParameters     // Catch: java.lang.Throwable -> L3a
            if (r2 != 0) goto L8
            r2 = r3
        L7:
            return r2
        L8:
            android.hardware.Camera$Parameters r2 = r6.mParameters     // Catch: java.lang.Throwable -> L3a
            java.lang.String r2 = r2.getFlashMode()     // Catch: java.lang.Throwable -> L3a
            if (r2 != 0) goto L12
            r2 = r3
            goto L7
        L12:
            android.hardware.Camera$Parameters r2 = r6.mParameters     // Catch: java.lang.Throwable -> L3a
            java.util.List r0 = r2.getSupportedFlashModes()     // Catch: java.lang.Throwable -> L3a
            if (r0 == 0) goto L36
            boolean r2 = r0.isEmpty()     // Catch: java.lang.Throwable -> L3a
            if (r2 != 0) goto L36
            int r2 = r0.size()     // Catch: java.lang.Throwable -> L3a
            if (r2 != r4) goto L38
            r2 = 0
            java.lang.Object r2 = r0.get(r2)     // Catch: java.lang.Throwable -> L3a
            java.lang.String r2 = (java.lang.String) r2     // Catch: java.lang.Throwable -> L3a
            java.lang.String r5 = "off"
            boolean r2 = r2.equals(r5)     // Catch: java.lang.Throwable -> L3a
            if (r2 == 0) goto L38
        L36:
            r2 = r3
            goto L7
        L38:
            r2 = r4
            goto L7
        L3a:
            r1 = move-exception
            r2 = r3
            goto L7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vk.camera.camera1.CameraHolder.currentCameraHasFlash():boolean");
    }
}
