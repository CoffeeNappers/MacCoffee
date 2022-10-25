package com.vkontakte.android.audio.player;

import android.content.Context;
import android.content.SharedPreferences;
import com.vk.core.util.Preference;
/* loaded from: classes2.dex */
public class Prefs implements Preference {
    private static volatile Prefs sInstance = null;
    public Preference.PreferenceEnum<LoopMode> loopMode;
    public Preference.PreferenceBoolean pausedBySystem;
    public Preference.PreferenceLong playedLastDate;
    public Preference.PreferenceLong playedTime;
    public Preference.PreferenceLongArray showedPausedInfo;
    public Preference.PreferenceBoolean shuffle;
    public Preference.PreferenceBoolean shuffleGlobal;
    public Preference.PreferenceString stoppedTrackInfo;

    public static Prefs getInstance(Context context) {
        if (sInstance == null) {
            synchronized (Prefs.class) {
                if (sInstance == null) {
                    sInstance = new Prefs(context);
                }
            }
        }
        return sInstance;
    }

    private Prefs(Context context) {
        SharedPreferences preferences = context.getSharedPreferences("PlayerService", 0);
        this.loopMode = new Preference.PreferenceEnum<>(preferences, "loop_mode", LoopMode.LIST, LoopMode.class);
        this.shuffle = new Preference.PreferenceBoolean(preferences, "shuffle", false);
        this.shuffleGlobal = new Preference.PreferenceBoolean(preferences, "shuffleGlobal", false);
        this.stoppedTrackInfo = new Preference.PreferenceString(preferences, "stopped_track_info", null);
        this.pausedBySystem = new Preference.PreferenceBoolean(preferences, "paused_by_system", false);
        this.playedTime = new Preference.PreferenceLong(preferences, "played_time", 0L);
        this.playedLastDate = new Preference.PreferenceLong(preferences, "played_last_date", 0L);
        this.showedPausedInfo = new Preference.PreferenceLongArray(preferences, "showed_paused_info", new Long[0]);
    }

    public void clear() {
        this.loopMode.remove();
        this.shuffle.remove();
        this.shuffleGlobal.remove();
        this.stoppedTrackInfo.remove();
        this.pausedBySystem.remove();
        this.playedTime.remove();
        this.playedLastDate.remove();
        this.showedPausedInfo.remove();
    }
}
