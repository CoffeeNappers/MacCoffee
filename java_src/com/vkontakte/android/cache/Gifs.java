package com.vkontakte.android.cache;

import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.utils.Utils;
import io.sentry.event.EventBuilder;
import java.io.File;
import java.io.IOException;
/* loaded from: classes2.dex */
public class Gifs extends FileLruCache {
    static volatile Gifs sInstance;

    public static Gifs get() {
        Gifs localInstance;
        Gifs localInstance2 = sInstance;
        if (localInstance2 == null) {
            synchronized (Gifs.class) {
                try {
                    localInstance2 = sInstance;
                    if (localInstance2 == null) {
                        try {
                            localInstance = new Gifs(new File(VKApplication.context.getCacheDir(), "gifs"), 52428800L);
                        } catch (IOException e) {
                            e = e;
                        }
                        try {
                            sInstance = localInstance;
                            localInstance2 = localInstance;
                        } catch (IOException e2) {
                            e = e2;
                            throw new RuntimeException(e);
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            }
        }
        return localInstance2;
    }

    Gifs(File path, long maxSize) throws IOException {
        super(path, maxSize);
    }

    public static String getAutoPlayState() {
        if (VKAccountManager.getCurrent().isGifAutoPlayAvailable()) {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
            return preferences.getString("gif_autoplay", "always");
        }
        return EventBuilder.DEFAULT_HOSTNAME;
    }

    public static boolean allowAutoPlay() {
        if (VKAccountManager.getCurrent().isGifAutoPlayAvailable()) {
            SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(VKApplication.context);
            String value = preferences.getString("gif_autoplay", "always");
            return "always".equals(value) || ("wifi".equals(value) && Utils.isWifi());
        }
        return false;
    }

    @Override // com.vkontakte.android.cache.FileLruCache
    public String convertKey(String input) {
        return VKAPIRequest.md5(input);
    }

    public void trackPlayEvent(int gif_id, boolean autoplay) {
        Analytics.track("gif_play").addParam("gif_id", Integer.valueOf(gif_id)).addParam("start_type", autoplay ? "autoplay" : "manual").commit();
    }
}
