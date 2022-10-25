package com.vk.medianative;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.text.TextUtils;
import android.util.Log;
import java.io.BufferedOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
/* loaded from: classes2.dex */
class AYUVFile {
    static final String LOG_TAG = "[YUV]";
    private String ayuvPath;
    private final Bitmap overlay;

    public AYUVFile(File overlayFile) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        this.overlay = BitmapFactory.decodeFile(overlayFile.getAbsolutePath(), options);
    }

    public AYUVFile(Bitmap overlay) {
        this.overlay = overlay;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getPath() {
        return this.ayuvPath;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean create(String path) {
        try {
            this.ayuvPath = path;
            writeFile(this.overlay);
            return true;
        } catch (IOException e) {
            Log.e(LOG_TAG, e.getMessage());
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void delete() {
        if (!TextUtils.isEmpty(this.ayuvPath)) {
            new File(this.ayuvPath).delete();
        }
    }

    private void writeFile(Bitmap overlayBitmap) throws IOException {
        DataOutputStream out = null;
        try {
            DataOutputStream out2 = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(this.ayuvPath)));
            try {
                ByteBuffer buffer = ByteBuffer.allocate(8);
                buffer.order(ByteOrder.LITTLE_ENDIAN);
                buffer.putInt(overlayBitmap.getWidth());
                buffer.putInt(overlayBitmap.getHeight());
                out2.write(buffer.array());
                int[] pixels = new int[overlayBitmap.getWidth() * overlayBitmap.getHeight()];
                overlayBitmap.getPixels(pixels, 0, overlayBitmap.getWidth(), 0, 0, overlayBitmap.getWidth(), overlayBitmap.getHeight());
                for (int row = 0; row < overlayBitmap.getHeight(); row++) {
                    for (int col = 0; col < overlayBitmap.getWidth(); col++) {
                        int pixel = pixels[(overlayBitmap.getWidth() * row) + col];
                        int a = Color.alpha(pixel);
                        int r = Color.red(pixel);
                        int g = Color.green(pixel);
                        int b = Color.blue(pixel);
                        int y = (((int) ((0.257f * r) + (0.504f * g) + (0.098f * b))) + 16) & 255;
                        int u = (((int) ((((-0.148f) * r) - (0.291f * g)) + (0.439f * b))) + 128) & 255;
                        int v = (((int) (((0.439f * r) - (0.368f * g)) - (0.071f * b))) + 128) & 255;
                        out2.writeByte(a);
                        out2.writeByte(y);
                        out2.writeByte(u);
                        out2.writeByte(v);
                    }
                }
                if (out2 != null) {
                    out2.close();
                }
            } catch (Throwable th) {
                th = th;
                out = out2;
                if (out != null) {
                    out.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }
}
