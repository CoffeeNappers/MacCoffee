package com.vkontakte.android.audio.player;

import java.util.List;
/* loaded from: classes.dex */
public interface PlayerListener {
    void onBufferingProgress(TrackInfo trackInfo);

    void onParametersChanged(Player player);

    void onProgress(TrackInfo trackInfo);

    void onStateChanged(PlayerState playerState, TrackInfo trackInfo);

    void onTrackListChanged(List<PlayerTrack> list);

    /* loaded from: classes2.dex */
    public static class PlayerListenerAdapter implements PlayerListener {
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
