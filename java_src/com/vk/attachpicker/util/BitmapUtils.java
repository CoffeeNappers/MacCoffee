package com.vk.attachpicker.util;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.net.Uri;
import com.facebook.common.util.UriUtil;
import com.facebook.imagepipeline.common.RotationOptions;
import com.vk.attachpicker.jni.Native;
import com.vk.core.util.Device;
import com.vk.core.util.Exif;
import com.vkontakte.android.utils.L;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes2.dex */
public class BitmapUtils {
    private static final Paint BITMAP_PAINT = new Paint(2);
    private static final String TAG = "BitmapUtils";

    private BitmapUtils() {
    }

    public static Bitmap centerCropBitmap(Bitmap image, int w, int h) {
        return centerCropBitmap(image, w, h, false);
    }

    public static Bitmap centerCropBitmap(Bitmap image, int w, int h, boolean mirror) {
        float scale;
        float dx;
        float dy;
        if (image == null) {
            return null;
        }
        Bitmap resultBitmap = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
        Canvas resultCanvas = new Canvas(resultBitmap);
        Matrix matrix = new Matrix();
        float scaleX = w / image.getWidth();
        float scaleY = h / image.getHeight();
        if (scaleY > scaleX) {
            scale = scaleY;
            dx = (w - (image.getWidth() * scale)) * 0.5f;
            dy = 0.0f;
        } else {
            scale = scaleX;
            dx = 0.0f;
            dy = (h - (image.getHeight() * scale)) * 0.5f;
        }
        matrix.setScale((mirror ? -1 : 1) * scale, scale);
        matrix.postTranslate((int) (dx + 0.5f), (int) (dy + 0.5f));
        resultCanvas.drawBitmap(image, matrix, BITMAP_PAINT);
        return resultBitmap;
    }

    public static Bitmap processCameraBitmap(byte[] jpegData, boolean mirror) {
        int rotation;
        Bitmap oldBitmap;
        Bitmap bitmap = BitmapFactory.decodeByteArray(jpegData, 0, jpegData.length);
        if (mirror && Device.isLenovoK900()) {
            rotation = RotationOptions.ROTATE_270;
        } else {
            rotation = Exif.getOrientation(jpegData);
        }
        if (bitmap != null && (bitmap = rotateBitmap(bitmap, rotation, mirror)) != bitmap) {
            bitmap.recycle();
        }
        if ((bitmap.getWidth() > 1280 || bitmap.getHeight() > 1280) && (bitmap = scaleBitmap(bitmap, 1280, true)) != (oldBitmap = bitmap)) {
            oldBitmap.recycle();
        }
        return bitmap;
    }

    public static Bitmap decodeBitmapFromContentUri(ContentResolver resolver, Uri uri, int MAX_DIM) throws FileNotFoundException {
        InputStream inputStream;
        byte[] byteArr = new byte[0];
        byte[] buffer = new byte[1024];
        int count = 0;
        try {
            if (uri.getScheme().equalsIgnoreCase(UriUtil.LOCAL_FILE_SCHEME)) {
                inputStream = new FileInputStream(uri.toString().substring(7));
            } else {
                inputStream = resolver.openInputStream(uri);
            }
            while (true) {
                int len = inputStream.read(buffer);
                if (len <= -1) {
                    break;
                } else if (len != 0) {
                    if (count + len > byteArr.length) {
                        byte[] newbuf = new byte[(count + len) * 2];
                        System.arraycopy(byteArr, 0, newbuf, 0, count);
                        byteArr = newbuf;
                    }
                    System.arraycopy(buffer, 0, byteArr, count, len);
                    count += len;
                }
            }
            inputStream.close();
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(byteArr, 0, count, options);
            int origWidth = options.outWidth;
            int origHeight = options.outHeight;
            if (origWidth > MAX_DIM || origHeight > MAX_DIM) {
                int k = 1;
                int tmpHeight = origHeight;
                int tmpWidth = origWidth;
                while (true) {
                    tmpWidth /= 2;
                    tmpHeight /= 2;
                    k *= 2;
                    if (tmpWidth / 2 < MAX_DIM && tmpHeight / 2 < MAX_DIM) {
                        break;
                    }
                }
                options.inSampleSize = k;
            } else {
                options.inSampleSize = 1;
            }
            options.inJustDecodeBounds = false;
            options.inPreferredConfig = Bitmap.Config.ARGB_8888;
            return BitmapFactory.decodeByteArray(byteArr, 0, count, options);
        } catch (Throwable th) {
            return null;
        }
    }

    public static Bitmap decodeBitmapFromContentUri(ContentResolver resolver, Uri uri, BitmapFactory.Options options) throws FileNotFoundException {
        InputStream inputStream;
        if (uri.getScheme().equalsIgnoreCase(UriUtil.LOCAL_FILE_SCHEME)) {
            inputStream = new FileInputStream(uri.toString().substring(7));
        } else {
            inputStream = resolver.openInputStream(uri);
        }
        return BitmapFactory.decodeStream(inputStream, null, options);
    }

    public static Bitmap rotateBitmap(Bitmap original, int angle, boolean mirror) {
        if (original == null) {
            L.d(TAG, "Image cannot be rotated, because it's null");
            return null;
        } else if (angle != 0 || mirror) {
            Matrix matrix = new Matrix();
            matrix.preRotate(angle);
            matrix.postScale(mirror ? -1.0f : 1.0f, 1.0f);
            try {
                Bitmap result = Bitmap.createBitmap(original, 0, 0, original.getWidth(), original.getHeight(), matrix, false);
                return result;
            } catch (Throwable throwable) {
                L.e(throwable, TAG);
                return original;
            }
        } else {
            return original;
        }
    }

    public static Bitmap scaleBitmap(Bitmap original, int desiredRes, boolean fast) {
        Bitmap result;
        if (original == null) {
            L.d(TAG, "Image cannot be resized, because it's null");
            return null;
        }
        float scaleW = desiredRes / original.getWidth();
        float scaleH = desiredRes / original.getHeight();
        float scale = Math.min(scaleW, scaleH);
        try {
            if (fast) {
                result = Bitmap.createScaledBitmap(original, (int) (original.getWidth() * scale), (int) (original.getHeight() * scale), true);
            } else {
                result = Bitmap.createBitmap((int) (original.getWidth() * scale), (int) (original.getHeight() * scale), Bitmap.Config.ARGB_8888);
                Native.resizeBitmap(original, result);
            }
            return result;
        } catch (Throwable throwable) {
            L.e(throwable, TAG);
            return original;
        }
    }

    /* loaded from: classes2.dex */
    public static class BitmapSize {
        public final int height;
        public final int width;

        public BitmapSize(int width, int height) {
            this.width = width;
            this.height = height;
        }
    }

    public static Bitmap getBitmapFromAsset(String strName, Activity activity) throws IOException {
        AssetManager assetManager = activity.getAssets();
        InputStream istr = assetManager.open(strName);
        Bitmap bitmap = BitmapFactory.decodeStream(istr);
        istr.close();
        return bitmap;
    }

    public static float getAspectRatio(Bitmap bitmap) {
        if (bitmap == null || bitmap.isRecycled()) {
            return 1.0f;
        }
        return bitmap.getWidth() / bitmap.getHeight();
    }
}
