package com.vkontakte.android.audio;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.Prefs;
import com.vkontakte.android.audio.player.SavedTracks;
import com.vkontakte.android.audio.player.TrackInfo;
import java.lang.ref.WeakReference;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes2.dex */
public class AudioStateListener implements PlayerListener, SavedTracks.SavedTracksListener {
    public static final AudioStateListener inst = new AudioStateListener();
    private List<PlayerTrack> list;
    private PlayerState playerState;
    private TrackInfo trackInfo;
    private WeakReference<Player> player = null;
    private WeakReference<SavedTracks> savedTracks = null;
    private volatile String lastBufferedMid = null;
    private volatile int lastBufferedPercent = -1;
    private volatile Set<PlayerListener> mPlayerListeners = new HashSet();
    private volatile Set<SavedTracks.SavedTracksListener> mSavedTracksListeners = new HashSet();
    private Runnable notifyOnStateChanged = AudioStateListener$$Lambda$1.lambdaFactory$(this);
    private Runnable notifyOnTrackListChanged = AudioStateListener$$Lambda$2.lambdaFactory$(this);
    private Runnable notifyOnProgress = AudioStateListener$$Lambda$3.lambdaFactory$(this);
    private Runnable notifyOnBufferingProgress = AudioStateListener$$Lambda$4.lambdaFactory$(this);
    private Runnable notifyOnSavedTracksChanged = AudioStateListener$$Lambda$5.lambdaFactory$(this);

    private AudioStateListener() {
    }

    public void onCreatePlayer(@NonNull Player player) {
        this.player = new WeakReference<>(player);
        this.playerState = player.getState();
        this.trackInfo = player.getTrackInfo();
        this.list = player.getTrackList();
        notifyOnStateChanged();
        notifyOnParametersChanged(player);
        notifyOnBufferingProgress();
        notifyOnProgress();
        notifyOnTrackListChanged();
    }

    public void onDestroyPlayer() {
        this.player = null;
    }

    public void onLoadSavedTracks(SavedTracks savedTracks) {
        this.savedTracks = new WeakReference<>(savedTracks);
        onSavedTracksChanged();
    }

    public void onUnloadSavedTracks() {
        this.savedTracks = null;
    }

    @NonNull
    public PlayerState getPlayerState() {
        return this.playerState == null ? PlayerState.IDLE : this.playerState;
    }

    @Nullable
    public TrackInfo getTrackInfo() {
        return this.trackInfo;
    }

    @Nullable
    public List<PlayerTrack> getList() {
        return this.list;
    }

    @Nullable
    public Player getPlayer() {
        WeakReference<Player> weakReference = this.player;
        if (weakReference == null) {
            return null;
        }
        return weakReference.get();
    }

    @Nullable
    public SavedTracks getSavedTracks() {
        WeakReference<SavedTracks> weakReference = this.savedTracks;
        if (weakReference == null) {
            return null;
        }
        return weakReference.get();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addPlayerListener(PlayerListener listener, boolean forceLastState) {
        Set<PlayerListener> playerListeners = new HashSet<>(this.mPlayerListeners);
        playerListeners.add(listener);
        this.mPlayerListeners = playerListeners;
        if (forceLastState) {
            if (this.trackInfo != null) {
                listener.onBufferingProgress(this.trackInfo);
                listener.onProgress(this.trackInfo);
            }
            if (this.trackInfo != null && this.playerState != null) {
                listener.onStateChanged(this.playerState, this.trackInfo);
            }
            if (this.list != null) {
                listener.onTrackListChanged(this.list);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void removePlayerListener(PlayerListener listener) {
        Set<PlayerListener> playerListeners = new HashSet<>(this.mPlayerListeners);
        playerListeners.remove(listener);
        this.mPlayerListeners = playerListeners;
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onStateChanged(PlayerState playerState, TrackInfo trackInfo) {
        Prefs prefs = Prefs.getInstance(MusicApp.getInstance());
        if (playerState == PlayerState.PLAYING && prefs.pausedBySystem.mo473get().booleanValue()) {
            prefs.pausedBySystem.set((Boolean) false);
        }
        this.playerState = playerState;
        this.trackInfo = trackInfo;
        notifyOnStateChanged();
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onTrackListChanged(List<PlayerTrack> list) {
        this.list = list;
        notifyOnTrackListChanged();
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onProgress(TrackInfo trackInfo) {
        this.trackInfo = trackInfo;
        notifyOnProgress();
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onBufferingProgress(TrackInfo trackInfo) {
        if (trackInfo.hasTrack()) {
            if (!TextUtils.equals(this.lastBufferedMid, trackInfo.getTrack().getMid()) || this.lastBufferedPercent != trackInfo.getBufferingPercent()) {
                this.lastBufferedMid = trackInfo.getTrack().getMid();
                this.lastBufferedPercent = trackInfo.getBufferingPercent();
                if (trackInfo.getBufferingPercent() == 100) {
                    AudioFacade.saveTrackIfAutoSaveEnable(trackInfo);
                }
                this.trackInfo = trackInfo;
                notifyOnBufferingProgress();
            }
        }
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onParametersChanged(Player player) {
        notifyOnParametersChanged(player);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0() {
        Set<PlayerListener> playerListeners = this.mPlayerListeners;
        PlayerState playerState = this.playerState;
        TrackInfo trackInfo = this.trackInfo;
        for (PlayerListener listener : playerListeners) {
            listener.onStateChanged(playerState, trackInfo);
        }
    }

    private void notifyOnStateChanged() {
        ViewUtils.removeCallbacks(this.notifyOnStateChanged);
        ViewUtils.runOnUiThread(this.notifyOnStateChanged);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1() {
        Set<PlayerListener> playerListeners = this.mPlayerListeners;
        for (PlayerListener listener : playerListeners) {
            listener.onTrackListChanged(this.list);
        }
    }

    private void notifyOnTrackListChanged() {
        ViewUtils.removeCallbacks(this.notifyOnTrackListChanged);
        ViewUtils.runOnUiThread(this.notifyOnTrackListChanged);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$2() {
        Set<PlayerListener> playerListeners = this.mPlayerListeners;
        TrackInfo trackInfo = this.trackInfo;
        for (PlayerListener listener : playerListeners) {
            listener.onProgress(trackInfo);
        }
    }

    private void notifyOnProgress() {
        ViewUtils.removeCallbacks(this.notifyOnProgress);
        ViewUtils.runOnUiThread(this.notifyOnProgress);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$3() {
        Set<PlayerListener> playerListeners = this.mPlayerListeners;
        TrackInfo trackInfo = this.trackInfo;
        for (PlayerListener listener : playerListeners) {
            listener.onBufferingProgress(trackInfo);
        }
    }

    private void notifyOnBufferingProgress() {
        ViewUtils.removeCallbacks(this.notifyOnBufferingProgress);
        ViewUtils.runOnUiThread(this.notifyOnBufferingProgress);
    }

    private void notifyOnParametersChanged(Player player) {
        Runnable runnable = AudioStateListener$$Lambda$6.lambdaFactory$(this, player);
        ViewUtils.runOnUiThread(runnable);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$notifyOnParametersChanged$4(Player player) {
        Set<PlayerListener> playerListeners = this.mPlayerListeners;
        for (PlayerListener listener : playerListeners) {
            listener.onParametersChanged(player);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addSavedTracksListener(SavedTracks.SavedTracksListener listener, boolean forceLastState) {
        Set<SavedTracks.SavedTracksListener> savedTracksListeners = new HashSet<>(this.mSavedTracksListeners);
        savedTracksListeners.add(listener);
        this.mSavedTracksListeners = savedTracksListeners;
        if (forceLastState) {
            listener.onSavedTracksChanged();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void removeSavedTracksListener(SavedTracks.SavedTracksListener listener) {
        Set<SavedTracks.SavedTracksListener> savedTracksListeners = new HashSet<>(this.mSavedTracksListeners);
        savedTracksListeners.remove(listener);
        this.mSavedTracksListeners = savedTracksListeners;
    }

    @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
    public void onSavedTracksChanged() {
        notifyOnSavedTracksChanged();
    }

    @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
    public void onSavedTracksSaved() {
        notifyOnSavedTracksSaved();
    }

    @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
    public void onDownloadStarted() {
        notifyOnDownloadStarted();
    }

    @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
    public void onDownloadFinished(boolean completed) {
        notifyOnDownloadFinished(completed);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$5() {
        Set<SavedTracks.SavedTracksListener> savedTracksListeners = this.mSavedTracksListeners;
        for (SavedTracks.SavedTracksListener listener : savedTracksListeners) {
            listener.onSavedTracksChanged();
        }
    }

    private void notifyOnSavedTracksChanged() {
        ViewUtils.removeCallbacks(this.notifyOnSavedTracksChanged);
        ViewUtils.runOnUiThread(this.notifyOnSavedTracksChanged);
    }

    private void notifyOnSavedTracksSaved() {
        Set<SavedTracks.SavedTracksListener> savedTracksListeners = this.mSavedTracksListeners;
        for (SavedTracks.SavedTracksListener listener : savedTracksListeners) {
            listener.onSavedTracksSaved();
        }
    }

    private void notifyOnDownloadStarted() {
        Set<SavedTracks.SavedTracksListener> savedTracksListeners = this.mSavedTracksListeners;
        for (SavedTracks.SavedTracksListener listener : savedTracksListeners) {
            listener.onDownloadStarted();
        }
    }

    private void notifyOnDownloadFinished(boolean completed) {
        Set<SavedTracks.SavedTracksListener> savedTracksListeners = this.mSavedTracksListeners;
        for (SavedTracks.SavedTracksListener listener : savedTracksListeners) {
            listener.onDownloadFinished(completed);
        }
    }
}
