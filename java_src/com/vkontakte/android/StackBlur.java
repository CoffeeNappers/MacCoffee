package com.vkontakte.android;

import android.graphics.Bitmap;
import android.support.v4.view.InputDeviceCompat;
import android.support.v4.view.ViewCompat;
import com.facebook.imageutils.TiffUtil;
import com.facebook.internal.FacebookRequestErrorClassification;
import com.my.target.ads.instream.InstreamAd;
import com.vk.media.camera.CameraUtils;
import com.vkontakte.android.ui.SearchViewWrapper;
/* loaded from: classes2.dex */
public class StackBlur {
    private static final int[] mul_table = {512, 512, 456, 512, 328, 456, 335, 512, 405, 328, 271, 456, 388, 335, 292, 512, 454, 405, 364, 328, 298, 271, 496, 456, 420, 388, InstreamAd.DEFAULT_VIDEO_QUALITY, 335, 312, 292, 273, 512, 482, 454, 428, 405, 383, 364, 345, 328, 312, 298, 284, 271, 259, 496, 475, 456, 437, 420, 404, 388, 374, InstreamAd.DEFAULT_VIDEO_QUALITY, 347, 335, 323, 312, 302, 292, 282, 273, 265, 512, 497, 482, 468, 454, 441, 428, 417, 405, 394, 383, 373, 364, 354, 345, 337, 328, 320, 312, 305, 298, 291, 284, 278, 271, 265, 259, 507, 496, 485, 475, 465, 456, 446, 437, 428, 420, 412, 404, 396, 388, 381, 374, 367, InstreamAd.DEFAULT_VIDEO_QUALITY, 354, 347, FacebookRequestErrorClassification.EC_TOO_MANY_USER_ACTION_CALLS, 335, 329, 323, 318, 312, 307, 302, 297, 292, 287, 282, 278, 273, 269, 265, 261, 512, GCMBroadcastReceiver.ID_GAME_INSTALL_NOTIFICATION, 497, 489, 482, 475, 468, 461, 454, 447, 441, 435, 428, 422, 417, 411, 405, 399, 394, 389, 383, 378, 373, 368, 364, 359, 354, 350, 345, FacebookRequestErrorClassification.EC_TOO_MANY_USER_ACTION_CALLS, 337, 332, 328, 324, 320, 316, 312, 309, 305, 301, 298, 294, 291, 287, 284, 281, 278, TiffUtil.TIFF_TAG_ORIENTATION, 271, 268, 265, 262, 259, InputDeviceCompat.SOURCE_KEYBOARD, 507, GCMBroadcastReceiver.ID_FRIEND_NOTIFICATION, 496, 491, 485, CameraUtils.Settings.LOW_HEIGHT, 475, 470, 465, 460, 456, 451, 446, 442, 437, 433, 428, 424, 420, 416, 412, 408, 404, SearchViewWrapper.CONFIRM_TIMEOUT, 396, 392, 388, 385, 381, 377, 374, 370, 367, 363, InstreamAd.DEFAULT_VIDEO_QUALITY, 357, 354, 350, 347, 344, FacebookRequestErrorClassification.EC_TOO_MANY_USER_ACTION_CALLS, 338, 335, 332, 329, 326, 323, 320, 318, 315, 312, 310, 307, 304, 302, 299, 297, 294, 292, 289, 287, 285, 282, 280, 278, 275, 273, 271, 269, 267, 265, 263, 261, 259};
    private static final int[] shg_table = {9, 11, 12, 13, 13, 14, 14, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24};

    public static void blurBitmap(Bitmap bitmap, int radius) {
        BlurStack stack;
        if (radius >= 1) {
            int radius2 = radius | 0;
            long time = System.currentTimeMillis();
            int[] pixels = new int[bitmap.getWidth() * bitmap.getHeight()];
            bitmap.getPixels(pixels, 0, bitmap.getWidth(), 0, 0, bitmap.getWidth(), bitmap.getHeight());
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            int div = radius2 + radius2 + 1;
            int i = width << 2;
            int widthMinus1 = width - 1;
            int heightMinus1 = height - 1;
            int radiusPlus1 = radius2 + 1;
            int sumFactor = ((radiusPlus1 + 1) * radiusPlus1) / 2;
            BlurStack stackStart = new BlurStack();
            BlurStack stack2 = stackStart;
            BlurStack stackEnd = null;
            int i2 = 1;
            while (true) {
                stack = stack2;
                if (i2 >= div) {
                    break;
                }
                stack2 = new BlurStack();
                stack.next = stack2;
                if (i2 == radiusPlus1) {
                    stackEnd = stack2;
                }
                i2++;
            }
            stack.next = stackStart;
            int yi = 0;
            int yw = 0;
            int mul_sum = mul_table[radius2];
            int shg_sum = shg_table[radius2];
            for (int y = 0; y < height; y++) {
                int b_in_sum = 0;
                int g_in_sum = 0;
                int r_in_sum = 0;
                int pr = pixels[yi] & 255;
                int r_out_sum = radiusPlus1 * pr;
                int pg = (pixels[yi] >> 8) & 255;
                int g_out_sum = radiusPlus1 * pg;
                int pb = (pixels[yi] >> 16) & 255;
                int b_out_sum = radiusPlus1 * pb;
                int r_sum = 0 + (sumFactor * pr);
                int g_sum = 0 + (sumFactor * pg);
                int b_sum = 0 + (sumFactor * pb);
                BlurStack stack3 = stackStart;
                for (int i3 = 0; i3 < radiusPlus1; i3++) {
                    stack3.r = pr;
                    stack3.g = pg;
                    stack3.b = pb;
                    stack3 = stack3.next;
                }
                int i4 = 1;
                while (i4 < radiusPlus1) {
                    int p = yi + (widthMinus1 < i4 ? widthMinus1 : i4);
                    int pr2 = pixels[p] & 255;
                    stack3.r = pr2;
                    int rbs = radiusPlus1 - i4;
                    r_sum += pr2 * rbs;
                    int pg2 = (pixels[p] >> 8) & 255;
                    stack3.g = pg2;
                    g_sum += pg2 * rbs;
                    int pb2 = (pixels[p] >> 16) & 255;
                    stack3.b = pb2;
                    b_sum += pb2 * rbs;
                    r_in_sum += pr2;
                    g_in_sum += pg2;
                    b_in_sum += pb2;
                    stack3 = stack3.next;
                    i4++;
                }
                BlurStack stackIn = stackStart;
                BlurStack stackOut = stackEnd;
                for (int x = 0; x < width; x++) {
                    pixels[yi] = ((r_sum * mul_sum) >> shg_sum) | (((g_sum * mul_sum) >> shg_sum) << 8) | (((b_sum * mul_sum) >> shg_sum) << 16) | ViewCompat.MEASURED_STATE_MASK;
                    int r_sum2 = r_sum - r_out_sum;
                    int g_sum2 = g_sum - g_out_sum;
                    int b_sum2 = b_sum - b_out_sum;
                    int r_out_sum2 = r_out_sum - stackIn.r;
                    int g_out_sum2 = g_out_sum - stackIn.g;
                    int b_out_sum2 = b_out_sum - stackIn.b;
                    int p2 = x + radius2 + 1;
                    if (p2 >= widthMinus1) {
                        p2 = widthMinus1;
                    }
                    int p3 = p2 + yw;
                    int i5 = pixels[p3] & 255;
                    stackIn.r = i5;
                    int r_in_sum2 = r_in_sum + i5;
                    int i6 = (pixels[p3] >> 8) & 255;
                    stackIn.g = i6;
                    int g_in_sum2 = g_in_sum + i6;
                    int i7 = (pixels[p3] >> 16) & 255;
                    stackIn.b = i7;
                    int b_in_sum2 = b_in_sum + i7;
                    r_sum = r_sum2 + r_in_sum2;
                    g_sum = g_sum2 + g_in_sum2;
                    b_sum = b_sum2 + b_in_sum2;
                    stackIn = stackIn.next;
                    int pr3 = stackOut.r;
                    r_out_sum = r_out_sum2 + pr3;
                    int pg3 = stackOut.g;
                    g_out_sum = g_out_sum2 + pg3;
                    int pb3 = stackOut.b;
                    b_out_sum = b_out_sum2 + pb3;
                    r_in_sum = r_in_sum2 - pr3;
                    g_in_sum = g_in_sum2 - pg3;
                    b_in_sum = b_in_sum2 - pb3;
                    stackOut = stackOut.next;
                    yi++;
                }
                yw += width;
            }
            for (int x2 = 0; x2 < width; x2++) {
                int r_in_sum3 = 0;
                int b_in_sum3 = 0;
                int g_in_sum3 = 0;
                int yi2 = x2;
                int pr4 = pixels[yi2] & 255;
                int r_out_sum3 = radiusPlus1 * pr4;
                int pg4 = (pixels[yi2] >> 8) & 255;
                int g_out_sum3 = radiusPlus1 * pg4;
                int pb4 = (pixels[yi2] >> 16) & 255;
                int b_out_sum3 = radiusPlus1 * pb4;
                int r_sum3 = 0 + (sumFactor * pr4);
                int g_sum3 = 0 + (sumFactor * pg4);
                int b_sum3 = 0 + (sumFactor * pb4);
                BlurStack stack4 = stackStart;
                for (int i8 = 0; i8 < radiusPlus1; i8++) {
                    stack4.r = pr4;
                    stack4.g = pg4;
                    stack4.b = pb4;
                    stack4 = stack4.next;
                }
                int yp = width;
                for (int i9 = 1; i9 <= radius2; i9++) {
                    int yi3 = yp + x2;
                    int pr5 = pixels[yi3] & 255;
                    stack4.r = pr5;
                    int rbs2 = radiusPlus1 - i9;
                    r_sum3 += pr5 * rbs2;
                    int pg5 = (pixels[yi3] >> 8) & 255;
                    stack4.g = pg5;
                    g_sum3 += pg5 * rbs2;
                    int pb5 = (pixels[yi3] >> 16) & 255;
                    stack4.b = pb5;
                    b_sum3 += pb5 * rbs2;
                    r_in_sum3 += pr5;
                    g_in_sum3 += pg5;
                    b_in_sum3 += pb5;
                    stack4 = stack4.next;
                    if (i9 < heightMinus1) {
                        yp += width;
                    }
                }
                int yi4 = x2;
                BlurStack stackIn2 = stackStart;
                BlurStack stackOut2 = stackEnd;
                for (int y2 = 0; y2 < height; y2++) {
                    pixels[yi4] = ((r_sum3 * mul_sum) >> shg_sum) | (((g_sum3 * mul_sum) >> shg_sum) << 8) | (((b_sum3 * mul_sum) >> shg_sum) << 16) | ViewCompat.MEASURED_STATE_MASK;
                    int r_sum4 = r_sum3 - r_out_sum3;
                    int g_sum4 = g_sum3 - g_out_sum3;
                    int b_sum4 = b_sum3 - b_out_sum3;
                    int r_out_sum4 = r_out_sum3 - stackIn2.r;
                    int g_out_sum4 = g_out_sum3 - stackIn2.g;
                    int b_out_sum4 = b_out_sum3 - stackIn2.b;
                    int p4 = y2 + radiusPlus1;
                    if (p4 >= heightMinus1) {
                        p4 = heightMinus1;
                    }
                    int p5 = x2 + (p4 * width);
                    int i10 = pixels[p5] & 255;
                    stackIn2.r = i10;
                    int r_in_sum4 = r_in_sum3 + i10;
                    r_sum3 = r_sum4 + r_in_sum4;
                    int i11 = (pixels[p5] >> 8) & 255;
                    stackIn2.g = i11;
                    int g_in_sum4 = g_in_sum3 + i11;
                    g_sum3 = g_sum4 + g_in_sum4;
                    int i12 = (pixels[p5] >> 16) & 255;
                    stackIn2.b = i12;
                    int b_in_sum4 = b_in_sum3 + i12;
                    b_sum3 = b_sum4 + b_in_sum4;
                    stackIn2 = stackIn2.next;
                    int pr6 = stackOut2.r;
                    r_out_sum3 = r_out_sum4 + pr6;
                    int pg6 = stackOut2.g;
                    g_out_sum3 = g_out_sum4 + pg6;
                    int pb6 = stackOut2.b;
                    b_out_sum3 = b_out_sum4 + pb6;
                    r_in_sum3 = r_in_sum4 - pr6;
                    g_in_sum3 = g_in_sum4 - pg6;
                    b_in_sum3 = b_in_sum4 - pb6;
                    stackOut2 = stackOut2.next;
                    yi4 += width;
                }
            }
            bitmap.setPixels(pixels, 0, width, 0, 0, width, height);
            Log.i("vk", "StackBlur time " + (System.currentTimeMillis() - time));
        }
    }

    /* loaded from: classes2.dex */
    private static class BlurStack {
        int b;
        int g;
        BlurStack next;
        int r;

        private BlurStack() {
        }
    }
}
