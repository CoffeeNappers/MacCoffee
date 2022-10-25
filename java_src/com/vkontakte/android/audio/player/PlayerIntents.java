package com.vkontakte.android.audio.player;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.vkontakte.android.audio.MusicApp;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.utils.Utils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
/* loaded from: classes2.dex */
public class PlayerIntents {
    static final String ACTION_STOP = Utils.formatAction(PlayerService.class, "STOP");
    static final String ACTION_LOGOUT = Utils.formatAction(PlayerService.class, "LOGOUT");
    static final String ACTION_PAUSE = Utils.formatAction(PlayerService.class, "PAUSE");
    static final String ACTION_REWIND = Utils.formatAction(PlayerService.class, "REWIND");
    static final String ACTION_RESUME = Utils.formatAction(PlayerService.class, "RESUME");
    static final String ACTION_TOGGLE_RESUME_PAUSE = Utils.formatAction(PlayerService.class, "TOGGLE_RESUME_PAUSE");
    static final String ACTION_NEXT = Utils.formatAction(PlayerService.class, "NEXT");
    static final String ACTION_PREV = Utils.formatAction(PlayerService.class, "PREV");
    static final String ACTION_TOGGLE_SHUFFLE = Utils.formatAction(PlayerService.class, "TOGGLE_SHUFFLE");
    static final String ACTION_SET_SHUFFLE = Utils.formatAction(PlayerService.class, "SET_SHUFFLE");
    static final String ACTION_TOGGLE_REPEAT = Utils.formatAction(PlayerService.class, "TOGGLE_REPEAT");
    static final String ACTION_TOGGLE_REPEAT_NONE_OR_TRACK = Utils.formatAction(PlayerService.class, "TOGGLE_REPEAT_NONE_OR_TRACK");
    static final String ACTION_SET_REPEAT_MODE = Utils.formatAction(PlayerService.class, "SET_REPEAT_MODE");
    static final String ACTION_PLAY_UUID = Utils.formatAction(PlayerService.class, "PLAY_UUID");
    static final String ACTION_START_DOWNLOAD_TRACKS = Utils.formatAction(PlayerService.class, "START_DOWNLOAD_TRACKS");
    static final String ACTION_PAUSE_DOWNLOAD = Utils.formatAction(PlayerService.class, "PAUSE_DOWNLOAD");
    static final String ACTION_RESUME_DOWNLOAD = Utils.formatAction(PlayerService.class, "RESUME_DOWNLOAD");
    static final String ACTION_CANCEL_DOWNLOAD = Utils.formatAction(PlayerService.class, "CANCEL_DOWNLOAD");
    static final String ACTION_CANCEL_DOWNLOADS = Utils.formatAction(PlayerService.class, "CANCEL_DOWNLOADS");
    static final String ACTION_REMOVE_SAVED_TRACK = Utils.formatAction(PlayerService.class, "REMOVE_SAVED_TRACKS");
    static final String ACTION_REMOVE_ALL_SAVED_TRACK = Utils.formatAction(PlayerService.class, "REMOVE_ALL_SAVED_TRACKS");
    static final String EXTRA_TRACKS = Utils.formatExtra(PlayerService.class, "TRACKS");
    static final String EXTRA_MID = Utils.formatExtra(PlayerService.class, "MID");
    static final String EXTRA_REPEAT_MODE = Utils.formatExtra(PlayerService.class, "REPEAT_MODE");
    static final String EXTRA_UUID = Utils.formatExtra(PlayerService.class, "UUID");
    static final String EXTRA_SHUFFLE = Utils.formatExtra(PlayerService.class, "SHUFFLE");
    static final String EXTRA_SHOW_NOTIFICATION = Utils.formatExtra(PlayerService.class, "EXTRA_SHOW_NOTIFICATION");

    /* JADX INFO: Access modifiers changed from: protected */
    public static Intent createIntent(Context context, String action) {
        return new Intent(action, null, context, PlayerService.class);
    }

    private static PendingIntent createPendingIntent(Context context, Intent intent, int flags) {
        return PendingIntent.getService(context, 0, intent, flags);
    }

    public static Intent getResumeIntent(Context context) {
        return createIntent(context, ACTION_RESUME);
    }

    public static void resume() {
        Context context = MusicApp.getInstance();
        context.startService(getResumeIntent(context));
    }

    public static Intent getPauseIntent(Context context) {
        return createIntent(context, ACTION_PAUSE);
    }

    public static void pause() {
        Context context = MusicApp.getInstance();
        context.startService(getPauseIntent(context));
    }

    public static Intent getToggleResumePauseIntent(Context context) {
        return createIntent(context, ACTION_TOGGLE_RESUME_PAUSE);
    }

    public static void toggleResumePause() {
        Context context = MusicApp.getInstance();
        context.startService(getToggleResumePauseIntent(context));
    }

    public static Intent getRewindIntent(Context context) {
        return createIntent(context, ACTION_REWIND);
    }

    public static void rewind() {
        Context context = MusicApp.getInstance();
        context.startService(getRewindIntent(context));
    }

    public static Intent getNextIntent(Context context) {
        return createIntent(context, ACTION_NEXT);
    }

    public static void next() {
        Context context = MusicApp.getInstance();
        context.startService(getNextIntent(context));
    }

    public static Intent getPrevIntent(Context context) {
        return createIntent(context, ACTION_PREV);
    }

    public static void prev() {
        Context context = MusicApp.getInstance();
        context.startService(getPrevIntent(context));
    }

    public static Intent getStopIntent(Context context) {
        return createIntent(context, ACTION_STOP);
    }

    public static void stop() {
        Context context = MusicApp.getInstance();
        context.startService(getStopIntent(context));
    }

    public static Intent getToggleShuffleIntent(Context context) {
        return createIntent(context, ACTION_TOGGLE_SHUFFLE);
    }

    public static void toggleShuffle() {
        Context context = MusicApp.getInstance();
        context.startService(getToggleShuffleIntent(context));
    }

    public static Intent getSetShuffleIntent(Context context, boolean isShuffle) {
        Intent intent = createIntent(context, ACTION_SET_SHUFFLE);
        intent.putExtra(EXTRA_SHUFFLE, isShuffle);
        return intent;
    }

    public static void setShuffle(boolean isShuffle) {
        Context context = MusicApp.getInstance();
        context.startService(getSetShuffleIntent(context, isShuffle));
    }

    public static Intent getToggleRepeatIntent(Context context) {
        return createIntent(context, ACTION_TOGGLE_REPEAT);
    }

    public static void toggleRepeat() {
        Context context = MusicApp.getInstance();
        context.startService(getToggleRepeatIntent(context));
    }

    public static Intent getToggleRepeatNoneOrTrackIntent(Context context) {
        return createIntent(context, ACTION_TOGGLE_REPEAT_NONE_OR_TRACK);
    }

    public static void toggleRepeatNoneOrTrack() {
        Context context = MusicApp.getInstance();
        context.startService(getToggleRepeatNoneOrTrackIntent(context));
    }

    public static Intent getSetRepeatModeIntent(Context context, LoopMode loopMode) {
        Intent intent = createIntent(context, ACTION_SET_REPEAT_MODE);
        intent.putExtra(EXTRA_REPEAT_MODE, loopMode.ordinal());
        return intent;
    }

    public static void setRepeatMode(LoopMode loopMode) {
        Context context = MusicApp.getInstance();
        context.startService(getSetRepeatModeIntent(context, loopMode));
    }

    public static Intent getPlayTrackUuidIntent(Context context, String uuid) {
        Intent intent = createIntent(context, ACTION_PLAY_UUID);
        intent.putExtra(EXTRA_UUID, uuid);
        return intent;
    }

    public static void playTrack(String uuid) {
        Context context = MusicApp.getInstance();
        context.startService(getPlayTrackUuidIntent(context, uuid));
    }

    public static Intent getLogoutIntent(Context context) {
        return createIntent(context, ACTION_LOGOUT);
    }

    public static void logout() {
        Context context = MusicApp.getInstance();
        context.startService(getLogoutIntent(context));
    }

    public static Intent getStartDownloadTracksIntent(Context context, Collection<? extends MusicTrack> tracks, boolean showNotification) {
        Intent intent = createIntent(context, ACTION_START_DOWNLOAD_TRACKS);
        intent.putExtra(EXTRA_SHOW_NOTIFICATION, showNotification);
        if (tracks instanceof ArrayList) {
            intent.putParcelableArrayListExtra(EXTRA_TRACKS, (ArrayList) Utils.checkedCast(tracks));
        } else {
            intent.putParcelableArrayListExtra(EXTRA_TRACKS, new ArrayList<>(tracks));
        }
        return intent;
    }

    public static Intent getStartDownloadTracksIntent(Context context, MusicTrack track, boolean showNotification) {
        return getStartDownloadTracksIntent(context, Collections.singletonList(track), showNotification);
    }

    public static void startDownloadTracks(Collection<MusicTrack> tracks, boolean showNotification) {
        Context context = MusicApp.getInstance();
        context.startService(getStartDownloadTracksIntent(context, tracks, showNotification));
    }

    public static void startDownloadTracks(MusicTrack track, boolean showNotification) {
        Context context = MusicApp.getInstance();
        context.startService(getStartDownloadTracksIntent(context, track, showNotification));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Intent getPauseDownloadIntent(Context context) {
        return createIntent(context, ACTION_PAUSE_DOWNLOAD);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Intent getResumeDownloadIntent(Context context) {
        return createIntent(context, ACTION_RESUME_DOWNLOAD);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Intent getCancelDownloadIntent(Context context, String uuid) {
        Intent intent = createIntent(context, ACTION_CANCEL_DOWNLOAD);
        intent.setData(Uri.parse(uuid));
        return intent;
    }

    public static void cancelDownload(String uuid) {
        Context context = MusicApp.getInstance();
        context.startService(getCancelDownloadIntent(context, uuid));
    }

    static Intent getCancelDownloadsIntent(Context context) {
        return createIntent(context, ACTION_CANCEL_DOWNLOADS);
    }

    public static void cancelDownloads() {
        Context context = MusicApp.getInstance();
        context.startService(getCancelDownloadsIntent(context));
    }

    public static Intent getRemoveSavedTrackIntent(Context context, String... mid) {
        Intent intent;
        if (mid.length == 0) {
            intent = createIntent(context, ACTION_REMOVE_ALL_SAVED_TRACK);
        } else {
            intent = createIntent(context, ACTION_REMOVE_SAVED_TRACK);
        }
        intent.putExtra(EXTRA_MID, mid);
        return intent;
    }

    public static void removeSavedTrack(String... mid) {
        Context context = MusicApp.getInstance();
        context.startService(getRemoveSavedTrackIntent(context, mid));
    }
}
