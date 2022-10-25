package com.vk.emoji;

import android.content.Context;
import android.net.Uri;
import android.os.StatFs;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.squareup.picasso.Downloader;
import com.squareup.picasso.NetworkPolicy;
import java.io.File;
import java.io.IOException;
import okhttp3.Cache;
import okhttp3.CacheControl;
import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class OkHttp3Downloader implements Downloader {
    private static final int MAX_DISK_CACHE_SIZE = 52428800;
    private static final int MIN_DISK_CACHE_SIZE = 5242880;
    private static final String PICASSO_CACHE = "picasso-cache";
    private final Cache cache;
    private final Call.Factory client;

    private static File defaultCacheDir(Context context) {
        File cache = new File(context.getApplicationContext().getCacheDir(), PICASSO_CACHE);
        if (!cache.exists()) {
            cache.mkdirs();
        }
        return cache;
    }

    private static long calculateDiskCacheSize(File dir) {
        long size = 5242880;
        try {
            StatFs statFs = new StatFs(dir.getAbsolutePath());
            long available = statFs.getBlockCount() * statFs.getBlockSize();
            size = available / 50;
        } catch (IllegalArgumentException e) {
        }
        return Math.max(Math.min(size, 52428800L), 5242880L);
    }

    public static Cache createDefaultCache(Context context) {
        File dir = defaultCacheDir(context);
        return new Cache(dir, calculateDiskCacheSize(dir));
    }

    private static OkHttpClient createOkHttpClient(File cacheDir, long maxSize) {
        return new OkHttpClient.Builder().cache(new Cache(cacheDir, maxSize)).build();
    }

    public OkHttp3Downloader(Context context) {
        this(defaultCacheDir(context));
    }

    public OkHttp3Downloader(File cacheDir) {
        this(cacheDir, calculateDiskCacheSize(cacheDir));
    }

    public OkHttp3Downloader(Context context, long maxSize) {
        this(defaultCacheDir(context), maxSize);
    }

    public OkHttp3Downloader(File cacheDir, long maxSize) {
        this(createOkHttpClient(cacheDir, maxSize));
    }

    public OkHttp3Downloader(OkHttpClient client) {
        this.client = client;
        this.cache = client.cache();
    }

    public OkHttp3Downloader(Call.Factory client, Cache cache) {
        this.client = client;
        this.cache = cache;
    }

    @Override // com.squareup.picasso.Downloader
    public Downloader.Response load(Uri uri, int networkPolicy) throws IOException {
        CacheControl cacheControl = null;
        if (networkPolicy != 0) {
            if (NetworkPolicy.isOfflineOnly(networkPolicy)) {
                cacheControl = CacheControl.FORCE_CACHE;
            } else {
                CacheControl.Builder builder = new CacheControl.Builder();
                if (!NetworkPolicy.shouldReadFromDiskCache(networkPolicy)) {
                    builder.noCache();
                }
                if (!NetworkPolicy.shouldWriteToDiskCache(networkPolicy)) {
                    builder.noStore();
                }
                cacheControl = builder.build();
            }
        }
        Request.Builder builder2 = new Request.Builder().url(uri.toString());
        if (cacheControl != null) {
            builder2.cacheControl(cacheControl);
        }
        Response response = this.client.newCall(builder2.build()).execute();
        int responseCode = response.code();
        if (responseCode >= 300) {
            response.body().close();
            throw new Downloader.ResponseException(responseCode + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + response.message(), networkPolicy, responseCode);
        }
        boolean fromCache = response.cacheResponse() != null;
        ResponseBody responseBody = response.body();
        return new Downloader.Response(responseBody.byteStream(), fromCache, responseBody.contentLength());
    }

    @Override // com.squareup.picasso.Downloader
    public void shutdown() {
        if (this.cache != null) {
            try {
                this.cache.close();
            } catch (IOException e) {
            }
        }
    }
}
