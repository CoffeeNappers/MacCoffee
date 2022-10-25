package com.vkontakte.android.audio;

import android.content.Context;
import android.content.SharedPreferences;
import com.vk.analytics.Analytics;
import com.vk.core.util.Preference;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.cache.AudioCache;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
/* loaded from: classes2.dex */
public class AudioCacheMigrateAdapter {
    private static volatile AudioCacheMigrateAdapter instance = null;
    private Preference.PreferenceBoolean cacheWasImported;

    private AudioCacheMigrateAdapter(Context ctx) {
        SharedPreferences preferences = ctx.getSharedPreferences("PlayerService", 0);
        this.cacheWasImported = new Preference.PreferenceBoolean(preferences, "audioCacheWasImported", false);
    }

    public static synchronized AudioCacheMigrateAdapter getInstance(Context ctx) {
        AudioCacheMigrateAdapter audioCacheMigrateAdapter;
        synchronized (AudioCacheMigrateAdapter.class) {
            if (instance == null) {
                audioCacheMigrateAdapter = new AudioCacheMigrateAdapter(ctx);
                instance = audioCacheMigrateAdapter;
            } else {
                audioCacheMigrateAdapter = instance;
            }
        }
        return audioCacheMigrateAdapter;
    }

    public void importOldFiles() {
        if (!Boolean.TRUE.equals(this.cacheWasImported.mo473get())) {
            try {
                List<MusicTrack> musicTracks = AudioCache.getCachedList(VKApplication.context);
                if (musicTracks != null) {
                    List<MusicTrack> tracksForDownloading = new ArrayList<>();
                    for (int i = musicTracks.size() - 1; i >= 0; i--) {
                        MusicTrack musicTrack = musicTracks.get(i);
                        File file = AudioCache.getFileForMusic(musicTrack);
                        if (file.exists()) {
                            File newFile = AudioFacade.getTrackDownloadFile(musicTrack.getMid());
                            if (!newFile.exists()) {
                                tracksForDownloading.add(musicTrack);
                            }
                        }
                    }
                    AudioFacade.startDownloadTracks((Collection<MusicTrack>) tracksForDownloading, true);
                }
                AudioCache.clear();
                this.cacheWasImported.set((Boolean) true);
            } catch (Exception e) {
                Analytics.logException(e);
            }
        }
    }
}
