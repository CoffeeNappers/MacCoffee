package com.vkontakte.android.audio.player;

import android.annotation.SuppressLint;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.support.v4.app.NotificationCompat;
import android.text.TextUtils;
import android.widget.Toast;
import com.coremedia.iso.boxes.UserBox;
import com.facebook.common.util.UriUtil;
import com.vk.analytics.Analytics;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicApp;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.http.ResponseException;
import com.vkontakte.android.audio.http.downloadfile.DownloadFile;
import com.vkontakte.android.audio.http.downloadfile.DownloadFileListener;
import com.vkontakte.android.audio.utils.AsyncTaskCompat;
import com.vkontakte.android.audio.utils.ProgressSnap;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.cache.AudioCache;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;
import java.util.UUID;
/* loaded from: classes2.dex */
public abstract class DownloadTaskBase extends AsyncTaskCompat<Void, Object, Error> {
    protected final Context mContext;
    private volatile long mLastResumeTime;
    private DownloadTaskListener mListener;
    private volatile boolean mPaused;
    final boolean mShowNotifications;
    private final String mUuid = UUID.randomUUID().toString();
    private final ProgressHolder mProgress = new ProgressHolder();

    /* loaded from: classes2.dex */
    public interface DownloadTaskListener {
        boolean isAllTasksFinished();

        void onFinished(DownloadTaskBase downloadTaskBase, boolean z);

        void onRemoveTracks(SavedTrack... savedTrackArr);

        void onSaveTracks(SavedTrack... savedTrackArr);
    }

    public abstract boolean hasTrack(String str);

    public DownloadTaskBase(Context context, DownloadTaskListener listener, boolean showNotifications) {
        this.mContext = context.getApplicationContext();
        this.mListener = listener;
        this.mShowNotifications = showNotifications;
        log("Download task created", new Object[0]);
    }

    public static void appendTracks(StringBuilder builder, SavedTrack... tracks) {
        builder.append('[');
        for (int i = 0; i < tracks.length; i++) {
            builder.append(tracks[i].getMid());
            if (i < tracks.length - 1) {
                builder.append(", ");
            }
        }
        builder.append(']');
    }

    @Override // android.os.AsyncTask
    protected void onPreExecute() {
        super.onPreExecute();
        log("onPreExecute", new Object[0]);
        removeNotificationFinished();
        showNotificationProgress(R.string.music_player_download_waiting, -1, 0, 0);
    }

    @Override // android.os.AsyncTask
    public void onPostExecute(Error result) {
        boolean z = true;
        super.onPostExecute((DownloadTaskBase) result);
        Object[] objArr = new Object[2];
        objArr[0] = "isError";
        objArr[1] = Boolean.valueOf(result != null);
        log("onPostExecute", objArr);
        removeNotification();
        if (this.mListener != null) {
            DownloadTaskListener downloadTaskListener = this.mListener;
            if (result != null) {
                z = false;
            }
            downloadTaskListener.onFinished(this, z);
        }
        if (this.mListener == null || this.mListener.isAllTasksFinished()) {
            showNotificationFinished(result);
        }
    }

    @Override // android.os.AsyncTask
    public void onCancelled(Error result) {
        super.onCancelled((DownloadTaskBase) result);
        log("onCancelled", new Object[0]);
        removeNotification();
        if (this.mListener != null) {
            this.mListener.onFinished(this, false);
        }
    }

    @Override // android.os.AsyncTask
    @SuppressLint({"StringFormatInvalid"})
    protected void onProgressUpdate(Object... values) {
        super.onProgressUpdate(values);
        if (this.mListener != null && values.length > 0) {
            Object object = values[0];
            log("onProgressUpdate", "object", object);
            if (object instanceof TracksToSave) {
                this.mListener.onSaveTracks(((TracksToSave) object).tracks);
            } else if (object instanceof TracksToRemove) {
                this.mListener.onRemoveTracks(((TracksToRemove) object).tracks);
            } else if (object instanceof TracksDownloadFailed) {
                String s = MusicApp.getInstance().getString(R.string.music_player_error_download_track, ((TracksDownloadFailed) object).mTrack.title);
                Toast.makeText(MusicApp.getInstance(), s, 0).show();
            }
        }
    }

    public String getUuid() {
        return this.mUuid;
    }

    public void removeListener() {
        this.mListener = null;
    }

    public synchronized void pause() {
        if (!this.mPaused) {
            this.mPaused = true;
            updateNotificationProgress();
        }
    }

    public synchronized void resume() {
        if (this.mPaused) {
            this.mPaused = false;
            this.mLastResumeTime = SystemClock.uptimeMillis();
            updateNotificationProgress();
            notifyAll();
        }
    }

    public boolean isPaused() {
        return this.mPaused;
    }

    public int getProgress() {
        return this.mProgress.progress;
    }

    public void cancelAndRemoveNotification() {
        log("cancelAndRemoveNotification", new Object[0]);
        cancel(true);
        removeNotification();
    }

    protected void log(String text, Object... params) {
        if (params.length != 0) {
            Object[] newParams = new Object[params.length + 4];
            newParams[0] = "class";
            newParams[1] = getClass().getSimpleName();
            newParams[2] = UserBox.TYPE;
            newParams[3] = this.mUuid;
            System.arraycopy(params, 0, newParams, 4, params.length);
            L.v("PlayerService", "SavedTracks", text, newParams);
            return;
        }
        L.v("PlayerService", "SavedTracks", text, "class", getClass().getSimpleName(), UserBox.TYPE, this.mUuid);
    }

    public void checkPause() {
        if (this.mPaused) {
            synchronized (this) {
                if (this.mPaused) {
                    boolean interrupted = false;
                    while (this.mPaused) {
                        try {
                            wait();
                        } catch (InterruptedException e) {
                            interrupted = true;
                        }
                    }
                    if (interrupted) {
                        Thread.currentThread().interrupt();
                    }
                }
            }
        }
    }

    private synchronized boolean isJustResumed() {
        boolean z;
        z = SystemClock.uptimeMillis() - this.mLastResumeTime <= 300;
        this.mLastResumeTime = 0L;
        return z;
    }

    protected boolean waitForOnline() {
        showNotificationProgress(R.string.music_player_download_waiting_connection, -1, 0, 0);
        while (!isCancelled()) {
            try {
                PlayerService.waitForOnline(this.mContext);
                return true;
            } catch (InterruptedException e) {
            }
        }
        return false;
    }

    public Error downloadTracks(final Collection<MusicTrack> musicTracks) {
        Error error;
        if (musicTracks == null || musicTracks.isEmpty()) {
            return null;
        }
        int trackCount = musicTracks.size();
        log("downloadTracks", "Paid count", Integer.valueOf(musicTracks.size()), "Track count", Integer.valueOf(trackCount));
        if (trackCount == 0) {
            return null;
        }
        final boolean isMultipleMode = trackCount > 1;
        DownloadFileListener listener = new DownloadFileListener() { // from class: com.vkontakte.android.audio.player.DownloadTaskBase.1
            private MusicTrack mFirstTrack;
            private ProgressSnap mProgressSnap;

            {
                DownloadTaskBase.this = this;
            }

            @Override // com.vkontakte.android.audio.http.downloadfile.DownloadFileListener
            public void onProgress(long count, long totalCount, int progress) {
                if (!isMultipleMode) {
                    if (this.mFirstTrack == null) {
                        this.mFirstTrack = (MusicTrack) musicTracks.iterator().next();
                    }
                    if (this.mProgressSnap == null) {
                        this.mProgressSnap = new ProgressSnap(20);
                    }
                    int p = this.mProgressSnap.progress(progress);
                    if (p >= 0) {
                        DownloadTaskBase.this.showNotificationProgress(this.mFirstTrack, p, 0, 0);
                    }
                }
            }

            @Override // com.vkontakte.android.audio.http.downloadfile.DownloadFileListener
            public boolean isCancelled() {
                return DownloadTaskBase.this.isCancelled();
            }
        };
        DownloadTrackFileConverter converter = new DownloadTrackFileConverter() { // from class: com.vkontakte.android.audio.player.DownloadTaskBase.2
            {
                DownloadTaskBase.this = this;
            }

            @Override // com.vkontakte.android.audio.player.DownloadTrackFileConverter
            public void checkPause() {
                super.checkPause();
                DownloadTaskBase.this.checkPause();
            }
        };
        List<SavedTrack> downloadedTracks = null;
        int trackIndex = -1;
        MusicTrack track = null;
        for (MusicTrack track2 : musicTracks) {
            if (track == null) {
                track = track2;
                trackIndex++;
            }
            checkPause();
            String url = track.getActualLink(false);
            File file = AudioFacade.getTrackDownloadFile(track.getMid());
            log("Downloading track", "mid", track.getMid(), "url", url, UriUtil.LOCAL_FILE_SCHEME, file);
            if (file == null) {
                return new Error();
            }
            if (!file.exists()) {
                File oldCacheFile = AudioCache.getFileForMusic(track);
                if (oldCacheFile.exists()) {
                    if (isMultipleMode) {
                        try {
                            showNotificationProgress(track, (trackIndex * 100) / trackCount, trackIndex + 1, trackCount);
                        } catch (IOException e) {
                            Analytics.logException(e);
                        }
                    }
                    Utils.replaceFile(oldCacheFile, file, true, DownloadTaskBase$$Lambda$1.lambdaFactory$(listener));
                    oldCacheFile.delete();
                }
            }
            CacheUtils.tryUseCacheForSaveMusic(track.getMid(), file);
            if (file.exists()) {
                if (downloadedTracks == null) {
                    downloadedTracks = new ArrayList<>();
                }
                downloadedTracks.add(new SavedTrack(track, file));
            } else {
                if (downloadedTracks != null) {
                    publishTracksToSave((SavedTrack[]) downloadedTracks.toArray(new SavedTrack[downloadedTracks.size()]));
                    downloadedTracks = null;
                }
                if (isMultipleMode) {
                    showNotificationProgress(track, (trackIndex * 100) / trackCount, trackIndex + 1, trackCount);
                }
                try {
                    if (TextUtils.isEmpty(url)) {
                        url = track.getActualLink(true);
                    }
                } catch (ResponseException e2) {
                    int statusCode = e2.getStatusCode();
                    if (statusCode == 404 || statusCode / 100 == 3 || statusCode == 0) {
                        try {
                            if (!DownloadFile.downloadFile(this.mContext, track.getActualLink(true), file, false, listener, converter)) {
                                if (isCancelled()) {
                                    error = new Error();
                                } else if (!isJustResumed()) {
                                    error = new Error();
                                } else {
                                    continue;
                                }
                            }
                        } catch (ResponseException e1) {
                            L.e(e1, new Object[0]);
                            publishProgress(new Object[]{new TracksDownloadFailed(track)});
                            track = null;
                        } catch (Exception e22) {
                            L.e(e22, true);
                            if (!isJustResumed()) {
                                return new Error();
                            }
                        }
                    } else {
                        L.e(e2, new Object[0]);
                        publishProgress(new Object[]{new TracksDownloadFailed(track)});
                        track = null;
                    }
                } catch (Exception e3) {
                    L.e(e3, true);
                    if (!isJustResumed()) {
                        return new Error();
                    }
                }
                if (TextUtils.isEmpty(url)) {
                    return new Error();
                }
                if (DownloadFile.downloadFile(this.mContext, url, file, false, listener, converter)) {
                    publishTracksToSave(new SavedTrack(track, file));
                } else if (isCancelled()) {
                    return new Error();
                } else {
                    if (!isJustResumed()) {
                        return new Error();
                    }
                }
            }
            if (isCancelled()) {
                error = null;
                return error;
            }
            track = null;
        }
        if (downloadedTracks != null) {
            publishTracksToSave((SavedTrack[]) downloadedTracks.toArray(new SavedTrack[downloadedTracks.size()]));
        }
        return null;
    }

    public static /* synthetic */ void lambda$downloadTracks$0(DownloadFileListener listener, Long aLong, Long aLong2) {
        if (aLong2.longValue() == 0) {
            listener.onProgress(0L, 0L, 0);
        } else {
            listener.onProgress(0L, 0L, (int) (aLong.longValue() / aLong2.longValue()));
        }
    }

    private void publishTracksToSave(SavedTrack... tracks) {
        publishProgress(new Object[]{new TracksToSave(tracks)});
    }

    private synchronized void showNotificationProgress(CharSequence text, int progress, int count, int max) {
        this.mProgress.set(text, progress, count, max);
        updateNotificationProgress();
    }

    private synchronized void showNotificationProgress(int textId, int progress, int count, int max) {
        showNotificationProgress(this.mContext.getString(textId), progress, count, max);
    }

    public synchronized void showNotificationProgress(MusicTrack track, int progress, int count, int max) {
        showNotificationProgress(track.artist + " - " + track.title, progress, count, max);
    }

    private synchronized void updateNotificationProgress() {
        if (this.mShowNotifications && this.mProgress.text != null) {
            NotificationCompat.Builder builder = new NotificationCompat.Builder(this.mContext);
            builder.setOnlyAlertOnce(true);
            builder.setSmallIcon(17301633);
            if (this.mProgress.max > 0) {
                builder.setContentTitle(this.mContext.getString(R.string.player_download_title_fmt, Integer.valueOf(this.mProgress.count), Integer.valueOf(this.mProgress.max)));
            } else {
                builder.setContentTitle(this.mContext.getString(R.string.player_download_title));
            }
            builder.setContentText(this.mProgress.text);
            builder.setShowWhen(false);
            builder.setWhen(0L);
            if (this.mProgress.progress >= 0) {
                builder.setProgress(100, this.mProgress.progress, false);
            } else {
                builder.setProgress(0, 0, true);
            }
            builder.setOngoing(true);
            if (this.mPaused) {
                Intent intent = PlayerIntents.getResumeDownloadIntent(this.mContext);
                PendingIntent pendingIntent = PendingIntent.getService(this.mContext, 0, intent, 0);
                builder.addAction(R.drawable.ic_stat_notify_resume_download, this.mContext.getString(R.string.player_download_resume), pendingIntent);
            } else {
                Intent intent2 = PlayerIntents.getPauseDownloadIntent(this.mContext);
                PendingIntent pendingIntent2 = PendingIntent.getService(this.mContext, 0, intent2, 0);
                builder.addAction(R.drawable.ic_stat_notify_pause, this.mContext.getString(R.string.player_download_pause), pendingIntent2);
            }
            Intent intent3 = PlayerIntents.getCancelDownloadIntent(this.mContext, this.mUuid);
            PendingIntent pendingIntent3 = PendingIntent.getService(this.mContext, 0, intent3, 0);
            builder.addAction(R.drawable.ic_stat_notify_cancel, this.mContext.getString(17039360), pendingIntent3);
            Utils.getNotificationManager(this.mContext).notify(this.mUuid, 2, builder.build());
        }
    }

    private void showNotificationFinished(Error error) {
        if (this.mShowNotifications) {
            NotificationCompat.Builder builder = new NotificationCompat.Builder(this.mContext);
            builder.setSmallIcon(17301634);
            builder.setContentTitle(this.mContext.getText(R.string.player_download_title));
            if (error == null) {
                builder.setContentText(this.mContext.getText(R.string.player_download_finished));
            } else {
                CharSequence text = this.mContext.getText(error.errorResId);
                builder.setContentText(text);
                NotificationCompat.BigTextStyle style = new NotificationCompat.BigTextStyle(builder);
                style.bigText(text);
                builder.setStyle(style);
            }
            builder.setAutoCancel(true);
            Intent contentIntent = Intent.makeMainActivity(new ComponentName(this.mContext, MusicApp.getAudioPlayerActivityClass()));
            builder.setContentIntent(PendingIntent.getActivity(this.mContext, 0, contentIntent, 0));
            if (error != null && error.retryIntent != null) {
                PendingIntent pendingIntent = PendingIntent.getService(this.mContext, new Random().nextInt(), error.retryIntent, 1073741824);
                builder.addAction(R.drawable.ic_stat_notify_retry, this.mContext.getString(R.string.player_download_repeat), pendingIntent);
            }
            Utils.getNotificationManager(this.mContext).notify(3, builder.build());
        }
    }

    private void removeNotification() {
        if (this.mShowNotifications) {
            Utils.getNotificationManager(this.mContext).cancel(this.mUuid, 2);
        }
    }

    private void removeNotificationFinished() {
        if (this.mShowNotifications) {
            Utils.getNotificationManager(this.mContext).cancel(3);
        }
    }

    /* loaded from: classes2.dex */
    public static class Error {
        final int errorResId;
        Intent retryIntent;

        public Error() {
            this.errorResId = R.string.music_player_download_error;
        }

        public Error(Exception e) {
            String message = e.getMessage();
            if (!TextUtils.isEmpty(message) && message.contains("ENOSPC")) {
                this.errorResId = R.string.music_player_download_error_out_of_space;
            } else {
                this.errorResId = R.string.music_player_download_error;
            }
        }

        public Error(Intent retryIntent) {
            this();
            this.retryIntent = retryIntent;
        }

        public Error(Intent retryIntent, Exception e) {
            this(e);
            this.retryIntent = retryIntent;
        }
    }

    /* loaded from: classes2.dex */
    public static class ProgressHolder {
        public int count;
        public int max;
        public int progress;
        public CharSequence text;

        private ProgressHolder() {
            this.progress = -1;
        }

        public void set(CharSequence text, int progress, int count, int max) {
            this.text = text;
            this.progress = progress;
            this.count = count;
            this.max = max;
        }
    }

    /* loaded from: classes2.dex */
    public static class TracksToSave {
        public final SavedTrack[] tracks;

        TracksToSave(SavedTrack... tracks) {
            this.tracks = tracks;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder("TracksToSave ");
            DownloadTaskBase.appendTracks(sb, this.tracks);
            return sb.toString();
        }
    }

    /* loaded from: classes2.dex */
    private static class TracksToRemove {
        public final SavedTrack[] tracks;

        public TracksToRemove(SavedTrack... tracks) {
            this.tracks = tracks;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder("TracksToRemove ");
            DownloadTaskBase.appendTracks(sb, this.tracks);
            return sb.toString();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class TracksDownloadFailed {
        private final MusicTrack mTrack;

        TracksDownloadFailed(MusicTrack track) {
            this.mTrack = track;
        }
    }
}
