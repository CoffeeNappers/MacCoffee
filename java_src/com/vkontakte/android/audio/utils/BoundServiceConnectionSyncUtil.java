package com.vkontakte.android.audio.utils;

import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.PlayerConnectionListener;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.TrackInfo;
import java.util.List;
/* loaded from: classes2.dex */
public class BoundServiceConnectionSyncUtil {

    /* loaded from: classes2.dex */
    public static class Listener implements PlayerConnectionListener {
        private PlayerConnectionListener listener;
        private final Object syncObj = new Object();
        private volatile boolean isFinish = false;

        public Listener(PlayerConnectionListener listener) {
            this.listener = listener;
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
            synchronized (this.syncObj) {
                try {
                    this.listener.onStateChanged(state, trackInfo);
                } catch (Exception e) {
                }
                this.isFinish = true;
                this.syncObj.notifyAll();
            }
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onTrackListChanged(List<PlayerTrack> list) {
            synchronized (this.syncObj) {
                try {
                    this.listener.onTrackListChanged(list);
                } catch (Exception e) {
                }
                this.isFinish = true;
                this.syncObj.notifyAll();
            }
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onProgress(TrackInfo trackInfo) {
            synchronized (this.syncObj) {
                try {
                    this.listener.onProgress(trackInfo);
                } catch (Exception e) {
                }
                this.isFinish = true;
                this.syncObj.notifyAll();
            }
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onBufferingProgress(TrackInfo trackInfo) {
            synchronized (this.syncObj) {
                try {
                    this.listener.onBufferingProgress(trackInfo);
                } catch (Exception e) {
                }
                this.isFinish = true;
                this.syncObj.notifyAll();
            }
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onParametersChanged(Player player) {
            synchronized (this.syncObj) {
                try {
                    this.listener.onParametersChanged(player);
                } catch (Exception e) {
                }
                this.isFinish = true;
                this.syncObj.notifyAll();
            }
        }

        @Override // com.vkontakte.android.audio.utils.BoundServiceConnection.BoundServiceConnectionListener
        public void onConnected() {
            synchronized (this.syncObj) {
                try {
                    this.listener.onConnected();
                } catch (Exception e) {
                }
                this.isFinish = true;
                this.syncObj.notifyAll();
            }
        }
    }

    public static void waitListenerFinished(Listener listener) {
        synchronized (listener.syncObj) {
            while (!listener.isFinish) {
                try {
                    listener.syncObj.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
