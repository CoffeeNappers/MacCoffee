package com.vk.emoji;

import android.content.Context;
import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.DisplayMetrics;
import java.io.IOException;
import java.io.InputStream;
/* loaded from: classes2.dex */
final class Utils {
    Utils() {
    }

    public static float convertDpToPixel(float dp, Context context) {
        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        float px = dp * (metrics.densityDpi / 160.0f);
        return px;
    }

    public static String unicode(String emoji) {
        int length = emoji.length();
        StringBuilder sb = new StringBuilder();
        int offset = 0;
        while (offset < length) {
            int codepoint = emoji.codePointAt(offset);
            sb.append(Integer.toHexString(codepoint)).append("-");
            offset += Character.charCount(codepoint);
        }
        sb.replace(sb.length() - 1, sb.length(), "");
        return sb.toString();
    }

    public static Bitmap getBitmapFromAsset(AssetManager mgr, String path) {
        Bitmap bitmap;
        InputStream is = null;
        try {
            is = mgr.open(path);
            bitmap = BitmapFactory.decodeStream(is);
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                }
            }
        } catch (IOException e2) {
            bitmap = null;
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e3) {
                }
            }
        } catch (Throwable th) {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
        return bitmap;
    }
}
