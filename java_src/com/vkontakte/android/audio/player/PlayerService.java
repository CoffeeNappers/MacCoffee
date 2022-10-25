package com.vkontakte.android.audio.player;

import android.app.Activity;
import android.app.NotificationManager;
import android.appwidget.AppWidgetManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import android.widget.Toast;
import com.facebook.internal.NativeProtocol;
import com.vk.imageloader.VKImageLoader;
import com.vkontakte.android.AppStateTracker;
import com.vkontakte.android.PlayerBigWidget;
import com.vkontakte.android.PlayerWidget;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.AudioStateListener;
import com.vkontakte.android.audio.MusicApp;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.events.StaticObservableEvent;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.SavedTracks;
import com.vkontakte.android.audio.player.proxy.PlayerProxy;
import com.vkontakte.android.audio.utils.BoundService;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.fragments.money.BuyMusicSubscriptionFragment;
import com.vkontakte.android.fragments.money.MusicWasPausedFragment;
import com.vkontakte.android.utils.L;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class PlayerService extends BoundService implements AppStateTracker.Callback {
    static final String LOG_PREFIX = "PlayerService";
    static final String LOG_TAG = "PlayerService";
    public static final int NOTIFY_DOWNLOAD_TRACKS = 2;
    public static final int NOTIFY_DOWNLOAD_TRACKS_FINISHED = 3;
    public static final int NOTIFY_PLAYER_SERVICE = 1;
    private static final int SHOW_PAUSED_INFO_MAX_COUNT = 10;
    private static final int SHOW_PAUSED_INFO_MAX_PERIOD = 90;
    private static final int SHOW_PAUSED_INFO_MAX_PER_DAY = 2;
    private static final int TIME_MILLIS_RESUME_MUSIC = 10000;
    private static final int TIME_MILLIS_SHOW_POPUP = 60000;
    private static final StaticObservableEvent<NetworkStateEventHandler, PlayerService, Boolean> mNetworkStateEvent = new StaticObservableEvent<NetworkStateEventHandler, PlayerService, Boolean>() { // from class: com.vkontakte.android.audio.player.PlayerService.1
        @Override // com.vkontakte.android.audio.events.ObservableEventBase
        public void notifyHandler(NetworkStateEventHandler handler, PlayerService playerService, Boolean args) {
            handler.onNetworkStateChanged(playerService, args.booleanValue());
        }
    };
    private Handler mHandler;
    private Player mPlayer;
    private LinkedList<Intent> mQueuedIntents;
    private SavedTracks mSavedTracks;
    private int mStartId;
    private boolean mUiStarted;
    private final StopRunnable mStopRunnable = new StopRunnable();
    private String lastMid = null;
    private final BroadcastReceiver mNetworkStateReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.audio.player.PlayerService.2
        {
            PlayerService.this = this;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            boolean online = Utils.isNetworkAvailable(context);
            PlayerService.mNetworkStateEvent.fire(PlayerService.this, Boolean.valueOf(online));
        }
    };
    private final ScreenStateReceiver mScreenStateReceiver = new ScreenStateReceiver();
    private boolean needShowBuyMusicSubscriptionFragment = false;
    private final Runnable checkStop = new Runnable() { // from class: com.vkontakte.android.audio.player.PlayerService.3
        {
            PlayerService.this = this;
        }

        @Override // java.lang.Runnable
        public void run() {
            ViewUtils.removeCallbacks(this);
            int disableTime = VKAccountManager.getCurrent().getAudioBackgroundLimit();
            long playedTimeSec = PlayerService.this.mPlayer == null ? 0L : PlayerService.this.mPlayer.getTodayListeningTimeSec();
            if (playedTimeSec != 0 && playedTimeSec / 60 >= disableTime) {
                if (PlayerService.this.mPlayer != null) {
                    PlayerService.this.mPlayer.pause();
                    PlayerService.this.mScreenStateReceiver.wasPaused = true;
                    PlayerService.this.mScreenStateReceiver.timeWasPaused = System.currentTimeMillis();
                }
            } else {
                ViewUtils.postDelayed(this, 2000L);
            }
            L.d(Integer.valueOf(disableTime), Long.valueOf(playedTimeSec / 60));
        }
    };

    /* loaded from: classes2.dex */
    public interface NetworkStateEventHandler {
        void onNetworkStateChanged(PlayerService playerService, boolean z);
    }

    public void showBuyMusicSubscriptionFragmentIfNeed() {
        Activity activity;
        if (this.needShowBuyMusicSubscriptionFragment) {
            long currentTime = System.currentTimeMillis();
            int todayCount = 0;
            int maxTimesCount = 0;
            Long[] times = Prefs.getInstance(this).showedPausedInfo.mo473get();
            List<Long> longs = new ArrayList<>();
            for (Long l : times) {
                if (currentTime - TimeUtils.DAY < l.longValue()) {
                    todayCount++;
                }
                if (currentTime - 324000000 < l.longValue()) {
                    maxTimesCount++;
                    longs.add(l);
                }
            }
            if (todayCount < 2 && maxTimesCount < 10 && (activity = AppStateTracker.getCurrentActivity()) != null && !BuyMusicSubscriptionFragment.isShowed()) {
                longs.add(Long.valueOf(currentTime));
                Prefs.getInstance(this).showedPausedInfo.set((Long[]) longs.toArray(new Long[longs.size()]));
                MusicWasPausedFragment.show(this, activity);
                this.needShowBuyMusicSubscriptionFragment = false;
            }
        }
    }

    /* loaded from: classes2.dex */
    private class ScreenStateReceiver extends BroadcastReceiver {
        long timeWasPaused;
        boolean wasPaused;

        private ScreenStateReceiver() {
            PlayerService.this = r3;
            this.wasPaused = false;
            this.timeWasPaused = 0L;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            Player player = PlayerService.this.mPlayer;
            String valueOf = String.valueOf(intent.getAction());
            char c = 65535;
            switch (valueOf.hashCode()) {
                case -2128145023:
                    if (valueOf.equals("android.intent.action.SCREEN_OFF")) {
                        c = 1;
                        break;
                    }
                    break;
                case -1454123155:
                    if (valueOf.equals("android.intent.action.SCREEN_ON")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    ViewUtils.removeCallbacks(PlayerService.this.checkStop);
                    if (player != null && this.wasPaused) {
                        if (System.currentTimeMillis() - this.timeWasPaused < 10000) {
                            player.resume();
                        }
                        if (System.currentTimeMillis() - this.timeWasPaused < 60000) {
                            PlayerService.this.needShowBuyMusicSubscriptionFragment = true;
                            PlayerService.this.showBuyMusicSubscriptionFragmentIfNeed();
                        }
                        this.wasPaused = false;
                        return;
                    }
                    return;
                case 1:
                    ViewUtils.removeCallbacks(PlayerService.this.checkStop);
                    PlayerState state = player == null ? null : player.getState();
                    if (VKAccountManager.getCurrent().isMusicRestricted() && !VKAccountManager.getCurrent().hasMusicSubscription() && state != null && state.isPlayState()) {
                        int disableTime = VKAccountManager.getCurrent().getAudioBackgroundLimit();
                        if (disableTime == 0) {
                            player.pause();
                            this.wasPaused = true;
                            this.timeWasPaused = System.currentTimeMillis();
                            return;
                        } else if (disableTime > 0 && disableTime < 1440) {
                            PlayerService.this.checkStop.run();
                            return;
                        } else {
                            this.wasPaused = false;
                            return;
                        }
                    }
                    this.wasPaused = false;
                    return;
                default:
                    return;
            }
        }
    }

    @Override // com.vkontakte.android.AppStateTracker.Callback
    public void onAppPaused() {
    }

    @Override // com.vkontakte.android.AppStateTracker.Callback
    public void onAppResumed() {
        showBuyMusicSubscriptionFragmentIfNeed();
    }

    public static void addNetworkStateEventHandler(NetworkStateEventHandler handler) {
        mNetworkStateEvent.add(handler);
    }

    public static void removeNetworkStateEventHandler(NetworkStateEventHandler handler) {
        mNetworkStateEvent.remove(handler);
    }

    public static boolean waitForOnline(Context context, int timeout) throws InterruptedException {
        boolean z = true;
        if (!Utils.isNetworkAvailable(context)) {
            CountDownLatch latch = new CountDownLatch(1);
            NetworkStateEventHandler handler = PlayerService$$Lambda$1.lambdaFactory$(latch);
            addNetworkStateEventHandler(handler);
            try {
                if (timeout > 0) {
                    z = latch.await(timeout, TimeUnit.MILLISECONDS);
                } else {
                    latch.await();
                    removeNetworkStateEventHandler(handler);
                }
            } finally {
                removeNetworkStateEventHandler(handler);
            }
        }
        return z;
    }

    public static /* synthetic */ void lambda$waitForOnline$0(CountDownLatch latch, PlayerService playerService, boolean online) {
        if (online) {
            latch.countDown();
        }
    }

    public static boolean waitForOnline(Context context) throws InterruptedException {
        return waitForOnline(context, 0);
    }

    public static String getDefaultValueForExoPlayer() {
        String valueOf = String.valueOf(VKAccountManager.getCurrent().getDefaultAudioPlayer());
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1740983714:
                if (valueOf.equals("exoCached")) {
                    c = 1;
                    break;
                }
                break;
            case 100892:
                if (valueOf.equals("exo")) {
                    c = 3;
                    break;
                }
                break;
            case 1312628413:
                if (valueOf.equals("standard")) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return "standard";
            case 1:
                return "exoCached";
            default:
                return "exo";
        }
    }

    public static String getPlayerType(Context ctx) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(ctx);
        if (prefs.contains("__dbg_exo_player")) {
            boolean b = prefs.getBoolean("__dbg_exo_player", true);
            return b ? "exo" : "standard";
        }
        return prefs.getString("__dbg_player_type", getDefaultValueForExoPlayer());
    }

    @Override // com.vkontakte.android.audio.utils.BoundService, android.app.Service
    public void onCreate() {
        MediaPlayerHelperI.Type type;
        super.onCreate();
        String playerType = getPlayerType(this);
        String valueOf = String.valueOf(playerType);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -1740983714:
                if (valueOf.equals("exoCached")) {
                    c = 2;
                    break;
                }
                break;
            case 100892:
                if (valueOf.equals("exo")) {
                    c = 3;
                    break;
                }
                break;
            case 1312628413:
                if (valueOf.equals("standard")) {
                    c = 1;
                    break;
                }
                break;
        }
        switch (c) {
            case 2:
                type = MediaPlayerHelperI.Type.exoPlayerCached;
                break;
            case 3:
                type = MediaPlayerHelperI.Type.exoPlayer;
                break;
            default:
                type = MediaPlayerHelperI.Type.mediaPlayer;
                break;
        }
        L.d("PlayerService", "PlayerService", "onCreate");
        try {
            if (type.useLocalhostForCache) {
                PlayerProxy.startThread(this);
            }
        } catch (IOException e) {
            L.e(e, new Object[0]);
            Toast.makeText(this, "Error starting proxy", 1).show();
        }
        LoadedListener loadedListener = new LoadedListener();
        this.mPlayer = new Player(this, loadedListener, type);
        Intent intent = new Intent("android.media.action.OPEN_AUDIO_EFFECT_CONTROL_SESSION");
        intent.putExtra("android.media.extra.PACKAGE_NAME", MusicApp.getInstance().getPackageName());
        intent.putExtra("android.media.extra.AUDIO_SESSION", this.mPlayer.getAudioSessionId());
        intent.putExtra("android.media.extra.CONTENT_TYPE", 0);
        sendBroadcast(intent);
        this.mPlayer.registerListener(new MyPlayerListener());
        AudioStateListener.inst.onCreatePlayer(this.mPlayer);
        this.mSavedTracks = new SavedTracks(this, loadedListener);
        this.mSavedTracks.registerListener(new MySavedTracksListener());
        this.mHandler = new Handler();
        this.mUiStarted = false;
        IntentFilter iF = new IntentFilter();
        iF.addAction("android.intent.action.SCREEN_ON");
        iF.addAction("android.intent.action.SCREEN_OFF");
        registerReceiver(this.mScreenStateReceiver, iF);
        AppStateTracker.addCallback(this);
    }

    @Override // com.vkontakte.android.audio.utils.BoundService, android.app.Service
    public void onDestroy() {
        L.d("PlayerService", "PlayerService", "onDestroy");
        AppStateTracker.removeCallback(this);
        cancelNotification();
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler = null;
        this.mSavedTracks.release();
        this.mSavedTracks = null;
        AudioStateListener.inst.onUnloadSavedTracks();
        Intent intent = new Intent("android.media.action.CLOSE_AUDIO_EFFECT_CONTROL_SESSION");
        intent.putExtra("android.media.extra.PACKAGE_NAME", MusicApp.getInstance().getPackageName());
        intent.putExtra("android.media.extra.AUDIO_SESSION", this.mPlayer.getAudioSessionId());
        intent.putExtra("android.media.extra.CONTENT_TYPE", 0);
        sendBroadcast(intent);
        this.mPlayer.release();
        this.mPlayer = null;
        AudioStateListener.inst.onDestroyPlayer();
        PlayerProxy.stopThread();
        updateWidgets();
        unregisterReceiver(this.mScreenStateReceiver);
        super.onDestroy();
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int flags, int startId) {
        this.mStartId = startId;
        if (isLoaded()) {
            handleIntent(intent);
            return 2;
        }
        if (this.mQueuedIntents == null) {
            this.mQueuedIntents = new LinkedList<>();
        }
        this.mQueuedIntents.add(intent);
        return 2;
    }

    @Override // com.vkontakte.android.audio.utils.BoundService
    public void onBound(Intent intent) {
        super.onBound(intent);
        if (!this.mUiStarted) {
            this.mUiStarted = true;
        }
        registerReceiver(this.mNetworkStateReceiver, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        this.mHandler.removeCallbacks(this.mStopRunnable);
    }

    @Override // com.vkontakte.android.audio.utils.BoundService
    public void onUnbound(Intent intent) {
        super.onUnbound(intent);
        unregisterReceiver(this.mNetworkStateReceiver);
        tryStopMe();
    }

    public Player getPlayer() {
        return this.mPlayer;
    }

    public SavedTracks getSavedTracks() {
        return this.mSavedTracks;
    }

    public void tryStopMe(boolean schedule) {
        this.mHandler.removeCallbacks(this.mStopRunnable);
        if (isLoaded() && !isBound() && this.mPlayer.getState() == PlayerState.STOPPED && !this.mSavedTracks.hasTasks()) {
            if (schedule) {
                this.mHandler.postDelayed(this.mStopRunnable, 5000L);
            } else {
                stopSelf(this.mStartId);
            }
        }
    }

    public void tryStopMe() {
        tryStopMe(true);
    }

    public void handleIntent(Intent intent) {
        String action = intent == null ? null : intent.getAction();
        if (action != null) {
            L.d("PlayerService", "PlayerService", "onStartCommand", NativeProtocol.WEB_DIALOG_ACTION, intent.getAction());
            if (PlayerIntents.ACTION_STOP.equals(action)) {
                this.mPlayer.saveTracksState();
                this.mPlayer.stop();
            } else if (PlayerIntents.ACTION_LOGOUT.equals(action)) {
                this.mPlayer.stop(true);
                this.mPlayer.clearTracks();
                this.mSavedTracks.cancelDownloads();
                Prefs.getInstance(this).clear();
            } else if (PlayerIntents.ACTION_PAUSE.equals(action)) {
                this.mPlayer.pause();
            } else if (PlayerIntents.ACTION_TOGGLE_RESUME_PAUSE.equals(action)) {
                this.mPlayer.toggleResumePause();
            } else if (PlayerIntents.ACTION_REWIND.equals(action)) {
                this.mPlayer.rewind();
            } else if (PlayerIntents.ACTION_RESUME.equals(action)) {
                this.mPlayer.resume();
            } else if (AudioFacade.ACTION_SHOW_PLAYER.equals(action)) {
                Intent intentShowPlayer = new Intent(getApplicationContext(), MusicApp.getAudioPlayerActivityClass()).addFlags(411041792);
                startActivity(intentShowPlayer);
            } else if (PlayerIntents.ACTION_NEXT.equals(action)) {
                this.mPlayer.playNext();
            } else if (PlayerIntents.ACTION_PREV.equals(action)) {
                if (!this.mPlayer.playPrev()) {
                    updateWidgets();
                }
            } else if (AudioFacade.ACTION_PLAY_NEXT.equals(action)) {
                ArrayList<MusicTrack> tracks = intent.getParcelableArrayListExtra(AudioFacade.EXTRA_MUSIC_FILES);
                if (tracks != null) {
                    if (this.mPlayer.hasTracks() && this.mPlayer.getState() != PlayerState.IDLE && this.mPlayer.getState() != PlayerState.STOPPED) {
                        this.mPlayer.addTrackToNext(tracks);
                    } else {
                        this.mPlayer.setTracksAndPlay(tracks, 0, PlayerRefer.none);
                    }
                }
            } else if (AudioFacade.ACTION_ADD_TO_PLAYLIST.equals(action)) {
                ArrayList<MusicTrack> tracks2 = intent.getParcelableArrayListExtra(AudioFacade.EXTRA_MUSIC_FILES);
                if (tracks2 != null) {
                    this.mPlayer.addTracks(tracks2);
                }
            } else if (PlayerIntents.ACTION_PLAY_UUID.equals(action)) {
                String uuid = intent.getStringExtra(PlayerIntents.EXTRA_UUID);
                if (!TextUtils.isEmpty(uuid)) {
                    this.mPlayer.play(uuid);
                }
            } else if (PlayerIntents.ACTION_TOGGLE_SHUFFLE.equals(action)) {
                this.mPlayer.toggleShuffle();
            } else if (PlayerIntents.ACTION_SET_SHUFFLE.equals(action)) {
                this.mPlayer.setShuffle(intent.getBooleanExtra(PlayerIntents.EXTRA_SHUFFLE, false));
            } else if (PlayerIntents.ACTION_TOGGLE_REPEAT.equals(action)) {
                this.mPlayer.setLoopMode(LoopMode.VALUES[(this.mPlayer.getLoopMode().ordinal() + 1) % LoopMode.VALUES.length]);
            } else if (PlayerIntents.ACTION_TOGGLE_REPEAT_NONE_OR_TRACK.equals(action)) {
                LoopMode loopMode = this.mPlayer.getLoopMode();
                switch (loopMode) {
                    case LIST:
                    case TRACK:
                        this.mPlayer.setLoopMode(LoopMode.NONE);
                        return;
                    case NONE:
                        this.mPlayer.setLoopMode(LoopMode.TRACK);
                        return;
                    default:
                        return;
                }
            } else if (PlayerIntents.ACTION_SET_REPEAT_MODE.equals(action)) {
                this.mPlayer.setLoopMode(LoopMode.VALUES[intent.getIntExtra(PlayerIntents.EXTRA_REPEAT_MODE, LoopMode.NONE.ordinal())]);
            } else if (PlayerIntents.ACTION_START_DOWNLOAD_TRACKS.equals(action)) {
                Collection<MusicTrack> tracks3 = intent.getParcelableArrayListExtra(PlayerIntents.EXTRA_TRACKS);
                boolean showNotifications = intent.getBooleanExtra(PlayerIntents.EXTRA_SHOW_NOTIFICATION, false);
                if (tracks3 != null) {
                    this.mSavedTracks.downloadTracks(tracks3, showNotifications);
                }
            } else if (PlayerIntents.ACTION_PAUSE_DOWNLOAD.equals(action)) {
                this.mSavedTracks.pauseDownload();
            } else if (PlayerIntents.ACTION_RESUME_DOWNLOAD.equals(action)) {
                this.mSavedTracks.resumeDownload();
            } else if (PlayerIntents.ACTION_CANCEL_DOWNLOAD.equals(action)) {
                this.mSavedTracks.cancelDownload(intent.getDataString());
            } else if (PlayerIntents.ACTION_CANCEL_DOWNLOADS.equals(action)) {
                this.mSavedTracks.cancelDownloads();
            } else if (PlayerIntents.ACTION_REMOVE_SAVED_TRACK.equals(action)) {
                String[] mids = intent.getStringArrayExtra(PlayerIntents.EXTRA_MID);
                if (mids != null) {
                    for (String mid : mids) {
                        if (!TextUtils.isEmpty(mid)) {
                            this.mSavedTracks.removeTracks(mid);
                        }
                    }
                }
            } else if (PlayerIntents.ACTION_REMOVE_ALL_SAVED_TRACK.equals(action)) {
                this.mSavedTracks.clearTracks();
            }
        }
    }

    @Override // android.app.Service
    public void onTaskRemoved(Intent rootIntent) {
        super.onTaskRemoved(rootIntent);
        L.d("PlayerService", "PlayerService", "onTaskRemoved");
        this.mPlayer.pause();
        this.mSavedTracks.cancelDownloads();
        this.mPlayer.saveTracksState();
    }

    /* loaded from: classes2.dex */
    public class MyPlayerListener implements PlayerListener {
        private MyPlayerListener() {
            PlayerService.this = r1;
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
            L.d("PlayerService", "PlayerService", "onStateChanged", "state", state);
            if (state == PlayerState.STOPPED) {
                PlayerService.this.stopForeground(true);
                PlayerService.this.cancelNotification();
                PlayerService.this.tryStopMe(false);
            } else {
                MusicTrack track = trackInfo == null ? null : trackInfo.getTrack();
                String mid = track == null ? null : track.getMid();
                String url = track == null ? null : track.getThumbUrl(Utils.getMaxCoverSize());
                PlayerService.this.lastMid = mid;
                if (TextUtils.isEmpty(url)) {
                    PlayerService.this.showNotification(null, mid);
                } else {
                    VKImageLoader.getBitmap(Uri.parse(url)).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread()).subscribe(PlayerService$MyPlayerListener$$Lambda$1.lambdaFactory$(this, mid), PlayerService$MyPlayerListener$$Lambda$2.lambdaFactory$(this, mid));
                }
            }
            AudioStateListener.inst.onStateChanged(state, trackInfo);
            PlayerService.this.updateWidgets();
        }

        public /* synthetic */ void lambda$onStateChanged$0(String mid, Bitmap bitmap) throws Exception {
            PlayerService.this.showNotification(bitmap, mid);
        }

        public /* synthetic */ void lambda$onStateChanged$1(String mid, Throwable throwable) throws Exception {
            PlayerService.this.showNotification(null, mid);
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onTrackListChanged(List<PlayerTrack> list) {
            AudioStateListener.inst.onTrackListChanged(list);
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onProgress(TrackInfo trackInfo) {
            AudioStateListener.inst.onProgress(trackInfo);
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onBufferingProgress(TrackInfo trackInfo) {
            AudioStateListener.inst.onBufferingProgress(trackInfo);
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onParametersChanged(Player player) {
            AudioStateListener.inst.onParametersChanged(player);
            PlayerService.this.updateWidgets();
        }
    }

    /* loaded from: classes2.dex */
    private class MySavedTracksListener implements SavedTracks.SavedTracksListener {
        private MySavedTracksListener() {
            PlayerService.this = r1;
        }

        @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
        public void onSavedTracksChanged() {
            AudioStateListener.inst.onSavedTracksChanged();
        }

        @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
        public void onSavedTracksSaved() {
            AudioStateListener.inst.onSavedTracksSaved();
            PlayerService.this.tryStopMe();
        }

        @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
        public void onDownloadStarted() {
            AudioStateListener.inst.onDownloadStarted();
        }

        @Override // com.vkontakte.android.audio.player.SavedTracks.SavedTracksListener
        public void onDownloadFinished(boolean completed) {
            AudioStateListener.inst.onDownloadFinished(completed);
            if (completed) {
                PlayerService.this.tryStopMe();
            }
        }
    }

    public void showNotification(Bitmap bitmap, String mid) {
        if (TextUtils.equals(mid, this.lastMid)) {
            NotificationManager manager = (NotificationManager) getSystemService("notification");
            Player player = getPlayer();
            if (player != null && manager != null) {
                if (player.getState().isPlayState()) {
                    startForeground(1, MusicApp.createNotification(this, getPlayer(), bitmap));
                } else {
                    stopForeground(false);
                    manager.notify(1, MusicApp.createNotification(this, getPlayer(), bitmap));
                }
                updateWidgets();
            }
        }
    }

    public void cancelNotification() {
        NotificationManager manager = (NotificationManager) getSystemService("notification");
        manager.cancel(1);
    }

    /* loaded from: classes2.dex */
    private class LoadedListener implements SavedTracks.OnLoadedListener, Player.OnLoadedListener {
        private boolean mPlayerLoaded;
        private boolean mSavedTracksLoaded;

        private LoadedListener() {
            PlayerService.this = r1;
        }

        @Override // com.vkontakte.android.audio.player.SavedTracks.OnLoadedListener
        public void onSavedTracksLoaded() {
            AudioStateListener.inst.onLoadSavedTracks(PlayerService.this.mSavedTracks);
            this.mSavedTracksLoaded = true;
            checkAllLoaded();
        }

        @Override // com.vkontakte.android.audio.player.Player.OnLoadedListener
        public void onPlayerLoaded() {
            this.mPlayerLoaded = true;
            checkAllLoaded();
        }

        private void checkAllLoaded() {
            if (this.mSavedTracksLoaded && this.mPlayerLoaded) {
                L.d("PlayerService", "PlayerService", "Service loaded");
                if (PlayerService.this.mQueuedIntents != null) {
                    Iterator it = PlayerService.this.mQueuedIntents.iterator();
                    while (it.hasNext()) {
                        Intent intent = (Intent) it.next();
                        PlayerService.this.handleIntent(intent);
                    }
                    PlayerService.this.mQueuedIntents = null;
                }
                PlayerService.this.loadFinished();
                PlayerService.this.tryStopMe();
            }
        }
    }

    /* loaded from: classes2.dex */
    public class StopRunnable implements Runnable {
        private StopRunnable() {
            PlayerService.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            PlayerService.this.tryStopMe(false);
        }
    }

    private void sendErrorBroadcast(String action) {
        Intent intent = new Intent(action);
        LocalBroadcastManager.getInstance(MusicApp.getInstance()).sendBroadcast(intent);
    }

    public void updateWidgets() {
        AppWidgetManager awm = AppWidgetManager.getInstance(this);
        int[] ids = awm.getAppWidgetIds(new ComponentName(this, PlayerWidget.class));
        if (ids != null && ids.length > 0) {
            PlayerWidget.update(this, awm, ids);
        }
        int[] ids2 = awm.getAppWidgetIds(new ComponentName(this, PlayerBigWidget.class));
        if (ids2 != null && ids2.length > 0) {
            PlayerBigWidget.update(this, awm, ids2);
        }
    }
}
