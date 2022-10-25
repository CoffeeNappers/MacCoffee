package com.vk.imageloader;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Shader;
import com.facebook.common.references.CloseableReference;
import com.facebook.imagepipeline.bitmaps.PlatformBitmapFactory;
/* loaded from: classes2.dex */
public class ImageLoaderUtils {
    public static final ThreadLocal<Rect> Rect1ThreadLocal;
    public static final ThreadLocal<Rect> Rect2ThreadLocal;
    public static final Paint bitmapPaint = new Paint();

    static {
        bitmapPaint.setAntiAlias(true);
        bitmapPaint.setDither(true);
        bitmapPaint.setFilterBitmap(true);
        Rect1ThreadLocal = new ThreadLocal<Rect>() { // from class: com.vk.imageloader.ImageLoaderUtils.1
            /* JADX INFO: Access modifiers changed from: protected */
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            /* renamed from: initialValue */
            public Rect mo481initialValue() {
                return new Rect();
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            /* renamed from: get */
            public Rect mo480get() {
                Rect r = (Rect) super.get();
                r.set(0, 0, 0, 0);
                return r;
            }
        };
        Rect2ThreadLocal = new ThreadLocal<Rect>() { // from class: com.vk.imageloader.ImageLoaderUtils.2
            /* JADX INFO: Access modifiers changed from: protected */
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            /* renamed from: initialValue */
            public Rect mo483initialValue() {
                return new Rect();
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.lang.ThreadLocal
            /* renamed from: get */
            public Rect mo482get() {
                Rect r = (Rect) super.get();
                r.set(0, 0, 0, 0);
                return r;
            }
        };
    }

    public static Bitmap rotateBitmap(Bitmap original, int angle) {
        if (original == null) {
            return null;
        }
        if (angle != 0) {
            Matrix matrix = new Matrix();
            matrix.preRotate(angle);
            try {
                Bitmap result = Bitmap.createBitmap(original, 0, 0, original.getWidth(), original.getHeight(), matrix, false);
                return result;
            } catch (Throwable th) {
                return original;
            }
        }
        return original;
    }

    public static void fastResizeBitmap(Bitmap src, Bitmap dst) {
        Rect srcRect = Rect1ThreadLocal.get();
        srcRect.set(0, 0, src.getWidth(), src.getHeight());
        Rect dstRect = Rect2ThreadLocal.get();
        dstRect.set(0, 0, dst.getWidth(), dst.getHeight());
        Canvas canvas = new Canvas(dst);
        canvas.drawBitmap(src, srcRect, dstRect, bitmapPaint);
    }

    public static CloseableReference<Bitmap> createFrescoBitmap(PlatformBitmapFactory bitmapFactory, Bitmap source, int x, int y, int width, int height) {
        CloseableReference<Bitmap> bitmapRef = bitmapFactory.createBitmap(width, height);
        try {
            Bitmap destBitmap = bitmapRef.get();
            Rect srcRect = Rect1ThreadLocal.get();
            srcRect.set(x, y, x + width, y + height);
            Rect dstRect = Rect2ThreadLocal.get();
            dstRect.set(0, 0, destBitmap.getWidth(), destBitmap.getHeight());
            Canvas canvas = new Canvas(destBitmap);
            canvas.drawBitmap(source, srcRect, dstRect, bitmapPaint);
            return CloseableReference.cloneOrNull(bitmapRef);
        } finally {
            CloseableReference.closeSafely(bitmapRef);
        }
    }

    public static Bitmap makeCircleBitmap(Bitmap source) {
        if (source == null) {
            return null;
        }
        int size = Math.min(source.getWidth(), source.getHeight());
        if (source.getWidth() == source.getHeight()) {
            Bitmap bitmap = Bitmap.createBitmap(size, size, source.getConfig());
            Canvas canvas = new Canvas(bitmap);
            Paint paint = new Paint();
            BitmapShader shader = new BitmapShader(source, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            paint.setShader(shader);
            paint.setAntiAlias(true);
            float r = size / 2.0f;
            canvas.drawCircle(r, r, r, paint);
            return bitmap;
        }
        int x = (source.getWidth() - size) / 2;
        int y = (source.getHeight() - size) / 2;
        Bitmap squaredBitmap = Bitmap.createBitmap(source, x, y, size, size);
        Bitmap bitmap2 = Bitmap.createBitmap(size, size, source.getConfig());
        Canvas canvas2 = new Canvas(bitmap2);
        Paint paint2 = new Paint();
        BitmapShader shader2 = new BitmapShader(squaredBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        paint2.setShader(shader2);
        paint2.setAntiAlias(true);
        float r2 = size / 2.0f;
        canvas2.drawCircle(r2, r2, r2, paint2);
        squaredBitmap.recycle();
        return bitmap2;
    }
}
