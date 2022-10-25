package com.vkontakte.android.ui;

import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Environment;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.View;
import com.google.android.exoplayer2.extractor.ts.PsExtractor;
import com.google.android.gms.gcm.Task;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.VKAPIRequest;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
/* loaded from: classes3.dex */
public class GifView extends View {
    private Thread animThread;
    private boolean error;
    private Paint errorBgPaint;
    private Paint errorPaint;
    private Bitmap frameBuffer;
    private int gifH;
    private int gifW;
    private Paint imgPaint;
    private boolean loadCompleted;
    private boolean loaded;
    private int loop;
    private ProgressCallback progressCallback;
    private boolean runAnimation;
    private InputStream stream;
    private Object syncLock;
    private boolean waiting;

    /* loaded from: classes3.dex */
    public interface ProgressCallback {
        void hideProgressBar();

        void setProgress(int i, int i2);
    }

    public GifView(Context context) {
        super(context);
        this.loop = 0;
        this.loaded = false;
        this.runAnimation = true;
        this.waiting = false;
        this.syncLock = new Object();
        this.imgPaint = new Paint();
        this.errorPaint = new Paint();
        this.errorBgPaint = new Paint();
        this.error = false;
        this.loadCompleted = false;
        init();
    }

    public GifView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.loop = 0;
        this.loaded = false;
        this.runAnimation = true;
        this.waiting = false;
        this.syncLock = new Object();
        this.imgPaint = new Paint();
        this.errorPaint = new Paint();
        this.errorBgPaint = new Paint();
        this.error = false;
        this.loadCompleted = false;
        init();
    }

    public GifView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.loop = 0;
        this.loaded = false;
        this.runAnimation = true;
        this.waiting = false;
        this.syncLock = new Object();
        this.imgPaint = new Paint();
        this.errorPaint = new Paint();
        this.errorBgPaint = new Paint();
        this.error = false;
        this.loadCompleted = false;
        init();
    }

    private void init() {
        this.imgPaint.setFilterBitmap(true);
        this.errorPaint.setColor(ViewCompat.MEASURED_STATE_MASK);
        this.errorPaint.setAntiAlias(true);
        this.errorPaint.setTextSize(Global.scale(15.0f));
        this.errorBgPaint.setColor(-2130706433);
    }

    @Override // android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.runAnimation = false;
        if (this.animThread != null) {
            this.animThread.interrupt();
        }
    }

    public void setProgressCallback(ProgressCallback pc) {
        this.progressCallback = pc;
    }

    @Override // android.view.View
    public void onMeasure(int wms, int hms) {
        if (this.gifW == 0 || this.gifH == 0) {
            super.onMeasure(wms, hms);
            setMeasuredDimension(Global.scale(200.0f), Global.scale(200.0f));
            return;
        }
        float vratio = View.MeasureSpec.getSize(wms) / View.MeasureSpec.getSize(hms);
        float iratio = this.gifW / this.gifH;
        if (Float.isInfinite(vratio)) {
            vratio = 0.0f;
        }
        int maxW = Math.min(Global.scale(this.gifW), View.MeasureSpec.getSize(wms));
        int maxH = Math.min(Global.scale(this.gifH), View.MeasureSpec.getSize(hms));
        if (vratio < iratio) {
            setMeasuredDimension(maxW - 1, (int) ((maxW / this.gifW) * this.gifH));
        } else {
            setMeasuredDimension(((int) ((maxH / this.gifH) * this.gifW)) - 1, maxH);
        }
    }

    public void loadURL(final String url) {
        new Thread(new Runnable() { // from class: com.vkontakte.android.ui.GifView.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Log.d("vk", "Loading: " + url);
                    URL u = new URL(url);
                    URLConnection conn = u.openConnection();
                    conn.connect();
                    File dir = new File(Environment.getExternalStorageDirectory(), ".vkontakte");
                    if (!dir.exists()) {
                        dir.mkdir();
                    }
                    File nomedia = new File(dir, ".nomedia");
                    if (!nomedia.exists()) {
                        nomedia.createNewFile();
                    }
                    File file = new File(dir, "tmp.gif");
                    file.createNewFile();
                    if (conn.getContentLength() > 52428800) {
                        throw new IOException("too big");
                    }
                    FileOutputStream out = new FileOutputStream(file);
                    InputStream in = conn.getInputStream();
                    byte[] buf = new byte[Task.EXTRAS_LIMIT_BYTES];
                    long lt = 0;
                    while (true) {
                        int r = in.read(buf);
                        if (r <= 0) {
                            break;
                        }
                        out.write(buf, 0, r);
                        if (!GifView.this.loaded) {
                            GifView.this.load(file.getAbsolutePath());
                        }
                        if (GifView.this.progressCallback != null && System.currentTimeMillis() - lt > 1000) {
                            lt = System.currentTimeMillis();
                            GifView.this.progressCallback.setProgress((int) out.getChannel().position(), conn.getContentLength());
                        }
                    }
                    in.close();
                    out.close();
                    if (GifView.this.progressCallback != null) {
                        GifView.this.progressCallback.hideProgressBar();
                    }
                    GifView.this.loadCompleted = true;
                    if (GifView.this.waiting) {
                        GifView.this.waiting = false;
                        synchronized (GifView.this.syncLock) {
                            GifView.this.syncLock.notify();
                        }
                    }
                } catch (Exception x) {
                    Log.w("vk", x);
                    GifView.this.error = true;
                    GifView.this.postInvalidate();
                    if (GifView.this.progressCallback != null) {
                        GifView.this.progressCallback.hideProgressBar();
                    }
                }
            }
        }).start();
    }

    public void load(String path) {
        try {
            File file = new File(path);
            FileInputStream is = new FileInputStream(file);
            load(is);
        } catch (Exception x) {
            Log.w("vk", x);
        }
    }

    public void load(InputStream _s) {
        this.stream = _s;
        this.loaded = true;
        AnimationRunner ar = new AnimationRunner();
        this.animThread = new Thread(ar);
        this.animThread.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int readShort(InputStream is) throws IOException {
        return is.read() | (is.read() << 8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void writeShort(OutputStream os, int i) throws IOException {
        os.write(i);
        os.write(i >> 8);
    }

    @Override // android.view.View
    public void onDraw(Canvas c) {
        if (this.frameBuffer != null) {
            float vratio = c.getWidth() + (1 / c.getHeight());
            float iratio = this.frameBuffer.getWidth() / this.frameBuffer.getHeight();
            if (vratio < iratio) {
                c.drawBitmap(this.frameBuffer, (Rect) null, new Rect(0, 0, c.getWidth() + 1, (int) ((c.getWidth() / this.frameBuffer.getWidth()) * this.frameBuffer.getHeight())), this.imgPaint);
            } else {
                c.drawBitmap(this.frameBuffer, (Rect) null, new Rect(0, 0, ((int) ((c.getHeight() / this.frameBuffer.getHeight()) * this.frameBuffer.getWidth())) + 1, c.getHeight()), this.imgPaint);
            }
        }
        if (this.error) {
            c.drawRect(0.0f, 0.0f, c.getWidth(), c.getHeight(), this.errorBgPaint);
            String error = getResources().getString(R.string.error);
            float w = this.errorPaint.measureText(error);
            float h = Math.abs(this.errorPaint.ascent()) + this.errorPaint.descent();
            c.drawText(error, (c.getWidth() / 2) - (w / 2.0f), (c.getHeight() / 2) - (h / 2.0f), this.errorPaint);
        }
    }

    /* loaded from: classes3.dex */
    private class Frame {
        boolean clear;
        long delay;
        Bitmap image;
        int x;
        int y;

        private Frame() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class AnimationRunner implements Runnable {
        private AnimationRunner() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                byte[] transpGif = {71, 73, 70, 56, 57, 97, 1, 0, 1, 0, Byte.MIN_VALUE, 0, 0, -1, -1, -1, 0, 0, 0, 33, -7, 4, 1, 0, 0, 0, 0, 44, 0, 0, 0, 0, 1, 0, 1, 0, 0, 2, 2, 68, 1, 0, 59};
                Bitmap transpTest = BitmapFactory.decodeByteArray(transpGif, 0, transpGif.length);
                boolean useAlphaHack = (transpTest.getPixel(0, 0) & ViewCompat.MEASURED_STATE_MASK) != 0;
                if (useAlphaHack) {
                    Log.w("vk", "Enabling gif alpha hack - Google, please fix this ASAP!");
                }
                while (GifView.this.runAnimation) {
                    Paint clearPaint = new Paint();
                    clearPaint.setColor(-1);
                    DataInputStream s = new DataInputStream(new SyncedInputStream(GifView.this.stream));
                    byte[] sig = new byte[6];
                    s.readFully(sig);
                    if (sig[0] == 71 && sig[1] == 73 && sig[2] == 70 && sig[3] == 56) {
                        GifView.this.gifW = GifView.this.readShort(s);
                        GifView.this.gifH = GifView.this.readShort(s);
                        if (!GifView.this.loadCompleted) {
                            GifView.this.waiting = true;
                            synchronized (GifView.this.syncLock) {
                                try {
                                    GifView.this.syncLock.wait();
                                } catch (Exception e) {
                                }
                            }
                        }
                        int lim = ((ActivityManager) GifView.this.getContext().getSystemService("activity")).getMemoryClass() > 32 ? 1500 : VKAPIRequest.ERROR_VIDEO_ALREADY_ADDED;
                        if (GifView.this.gifW > lim || GifView.this.gifH > lim) {
                            throw new IOException("Too big: " + GifView.this.gifW + "x" + GifView.this.gifH);
                        }
                        GifView.this.post(new Runnable() { // from class: com.vkontakte.android.ui.GifView.AnimationRunner.1
                            @Override // java.lang.Runnable
                            public void run() {
                                GifView.this.requestLayout();
                            }
                        });
                        if (GifView.this.frameBuffer == null) {
                            GifView.this.frameBuffer = Bitmap.createBitmap(GifView.this.gifW, GifView.this.gifH, Bitmap.Config.ARGB_8888);
                        }
                        Canvas canvas = new Canvas(GifView.this.frameBuffer);
                        int flags = s.read();
                        int bgColorIndex = s.read();
                        s.read();
                        byte[] globalPal = null;
                        if ((flags & 128) > 0) {
                            int size = 1 << ((flags & 7) + 1);
                            globalPal = new byte[size * 3];
                            s.readFully(globalPal);
                        }
                        int bgColor = globalPal != null ? ((globalPal[bgColorIndex * 3] & 255) << 16) | ((globalPal[(bgColorIndex * 3) + 1] & 255) << 8) | (globalPal[(bgColorIndex * 3) + 2] & 255) | ViewCompat.MEASURED_STATE_MASK : ViewCompat.MEASURED_STATE_MASK;
                        clearPaint.setColor(bgColor);
                        long delay = 100;
                        int transpColor = -1;
                        boolean clearBg = false;
                        long t = System.currentTimeMillis();
                        int n = 0;
                        while (true) {
                            if (!GifView.this.runAnimation) {
                                break;
                            }
                            int c = s.read();
                            if (c == 33) {
                                int xtype = s.read();
                                if (xtype == 249) {
                                    s.read();
                                    int lflags = s.read();
                                    delay = GifView.this.readShort(s) * 10;
                                    if (delay < 30) {
                                        delay = 100;
                                    }
                                    transpColor = s.read();
                                    if ((lflags & 1) == 0) {
                                        transpColor = -1;
                                    }
                                    clearBg = (lflags >> 2) == 2;
                                    s.read();
                                } else if (xtype == 255) {
                                    s.read();
                                    byte[] _appid = new byte[8];
                                    s.read(_appid);
                                    String appid = new String(_appid);
                                    s.skip(3L);
                                    if ("NETSCAPE".equals(appid)) {
                                        s.read();
                                        s.read();
                                        GifView.this.loop = GifView.this.readShort(s);
                                        s.read();
                                    } else {
                                        for (int l = s.read(); l > 0; l = s.read()) {
                                            s.skip(l);
                                        }
                                    }
                                } else {
                                    for (int l2 = s.read(); l2 > 0; l2 = s.read()) {
                                        s.skip(l2);
                                    }
                                }
                            } else if (c == 44) {
                                int left = GifView.this.readShort(s);
                                int top = GifView.this.readShort(s);
                                int width = GifView.this.readShort(s);
                                int height = GifView.this.readShort(s);
                                int lflags2 = s.read();
                                boolean interlaced = (lflags2 & 64) > 0;
                                byte[] localPal = null;
                                if ((lflags2 & 128) > 0) {
                                    int size2 = 1 << ((lflags2 & 7) + 1);
                                    localPal = new byte[size2 * 3];
                                    s.readFully(localPal, 0, localPal.length);
                                }
                                ByteArrayOutputStream buf = new ByteArrayOutputStream();
                                buf.write("GIF89a".getBytes());
                                GifView.this.writeShort(buf, width);
                                GifView.this.writeShort(buf, height);
                                buf.write((localPal != null ? lflags2 & 7 : flags & 7) | PsExtractor.VIDEO_STREAM_MASK);
                                buf.write(bgColorIndex);
                                buf.write(0);
                                buf.write(localPal != null ? localPal : globalPal);
                                buf.write(33);
                                buf.write(249);
                                buf.write(4);
                                buf.write(transpColor >= 0 ? 1 : 0);
                                GifView.this.writeShort(buf, 0);
                                buf.write(transpColor);
                                buf.write(0);
                                buf.write(44);
                                GifView.this.writeShort(buf, 0);
                                GifView.this.writeShort(buf, 0);
                                GifView.this.writeShort(buf, width);
                                GifView.this.writeShort(buf, height);
                                buf.write(interlaced ? 64 : 0);
                                int mc = s.read();
                                buf.write(mc);
                                int l3 = s.read();
                                buf.write(l3);
                                byte[] db = new byte[255];
                                while (l3 > 0) {
                                    s.readFully(db, 0, l3);
                                    buf.write(db, 0, l3);
                                    l3 = s.read();
                                    buf.write(l3);
                                }
                                buf.write(59);
                                BitmapFactory.Options opts = new BitmapFactory.Options();
                                opts.inPreferredConfig = Bitmap.Config.ARGB_8888;
                                Frame frame = new Frame();
                                frame.image = BitmapFactory.decodeByteArray(buf.toByteArray(), 0, buf.size(), opts);
                                frame.x = left;
                                frame.y = top;
                                frame.delay = delay;
                                frame.clear = clearBg;
                                if (useAlphaHack && transpColor >= 0 && !clearBg) {
                                    int[] pixels = new int[frame.image.getWidth() * frame.image.getHeight()];
                                    frame.image.getPixels(pixels, 0, frame.image.getWidth(), 0, 0, frame.image.getWidth(), frame.image.getHeight());
                                    byte[] pal = localPal == null ? globalPal : localPal;
                                    if (transpColor < pal.length / 3) {
                                        int transpRGB = ((pal[transpColor * 3] & 255) << 16) | ((pal[(transpColor * 3) + 1] & 255) << 8) | (pal[(transpColor * 3) + 2] & 255) | ViewCompat.MEASURED_STATE_MASK;
                                        for (int i = 0; i < pixels.length; i++) {
                                            if (pixels[i] == transpRGB) {
                                                pixels[i] = 0;
                                            }
                                        }
                                        frame.image = Bitmap.createBitmap(pixels, frame.image.getWidth(), frame.image.getHeight(), Bitmap.Config.ARGB_8888);
                                    }
                                }
                                if (delay > 0) {
                                    try {
                                        Thread.sleep(Math.max(0L, delay - (System.currentTimeMillis() - t)));
                                    } catch (Exception e2) {
                                    }
                                }
                                t = System.currentTimeMillis();
                                if (frame.clear) {
                                    canvas.drawRect(new Rect(0, 0, canvas.getWidth(), canvas.getHeight()), clearPaint);
                                }
                                try {
                                    canvas.drawBitmap(frame.image, frame.x, frame.y, (Paint) null);
                                } catch (Exception e3) {
                                }
                                GifView.this.postInvalidate();
                                long j = frame.delay;
                                n++;
                            } else if (c == 59) {
                                ((FileInputStream) GifView.this.stream).getChannel().position(0L);
                                break;
                            }
                        }
                    } else {
                        s.close();
                        throw new IOException("Incorrect GIF signature " + new String(sig));
                    }
                }
            } catch (Throwable x) {
                Log.w("vk", x);
                GifView.this.error = true;
                GifView.this.postInvalidate();
                if (GifView.this.progressCallback != null) {
                    GifView.this.progressCallback.hideProgressBar();
                }
            }
            try {
                GifView.this.stream.close();
            } catch (Exception e4) {
            }
        }
    }

    /* loaded from: classes3.dex */
    private class SyncedInputStream extends FilterInputStream {
        protected SyncedInputStream(InputStream in) {
            super(in);
        }

        private void waitForData() {
            GifView.this.waiting = true;
            synchronized (GifView.this.syncLock) {
                try {
                    GifView.this.syncLock.wait();
                } catch (Exception e) {
                }
            }
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
        public int read() throws IOException {
            if (this.in.available() < 1) {
                waitForData();
            }
            return this.in.read();
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
        public int read(byte[] b) throws IOException {
            if (this.in.available() < b.length) {
                waitForData();
            }
            return this.in.read(b);
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
        public int read(byte[] b, int offset, int len) throws IOException {
            if (this.in.available() < len) {
                waitForData();
            }
            return this.in.read(b, offset, len);
        }
    }
}
