package com.vkontakte.android.audio.player;

import android.content.Context;
import android.os.Environment;
import android.text.TextUtils;
import com.vkontakte.android.audio.AudioCacheMigrateAdapter;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.DownloadTaskBase;
import com.vkontakte.android.audio.utils.AsyncTaskCompat;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.audio.utils.WakeLockEx;
import com.vkontakte.android.auth.VKAccountManager;
import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public final class SavedTracks {
    private static final ThreadPoolExecutor EXECUTOR = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS, new LinkedBlockingQueue());
    static final String LOG_PREFIX = "SavedTracks";
    private final Context mContext;
    private LoadTracksTask mLoadTracksTask;
    private SaveTracksTask mSaveTracksTask;
    private boolean mTracksLocked;
    private final WakeLockEx mWakeLockEx;
    private final Set<SavedTracksListener> mListeners = new HashSet();
    private final ArrayList<SavedTrack> mTracksList = new ArrayList<>();
    private final Set<String> mMidsSet = new HashSet();
    private final Set<String> mLostMidsSet = new HashSet();
    private final Map<String, DownloadTaskBase> mDownloadTasks = new LinkedHashMap();

    /* loaded from: classes2.dex */
    public enum DownloadState {
        NONE,
        DOWNLOADING,
        DOWNLOADED,
        DOWNLOADED_LOST
    }

    /* loaded from: classes2.dex */
    public interface OnLoadedListener {
        void onSavedTracksLoaded();
    }

    /* loaded from: classes2.dex */
    public interface SavedTracksListener {
        void onDownloadFinished(boolean z);

        void onDownloadStarted();

        void onSavedTracksChanged();

        void onSavedTracksSaved();
    }

    public SavedTracks(Context context, OnLoadedListener onLoadedListener) {
        this.mContext = context;
        this.mWakeLockEx = new WakeLockEx(context, SavedTracks.class.getName());
        this.mLoadTracksTask = new LoadTracksTask(onLoadedListener, context);
        this.mLoadTracksTask.executeQuick(new Void[0]);
    }

    public static List<File> getDownloadDirectories(Context context) {
        File[] dirs = Utils.getExternalFilesDirs(context, Environment.DIRECTORY_MUSIC);
        if (dirs == null) {
            return new ArrayList();
        }
        List<File> list = new ArrayList<>(dirs.length);
        for (File dir : dirs) {
            if (dir != null) {
                list.add(dir);
            }
        }
        return list;
    }

    public static HashSet<File> getFiles(Context context) {
        FilenameFilter filter;
        File[] fs;
        filter = SavedTracks$$Lambda$1.instance;
        HashSet<File> files = new HashSet<>();
        for (File dir : getDownloadDirectories(context)) {
            if (dir.exists() && (fs = dir.listFiles(filter)) != null) {
                Collections.addAll(files, fs);
            }
        }
        return files;
    }

    public static /* synthetic */ boolean lambda$getFiles$0(File dir, String filename) {
        return !filename.endsWith(".tmp");
    }

    public void release() {
        this.mListeners.clear();
        for (DownloadTaskBase task : this.mDownloadTasks.values()) {
            task.removeListener();
            task.cancel(true);
        }
        this.mDownloadTasks.clear();
        if (this.mLoadTracksTask != null) {
            this.mLoadTracksTask.cancel(true);
            this.mLoadTracksTask = null;
        }
        this.mWakeLockEx.releaseSafety();
    }

    public SavedTrack getTrack(String mid) {
        if (this.mTracksList != null && this.mMidsSet.contains(mid)) {
            Iterator<SavedTrack> it = this.mTracksList.iterator();
            while (it.hasNext()) {
                SavedTrack track = it.next();
                if (TextUtils.equals(track.getMid(), mid)) {
                    return track;
                }
            }
        }
        return null;
    }

    public List<SavedTrack> getTracks() {
        return Collections.unmodifiableList(this.mTracksList);
    }

    public void downloadTracks(Collection<MusicTrack> tracks, boolean showNotification) {
        if (!VKAccountManager.getCurrent().isMusicRestricted()) {
            Collection<MusicTrack> tracksToDownload = new ArrayList<>(tracks.size());
            for (MusicTrack track : tracks) {
                if (track.getRestrictionType() == 0) {
                    switch (getDownloadState(track.getMid())) {
                        case DOWNLOADED_LOST:
                            this.mLostMidsSet.remove(track.getMid());
                            tracksToDownload.add(track);
                            break;
                        case NONE:
                            tracksToDownload.add(track);
                            break;
                    }
                }
            }
            if (!tracksToDownload.isEmpty()) {
                startDownloadTask(new DownloadTaskTracks(this.mContext, new MyDownloadTaskListener(), tracksToDownload, showNotification));
            }
        }
    }

    public void downloadTrack(MusicTrack track, boolean showNotification) {
        downloadTracks(Collections.singletonList(track), showNotification);
    }

    public void cancelDownloads() {
        for (DownloadTaskBase task : this.mDownloadTasks.values()) {
            task.cancelAndRemoveNotification();
        }
        this.mDownloadTasks.clear();
    }

    public void removeTracks(SavedTrack... tracks) {
        checkTracksLock();
        boolean modified = false;
        for (SavedTrack track : tracks) {
            if (removeTrackInternal(track.getMid())) {
                modified = true;
            }
        }
        if (modified) {
            saveTracks();
            notifyTracksChanged();
        }
    }

    public void removeTracks(String... mids) {
        checkTracksLock();
        boolean modified = false;
        for (String mid : mids) {
            if (removeTrackInternal(mid)) {
                modified = true;
            }
        }
        if (modified) {
            saveTracks();
            notifyTracksChanged();
        }
    }

    public void clearTracks() {
        checkTracksLock();
        this.mTracksList.clear();
        this.mMidsSet.clear();
        saveTracks();
        notifyTracksChanged();
    }

    public boolean isDownloading(String mid) {
        for (DownloadTaskBase task : this.mDownloadTasks.values()) {
            if (task.hasTrack(mid)) {
                return true;
            }
        }
        return false;
    }

    public boolean isDownloaded(String mid) {
        return this.mMidsSet.contains(mid);
    }

    public DownloadState getDownloadState(String mid) {
        if (isDownloaded(mid)) {
            if (isFileLost(mid)) {
                return DownloadState.DOWNLOADED_LOST;
            }
            return DownloadState.DOWNLOADED;
        } else if (isDownloading(mid)) {
            return DownloadState.DOWNLOADING;
        } else {
            return DownloadState.NONE;
        }
    }

    private boolean isFileLost(String mid) {
        return this.mLostMidsSet.contains(mid);
    }

    public boolean checkFileLost(File file) {
        boolean lost = !file.exists();
        boolean modified = false;
        Iterator<SavedTrack> it = this.mTracksList.iterator();
        while (it.hasNext()) {
            SavedTrack track = it.next();
            if (track.file.equals(file)) {
                if (lost) {
                    this.mLostMidsSet.add(track.getMid());
                    modified = true;
                } else if (this.mLostMidsSet.remove(track.getMid())) {
                    modified = true;
                }
            }
        }
        if (modified) {
            saveTracks();
            notifyTracksChanged();
        }
        return lost;
    }

    public void registerListener(SavedTracksListener listener) {
        if (listener != null) {
            this.mListeners.add(listener);
        }
    }

    public boolean cancelDownload(String uuid) {
        DownloadTaskBase task = removeTask(uuid);
        if (task != null) {
            task.cancelAndRemoveNotification();
        }
        return task != null;
    }

    public void pauseDownload() {
        DownloadTaskBase task = getCurrentDownloadTask();
        if (task != null) {
            task.pause();
        }
    }

    public void resumeDownload() {
        DownloadTaskBase task = getCurrentDownloadTask();
        if (task != null) {
            task.resume();
        }
    }

    public boolean hasTasks() {
        return !this.mDownloadTasks.isEmpty();
    }

    public File getTrackFile(String mid) {
        SavedTrack track = getTrack(mid);
        if (track == null) {
            return null;
        }
        return track.file;
    }

    private void startDownloadTask(DownloadTaskBase task) {
        this.mDownloadTasks.put(task.getUuid(), task);
        task.executeOnExecutor(EXECUTOR, new Void[0]);
        this.mWakeLockEx.acquire();
        notifyDownloadStarted();
    }

    public DownloadTaskBase removeTask(String uuid) {
        return this.mDownloadTasks.remove(uuid);
    }

    private void notifyTracksChanged() {
        this.mTracksLocked = true;
        try {
            for (SavedTracksListener listener : this.mListeners) {
                listener.onSavedTracksChanged();
            }
        } finally {
            this.mTracksLocked = false;
        }
    }

    public void notifySaveFinished() {
        for (SavedTracksListener listener : this.mListeners) {
            listener.onSavedTracksSaved();
        }
    }

    private void notifyDownloadStarted() {
        for (SavedTracksListener listener : this.mListeners) {
            listener.onDownloadStarted();
        }
    }

    public void notifyDownloadFinished() {
        boolean completed = this.mDownloadTasks.isEmpty();
        for (SavedTracksListener listener : this.mListeners) {
            listener.onDownloadFinished(completed);
        }
    }

    private DownloadTaskBase getCurrentDownloadTask() {
        if (this.mDownloadTasks.isEmpty()) {
            return null;
        }
        return this.mDownloadTasks.values().iterator().next();
    }

    private void saveTracks() {
        if (this.mSaveTracksTask != null) {
            this.mSaveTracksTask.cancel(true);
        }
        this.mSaveTracksTask = new SaveTracksTask();
        this.mSaveTracksTask.execute(new Void[0]);
    }

    private void checkTracksLock() {
        if (this.mTracksLocked) {
            throw new RuntimeException("Cannot change saved tracks list");
        }
    }

    private boolean removeTrackInternal(String mid) {
        boolean modified = false;
        Iterator<SavedTrack> iterator = this.mTracksList.iterator();
        while (true) {
            if (!iterator.hasNext()) {
                break;
            }
            SavedTrack track = iterator.next();
            if (TextUtils.equals(track.getMid(), mid)) {
                iterator.remove();
                modified = true;
                break;
            }
        }
        this.mMidsSet.remove(mid);
        this.mLostMidsSet.remove(mid);
        return modified;
    }

    public void saveTracks(SavedTrack... tracks) {
        for (SavedTrack track : tracks) {
            if (!isDownloaded(track.getMid())) {
                this.mTracksList.add(0, track);
                this.mMidsSet.add(track.getMid());
            }
        }
        saveTracks();
        notifyTracksChanged();
    }

    /* loaded from: classes2.dex */
    public static class LoadedTracks {
        final Set<String> lostMidsSet;
        final ArrayList<SavedTrack> midsList;

        LoadedTracks(ArrayList<SavedTrack> midsList, Set<String> lostMidsSet) {
            this.midsList = midsList;
            this.lostMidsSet = lostMidsSet;
        }
    }

    /* loaded from: classes2.dex */
    public class MyDownloadTaskListener implements DownloadTaskBase.DownloadTaskListener {
        private MyDownloadTaskListener() {
            SavedTracks.this = r1;
        }

        @Override // com.vkontakte.android.audio.player.DownloadTaskBase.DownloadTaskListener
        public void onSaveTracks(SavedTrack... tracks) {
            SavedTracks.this.saveTracks(tracks);
        }

        @Override // com.vkontakte.android.audio.player.DownloadTaskBase.DownloadTaskListener
        public void onRemoveTracks(SavedTrack... tracks) {
            SavedTracks.this.removeTracks(tracks);
        }

        @Override // com.vkontakte.android.audio.player.DownloadTaskBase.DownloadTaskListener
        public void onFinished(DownloadTaskBase task, boolean success) {
            SavedTracks.this.removeTask(task.getUuid());
            if (SavedTracks.this.mDownloadTasks.isEmpty()) {
                SavedTracks.this.mWakeLockEx.releaseSafety();
            }
            SavedTracks.this.notifyDownloadFinished();
        }

        @Override // com.vkontakte.android.audio.player.DownloadTaskBase.DownloadTaskListener
        public boolean isAllTasksFinished() {
            return SavedTracks.this.mDownloadTasks.isEmpty();
        }
    }

    /* loaded from: classes2.dex */
    public class LoadTracksTask extends AsyncTaskCompat<Void, Void, LoadedTracks> {
        private final Context context;
        private final OnLoadedListener mListener;

        private LoadTracksTask(OnLoadedListener listener, Context context) {
            SavedTracks.this = r1;
            this.mListener = listener;
            this.context = context;
        }

        @Override // android.os.AsyncTask
        public LoadedTracks doInBackground(Void... params) {
            AudioCacheMigrateAdapter.getInstance(this.context).importOldFiles();
            Set<String> lostSet = new HashSet<>();
            Map<File, Boolean> checkedFiles = new HashMap<>();
            ArrayList<SavedTrack> tracks = SavedTrack.PROVIDER.loadTracks();
            Iterator<SavedTrack> it = tracks.iterator();
            while (it.hasNext()) {
                SavedTrack track = it.next();
                Boolean lost = checkedFiles.get(track.file);
                if (lost == null) {
                    lost = Boolean.valueOf(!track.file.exists());
                    if (!lost.booleanValue() && VKAccountManager.getCurrent().isMusicRestricted()) {
                        track.file.delete();
                        lost = true;
                    }
                    checkedFiles.put(track.file, lost);
                }
                if (lost.booleanValue()) {
                    lostSet.add(track.getMid());
                }
            }
            return new LoadedTracks(tracks, lostSet);
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(LoadedTracks result) {
            super.onPostExecute((LoadTracksTask) result);
            SavedTracks.this.mLoadTracksTask = null;
            SavedTracks.this.mTracksList.clear();
            SavedTracks.this.mTracksList.addAll(result.midsList);
            Iterator<SavedTrack> it = result.midsList.iterator();
            while (it.hasNext()) {
                SavedTrack track = it.next();
                SavedTracks.this.mMidsSet.add(track.getMid());
            }
            SavedTracks.this.mLostMidsSet.addAll(result.lostMidsSet);
            if (this.mListener != null) {
                this.mListener.onSavedTracksLoaded();
            }
        }
    }

    /* loaded from: classes2.dex */
    public class SaveTracksTask extends AsyncTaskCompat<Void, Void, Void> {
        private final List<SavedTrack> mTracks;

        SaveTracksTask() {
            SavedTracks.this = r3;
            this.mTracks = new ArrayList(r3.mTracksList);
        }

        /* JADX WARN: Code restructure failed: missing block: B:69:0x0069, code lost:
            r3 = 0;
         */
        /* JADX WARN: Code restructure failed: missing block: B:71:0x0070, code lost:
            if (r3 >= r11.mTracks.size()) goto L32;
         */
        /* JADX WARN: Code restructure failed: missing block: B:72:0x0072, code lost:
            r5 = r11.mTracks.get(r3);
            r5.position = r3;
            r5.save();
         */
        /* JADX WARN: Code restructure failed: missing block: B:73:0x0083, code lost:
            if (isCancelled() == false) goto L29;
         */
        /* JADX WARN: Code restructure failed: missing block: B:75:0x0089, code lost:
            r3 = r3 + 1;
         */
        /* JADX WARN: Code restructure failed: missing block: B:76:0x008c, code lost:
            r0.setTransactionSuccessful();
         */
        /* JADX WARN: Code restructure failed: missing block: B:77:0x008f, code lost:
            r0.endTransaction();
            r2 = com.vkontakte.android.audio.player.SavedTracks.getFiles(com.vkontakte.android.audio.player.SavedTracks.this.mContext);
            r6 = com.vkontakte.android.audio.player.SavedTrack.PROVIDER.getAll().iterator();
         */
        /* JADX WARN: Code restructure failed: missing block: B:79:0x00aa, code lost:
            if (r6.hasNext() == false) goto L38;
         */
        /* JADX WARN: Code restructure failed: missing block: B:80:0x00ac, code lost:
            r2.remove(((com.vkontakte.android.audio.player.SavedTrack) r6.next()).file);
         */
        /* JADX WARN: Code restructure failed: missing block: B:81:0x00b8, code lost:
            r6 = r2.iterator();
         */
        /* JADX WARN: Code restructure failed: missing block: B:83:0x00c0, code lost:
            if (r6.hasNext() == false) goto L43;
         */
        /* JADX WARN: Code restructure failed: missing block: B:84:0x00c2, code lost:
            r1 = r6.next();
            r1.delete();
         */
        @Override // android.os.AsyncTask
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public java.lang.Void doInBackground(java.lang.Void... r12) {
            /*
                r11 = this;
                r10 = 0
                android.content.Context r6 = com.vkontakte.android.audio.MusicApp.getInstance()
                com.vkontakte.android.data.db.Database r6 = com.vkontakte.android.data.db.Database.getInst(r6)
                android.database.sqlite.SQLiteDatabase r0 = r6.getWritableDatabase()
                r0.beginTransaction()
                java.util.HashSet r4 = new java.util.HashSet     // Catch: java.lang.Throwable -> L33
                r4.<init>()     // Catch: java.lang.Throwable -> L33
                java.util.List<com.vkontakte.android.audio.player.SavedTrack> r6 = r11.mTracks     // Catch: java.lang.Throwable -> L33
                java.util.Iterator r6 = r6.iterator()     // Catch: java.lang.Throwable -> L33
            L1b:
                boolean r7 = r6.hasNext()     // Catch: java.lang.Throwable -> L33
                if (r7 == 0) goto L38
                java.lang.Object r5 = r6.next()     // Catch: java.lang.Throwable -> L33
                com.vkontakte.android.audio.player.SavedTrack r5 = (com.vkontakte.android.audio.player.SavedTrack) r5     // Catch: java.lang.Throwable -> L33
                long r8 = r5.getId()     // Catch: java.lang.Throwable -> L33
                java.lang.Long r7 = java.lang.Long.valueOf(r8)     // Catch: java.lang.Throwable -> L33
                r4.add(r7)     // Catch: java.lang.Throwable -> L33
                goto L1b
            L33:
                r6 = move-exception
                r0.endTransaction()
                throw r6
            L38:
                com.vkontakte.android.audio.player.SavedTrack$SavedTrackProvider r6 = com.vkontakte.android.audio.player.SavedTrack.PROVIDER     // Catch: java.lang.Throwable -> L33
                java.util.Collection r6 = r6.getAll()     // Catch: java.lang.Throwable -> L33
                java.util.Iterator r6 = r6.iterator()     // Catch: java.lang.Throwable -> L33
            L42:
                boolean r7 = r6.hasNext()     // Catch: java.lang.Throwable -> L33
                if (r7 == 0) goto L69
                java.lang.Object r5 = r6.next()     // Catch: java.lang.Throwable -> L33
                com.vkontakte.android.audio.player.SavedTrack r5 = (com.vkontakte.android.audio.player.SavedTrack) r5     // Catch: java.lang.Throwable -> L33
                long r8 = r5.getId()     // Catch: java.lang.Throwable -> L33
                java.lang.Long r7 = java.lang.Long.valueOf(r8)     // Catch: java.lang.Throwable -> L33
                boolean r7 = r4.contains(r7)     // Catch: java.lang.Throwable -> L33
                if (r7 != 0) goto L42
                r5.remove()     // Catch: java.lang.Throwable -> L33
                boolean r7 = r11.isCancelled()     // Catch: java.lang.Throwable -> L33
                if (r7 == 0) goto L42
                r0.endTransaction()
            L68:
                return r10
            L69:
                r3 = 0
            L6a:
                java.util.List<com.vkontakte.android.audio.player.SavedTrack> r6 = r11.mTracks     // Catch: java.lang.Throwable -> L33
                int r6 = r6.size()     // Catch: java.lang.Throwable -> L33
                if (r3 >= r6) goto L8c
                java.util.List<com.vkontakte.android.audio.player.SavedTrack> r6 = r11.mTracks     // Catch: java.lang.Throwable -> L33
                java.lang.Object r5 = r6.get(r3)     // Catch: java.lang.Throwable -> L33
                com.vkontakte.android.audio.player.SavedTrack r5 = (com.vkontakte.android.audio.player.SavedTrack) r5     // Catch: java.lang.Throwable -> L33
                r5.position = r3     // Catch: java.lang.Throwable -> L33
                r5.save()     // Catch: java.lang.Throwable -> L33
                boolean r6 = r11.isCancelled()     // Catch: java.lang.Throwable -> L33
                if (r6 == 0) goto L89
                r0.endTransaction()
                goto L68
            L89:
                int r3 = r3 + 1
                goto L6a
            L8c:
                r0.setTransactionSuccessful()     // Catch: java.lang.Throwable -> L33
                r0.endTransaction()
                com.vkontakte.android.audio.player.SavedTracks r6 = com.vkontakte.android.audio.player.SavedTracks.this
                android.content.Context r6 = com.vkontakte.android.audio.player.SavedTracks.access$1200(r6)
                java.util.HashSet r2 = com.vkontakte.android.audio.player.SavedTracks.access$1300(r6)
                com.vkontakte.android.audio.player.SavedTrack$SavedTrackProvider r6 = com.vkontakte.android.audio.player.SavedTrack.PROVIDER
                java.util.Collection r6 = r6.getAll()
                java.util.Iterator r6 = r6.iterator()
            La6:
                boolean r7 = r6.hasNext()
                if (r7 == 0) goto Lb8
                java.lang.Object r5 = r6.next()
                com.vkontakte.android.audio.player.SavedTrack r5 = (com.vkontakte.android.audio.player.SavedTrack) r5
                java.io.File r7 = r5.file
                r2.remove(r7)
                goto La6
            Lb8:
                java.util.Iterator r6 = r2.iterator()
            Lbc:
                boolean r7 = r6.hasNext()
                if (r7 == 0) goto L68
                java.lang.Object r1 = r6.next()
                java.io.File r1 = (java.io.File) r1
                r1.delete()
                goto Lbc
            */
            throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.audio.player.SavedTracks.SaveTracksTask.doInBackground(java.lang.Void[]):java.lang.Void");
        }

        @Override // android.os.AsyncTask
        public void onPostExecute(Void aVoid) {
            super.onPostExecute((SaveTracksTask) aVoid);
            SavedTracks.this.mSaveTracksTask = null;
            SavedTracks.this.notifySaveFinished();
        }
    }
}
