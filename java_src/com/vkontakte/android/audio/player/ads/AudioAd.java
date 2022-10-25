package com.vkontakte.android.audio.player.ads;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.Nullable;
import com.my.target.Tracer;
import com.my.target.ads.CustomParams;
import com.my.target.ads.instream.InstreamAudioAd;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.PlayerAction;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.auth.configs.AudioAdConfig;
import com.vkontakte.android.utils.L;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantReadWriteLock;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class AudioAd implements InstreamAudioAd.InstreamAudioAdListener, Runnable {
    private static final long AD_LOAD_TIMEOUT = 2000;
    private static final int SLOT_ID = 69342;
    private static final Handler handler = new Handler(Looper.getMainLooper());
    @Nullable
    private InstreamAudioAd ad;
    private final AdPlayerHelper adPlayerHelper;
    private final OnStateChangedListener onStateChangedListener;
    private final MediaPlayerHelperI.Refer refer;
    private final OnCompleteListener[] listeners = new OnCompleteListener[AudioAdConfig.Type.values().length];
    private volatile AudioAdConfig.Type _innerState = null;
    private volatile AudioAdConfig.Type state = null;
    private final ReentrantReadWriteLock lock = new ReentrantReadWriteLock();
    private final AtomicBoolean waitLoading = new AtomicBoolean(false);
    private int adsCounter = 0;
    private final AudioAdStatSender audioAdStatSender = new AudioAdStatSender();
    private float[] midPoints = null;
    private boolean[] midPointsStarted = null;
    private InstreamAudioAd.InstreamAudioAdBanner currentBanner = null;
    private PlayerAction[] currentBannerActions = null;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface OnCompleteListener {
        void onComplete();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface OnStateChangedListener {
        void onStateChange();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AudioAd(Context ctx, MusicTrack track, AdPlayerHelper adPlayerHelper, OnStateChangedListener onStateChangedListener, MediaPlayerHelperI.Refer refer) {
        this.refer = refer == null ? PlayerRefer.none : refer;
        this.onStateChangedListener = onStateChangedListener;
        this.adPlayerHelper = adPlayerHelper;
        Tracer.enabled = true;
        CustomParams customParams = new CustomParams();
        customParams.setVKId(String.valueOf(VKAccountManager.getCurrent().getUid()));
        customParams.setCustomParam("vkcat_id", String.valueOf(this.refer.getInt()));
        customParams.setCustomParam("duration", String.valueOf(track.duration));
        customParams.setCustomParam("content_id", track.getMid());
        customParams.setCustomParam("puid1", "554");
        this.ad = new InstreamAudioAd(SLOT_ID, customParams, ctx);
        this.ad.setListener(this);
    }

    @Override // java.lang.Runnable
    public void run() {
        killAd();
    }

    private void startWaitLoad() {
        this.waitLoading.set(true);
        handler.postDelayed(this, AD_LOAD_TIMEOUT);
    }

    private void endWaitLoad() {
        try {
            this.lock.readLock().lock();
            this.waitLoading.set(false);
            handler.removeCallbacks(this);
        } finally {
            this.lock.readLock().unlock();
        }
    }

    private void killAd() {
        try {
            this.lock.writeLock().lock();
            if (this.ad != null) {
                this.ad.setListener(null);
                this.ad.stop();
                this.ad.destroy();
                this.ad = null;
            }
            if (this.waitLoading.get()) {
                onComplete();
                this.waitLoading.set(false);
            }
        } finally {
            this.lock.writeLock().unlock();
        }
    }

    private void setState(AudioAdConfig.Type state) {
        this.state = state;
        this.onStateChangedListener.onStateChange();
    }

    private void onComplete() {
        try {
            this.lock.readLock().lock();
            AudioAdConfig.Type state = this._innerState != null ? this._innerState : this.state;
            this._innerState = null;
            setState(null);
            if (state != null) {
                OnCompleteListener onCompleteListener = this.listeners[state.ordinal()];
                this.listeners[state.ordinal()] = null;
                if (onCompleteListener != null) {
                    onCompleteListener.onComplete();
                }
            }
        } finally {
            this.lock.readLock().unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean checkMidroll(int progressSec) {
        if (this.midPoints != null) {
            for (int i = 0; i < this.midPoints.length; i++) {
                if (((int) this.midPoints[i]) == progressSec && !this.midPointsStarted[i]) {
                    this.midPointsStarted[i] = true;
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void release() {
        try {
            this.lock.readLock().lock();
            for (int i = 0; i < this.listeners.length; i++) {
                this.listeners[i] = null;
            }
            if (this.ad != null) {
                this.ad.stop();
                this.ad.destroy();
            }
        } finally {
            this.lock.readLock().unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isWorking(AudioAd audioAd) {
        return (audioAd == null || audioAd.state == null) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void work(AudioAdConfig.Type state, OnCompleteListener onCompleteListener) {
        work(state, onCompleteListener, 0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void work(AudioAdConfig.Type state, OnCompleteListener onCompleteListener, int positionSec) {
        try {
            this.lock.readLock().lock();
            this.listeners[state.ordinal()] = onCompleteListener;
            this._innerState = state;
            switch (state) {
                case preroll:
                    if (this.ad != null) {
                        this.ad.load();
                        this.audioAdStatSender.sendRequested(this.refer);
                        startWaitLoad();
                        break;
                    } else {
                        onComplete();
                        break;
                    }
                case midlroll:
                    if (AudioAdConfig.isAdAllowed(VKAccountManager.getCurrent().getAudioAdConfig(), state, this.adsCounter, this.refer) && this.ad != null) {
                        this.ad.startMidroll(positionSec);
                        break;
                    } else {
                        this.audioAdStatSender.sendRejected(this.refer);
                        onComplete();
                        break;
                    }
                case postroll:
                    if (AudioAdConfig.isAdAllowed(VKAccountManager.getCurrent().getAudioAdConfig(), state, this.adsCounter, this.refer) && this.ad != null) {
                        this.ad.startPostroll();
                        break;
                    } else {
                        this.audioAdStatSender.sendRejected(this.refer);
                        onComplete();
                        break;
                    }
                    break;
            }
        } finally {
            this.lock.readLock().unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public float getCurrentDuration() {
        InstreamAudioAd.InstreamAudioAdBanner currentBanner = this.currentBanner;
        if (currentBanner == null) {
            return 0.0f;
        }
        return currentBanner.getDuration();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isAllowSeek() {
        InstreamAudioAd.InstreamAudioAdBanner currentBanner = this.currentBanner;
        return currentBanner != null && currentBanner.isAllowSeek();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isAllowTrackChange() {
        InstreamAudioAd.InstreamAudioAdBanner currentBanner = this.currentBanner;
        return currentBanner != null && currentBanner.isAllowTrackChange();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isAllowSkip() {
        InstreamAudioAd.InstreamAudioAdBanner currentBanner = this.currentBanner;
        return currentBanner != null && currentBanner.isAllowSkip();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void skip() {
        try {
            this.lock.readLock().lock();
            if (this.ad != null) {
                this.ad.skip();
            }
        } finally {
            this.lock.readLock().unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PlayerAction[] getPlayerActions() {
        return this.currentBannerActions;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getAdText() {
        InstreamAudioAd.InstreamAudioAdBanner currentBanner = this.currentBanner;
        if (currentBanner == null) {
            return null;
        }
        return currentBanner.getAdText();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean pause() {
        ReentrantReadWriteLock reentrantReadWriteLock;
        ReentrantReadWriteLock.ReadLock readLock;
        try {
            this.lock.readLock().lock();
            if (this.ad != null) {
                this.ad.pause();
                return true;
            }
            return false;
        } finally {
            this.lock.readLock().unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean resume() {
        if (this.ad != null) {
            this.ad.resume();
            return true;
        }
        return false;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdListener
    public void onLoad(InstreamAudioAd instreamAudioAd) {
        endWaitLoad();
        try {
            this.lock.readLock().lock();
            L.d(instreamAudioAd);
            this.audioAdStatSender.sendReceived(this.refer);
            if (this.ad != null) {
                this.midPoints = this.ad.getMidPoints();
            }
            if (this.midPoints != null) {
                this.midPointsStarted = new boolean[this.midPoints.length];
            }
            if (this.ad != null) {
                this.ad.setPlayer(this.adPlayerHelper.getOrCreateAdPlayer());
            }
            if (AudioAdConfig.isAdAllowed(VKAccountManager.getCurrent().getAudioAdConfig(), AudioAdConfig.Type.preroll, this.adsCounter, this.refer) && this.ad != null) {
                this.ad.startPreroll();
            } else {
                this.audioAdStatSender.sendRejected(this.refer);
                onComplete();
            }
        } finally {
            this.lock.readLock().unlock();
        }
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdListener
    public void onNoAd(String s, InstreamAudioAd instreamAudioAd) {
        endWaitLoad();
        L.d(instreamAudioAd);
        this.audioAdStatSender.sendNotReceived(this.refer);
        onComplete();
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdListener
    public void onError(String s, InstreamAudioAd instreamAudioAd) {
        endWaitLoad();
        L.d(s, instreamAudioAd);
        onComplete();
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdListener
    public void onBannerStart(InstreamAudioAd instreamAudioAd, InstreamAudioAd.InstreamAudioAdBanner instreamAudioAdBanner) {
        L.d(instreamAudioAd, instreamAudioAdBanner);
        this.audioAdStatSender.sendReady(this.refer);
        this.adsCounter++;
        if (this._innerState != null) {
            setState(this._innerState);
            this._innerState = null;
        }
        this.currentBanner = instreamAudioAdBanner;
        if (this.currentBanner != null) {
            Set<PlayerAction> actions = new HashSet<>();
            actions.add(PlayerAction.playPause);
            if (this.currentBanner.isAllowSeek()) {
                actions.add(PlayerAction.seek);
            }
            if (this.currentBanner.isAllowTrackChange()) {
                actions.add(PlayerAction.changeTrack);
            }
            if (this.currentBanner.isAllowSkip()) {
                actions.add(PlayerAction.skipAd);
            }
            this.currentBannerActions = new PlayerAction[actions.size()];
            int i = 0;
            for (PlayerAction action : actions) {
                this.currentBannerActions[i] = action;
                i++;
            }
            return;
        }
        this.currentBannerActions = null;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdListener
    public void onBannerComplete(InstreamAudioAd instreamAudioAd, InstreamAudioAd.InstreamAudioAdBanner instreamAudioAdBanner) {
        L.d(instreamAudioAd, instreamAudioAdBanner);
        this.audioAdStatSender.sendCompleted(this.refer);
        this.currentBanner = null;
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdListener
    public void onBannerTimeLeftChange(float v, float v1, InstreamAudioAd instreamAudioAd) {
        L.d(Float.valueOf(v), Float.valueOf(v1), instreamAudioAd);
        this.audioAdStatSender.sendProgress(v1 - v, v1, this.refer);
    }

    @Override // com.my.target.ads.instream.InstreamAudioAd.InstreamAudioAdListener
    public void onComplete(String s, InstreamAudioAd instreamAudioAd) {
        L.d(s, instreamAudioAd);
        onComplete();
    }
}
