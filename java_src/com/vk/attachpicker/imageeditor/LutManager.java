package com.vk.attachpicker.imageeditor;

import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.support.v4.util.LruCache;
import com.vk.attachpicker.Picker;
import com.vk.attachpicker.imageeditor.json.ApiColorPreference;
import com.vk.attachpicker.imageeditor.json.ApiFilter;
import com.vk.attachpicker.imageeditor.json.ApiFilterWrapper;
import com.vk.attachpicker.jni.Native;
import com.vkontakte.android.R;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes2.dex */
public class LutManager {
    private static final int LOOKUP_BYTE_SIZE = 1048576;
    private static final BitmapLruCache bitmapLruCache;
    private static final ExecutorService colorCorrectionExecutor = Executors.newSingleThreadExecutor();
    private static Bitmap labLookupBitmap;
    private static Bitmap lookupBitmap;

    static {
        int memoryCacheSize = (int) (getHeapSizeInBytes(Picker.getContext()) * 0.3f);
        bitmapLruCache = new BitmapLruCache(memoryCacheSize);
    }

    public static int getHeapSizeInBytes(Context context) {
        ActivityManager am = (ActivityManager) context.getSystemService("activity");
        boolean largeHeap = (context.getApplicationInfo().flags & 1048576) != 0;
        int memoryClass = am.getMemoryClass();
        if (largeHeap) {
            memoryClass = am.getLargeMemoryClass();
        }
        return memoryClass * 1024 * 1024;
    }

    private static synchronized Bitmap getOriginalLookupBitmap() {
        Bitmap bitmap;
        synchronized (LutManager.class) {
            if (lookupBitmap == null || lookupBitmap.isRecycled()) {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inScaled = false;
                lookupBitmap = BitmapFactory.decodeResource(Picker.getContext().getResources(), R.drawable.lookup, options);
            }
            bitmap = lookupBitmap;
        }
        return bitmap;
    }

    private static synchronized Bitmap getLookupBitmap() {
        Bitmap copy;
        synchronized (LutManager.class) {
            copy = getOriginalLookupBitmap().copy(Bitmap.Config.ARGB_8888, true);
        }
        return copy;
    }

    public static synchronized Bitmap getLabLookupBitmap() {
        Bitmap bitmap;
        synchronized (LutManager.class) {
            if (labLookupBitmap == null || labLookupBitmap.isRecycled()) {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inScaled = false;
                labLookupBitmap = BitmapFactory.decodeResource(Picker.getContext().getResources(), R.drawable.lookup_lab, options);
            }
            bitmap = labLookupBitmap;
        }
        return bitmap;
    }

    public static synchronized Bitmap getLookupBitmap(List<ApiColorPreference> colors) {
        Bitmap mutableLut;
        synchronized (LutManager.class) {
            mutableLut = getLookupBitmap();
            Native.colorCorrectionBitmap(mutableLut, getLabLookupBitmap(), colors);
        }
        return mutableLut;
    }

    public static synchronized Bitmap getLookupBitmap(ApiFilterWrapper wrapper) {
        Bitmap cachedLut;
        synchronized (LutManager.class) {
            String id = wrapper.id;
            if (ApiFilterWrapper.FILTER_ORIGINAL.equals(id)) {
                cachedLut = getOriginalLookupBitmap();
            } else {
                cachedLut = bitmapLruCache.getBitmap(id);
                if (cachedLut == null || cachedLut.isRecycled()) {
                    Bitmap mutableLut = getLookupBitmap();
                    Native.applyCurveAndSaturationBitmap(mutableLut, createCurve(wrapper.filter), wrapper.filter.saturation);
                    Native.colorCorrectionBitmap(mutableLut, getLabLookupBitmap(), wrapper.filter.colors);
                    bitmapLruCache.putBitmap(id, mutableLut);
                    cachedLut = mutableLut;
                }
            }
        }
        return cachedLut;
    }

    public static synchronized void populateBitmap(ApiFilterWrapper wrapper) {
        synchronized (LutManager.class) {
            colorCorrectionExecutor.submit(LutManager$$Lambda$1.lambdaFactory$(wrapper));
        }
    }

    public static /* synthetic */ void lambda$populateBitmap$0(ApiFilterWrapper wrapper) {
        String id = wrapper.id;
        Bitmap cachedLut = bitmapLruCache.getBitmap(id);
        if (cachedLut == null || cachedLut.isRecycled()) {
            Bitmap mutableLut = getLookupBitmap();
            Native.applyCurveAndSaturationBitmap(mutableLut, createCurve(wrapper.filter), wrapper.filter.saturation);
            Native.colorCorrectionBitmap(mutableLut, getLabLookupBitmap(), wrapper.filter.colors);
            bitmapLruCache.putBitmap(id, mutableLut);
        }
    }

    public static synchronized Bitmap getBigLookupBitmap(ApiFilterWrapper wrapper) {
        Bitmap mutableLut;
        synchronized (LutManager.class) {
            mutableLut = BitmapFactory.decodeResource(Picker.getContext().getResources(), R.drawable.lookup_512, null);
            Bitmap labLut = BitmapFactory.decodeResource(Picker.getContext().getResources(), R.drawable.lookup_lab_512, null);
            Native.applyCurveAndSaturationBitmap(mutableLut, createCurve(wrapper.filter), wrapper.filter.saturation);
            Native.colorCorrectionBitmap(mutableLut, labLut, wrapper.filter.colors);
            labLut.recycle();
        }
        return mutableLut;
    }

    private static int[] createCurve(ApiFilter filter) {
        int[] redRaw = new int[10];
        int[] greenRaw = new int[10];
        int[] blueRaw = new int[10];
        int[] rgbRaw = new int[10];
        syncRawArray(redRaw, filter.redCurve);
        syncRawArray(greenRaw, filter.greenCurve);
        syncRawArray(blueRaw, filter.blueCurve);
        syncRawArray(rgbRaw, filter.rgbCurve);
        int[] finalCurve = new int[256];
        Native.createCurve(redRaw, greenRaw, blueRaw, rgbRaw, finalCurve, filter.brightness, filter.contrast, filter.fade, filter.temperature, filter.tint);
        return finalCurve;
    }

    private static void syncRawArray(int[] raw, int[] array) {
        raw[0] = 0;
        raw[1] = array[0];
        raw[2] = 64;
        raw[3] = array[1];
        raw[4] = 128;
        raw[5] = array[2];
        raw[6] = 192;
        raw[7] = array[3];
        raw[8] = 255;
        raw[9] = array[4];
    }

    public static void clearCache() {
        bitmapLruCache.evictAll();
    }

    /* loaded from: classes2.dex */
    public static class BitmapLruCache extends LruCache<String, Bitmap> {
        public BitmapLruCache(int maxSize) {
            super(maxSize);
        }

        @Override // android.support.v4.util.LruCache
        public int sizeOf(String key, Bitmap value) {
            return 1048576;
        }

        public Bitmap getBitmap(String url) {
            return get(url);
        }

        public void putBitmap(String url, Bitmap bitmap) {
            put(url, bitmap);
        }
    }
}
