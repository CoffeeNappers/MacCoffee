package com.vk.stories;

import android.text.TextUtils;
import android.util.Log;
import com.danikula.videocache.HttpProxyCacheServer;
import com.vk.core.network.Network;
import com.vk.core.util.FileUtils;
import com.vk.stories.model.StoryEntry;
import com.vkontakte.android.VKApplication;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import okhttp3.Request;
import okhttp3.Response;
import okio.Okio;
/* loaded from: classes2.dex */
public class StoryVideoCache {
    private static final int CACHE_SIZE_BYTES = 50000000;
    private static final int CACHE_SIZE_ENTRIES = 10;
    private static final String TAG = "StoryVideoCache";
    private static HttpProxyCacheServer videoCache = new HttpProxyCacheServer.Builder(VKApplication.context).cacheDirectory(FileUtils.getVideoCacheDir()).maxCacheFilesCount(10).maxCacheSize(50000000).build();
    private static final Executor downloadExecutor = Executors.newSingleThreadExecutor();
    private static final Executor linkExecutor = Executors.newSingleThreadExecutor();
    private static final Set<StoryEntry> pendingVideoRequests = Collections.synchronizedSet(new HashSet());

    /* loaded from: classes2.dex */
    public interface UrlCallback {
        void onLinkReady(String str);
    }

    public static void getVideoUrl(final StoryEntry entry, final UrlCallback urlCallback) {
        linkExecutor.execute(new Runnable() { // from class: com.vk.stories.StoryVideoCache.1
            @Override // java.lang.Runnable
            public void run() {
                UrlCallback.this.onLinkReady(StoryVideoCache.videoCache.getProxyUrl(entry.getVideoUrl()));
            }
        });
    }

    public static void prefetchVideo(final StoryEntry entry) {
        if (entry != null && !TextUtils.isEmpty(entry.getVideoUrl()) && !pendingVideoRequests.contains(entry)) {
            pendingVideoRequests.add(entry);
            final String url = entry.getVideoUrl();
            downloadExecutor.execute(new Runnable() { // from class: com.vk.stories.StoryVideoCache.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        if (!StoryVideoCache.videoCache.isCached(url)) {
                            try {
                                Request request = new Request.Builder().url(StoryVideoCache.videoCache.getProxyUrl(entry.getVideoUrl())).build();
                                Response response = Network.getDefaultClient().newCall(request).execute();
                                response.body().source().readAll(Okio.blackhole());
                            } catch (Exception e) {
                                Log.d(StoryVideoCache.TAG, "Error while caching video");
                            }
                        }
                    } finally {
                        StoryVideoCache.pendingVideoRequests.remove(entry);
                    }
                }
            });
        }
    }
}
