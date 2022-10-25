package com.google.android.gms.ads.internal.overlay;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.view.Display;
import android.view.WindowManager;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
@zzji
/* loaded from: classes.dex */
class zzw implements SensorEventListener {
    private final SensorManager zzccu;
    private final Display zzccw;
    private float[] zzccz;
    private Handler zzcda;
    private zza zzcdb;
    private final float[] zzccx = new float[9];
    private final float[] zzccy = new float[9];
    private final Object zzccv = new Object();

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface zza {
        void zzpr();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzw(Context context) {
        this.zzccu = (SensorManager) context.getSystemService("sensor");
        this.zzccw = ((WindowManager) context.getSystemService("window")).getDefaultDisplay();
    }

    private void zzh(int i, int i2) {
        float f = this.zzccy[i];
        this.zzccy[i] = this.zzccy[i2];
        this.zzccy[i2] = f;
    }

    int getRotation() {
        return this.zzccw.getRotation();
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent sensorEvent) {
        zza(sensorEvent.values);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void start() {
        if (this.zzcda != null) {
            return;
        }
        Sensor defaultSensor = this.zzccu.getDefaultSensor(11);
        if (defaultSensor == null) {
            zzkx.e("No Sensor of TYPE_ROTATION_VECTOR");
            return;
        }
        HandlerThread handlerThread = new HandlerThread("OrientationMonitor");
        handlerThread.start();
        this.zzcda = new Handler(handlerThread.getLooper());
        if (this.zzccu.registerListener(this, defaultSensor, 0, this.zzcda)) {
            return;
        }
        zzkx.e("SensorManager.registerListener failed.");
        stop();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stop() {
        if (this.zzcda == null) {
            return;
        }
        this.zzccu.unregisterListener(this);
        this.zzcda.post(new Runnable() { // from class: com.google.android.gms.ads.internal.overlay.zzw.1
            @Override // java.lang.Runnable
            public void run() {
                Looper.myLooper().quit();
            }
        });
        this.zzcda = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zza zzaVar) {
        this.zzcdb = zzaVar;
    }

    void zza(float[] fArr) {
        if (fArr[0] == 0.0f && fArr[1] == 0.0f && fArr[2] == 0.0f) {
            return;
        }
        synchronized (this.zzccv) {
            if (this.zzccz == null) {
                this.zzccz = new float[9];
            }
        }
        SensorManager.getRotationMatrixFromVector(this.zzccx, fArr);
        switch (getRotation()) {
            case 1:
                SensorManager.remapCoordinateSystem(this.zzccx, 2, TsExtractor.TS_STREAM_TYPE_AC3, this.zzccy);
                break;
            case 2:
                SensorManager.remapCoordinateSystem(this.zzccx, TsExtractor.TS_STREAM_TYPE_AC3, 130, this.zzccy);
                break;
            case 3:
                SensorManager.remapCoordinateSystem(this.zzccx, 130, 1, this.zzccy);
                break;
            default:
                System.arraycopy(this.zzccx, 0, this.zzccy, 0, 9);
                break;
        }
        zzh(1, 3);
        zzh(2, 6);
        zzh(5, 7);
        synchronized (this.zzccv) {
            System.arraycopy(this.zzccy, 0, this.zzccz, 0, 9);
        }
        if (this.zzcdb == null) {
            return;
        }
        this.zzcdb.zzpr();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzb(float[] fArr) {
        boolean z = false;
        synchronized (this.zzccv) {
            if (this.zzccz != null) {
                System.arraycopy(this.zzccz, 0, fArr, 0, this.zzccz.length);
                z = true;
            }
        }
        return z;
    }
}
