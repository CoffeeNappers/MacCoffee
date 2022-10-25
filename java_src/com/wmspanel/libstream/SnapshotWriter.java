package com.wmspanel.libstream;

import android.graphics.Bitmap;
import android.util.Log;
import java.io.File;
import java.nio.ByteBuffer;
/* loaded from: classes3.dex */
public class SnapshotWriter implements Runnable {
    private static final String TAG = "SnapshotWriter";
    private static Bitmap.CompressFormat mFormat = Bitmap.CompressFormat.JPEG;
    private static int mQuality = 90;
    private ByteBuffer mBuffer;
    private SnapshotCallback mCallback;
    private File mFile;
    private int mHeight;
    private boolean mMirror;
    private int mWidth;

    /* loaded from: classes3.dex */
    public interface SnapshotCallback {
        void onSnapshotTaken(Bitmap bitmap);
    }

    public SnapshotWriter(ByteBuffer buffer, SnapshotCallback callback, File file, int width, int height, boolean mirror) {
        this.mBuffer = buffer;
        this.mFile = file;
        this.mCallback = callback;
        this.mWidth = width;
        this.mHeight = height;
        this.mMirror = mirror;
    }

    public static void setCompressFormat(Bitmap.CompressFormat format) {
        mFormat = format;
    }

    public static void setQuality(int quality) {
        if (quality < 0 || quality > 100) {
            Log.e(TAG, "quality must be 0..100");
        } else {
            mQuality = quality;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:42:0x0093 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void run() {
        /*
            r8 = this;
            r1 = -1082130432(0xffffffffbf800000, float:-1.0)
            r7 = 0
            int r0 = r8.mWidth     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            int r2 = r8.mHeight     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            android.graphics.Bitmap$Config r3 = android.graphics.Bitmap.Config.ARGB_8888     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            android.graphics.Bitmap r0 = android.graphics.Bitmap.createBitmap(r0, r2, r3)     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            java.nio.ByteBuffer r2 = r8.mBuffer     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            r0.copyPixelsFromBuffer(r2)     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            android.graphics.Matrix r5 = new android.graphics.Matrix     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            r5.<init>()     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            boolean r2 = r8.mMirror     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            if (r2 == 0) goto L3a
        L1b:
            r2 = -1082130432(0xffffffffbf800000, float:-1.0)
            r5.postScale(r1, r2)     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            r1 = 0
            r2 = 0
            int r3 = r8.mWidth     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            int r4 = r8.mHeight     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            r6 = 1
            android.graphics.Bitmap r0 = android.graphics.Bitmap.createBitmap(r0, r1, r2, r3, r4, r5, r6)     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            com.wmspanel.libstream.SnapshotWriter$SnapshotCallback r1 = r8.mCallback     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            if (r1 == 0) goto L49
            com.wmspanel.libstream.SnapshotWriter$SnapshotCallback r1 = r8.mCallback     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            r1.onSnapshotTaken(r0)     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            if (r7 == 0) goto L39
            r7.close()     // Catch: java.io.IOException -> L3d
        L39:
            return
        L3a:
            r1 = 1065353216(0x3f800000, float:1.0)
            goto L1b
        L3d:
            r0 = move-exception
            java.lang.String r1 = "SnapshotWriter"
            java.lang.String r0 = android.util.Log.getStackTraceString(r0)
            android.util.Log.d(r1, r0)
            goto L39
        L49:
            java.io.File r1 = r8.mFile     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            if (r1 == 0) goto La8
            java.io.BufferedOutputStream r1 = new java.io.BufferedOutputStream     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            java.io.FileOutputStream r2 = new java.io.FileOutputStream     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            java.io.File r3 = r8.mFile     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            r2.<init>(r3)     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            r1.<init>(r2)     // Catch: java.io.FileNotFoundException -> L72 java.lang.Throwable -> L90
            android.graphics.Bitmap$CompressFormat r2 = com.wmspanel.libstream.SnapshotWriter.mFormat     // Catch: java.lang.Throwable -> La3 java.io.FileNotFoundException -> La6
            int r3 = com.wmspanel.libstream.SnapshotWriter.mQuality     // Catch: java.lang.Throwable -> La3 java.io.FileNotFoundException -> La6
            r0.compress(r2, r3, r1)     // Catch: java.lang.Throwable -> La3 java.io.FileNotFoundException -> La6
        L60:
            if (r1 == 0) goto L39
            r1.close()     // Catch: java.io.IOException -> L66
            goto L39
        L66:
            r0 = move-exception
            java.lang.String r1 = "SnapshotWriter"
            java.lang.String r0 = android.util.Log.getStackTraceString(r0)
            android.util.Log.d(r1, r0)
            goto L39
        L72:
            r0 = move-exception
            r1 = r7
        L74:
            java.lang.String r2 = "SnapshotWriter"
            java.lang.String r0 = android.util.Log.getStackTraceString(r0)     // Catch: java.lang.Throwable -> La3
            android.util.Log.d(r2, r0)     // Catch: java.lang.Throwable -> La3
            if (r1 == 0) goto L39
            r1.close()     // Catch: java.io.IOException -> L84
            goto L39
        L84:
            r0 = move-exception
            java.lang.String r1 = "SnapshotWriter"
            java.lang.String r0 = android.util.Log.getStackTraceString(r0)
            android.util.Log.d(r1, r0)
            goto L39
        L90:
            r0 = move-exception
        L91:
            if (r7 == 0) goto L96
            r7.close()     // Catch: java.io.IOException -> L97
        L96:
            throw r0
        L97:
            r1 = move-exception
            java.lang.String r2 = "SnapshotWriter"
            java.lang.String r1 = android.util.Log.getStackTraceString(r1)
            android.util.Log.d(r2, r1)
            goto L96
        La3:
            r0 = move-exception
            r7 = r1
            goto L91
        La6:
            r0 = move-exception
            goto L74
        La8:
            r1 = r7
            goto L60
        */
        throw new UnsupportedOperationException("Method not decompiled: com.wmspanel.libstream.SnapshotWriter.run():void");
    }
}
