package com.vkontakte.android.audio.player;

import com.vkontakte.android.audio.utils.BoundServiceConnection;
import java.util.List;
/* loaded from: classes2.dex */
public interface PlayerConnectionListener extends BoundServiceConnection.BoundServiceConnectionListener, PlayerListener {

    /* loaded from: classes2.dex */
    public static class PlayerConnectionListenerAdapter implements PlayerConnectionListener {
        @Override // com.vkontakte.android.audio.utils.BoundServiceConnection.BoundServiceConnectionListener
        public void onConnected() {
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onTrackListChanged(List<PlayerTrack> list) {
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onProgress(TrackInfo trackInfo) {
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onBufferingProgress(TrackInfo trackInfo) {
        }

        @Override // com.vkontakte.android.audio.player.PlayerListener
        public void onParametersChanged(Player player) {
        }
    }
}
