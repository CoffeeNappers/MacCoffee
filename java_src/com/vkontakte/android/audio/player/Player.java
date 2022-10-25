package com.vkontakte.android.audio.player;

import android.database.sqlite.SQLiteDatabase;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import android.widget.Toast;
import com.coremedia.iso.boxes.UserBox;
import com.facebook.common.util.UriUtil;
import com.vk.core.util.Preference;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.MusicApp;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.PlayerAction;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.audio.player.ads.AdPlayerHelper;
import com.vkontakte.android.audio.player.proxy.PlayerProxy;
import com.vkontakte.android.audio.utils.AsyncTaskCompat;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.utils.L;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class Player {
    private static final long ERROR_TIMEOUT = 5000;
    private static final int INDEX_AD = 1;
    private static final int INDEX_CONTENT = 0;
    static final String LOG_PREFIX = "Player";
    private static final int MAX_ERRORS_TO_STOP = 3;
    private static final int MSG_BUFFERING = 4;
    private static final int MSG_PARAMETERS_CHANGED = 5;
    private static final int MSG_PROGRESS = 3;
    private static final int MSG_STATE_CHANGED = 1;
    private static final int MSG_TRACKS_CHANGED = 2;
    private static final long NEXT_PREV_TIMEOUT = 300;
    public static final int PLAY_RESUME_ON_FOCUS_GAIN_DELAY_MILLIS = 1500;
    private static final long REWIND_PREV_POSITION_THRESHOLD = 5000;
    private static final long TOAST_DELAY = 1000;
    private final ErrorHandler mErrorHandler;
    private FocusListener mFocusListener;
    private final Handler mHandler;
    private long mLastNextPrevTime;
    private final Set<PlayerListener> mListeners;
    private LoadTracksTask mLoadTracksTask;
    @NonNull
    private final MediaPlayerHelperI mPlayer;
    private boolean mReleased;
    private final PlayerService mService;
    private final MediaSessionHelper mSession;
    private Tracks mShuffleTracks;
    private final TrackInfo mTrackInfo;
    private final Tracks mTracks;
    private boolean mTracksLocked;
    private MediaPlayerHelperI.Type mType;
    private AudioStatSender mAudioStatSender = new AudioStatSender();
    private PlayerRefer refer = null;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface OnLoadedListener {
        void onPlayerLoaded();
    }

    public long getTodayListeningTimeSec() {
        return this.mAudioStatSender.getTodayListeningTimeSec();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Player(final PlayerService service, OnLoadedListener onLoadedListener, MediaPlayerHelperI.Type type) {
        this.mService = service;
        this.mType = type;
        if (VKAccountManager.getCurrent().isAudioAdAvailable()) {
            this.mPlayer = new AdPlayerHelper(type, service, 0, 1, new MyPlayerHelperListener());
        } else {
            this.mPlayer = MediaPlayerHelperI.Factory.get(type, service, 0, new MyPlayerHelperListener());
        }
        this.mListeners = new HashSet();
        this.mTracks = new Tracks();
        this.mTrackInfo = new TrackInfo(2, new TrackInfo.TrackInfoProvider() { // from class: com.vkontakte.android.audio.player.Player.1
            @Override // com.vkontakte.android.audio.player.TrackInfo.TrackInfoProvider
            public String getTitle(TrackInfo trackInfo, int currentIndex) {
                switch (currentIndex) {
                    case 1:
                        return service.getString(R.string.audio_ad_title);
                    default:
                        return trackInfo.hasTrack() ? trackInfo.getTrack().title : "";
                }
            }

            @Override // com.vkontakte.android.audio.player.TrackInfo.TrackInfoProvider
            public String getSubtitle(TrackInfo trackInfo, int currentIndex) {
                switch (currentIndex) {
                    case 1:
                        MediaPlayerHelperI helperI = Player.this.mPlayer;
                        return helperI instanceof AdPlayerHelper ? ((AdPlayerHelper) helperI).getAdText() : "";
                    default:
                        return trackInfo.hasTrack() ? trackInfo.getTrack().artist : "";
                }
            }

            @Override // com.vkontakte.android.audio.player.TrackInfo.TrackInfoProvider
            public PlayerAction[] getActions(TrackInfo trackInfo, int currentIndex) {
                switch (currentIndex) {
                    case 1:
                        MediaPlayerHelperI helperI = Player.this.mPlayer;
                        if (!(helperI instanceof AdPlayerHelper)) {
                            return null;
                        }
                        return ((AdPlayerHelper) helperI).getPlayerActions();
                    default:
                        return null;
                }
            }

            @Override // com.vkontakte.android.audio.player.TrackInfo.TrackInfoProvider
            public boolean isContentMode(TrackInfo trackInfo, int currentIndex) {
                return currentIndex == 0;
            }
        });
        this.mTrackInfo.setCurrentIndex(0);
        this.mErrorHandler = new ErrorHandler();
        this.mSession = new MediaSessionHelper(service, this);
        this.mHandler = new Handler(new HandlerCallback());
        this.mLoadTracksTask = new LoadTracksTask(onLoadedListener);
        this.mLoadTracksTask.executeQuick(new Void[0]);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void release() {
        this.mReleased = true;
        this.mHandler.removeCallbacksAndMessages(null);
        this.mSession.release();
        this.mPlayer.release();
        this.mListeners.clear();
        saveTracksState();
        this.mTrackInfo.clear(false);
        this.mAudioStatSender.release();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void saveTracksState() {
        if (this.mTrackInfo.hasTrack()) {
            JSONObject json = new JSONObject();
            try {
                json.put(UserBox.TYPE, this.mTrackInfo.getTrack().uuid);
                json.put("duration", this.mTrackInfo.getDuration(0));
                json.put("position", this.mTrackInfo.getPosition(0));
                L.v(LOG_PREFIX, "Saving track state: " + this.mTrackInfo.getTrack().uuid);
                Prefs.getInstance(this.mService).stoppedTrackInfo.set(json.toString());
            } catch (JSONException e) {
                throw new RuntimeException(e);
            }
        } else {
            Prefs.getInstance(this.mService).stoppedTrackInfo.remove();
        }
        if (this.mLoadTracksTask != null) {
            this.mLoadTracksTask.cancel(true);
            this.mLoadTracksTask = null;
            return;
        }
        new SaveTracksTask().executeQuick(new Void[0]);
    }

    public void stop(boolean reset) {
        abandonAudioFocus();
        this.mPlayer.stop();
        if (reset) {
            this.mTrackInfo.clear(false);
        } else {
            this.mTrackInfo.clearBuffering();
        }
        notifyStateChanged();
    }

    public void stop() {
        stop(false);
    }

    public void play(String uuid) {
        play(uuid, false);
    }

    public void play(String uuid, boolean preserveState) {
        play(uuid, preserveState, false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void play(String uuid, boolean preserveState, boolean clearPreserveProgress) {
        boolean z = true;
        PlayerTrack track = getTrack(uuid);
        PlayerState state = this.mPlayer.getState();
        int errorResId = R.string.music_player_error_unable_to_play;
        Object[] objects = null;
        if (track != null) {
            File file = CacheUtils.getLoadedTmpFile(track.getMid());
            if (file == null) {
                file = this.mService.getSavedTracks().getTrackFile(track.getMid());
            }
            if (file == null || this.mService.getSavedTracks().checkFileLost(file)) {
                if (track.getRestrictionType() == 0) {
                    errorResId = playUrl(track, track.url, this.refer);
                } else {
                    switch (track.getRestrictionType()) {
                        case 1:
                            errorResId = R.string.audio_restricted_withdrawn;
                            objects = new Object[]{track.title};
                            break;
                        case 2:
                            errorResId = R.string.audio_restricted_location;
                            objects = new Object[]{track.title};
                            break;
                    }
                }
            } else {
                errorResId = playFile(track, file, this.refer);
            }
        }
        if (errorResId == 0 || errorResId == R.string.audio_restricted_location || errorResId == R.string.audio_restricted_withdrawn) {
            requestAudioFocus();
            boolean preserveProgress = this.mTrackInfo.hasTrack() && TextUtils.equals(this.mTrackInfo.getTrack().getUniqueId(), track.getUniqueId());
            TrackInfo trackInfo = this.mTrackInfo;
            if (!preserveProgress || clearPreserveProgress) {
                z = false;
            }
            trackInfo.clear(z);
            this.mTrackInfo.setTrack(track);
            cacheNextTracks();
            if (preserveState) {
                switch (state) {
                    case STOPPED:
                        this.mPlayer.stop();
                        break;
                    case PAUSED:
                        this.mPlayer.pause();
                        break;
                }
            }
            notifyStateChanged();
            if (errorResId == R.string.audio_restricted_location || errorResId == R.string.audio_restricted_withdrawn) {
                this.mErrorHandler.error(errorResId, objects);
                return;
            }
            return;
        }
        this.mErrorHandler.error(errorResId, objects);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean playNext(boolean checkTimeout) {
        boolean preserveState;
        if (!checkTimeout || SystemClock.uptimeMillis() >= this.mLastNextPrevTime + NEXT_PREV_TIMEOUT) {
            PlayerTrack track = getNextTrack(null);
            this.mTrackInfo.clear(false);
            if (track == null) {
                track = getPlayTracks().get(0);
                stop();
                preserveState = true;
            } else {
                preserveState = false;
            }
            if (track == null) {
                return false;
            }
            this.mLastNextPrevTime = SystemClock.uptimeMillis();
            play(track.uuid, preserveState);
            return true;
        }
        return false;
    }

    public boolean playNext() {
        return !this.mPlayer.tryNext() && playNext(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean playPrev() {
        PlayerTrack track;
        if (SystemClock.uptimeMillis() >= this.mLastNextPrevTime + NEXT_PREV_TIMEOUT && ((!this.mTrackInfo.hasTrack() || this.mTrackInfo.getPosition() <= 5000 || !rewind()) && (track = getPrevTrack(null, true)) != null)) {
            this.mLastNextPrevTime = SystemClock.uptimeMillis();
            play(track.uuid, true);
            return true;
        }
        return false;
    }

    public boolean rewind() {
        return this.mPlayer.rewind();
    }

    public void seekTo(int millis) {
        if (this.mPlayer.seekTo(millis)) {
            this.mTrackInfo.setPosition(this.mPlayer.getId(), millis);
            notifyProgress();
        }
    }

    public boolean resume() {
        if (this.mPlayer.resume()) {
            requestAudioFocus();
            notifyStateChanged();
            return true;
        }
        return false;
    }

    public boolean pause() {
        if (this.mFocusListener != null) {
            this.mFocusListener.resetPaused();
        }
        if (this.mPlayer.pause()) {
            notifyStateChanged();
            return true;
        }
        return false;
    }

    public boolean toggleResumePause() {
        switch (this.mPlayer.getState()) {
            case STOPPED:
            case IDLE:
                if (this.mTrackInfo.hasTrack()) {
                    play(this.mTrackInfo.getTrack().uuid);
                } else {
                    playNext();
                }
                return true;
            case PLAYING:
                return pause();
            case PAUSED:
                return resume();
            default:
                return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public LoopMode getLoopMode() {
        return Prefs.getInstance(this.mService).loopMode.mo473get();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setLoopMode(LoopMode mode) {
        Prefs.getInstance(this.mService).loopMode.set((Preference.PreferenceEnum<LoopMode>) mode);
        notifyParametersChanged();
    }

    public void toggleLoopMode() {
        int ordinal = getLoopMode().ordinal();
        setLoopMode(LoopMode.VALUES[(ordinal + 1) % LoopMode.VALUES.length]);
    }

    public boolean isShuffle() {
        return Prefs.getInstance(this.mService).shuffle.mo473get().booleanValue();
    }

    public void setShuffle(boolean shuffle) {
        Prefs.getInstance(this.mService).shuffle.set(Boolean.valueOf(shuffle));
        Prefs.getInstance(this.mService).shuffleGlobal.set(Boolean.valueOf(shuffle));
        shuffleIfNeeded(true, false);
        notifyParametersChanged();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void toggleShuffle() {
        setShuffle(!isShuffle());
    }

    private int playUrl(MusicTrack track, String url, MediaPlayerHelperI.Refer refer) {
        L.d("PlayerService", LOG_PREFIX, "playUrl", url);
        if (track != null && !TextUtils.isEmpty(track.getMid())) {
            try {
                this.mPlayer.play(track, this.mType.createHttpUrl(track, url), refer);
                return 0;
            } catch (IOException e) {
                L.e(e, new Object[0]);
            }
        }
        return Utils.isNetworkAvailable(this.mService) ? R.string.music_player_error_unable_to_play : R.string.music_player_error_no_connection;
    }

    private int playFile(MusicTrack track, File file, MediaPlayerHelperI.Refer refer) {
        L.d("PlayerService", LOG_PREFIX, "playFile", UriUtil.LOCAL_FILE_SCHEME, file);
        try {
            this.mPlayer.play(track, this.mType.createFileUrl(track, file.toURI().toString()), refer);
            return 0;
        } catch (IOException e) {
            L.e(e, new Object[0]);
            return R.string.music_player_error_unable_to_play;
        }
    }

    private void cacheNextTracks() {
        MusicTrack track1;
        if (this.mTrackInfo.hasTrack() && (track1 = getNextTrack(this.mTrackInfo.getTrack().uuid)) != null) {
            ArrayList<MusicTrack> tracks = new ArrayList<>(1);
            if (!this.mService.getSavedTracks().isDownloaded(track1.getMid())) {
                tracks.add(track1);
            }
            if (!tracks.isEmpty()) {
                PlayerProxy.cache(this.mService, (MusicTrack[]) tracks.toArray(new MusicTrack[tracks.size()]));
            }
        }
    }

    public void addTrack(MusicTrack track) {
        checkTracksLock();
        this.mTracks.add(new PlayerTrack(track));
        shuffleIfNeeded(true, true);
        notifyTracksChanged();
    }

    public void addTracks(Collection<MusicTrack> tracks) {
        checkTracksLock();
        for (MusicTrack track : tracks) {
            this.mTracks.add(new PlayerTrack(track));
        }
        shuffleIfNeeded(true, true);
        notifyTracksChanged();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addTrackToNext(List<MusicTrack> tracks) {
        checkTracksLock();
        String uuid = this.mTrackInfo.hasTrack() ? this.mTrackInfo.getTrack().uuid : null;
        if (tracks != null) {
            for (MusicTrack track : tracks) {
                this.mTracks.add(new PlayerTrack(track), uuid);
            }
        }
        shuffleIfNeeded(true, true);
        notifyTracksChanged();
    }

    public void setTracksAndPlayShuffle(Collection<? extends MusicTrack> tracks, PlayerRefer refer) {
        String uuid = null;
        if (this.mPlayer.canPlay()) {
            setShuffle(true);
            checkTracksLock();
            this.mTracks.clear();
            for (MusicTrack track : tracks) {
                this.mTracks.add(new PlayerTrack(track));
            }
            shuffleIfNeeded(null);
            notifyTracksChanged();
            if (!tracks.isEmpty()) {
                uuid = getPlayTracks().get(0).uuid;
            }
            if (!tracks.isEmpty()) {
                this.refer = refer;
                play(uuid);
                return;
            }
            stop();
        }
    }

    public void setTracksAndPlay(Collection<? extends MusicTrack> tracks, int index, PlayerRefer refer) {
        Set set = null;
        if (this.mPlayer.canPlay()) {
            checkTracksLock();
            this.mTracks.clear();
            for (MusicTrack track : tracks) {
                this.mTracks.add(new PlayerTrack(track));
            }
            String uuid = index >= 0 ? this.mTracks.get(index).uuid : null;
            if (uuid != null) {
                set = Collections.singleton(uuid);
            }
            shuffleIfNeeded(set);
            notifyTracksChanged();
            if (index >= 0) {
                this.refer = refer;
                play(uuid);
                return;
            }
            stop();
        }
    }

    public void removeTrack(String uuid) {
        checkTracksLock();
        this.mTracks.remove(uuid);
        if (this.mShuffleTracks != null) {
            this.mShuffleTracks.remove(uuid);
        }
        notifyTracksChanged();
    }

    public void removeTrack(int oid, int aid) {
        checkTracksLock();
        this.mTracks.remove(oid, aid);
        if (this.mShuffleTracks != null) {
            this.mShuffleTracks.remove(oid, aid);
        }
        notifyTracksChanged();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clearTracks() {
        checkTracksLock();
        this.mTracks.clear();
        shuffleIfNeeded(false, false);
        notifyTracksChanged();
    }

    public PlayerTrack getTrack(String uuid) {
        return this.mTracks.get(uuid);
    }

    public PlayerTrack getTrack(int index) {
        return this.mTracks.get(index);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public PlayerTrack getFirstTrack() {
        return getPlayTracks().getFirst();
    }

    private PlayerTrack getLastTrack() {
        return getPlayTracks().getLast();
    }

    private PlayerTrack getNextTrack(String uuid) {
        if (uuid == null && this.mTrackInfo.hasTrack()) {
            uuid = this.mTrackInfo.getTrack().uuid;
        }
        PlayerTrack track = getPlayTracks().getNext(uuid);
        if (track == null && getLoopMode() == LoopMode.LIST) {
            return getFirstTrack();
        }
        return track;
    }

    private PlayerTrack getPrevTrack(String uuid, boolean canLoop) {
        if (uuid == null && this.mTrackInfo.hasTrack()) {
            uuid = this.mTrackInfo.getTrack().uuid;
        }
        PlayerTrack track = getPlayTracks().getPrev(uuid);
        if (track == null) {
            if (canLoop || getLoopMode() == LoopMode.LIST) {
                return getLastTrack();
            }
            return track;
        }
        return track;
    }

    public List<PlayerTrack> getTrackList() {
        return this.mTracks.asList();
    }

    public List<PlayerTrack> getActualTrackList() {
        return getPlayTracks().asList();
    }

    public int getActualTrackListSize() {
        return getPlayTracks().size();
    }

    public int getTrackIndex(String uuid) {
        return this.mTracks.indexOf(uuid);
    }

    private int getActualTrackIndex(String uuid) {
        return getPlayTracks().indexOf(uuid);
    }

    public int getActualTrackIndex() {
        if (this.mTrackInfo.hasTrack()) {
            return getActualTrackIndex(this.mTrackInfo.getTrack().uuid);
        }
        return -1;
    }

    public int getTrackCount() {
        return this.mTracks.size();
    }

    public boolean hasTracks() {
        return !this.mTracks.isEmpty();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getAudioSessionId() {
        return this.mPlayer.getAudioSessionId();
    }

    private Tracks getPlayTracks() {
        if (isShuffle()) {
            if (this.mShuffleTracks == null) {
                shuffleIfNeeded(true, true);
            }
            return this.mShuffleTracks;
        }
        return this.mTracks;
    }

    public void swap(String uuid1, String uuid2) {
        getPlayTracks().swap(uuid1, uuid2);
        notifyTracksChanged();
    }

    private void shuffleIfNeeded(Collection<String> preserveUuids) {
        if (isShuffle()) {
            if (this.mTracks.isEmpty() && this.mShuffleTracks != null) {
                this.mShuffleTracks.clear();
            } else {
                this.mShuffleTracks = this.mTracks.shuffle(preserveUuids);
            }
        } else {
            this.mShuffleTracks = null;
        }
        notifyTracksChanged();
    }

    private void shuffleIfNeeded(boolean preserveCurrentTrack, boolean preserveHistory) {
        if (isShuffle()) {
            if (!preserveCurrentTrack || !this.mTrackInfo.hasTrack()) {
                shuffleIfNeeded(null);
                return;
            }
            ArrayList<String> uuids = new ArrayList<>(1);
            PlayerTrack track = this.mTrackInfo.getTrack();
            uuids.add(track.uuid);
            if (preserveHistory) {
                Tracks tracks = (!isShuffle() || this.mShuffleTracks == null) ? this.mTracks : this.mShuffleTracks;
                while (true) {
                    track = tracks.getPrev(track.uuid);
                    if (track == null) {
                        break;
                    }
                    uuids.add(track.uuid);
                }
                Collections.reverse(uuids);
            }
            shuffleIfNeeded(uuids);
            return;
        }
        shuffleIfNeeded(null);
    }

    private void checkTracksLock() {
        if (this.mTracksLocked) {
            throw new RuntimeException("Cannot change track list");
        }
    }

    @NonNull
    public PlayerState getState() {
        return this.mPlayer.getState();
    }

    public TrackInfo getTrackInfo() {
        return this.mTrackInfo;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void registerListener(PlayerListener listener) {
        if (listener != null) {
            this.mListeners.add(listener);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void unregisterListener(PlayerListener listener) {
        if (listener != null) {
            this.mListeners.remove(listener);
        }
    }

    private void requestAudioFocus() {
        L.d("PlayerService", LOG_PREFIX, "requestAudioFocus");
        if (this.mFocusListener == null) {
            this.mFocusListener = new FocusListener();
        }
        int result = Utils.getAudioManager(this.mService).requestAudioFocus(this.mFocusListener, 3, 1);
        if (result == 1) {
            this.mFocusListener.onAudioFocusChange(1);
        } else {
            this.mFocusListener.onAudioFocusChange(-1);
        }
    }

    private void abandonAudioFocus() {
        L.d("PlayerService", LOG_PREFIX, "abandonAudioFocus");
        if (this.mFocusListener != null) {
            Utils.getAudioManager(this.mService).abandonAudioFocus(this.mFocusListener);
            this.mFocusListener = null;
        }
    }

    private void notifyMessage(int what) {
        this.mHandler.removeMessages(what);
        Message.obtain(this.mHandler, what).sendToTarget();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyStateChanged() {
        this.mSession.update();
        notifyMessage(1);
    }

    private void notifyTracksChanged() {
        notifyMessage(2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyProgress() {
        notifyMessage(3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyBuffering() {
        notifyMessage(4);
    }

    private void notifyParametersChanged() {
        notifyMessage(5);
    }

    /* loaded from: classes2.dex */
    private class MyPlayerHelperListener implements MediaPlayerHelperI.MediaPlayerHelperListener {
        private MyPlayerHelperListener() {
        }

        @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
        public void onPrepared(@NonNull MediaPlayerHelperI helper, int duration) {
            if (helper.getId() == 0) {
                Player.this.mAudioStatSender.onPrepared(Player.this.mTrackInfo.getTrack(), duration, helper.getRefer());
                if (Player.this.mTrackInfo.getPosition() > 0) {
                    Player.this.seekTo(Player.this.mTrackInfo.getPosition());
                }
                MusicApp.sendBroadcast(Player.this.getTrackInfo().getTrack());
            }
            Player.this.mTrackInfo.setDuration(helper.getId(), duration);
            Player.this.notifyStateChanged();
            Player.this.notifyProgress();
            Player.this.notifyBuffering();
        }

        @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
        public void onCompleted(@NonNull MediaPlayerHelperI helper) {
            if (helper.getId() == 0) {
                if (isLooping()) {
                    TrackInfo ti = Player.this.getTrackInfo();
                    PlayerTrack track = ti == null ? null : ti.getTrack();
                    if (track != null) {
                        Player.this.play(track.uuid, false, true);
                        return;
                    }
                }
                if (!Player.this.playNext()) {
                    PlayerTrack track2 = Player.this.getFirstTrack();
                    if (track2 != null) {
                        Player.this.play(track2.uuid);
                    }
                    Player.this.stop();
                }
            }
        }

        @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
        public void onError(@NonNull MediaPlayerHelperI helper, MediaPlayerHelperI.MediaPlayerHelperListener.ErrorType errorType) {
            L.e("PlayerService", "onError", "error type", errorType);
            if (helper.getId() == 0) {
                switch (errorType) {
                    case timeout:
                        Player.this.mErrorHandler.error(R.string.music_player_error_timeout, new Object[0]);
                        return;
                    case unsupported:
                        Player.this.mErrorHandler.error(R.string.music_player_error_unsupported_format, new Object[0]);
                        return;
                    default:
                        if (Utils.isNetworkAvailable(Player.this.mService)) {
                            Player.this.mErrorHandler.error(R.string.music_player_error_during_playback, new Object[0]);
                            return;
                        } else {
                            Player.this.mErrorHandler.error(R.string.music_player_error_no_connection, new Object[0]);
                            return;
                        }
                }
            }
        }

        @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
        public void onProgress(@NonNull MediaPlayerHelperI helper, int progress) {
            Player.this.mTrackInfo.setPosition(helper.getId(), progress);
            if (helper.getId() == 0 && Player.this.mTrackInfo.hasTrack()) {
                Player.this.mAudioStatSender.onProgress(Player.this.mTrackInfo.getTrack(), Player.this.mTrackInfo.getDuration(), progress, helper.getRefer());
            }
            Player.this.notifyProgress();
        }

        @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
        public void onBufferingProgress(@NonNull MediaPlayerHelperI helper, int percent) {
            Player.this.mTrackInfo.setBufferingPercent(helper.getId(), percent);
            Player.this.notifyBuffering();
        }

        @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.MediaPlayerHelperListener
        public void onHelperIdChange(int newId) {
            Player.this.mTrackInfo.setCurrentIndex(newId);
            Player.this.notifyStateChanged();
        }

        public boolean isLooping() {
            return Player.this.getLoopMode() == LoopMode.TRACK;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class ErrorHandler {
        private int mErrorCount;
        private long mLastErrorTime;
        private long mLastTime;

        private ErrorHandler() {
        }

        public void error(int textId, Object... objects) {
            long time = SystemClock.uptimeMillis();
            if (time >= this.mLastTime + 1000) {
                String s = objects == null ? Player.this.mService.getString(textId) : Player.this.mService.getString(textId, objects);
                Toast.makeText(Player.this.mService, s, 1).show();
                this.mLastTime = time;
            }
            if (!canPlayNext() || isFatalError(textId) || !Player.this.playNext(false)) {
                Player.this.stop();
            }
        }

        private boolean isFatalError(int textId) {
            return textId == R.string.music_player_error_no_connection;
        }

        private boolean canPlayNext() {
            long time = SystemClock.uptimeMillis();
            try {
                if (time < this.mLastErrorTime + 5000) {
                    this.mErrorCount++;
                    if (this.mErrorCount >= 3) {
                        return false;
                    }
                } else {
                    this.mErrorCount = 0;
                }
                return true;
            } finally {
                this.mLastErrorTime = time;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class FocusListener implements AudioManager.OnAudioFocusChangeListener {
        private boolean mPaused;
        Runnable playResumeRunnable;

        private FocusListener() {
            this.playResumeRunnable = new Runnable() { // from class: com.vkontakte.android.audio.player.Player.FocusListener.1
                @Override // java.lang.Runnable
                public void run() {
                    L.d("PlayerService", Player.LOG_PREFIX, "Audio focus gain");
                    Player.this.mPlayer.setVolume(1.0f);
                    if (FocusListener.this.mPaused) {
                        FocusListener.this.mPaused = false;
                        Player.this.resume();
                    }
                }
            };
        }

        @Override // android.media.AudioManager.OnAudioFocusChangeListener
        public void onAudioFocusChange(int focusChange) {
            if (!Player.this.mReleased) {
                switch (focusChange) {
                    case -3:
                        L.d("PlayerService", Player.LOG_PREFIX, "Audio focus loss can duck");
                        Player.this.mPlayer.setVolume(0.2f);
                        return;
                    case -2:
                    case -1:
                        L.d("PlayerService", Player.LOG_PREFIX, "Audio focus loss");
                        Player.this.mHandler.removeCallbacks(this.playResumeRunnable);
                        this.mPaused = Player.this.pause();
                        return;
                    case 0:
                    default:
                        return;
                    case 1:
                        Player.this.mHandler.postDelayed(this.playResumeRunnable, 1500L);
                        return;
                }
            }
        }

        void resetPaused() {
            this.mPaused = false;
        }
    }

    /* loaded from: classes2.dex */
    private class HandlerCallback implements Handler.Callback {
        private HandlerCallback() {
        }

        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    PlayerState state = Player.this.mPlayer.getState();
                    for (PlayerListener listener : Player.this.mListeners) {
                        listener.onStateChanged(state, Player.this.mTrackInfo);
                    }
                    return true;
                case 2:
                    List<PlayerTrack> list = Player.this.getTrackList();
                    Player.this.mTracksLocked = true;
                    try {
                        for (PlayerListener listener2 : Player.this.mListeners) {
                            listener2.onTrackListChanged(list);
                        }
                        return true;
                    } finally {
                        Player.this.mTracksLocked = false;
                    }
                case 3:
                    for (PlayerListener listener3 : Player.this.mListeners) {
                        listener3.onProgress(Player.this.mTrackInfo);
                    }
                    return true;
                case 4:
                    for (PlayerListener listener4 : Player.this.mListeners) {
                        listener4.onBufferingProgress(Player.this.mTrackInfo);
                    }
                    return true;
                case 5:
                    for (PlayerListener listener5 : Player.this.mListeners) {
                        listener5.onParametersChanged(Player.this);
                    }
                    return true;
                default:
                    return false;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class LoadTracksTask extends AsyncTaskCompat<Void, Void, List<PlayerTrack>> {
        private final OnLoadedListener mListener;

        private LoadTracksTask(OnLoadedListener listener) {
            this.mListener = listener;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public List<PlayerTrack> doInBackground(Void... params) {
            return PlayerTrack.PROVIDER.loadTracks();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(List<PlayerTrack> result) {
            super.onPostExecute((LoadTracksTask) result);
            Player.this.mLoadTracksTask = null;
            Player.this.mTracks.clear();
            Player.this.mTracks.addAll(result);
            if (Prefs.getInstance(Player.this.mService).stoppedTrackInfo.has()) {
                try {
                    JSONObject json = new JSONObject(Prefs.getInstance(Player.this.mService).stoppedTrackInfo.mo473get());
                    PlayerTrack track = Player.this.getTrack(json.optString(UserBox.TYPE));
                    if (track != null) {
                        L.v(Player.LOG_PREFIX, "Restore track state " + track.uuid);
                        Player.this.mTrackInfo.setTrack(track);
                        Player.this.mTrackInfo.setDuration(0, json.optInt("duration"));
                        Player.this.mTrackInfo.setPosition(0, json.optInt("position"));
                    } else {
                        L.w(Player.LOG_PREFIX, "Restore track state: null");
                    }
                } catch (JSONException e) {
                    throw new RuntimeException(e);
                }
            }
            if (this.mListener != null) {
                this.mListener.onPlayerLoaded();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class SaveTracksTask extends AsyncTaskCompat<Void, Void, Void> {
        private SaveTracksTask() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Void doInBackground(Void... params) {
            SQLiteDatabase database = MusicApp.getWritableDatabase();
            database.beginTransaction();
            try {
                List<PlayerTrack> tracks = Player.this.mTracks.asList();
                Set<Long> ids = new HashSet<>();
                for (PlayerTrack track : tracks) {
                    ids.add(Long.valueOf(track.getId()));
                }
                for (T track2 : PlayerTrack.PROVIDER.getAll()) {
                    if (!ids.contains(Long.valueOf(track2.getId()))) {
                        track2.remove();
                    }
                }
                for (int i = 0; i < tracks.size(); i++) {
                    PlayerTrack track3 = tracks.get(i);
                    track3.position = i;
                    track3.save();
                }
                database.setTransactionSuccessful();
                return null;
            } catch (Exception e) {
                L.e(e, new Object[0]);
                return null;
            } finally {
                database.endTransaction();
            }
        }
    }
}
