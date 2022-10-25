package com.vk.imageloader;

import android.app.ActivityManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.support.v4.util.LruCache;
import android.util.Log;
import bolts.Task;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.disk.DiskCacheConfig;
import com.facebook.common.executors.CallerThreadExecutor;
import com.facebook.common.internal.Supplier;
import com.facebook.common.references.CloseableReference;
import com.facebook.common.soloader.SoLoaderShim;
import com.facebook.datasource.DataSource;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.facebook.imagepipeline.cache.BufferedDiskCache;
import com.facebook.imagepipeline.cache.MemoryCacheParams;
import com.facebook.imagepipeline.common.ResizeOptions;
import com.facebook.imagepipeline.common.RotationOptions;
import com.facebook.imagepipeline.core.ImagePipeline;
import com.facebook.imagepipeline.core.ImagePipelineConfig;
import com.facebook.imagepipeline.datasource.BaseBitmapDataSubscriber;
import com.facebook.imagepipeline.image.CloseableImage;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.nativecode.ImagePipelineNativeLoader;
import com.facebook.imagepipeline.request.ImageRequest;
import com.facebook.imagepipeline.request.ImageRequestBuilder;
import com.facebook.imagepipeline.request.Postprocessor;
import com.vk.core.util.LibraryLoader;
import com.vk.core.util.RxUtil;
import com.vk.imageloader.view.VKImageView;
import io.reactivex.Observable;
import io.reactivex.functions.Function;
import java.lang.reflect.Field;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes.dex */
public class VKImageLoader {
    public static final int AUTO_ROTATION_FLAG = 94848;
    private static final float CACHE_SIZE = 0.3f;
    private static final String IMAGE_PIPELINE_CACHE_DIR = "fresco_cache";
    private static final String IMAGE_PIPELINE_STICKER_CACHE_DIR = "fresco_sticker_cache";
    private static final int MAX_DISK_CACHE_SIZE = 104857600;
    private static final int MAX_STICKER_DISK_CACHE_SIZE = 262144000;
    private static final String[] PERSISTENT_CACHE_URLS = {"https://vk.com/images/stickers", "http://vk.com/images/stickers", "https://vk.com/images/store/stickers", "http://vk.com/images/store/stickers"};
    private static Field diskCacheField;
    private static LruCache<String, Bitmap> heapBitmapCache;

    public static void init(final Context context) {
        try {
            LibraryLoader.loadLibraries(context, false, new String[]{ImagePipelineNativeLoader.DSO_NAME});
        } catch (UnsatisfiedLinkError e) {
        }
        SoLoaderShim.setHandler(new SoLoaderShim.Handler() { // from class: com.vk.imageloader.VKImageLoader.1
            @Override // com.facebook.common.soloader.SoLoaderShim.Handler
            public void loadLibrary(String libraryName) {
                LibraryLoader.loadLibraries(context, false, new String[]{libraryName});
            }
        });
        ImagePipelineConfig.Builder configBuilder = ImagePipelineConfig.newBuilder(context);
        configBuilder.setDownsampleEnabled(true);
        configBuilder.setNetworkFetcher(new OkHttpNetworkFetcher());
        configBuilder.setCacheKeyFactory(VKCacheKeyFactory.getInstance());
        configureCaches(configBuilder, context);
        Fresco.initialize(context, configBuilder.build());
        heapBitmapCache = new LruCache<String, Bitmap>(27000000) { // from class: com.vk.imageloader.VKImageLoader.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.support.v4.util.LruCache
            public int sizeOf(String key, Bitmap bitmap) {
                return bitmap.getByteCount();
            }
        };
    }

    public static EncodedImage getDiskCacheEntry(Uri uri) {
        return getDiskCacheEntry(uri, ImageRequest.CacheChoice.DEFAULT);
    }

    public static EncodedImage getDiskCacheEntry(Uri uri, ImageRequest.CacheChoice cacheChoice) {
        ImageRequest imageRequest = ImageRequestBuilder.newBuilderWithSource(uri).setCacheChoice(cacheChoice).build();
        CacheKey cacheKey = Fresco.getImagePipeline().getCacheKeyFactory().getEncodedCacheKey(imageRequest, null);
        try {
            Task<EncodedImage> cacheEntry = diskCache().get(cacheKey, new AtomicBoolean(false));
            cacheEntry.waitForCompletion();
            return cacheEntry.getResult();
        } catch (Exception e) {
            return null;
        }
    }

    public static void clearMemoryCache() {
        Fresco.getImagePipeline().clearMemoryCaches();
        heapBitmapCache.evictAll();
    }

    public static void clearAllCaches() {
        clearMemoryCache();
        Fresco.getImagePipeline().clearCaches();
    }

    public static boolean isInCache(String url) {
        if (url == null) {
            return false;
        }
        Uri uri = Uri.parse(url);
        return (heapBitmapCache.get(url) != null && Fresco.getImagePipeline().isInBitmapMemoryCache(uri)) || Fresco.getImagePipeline().isInDiskCacheSync(uri);
    }

    public static boolean isInMemoryCache(String url) {
        if (url == null) {
            return false;
        }
        Uri uri = Uri.parse(url);
        return heapBitmapCache.get(url) != null && Fresco.getImagePipeline().isInBitmapMemoryCache(uri);
    }

    public static Bitmap getBitmapFromMemoryCache(String url) {
        if (url == null) {
            return null;
        }
        Bitmap heapBitmap = heapBitmapCache.get(url);
        if (heapBitmap == null) {
            Uri uri = Uri.parse(url);
            if (!Fresco.getImagePipeline().isInBitmapMemoryCache(uri)) {
                return null;
            }
            return (Bitmap) RxUtil.blockingGetWithNull(getBitmap(uri));
        }
        return heapBitmap;
    }

    public static boolean shouldUsePersistentCache(String url) {
        if (url == null) {
            return false;
        }
        for (int i = 0; i < PERSISTENT_CACHE_URLS.length; i++) {
            if (url.startsWith(PERSISTENT_CACHE_URLS[i])) {
                return true;
            }
        }
        return false;
    }

    public static void prefetchToMemory(Uri uri) {
        prefetchToMemory(uri, null);
    }

    public static void prefetchToMemory(Uri uri, ImageSize size) {
        ImageRequestBuilder builder = ImageRequestBuilder.newBuilderWithSource(uri);
        builder.setRotationOptions(VKImageView.ROTATE_OPTIONS);
        if (size != null) {
            builder.setResizeOptions(new ResizeOptions(size.getPixelsSize(), size.getPixelsSize()));
        }
        Fresco.getImagePipeline().prefetchToBitmapCache(builder.build(), null);
    }

    public static void prefetchToDisk(Uri uri) {
        Fresco.getImagePipeline().prefetchToDiskCache(ImageRequest.fromUri(uri), null);
    }

    public static Observable<Bitmap> getCircleBitmap(String url) {
        if (url == null) {
            return Observable.error(new IllegalAccessException("url can't be null"));
        }
        return getBitmap(Uri.parse(url)).map(new Function<Bitmap, Bitmap>() { // from class: com.vk.imageloader.VKImageLoader.3
            @Override // io.reactivex.functions.Function
            /* renamed from: apply  reason: avoid collision after fix types in other method */
            public Bitmap mo1190apply(Bitmap bitmap) throws Exception {
                return ImageLoaderUtils.makeCircleBitmap(bitmap);
            }
        });
    }

    public static Observable<Bitmap> getBitmap(Uri uri) {
        return getBitmap(uri, 0, 0, 0, null, null, null);
    }

    public static Observable<Bitmap> getBitmap(Uri uri, Postprocessor postprocessor) {
        return getBitmap(uri, 0, 0, 0, null, null, postprocessor);
    }

    public static Observable<Bitmap> getVeryBigBitmap(Uri uri) {
        return getBitmap(uri, ImageSize.VERY_BIG.getPixelsSize(), ImageSize.VERY_BIG.getPixelsSize(), AUTO_ROTATION_FLAG, null, null, null);
    }

    public static Observable<Bitmap> getVeryBigBitmap(Uri uri, VKImageRequestWrapper wrapper, VKImageRequestProgress requestProgress) {
        return getBitmap(uri, ImageSize.VERY_BIG.getPixelsSize(), ImageSize.VERY_BIG.getPixelsSize(), AUTO_ROTATION_FLAG, wrapper, requestProgress, null);
    }

    public static Observable<Bitmap> getBitmap(final Uri uri, final int width, final int height, final int rotation, final VKImageRequestWrapper wrapper, final VKImageRequestProgress requestProgress, final Postprocessor postprocessor) {
        return Observable.fromCallable(new Callable<Bitmap>() { // from class: com.vk.imageloader.VKImageLoader.4
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.concurrent.Callable
            /* renamed from: call */
            public Bitmap mo485call() throws Exception {
                return VKImageLoader.getBitmapInternal(uri, width, height, rotation, wrapper, requestProgress, postprocessor);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public static Bitmap getBitmapInternal(Uri uri, int width, int height, int rotation, VKImageRequestWrapper wrapper, final VKImageRequestProgress requestProgress, Postprocessor postprocessor) {
        DataSource<CloseableReference<CloseableImage>> dataSource;
        if (uri == null) {
            return null;
        }
        Bitmap heapCachedBitmap = heapBitmapCache.get(uri.toString());
        if (heapCachedBitmap == null) {
            if (uri != null && AvatarDataSource.CHAT_AVATAR_SCHEME.equals(uri.getScheme())) {
                dataSource = AvatarDataSource.get(uri);
            } else {
                ImageRequestBuilder imageRequest = ImageRequestBuilder.newBuilderWithSource(uri);
                if (rotation == 94848) {
                    imageRequest.setRotationOptions(RotationOptions.autoRotate());
                } else {
                    imageRequest.setRotationOptions(RotationOptions.forceRotation(rotation));
                }
                if (width > 0 && height > 0) {
                    imageRequest.setResizeOptions(new ResizeOptions(width, height));
                }
                if (postprocessor != null) {
                    imageRequest.setPostprocessor(postprocessor);
                }
                dataSource = Fresco.getImagePipeline().fetchDecodedImage(imageRequest.build(), null);
            }
            final AtomicReference<Bitmap> res = new AtomicReference<>();
            final Object lock = new Object();
            final AtomicBoolean needLock = new AtomicBoolean(true);
            if (wrapper != null) {
                wrapper.wrap(dataSource);
            }
            dataSource.subscribe(new BaseBitmapDataSubscriber() { // from class: com.vk.imageloader.VKImageLoader.5
                @Override // com.facebook.imagepipeline.datasource.BaseBitmapDataSubscriber
                public void onNewResultImpl(@Nullable Bitmap bitmap) {
                    try {
                        res.set(bitmap.copy(Bitmap.Config.ARGB_8888, true));
                    } catch (Throwable t) {
                        Log.e("VKImageLoader", "", t);
                    }
                    synchronized (lock) {
                        lock.notifyAll();
                    }
                    needLock.set(false);
                }

                @Override // com.facebook.datasource.BaseDataSubscriber
                public void onFailureImpl(DataSource<CloseableReference<CloseableImage>> dataSource2) {
                    synchronized (lock) {
                        lock.notifyAll();
                    }
                    needLock.set(false);
                }

                @Override // com.facebook.datasource.BaseDataSubscriber, com.facebook.datasource.DataSubscriber
                public void onProgressUpdate(DataSource<CloseableReference<CloseableImage>> dataSource2) {
                    float progress = dataSource2.getProgress();
                    if (requestProgress != null) {
                        requestProgress.onProgressUpdate(progress);
                    }
                }
            }, CallerThreadExecutor.getInstance());
            if (needLock.get()) {
                try {
                    synchronized (lock) {
                        lock.wait();
                    }
                } catch (InterruptedException e) {
                }
            }
            if (res.get() != null) {
                heapBitmapCache.put(uri.toString(), res.get());
            }
            return res.get();
        }
        return heapCachedBitmap;
    }

    private static void configureCaches(ImagePipelineConfig.Builder configBuilder, Context context) {
        int memoryCacheSize = (int) (getHeapSizeInBytes(context) * 0.3f);
        final MemoryCacheParams bitmapCacheParams = new MemoryCacheParams(memoryCacheSize, 200, memoryCacheSize, Integer.MAX_VALUE, Integer.MAX_VALUE);
        configBuilder.setBitmapMemoryCacheParamsSupplier(new Supplier<MemoryCacheParams>() { // from class: com.vk.imageloader.VKImageLoader.6
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.facebook.common.internal.Supplier
            /* renamed from: get */
            public MemoryCacheParams mo486get() {
                return MemoryCacheParams.this;
            }
        }).setMainDiskCacheConfig(DiskCacheConfig.newBuilder(context).setBaseDirectoryPath(context.getApplicationContext().getCacheDir()).setBaseDirectoryName(IMAGE_PIPELINE_CACHE_DIR).setMaxCacheSize(104857600L).build()).setSmallImageDiskCacheConfig(DiskCacheConfig.newBuilder(context).setBaseDirectoryPath(context.getApplicationContext().getCacheDir()).setBaseDirectoryName(IMAGE_PIPELINE_STICKER_CACHE_DIR).setMaxCacheSize(262144000L).build());
    }

    private static int getHeapSizeInBytes(Context context) {
        ActivityManager am = (ActivityManager) context.getSystemService("activity");
        int memoryClass = am.getMemoryClass();
        return memoryClass * 1024 * 1024;
    }

    private static synchronized BufferedDiskCache diskCache() {
        BufferedDiskCache bufferedDiskCache;
        synchronized (VKImageLoader.class) {
            try {
                if (diskCacheField == null) {
                    diskCacheField = ImagePipeline.class.getDeclaredField("mMainBufferedDiskCache");
                    diskCacheField.setAccessible(true);
                }
                bufferedDiskCache = (BufferedDiskCache) diskCacheField.get(Fresco.getImagePipeline());
            } catch (Exception e) {
                throw new RuntimeException("Can not find mMainBufferedDiskCache field");
            }
        }
        return bufferedDiskCache;
    }
}
