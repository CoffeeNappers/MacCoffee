package com.vkontakte.android.audio;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.ProgressCallback;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.api.audio.AudioSetBroadcast;
import com.vkontakte.android.audio.player.CacheUtils;
import com.vkontakte.android.audio.player.LoopMode;
import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.PlayerConnection;
import com.vkontakte.android.audio.player.PlayerConnectionListener;
import com.vkontakte.android.audio.player.PlayerIntents;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.audio.player.PlayerService;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.Prefs;
import com.vkontakte.android.audio.player.SavedTrack;
import com.vkontakte.android.audio.player.SavedTracks;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.audio.utils.BoundServiceConnectionSyncUtil;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public final class AudioFacade extends PlayerIntents {
    public static final String ACTION_USER_AUDIO_ADDED = Utils.formatAction(PlayerService.class, "USER_AUDIO_CHANGED");
    public static final String ACTION_USER_AUDIO_REMOVED = Utils.formatAction(PlayerService.class, "USER_AUDIO_CHANGED");
    public static final String ACTION_SHOW_PLAYER = Utils.formatAction(PlayerService.class, "SHOW_PLAYER");
    public static final String ACTION_PLAY_NEXT = Utils.formatAction(PlayerService.class, "PLAY_NEXT");
    public static final String ACTION_ADD_TO_PLAYLIST = Utils.formatAction(PlayerService.class, "ADD_TO_PLAYLIST");
    public static final String EXTRA_MID = Utils.formatExtra(PlayerService.class, "MID");
    public static final String EXTRA_MUSIC_FILES = Utils.formatExtra(PlayerService.class, "MUSIC_FILES");
    private static HashMap<OnConnectionListener, PlayerConnection> connectionHashMap = new HashMap<>();

    /* loaded from: classes2.dex */
    public interface OnConnectionListener {
        void onConnected();
    }

    private AudioFacade() {
    }

    public static void bind(Context ctx, @NonNull final OnConnectionListener o) {
        PlayerConnection connection = new PlayerConnection(new PlayerConnectionListener.PlayerConnectionListenerAdapter() { // from class: com.vkontakte.android.audio.AudioFacade.1
            @Override // com.vkontakte.android.audio.player.PlayerConnectionListener.PlayerConnectionListenerAdapter, com.vkontakte.android.audio.utils.BoundServiceConnection.BoundServiceConnectionListener
            public void onConnected() {
                OnConnectionListener onConnectionListener = OnConnectionListener.this;
                onConnectionListener.getClass();
                ViewUtils.runOnUiThread(AudioFacade$1$$Lambda$1.lambdaFactory$(onConnectionListener));
            }
        });
        connection.connect(ctx);
        connectionHashMap.put(o, connection);
    }

    public static void unbind(OnConnectionListener o) {
        PlayerConnection connection = connectionHashMap.get(o);
        if (connection != null && connection.isConnected()) {
            connection.disconnect();
        }
        connectionHashMap.remove(o);
    }

    public static void addPlayerListener(PlayerListener listener, boolean forceLastState) {
        AudioStateListener.inst.addPlayerListener(listener, forceLastState);
    }

    public static void removePlayerListener(PlayerListener listener) {
        AudioStateListener.inst.removePlayerListener(listener);
    }

    public static void addSavedTracksListener(SavedTracks.SavedTracksListener listener, boolean forceLastState) {
        AudioStateListener.inst.addSavedTracksListener(listener, forceLastState);
    }

    public static void removeSavedTracksListener(SavedTracks.SavedTracksListener listener) {
        AudioStateListener.inst.removeSavedTracksListener(listener);
    }

    public static void startDownloadTracks(final Collection<MusicTrack> tracks, final boolean showNotification) {
        if (tracks != null && !tracks.isEmpty()) {
            SavedTracks savedTracks = AudioStateListener.inst.getSavedTracks();
            if (savedTracks != null) {
                savedTracks.downloadTracks(tracks, showNotification);
                return;
            }
            PlayerConnection connection = new PlayerConnection(new PlayerConnectionListener.PlayerConnectionListenerAdapter() { // from class: com.vkontakte.android.audio.AudioFacade.2
                @Override // com.vkontakte.android.audio.player.PlayerConnectionListener.PlayerConnectionListenerAdapter, com.vkontakte.android.audio.utils.BoundServiceConnection.BoundServiceConnectionListener
                public void onConnected() {
                    SavedTracks savedTracks2 = reference[0].getSavedTracks();
                    if (savedTracks2 != null) {
                        savedTracks2.downloadTracks(tracks, showNotification);
                    }
                    reference[0].disconnect();
                }
            });
            final PlayerConnection[] reference = {connection};
            connection.connect(MusicApp.getInstance());
        }
    }

    public static boolean isCached(String mid) {
        SavedTracks savedTracks = AudioStateListener.inst.getSavedTracks();
        return savedTracks != null && savedTracks.isDownloaded(mid);
    }

    public static boolean isDownloading(String mid) {
        SavedTracks savedTracks = AudioStateListener.inst.getSavedTracks();
        return savedTracks != null && savedTracks.isDownloading(mid);
    }

    public static boolean toggleCurrentCachedState() {
        SavedTracks savedTracks = AudioStateListener.inst.getSavedTracks();
        PlayerTrack track = getCurrentTrack();
        if (savedTracks == null || track == null) {
            return false;
        }
        SavedTracks.DownloadState downloadState = savedTracks.getDownloadState(track.getMid());
        if (downloadState == SavedTracks.DownloadState.NONE) {
            savedTracks.downloadTrack(track, false);
            return true;
        }
        savedTracks.removeTracks(track.getMid());
        return true;
    }

    public static void removeCachedFile(String mid) {
        SavedTracks savedTracks = AudioStateListener.inst.getSavedTracks();
        if (savedTracks != null) {
            savedTracks.removeTracks(mid);
        }
    }

    public static List<SavedTrack> getSavedTracks() {
        SavedTracks savedTracks = AudioStateListener.inst.getSavedTracks();
        if (savedTracks != null) {
            return savedTracks.getTracks();
        }
        final List<SavedTrack>[] retListRef = new List[1];
        BoundServiceConnectionSyncUtil.Listener listener = new BoundServiceConnectionSyncUtil.Listener(new PlayerConnectionListener.PlayerConnectionListenerAdapter() { // from class: com.vkontakte.android.audio.AudioFacade.3
            @Override // com.vkontakte.android.audio.player.PlayerConnectionListener.PlayerConnectionListenerAdapter, com.vkontakte.android.audio.utils.BoundServiceConnection.BoundServiceConnectionListener
            public void onConnected() {
                SavedTracks savedTracks2 = reference[0].getSavedTracks();
                retListRef[0] = savedTracks2 == null ? Collections.emptyList() : savedTracks2.getTracks();
                reference[0].disconnect();
            }
        });
        PlayerConnection connection = new PlayerConnection(listener);
        final PlayerConnection[] reference = {connection};
        connection.connect(MusicApp.getInstance());
        BoundServiceConnectionSyncUtil.waitListenerFinished(listener);
        return retListRef[0];
    }

    @NonNull
    public static List<PlayerTrack> getActualTrackList() {
        Player player = AudioStateListener.inst.getPlayer();
        return player == null ? Collections.emptyList() : player.getActualTrackList();
    }

    public static int getActualTrackListSize() {
        Player player = AudioStateListener.inst.getPlayer();
        if (player == null) {
            return 0;
        }
        return player.getActualTrackListSize();
    }

    public static int getActualTrackIndex() {
        Player player = AudioStateListener.inst.getPlayer();
        if (player != null) {
            return player.getActualTrackIndex();
        }
        return -1;
    }

    public static void swapPlaylistTracks(PlayerTrack track1, PlayerTrack track2) {
        Player player = AudioStateListener.inst.getPlayer();
        if (player != null) {
            player.swap(track1.uuid, track2.uuid);
        }
    }

    public static void removePlaylistItem(String uuid) {
        Player player = AudioStateListener.inst.getPlayer();
        if (player != null) {
            player.removeTrack(uuid);
        }
    }

    public static void removePlaylistItem(int oid, int aid) {
        Player player = AudioStateListener.inst.getPlayer();
        if (player != null) {
            player.removeTrack(oid, aid);
        }
    }

    @Nullable
    public static PlayerTrack getCurrentTrack() {
        Player player = AudioStateListener.inst.getPlayer();
        if (player != null) {
            return player.getTrackInfo().getTrack();
        }
        return null;
    }

    @Nullable
    public static TrackInfo getCurrentTrackInfo() {
        Player player = AudioStateListener.inst.getPlayer();
        if (player != null) {
            return player.getTrackInfo();
        }
        return null;
    }

    public static boolean isCurrentTrack(int ownerId, int audioId) {
        MusicTrack musicTrack = getCurrentTrack();
        return musicTrack != null && musicTrack.oid == ownerId && musicTrack.aid == audioId;
    }

    public static void seekTo(int percentProgress) {
        Player player = AudioStateListener.inst.getPlayer();
        MusicTrack musicTrack = getCurrentTrack();
        if (player != null && musicTrack != null) {
            player.seekTo(musicTrack.duration * 10 * percentProgress);
        }
    }

    public static boolean enqueue(MusicTrack f) {
        Player player = AudioStateListener.inst.getPlayer();
        if (player == null || !canEnqueue(f)) {
            return false;
        }
        player.addTrack(f);
        return true;
    }

    public static boolean canEnqueue(MusicTrack f) {
        List<PlayerTrack> playerTracks = getActualTrackList();
        for (int i = playerTracks.size() - 1; i >= 0; i--) {
            if (playerTracks.get(i).equals(f)) {
                return false;
            }
        }
        return true;
    }

    public static void addToPlayNext(Context ctx, Collection<MusicTrack> f) {
        Intent intent = createIntent(ctx, ACTION_PLAY_NEXT);
        intent.putExtra(EXTRA_MUSIC_FILES, new ArrayList(f));
        ctx.startService(intent);
    }

    public static void addToPlaylist(Context ctx, ArrayList<MusicTrack> f) {
        Intent intent = createIntent(ctx, ACTION_ADD_TO_PLAYLIST);
        intent.putExtra(EXTRA_MUSIC_FILES, f);
        ctx.startService(intent);
    }

    public static Intent getShowPlayerIntent(Context context) {
        return createIntent(context, ACTION_SHOW_PLAYER);
    }

    public static void showPlayer() {
        Context context = MusicApp.getInstance();
        context.startService(getShowPlayerIntent(context));
    }

    @NonNull
    public static PlayerState getPlayerState() {
        return AudioStateListener.inst.getPlayerState();
    }

    public static void resumeIfPausedBySystem() {
        Prefs prefs = Prefs.getInstance(MusicApp.getInstance());
        if (getPlayerState() == PlayerState.PAUSED && prefs.pausedBySystem.mo473get().booleanValue()) {
            prefs.pausedBySystem.set((Boolean) false);
            resume();
        }
    }

    public static void pauseBySystem() {
        if (getPlayerState() == PlayerState.PLAYING) {
            Prefs.getInstance(MusicApp.getInstance()).pausedBySystem.set((Boolean) true);
            pause();
        }
    }

    public static LoopMode getLoopMode() {
        return Prefs.getInstance(MusicApp.getInstance()).loopMode.mo473get();
    }

    public static boolean isShuffle() {
        return Prefs.getInstance(MusicApp.getInstance()).shuffle.mo473get().booleanValue();
    }

    public static void playTrack(MusicTrack musicTrack, PlayerRefer refer, boolean isIgnoreShuffle) {
        ArrayList<MusicTrack> musicTracks = new ArrayList<>(1);
        musicTracks.add(musicTrack);
        playTracks(musicTracks, 0, refer, isIgnoreShuffle);
    }

    public static void playTracksShuffle(Collection<? extends MusicTrack> musicTracks, int index, PlayerRefer refer) {
        playTracks(musicTracks, index, refer, false, true);
    }

    public static void playTracks(Collection<? extends MusicTrack> musicTracks, int index, PlayerRefer refer, boolean isIgnoreShuffle) {
        playTracks(musicTracks, index, refer, isIgnoreShuffle, false);
    }

    private static void playTracks(final Collection<? extends MusicTrack> musicTracks, final int index, final PlayerRefer refer, boolean isIgnoreShuffle, final boolean shuffle) {
        Prefs prefs = Prefs.getInstance(MusicApp.getInstance());
        if (isIgnoreShuffle) {
            prefs.shuffle.set((Boolean) false);
        } else {
            prefs.shuffle.set(prefs.shuffleGlobal.mo473get());
        }
        if (musicTracks != null && !musicTracks.isEmpty()) {
            PlayerConnection connection = new PlayerConnection(new PlayerConnectionListener.PlayerConnectionListenerAdapter() { // from class: com.vkontakte.android.audio.AudioFacade.4
                @Override // com.vkontakte.android.audio.player.PlayerConnectionListener.PlayerConnectionListenerAdapter, com.vkontakte.android.audio.utils.BoundServiceConnection.BoundServiceConnectionListener
                public void onConnected() {
                    Player player = reference[0].getPlayer();
                    if (player != null) {
                        if (shuffle) {
                            player.setTracksAndPlayShuffle(musicTracks, refer);
                        } else {
                            player.setTracksAndPlay(musicTracks, index, refer);
                        }
                    }
                    reference[0].disconnect();
                }
            });
            final PlayerConnection[] reference = {connection};
            connection.connect(MusicApp.getInstance());
        }
    }

    public static void setBroadcast(ArrayList<Integer> targets) {
        MusicTrack currentFile = getCurrentTrack();
        if (currentFile != null) {
            ArrayList<Integer> prev = getBroadcastTargets();
            ArrayList<Integer> enable = new ArrayList<>();
            ArrayList<Integer> disable = new ArrayList<>();
            Iterator<Integer> it = targets.iterator();
            while (it.hasNext()) {
                int id = it.next().intValue();
                if (!prev.contains(Integer.valueOf(id))) {
                    enable.add(Integer.valueOf(id));
                }
            }
            Iterator<Integer> it2 = prev.iterator();
            while (it2.hasNext()) {
                int id2 = it2.next().intValue();
                if (!targets.contains(Integer.valueOf(id2))) {
                    disable.add(Integer.valueOf(id2));
                }
            }
            L.i("vk", "Set broadcast: enable=", enable, ", disable=", disable);
            MusicApp.getInstance().getSharedPreferences(null, 0).edit().putString("audio_broadcast", TextUtils.join(",", targets)).apply();
            if (enable.size() > 0) {
                new AudioSetBroadcast(currentFile, enable).exec();
            }
            if (disable.size() > 0) {
                new AudioSetBroadcast(null, disable).exec();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void updateBroadcast() {
        ArrayList<Integer> t = getBroadcastTargets();
        MusicTrack musicTrack = getCurrentTrack();
        if (t.size() != 0 && musicTrack != null) {
            new AudioSetBroadcast(musicTrack, t).exec();
        }
    }

    public static ArrayList<Integer> getBroadcastTargets() {
        ArrayList<Integer> result = new ArrayList<>();
        String s = MusicApp.getInstance().getSharedPreferences(null, 0).getString("audio_broadcast", "");
        String[] ss = s.split(",");
        for (String id : ss) {
            try {
                result.add(Integer.valueOf(Integer.parseInt(id)));
            } catch (Exception e) {
            }
        }
        return result;
    }

    public static boolean isBroadcast() {
        return getBroadcastTargets().size() > 0;
    }

    public static void sendUserAudioAdded(MusicTrack musicTrack) {
        Intent intent = new Intent(ACTION_USER_AUDIO_ADDED).putExtra(EXTRA_MUSIC_FILES, musicTrack);
        MusicApp.getInstance().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    private static void sendUserAudioRemoved(String mid) {
        Intent intent = new Intent(ACTION_USER_AUDIO_REMOVED).putExtra(EXTRA_MID, mid);
        MusicApp.getInstance().sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void saveTrackIfAutoSaveEnable(TrackInfo trackInfo) {
        if (trackInfo.getTrack().oid == VKAccountManager.getCurrent().getUid() && isAudioCacheEnable()) {
            startDownloadTracks((MusicTrack) trackInfo.getTrack(), false);
        }
    }

    /* loaded from: classes2.dex */
    public enum StorageType {
        internal("internal"),
        sdCard("sdCard");
        
        public final String nameForPreference;

        StorageType(String nameForPreference) {
            this.nameForPreference = nameForPreference;
        }

        public static StorageType parseFromPreferences(String value) {
            String value2 = String.valueOf(value);
            char c = 65535;
            switch (value2.hashCode()) {
                case -908169983:
                    if (value2.equals("sdCard")) {
                        c = 1;
                        break;
                    }
                    break;
                case 570410685:
                    if (value2.equals("internal")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    return internal;
                case 1:
                    return sdCard;
                default:
                    return Utils.isSdCardPath(value2) ? sdCard : internal;
            }
        }

        public static Map<StorageType, File> getFileMap() {
            Map<StorageType, File> map = new HashMap<>();
            for (File file : SavedTracks.getDownloadDirectories(MusicApp.getInstance())) {
                if (Utils.isSdCardPath(file)) {
                    map.put(sdCard, file);
                } else {
                    map.put(internal, file);
                }
            }
            return map;
        }
    }

    public static void move(StorageType from, StorageType to, ProgressCallback pc) throws IOException {
        Map<StorageType, File> map = StorageType.getFileMap();
        File fromDir = map.get(from);
        File toDir = map.get(to);
        if (from == null || toDir == null) {
            pc.onFinished();
            return;
        }
        if (Build.VERSION.SDK_INT >= 19) {
            MusicApp.getInstance().getExternalFilesDirs(null);
        }
        toDir.mkdirs();
        File[] srcList = fromDir.listFiles();
        if (srcList == null) {
            pc.onFinished();
            return;
        }
        pc.onSetMaxValue(srcList.length);
        List<SavedTrack> savedTracks = SavedTrack.PROVIDER.loadTracks();
        Map<File, SavedTrack> savedTrackMap = new HashMap<>();
        for (SavedTrack savedTrack : savedTracks) {
            savedTrackMap.put(savedTrack.file, savedTrack);
        }
        int i = 0;
        for (File f : srcList) {
            if (f.getName().endsWith(".encoded")) {
                File df = new File(toDir, f.getName());
                Utils.replaceFile(f, df, false);
                SavedTrack savedTrack2 = savedTrackMap.get(f);
                if (savedTrack2 != null) {
                    savedTrack2.file = df;
                    savedTrack2.save();
                }
                i++;
                pc.onProgressUpdated(i);
            }
        }
        pc.onFinished();
    }

    public static File getTrackTmpFile(String mid) {
        File cacheDir = CacheUtils.getCacheDir(MusicApp.getInstance());
        File file = new File(cacheDir, Utils.stringToFileName(mid));
        if (mid == null || "null".equals(mid)) {
            file.delete();
        }
        return file;
    }

    public static File getTrackDownloadFile(int oid, int aid) {
        return getTrackDownloadFile(MusicTrack.generateMid(oid, aid));
    }

    public static File getTrackDownloadFile(String mid) {
        return getFile(mid, "encoded");
    }

    private static File getFile(String mid, String suffix) {
        if (TextUtils.isEmpty(mid)) {
            return null;
        }
        String path = PreferenceManager.getDefaultSharedPreferences(MusicApp.getInstance()).getString("audioCacheLocation", "");
        StorageType storageType = StorageType.parseFromPreferences(path);
        Map<StorageType, File> fileMap = StorageType.getFileMap();
        File dir = fileMap.get(storageType);
        if (dir == null) {
            dir = fileMap.get(StorageType.internal);
        }
        if (dir == null) {
            dir = fileMap.get(StorageType.sdCard);
        }
        if (dir != null) {
            return new File(dir, Utils.stringToFileName(mid) + "." + suffix);
        }
        return null;
    }

    public static boolean deleteAudio(MusicTrack musicTrack) {
        boolean ret = false;
        Player player = AudioStateListener.inst.getPlayer();
        if (player != null) {
            PlayerTrack playerTrack = player.getTrackInfo().getTrack();
            if (com.vkontakte.android.utils.Utils.equals(musicTrack, playerTrack)) {
                if (player.getTrackCount() == 1) {
                    player.stop();
                    ret = true;
                } else {
                    player.playNext();
                }
            }
            sendUserAudioRemoved(musicTrack.getMid());
            SavedTracks savedTracks = AudioStateListener.inst.getSavedTracks();
            if (savedTracks != null) {
                savedTracks.removeTracks(musicTrack.getMid());
            }
            player.removeTrack(musicTrack.oid, musicTrack.aid);
        }
        return ret;
    }

    public static boolean isAudioCacheEnable() {
        return !VKAccountManager.getCurrent().isMusicRestricted() && PreferenceManager.getDefaultSharedPreferences(MusicApp.getInstance()).getBoolean("enableAudioCache", true);
    }
}
