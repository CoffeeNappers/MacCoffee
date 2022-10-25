package com.vk.music.model;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.core.util.ToastUtils;
import com.vk.music.model.PlayerModel;
import com.vkontakte.android.R;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.audio.AudioGetRecommendations;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.PlayerListener;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.data.VKList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class PlayerModelImpl extends ObservableModel<PlayerModel.Callback> implements PlayerModel, PlayerListener {
    boolean playerPlaying = AudioFacade.getPlayerState().isPlayState();
    MusicTrack playingTrack;
    final PlayerRefer refer;

    @Override // com.vk.music.model.PlayerModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull PlayerModel.Callback callback) {
        super.subscribe((PlayerModelImpl) callback);
    }

    @Override // com.vk.music.model.PlayerModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull PlayerModel.Callback callback) {
        super.unsubscribe((PlayerModelImpl) callback);
    }

    public PlayerModelImpl(@NonNull PlayerRefer refer) {
        this.refer = refer;
        AudioFacade.addPlayerListener(this, true);
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.playingTrack = (MusicTrack) state.getParcelable("playingTrack");
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle state = new Bundle();
        state.putParcelable("playingTrack", this.playingTrack);
        return state;
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        AudioFacade.removePlayerListener(this);
    }

    @Override // com.vk.music.model.PlayerModel
    @Nullable
    public MusicTrack getPlayingTrack() {
        return this.playingTrack;
    }

    @Override // com.vk.music.model.PlayerModel
    public void togglePlayer(@Nullable MusicTrack musicTrack, @Nullable List<MusicTrack> tracks) {
        togglePlayer(musicTrack, tracks, this.refer);
    }

    @Override // com.vk.music.model.PlayerModel
    public void togglePlayer(@Nullable MusicTrack musicTrack, @Nullable List<MusicTrack> tracks, PlayerRefer refer) {
        if (musicTrack != null && musicTrack.equals(AudioFacade.getCurrentTrack())) {
            if (this.playerPlaying) {
                AudioFacade.pause();
                return;
            } else {
                AudioFacade.resume();
                return;
            }
        }
        int index = tracks == null ? -1 : tracks.indexOf(musicTrack);
        if (index >= 0) {
            AudioFacade.playTracks(tracks, index, refer, false);
        } else if (musicTrack != null) {
            AudioFacade.playTrack(musicTrack, refer, false);
        } else if (tracks != null && !tracks.isEmpty()) {
            AudioFacade.playTracks(tracks, 0, refer, false);
        }
    }

    @Override // com.vk.music.model.PlayerModel
    public boolean isPlayerPlaying() {
        return this.playerPlaying;
    }

    @Override // com.vk.music.model.PlayerModel
    public void addToPlayNext(@NonNull Context ctx, @NonNull MusicTrack musicTrack) {
        AudioFacade.addToPlayNext(ctx, Collections.singletonList(musicTrack));
        ToastUtils.showToast((int) R.string.music_toast_add_to_play_next);
    }

    @Override // com.vk.music.model.PlayerModel
    public void loadAndPlayTheSame(@NonNull Context ctx, @NonNull MusicTrack musicTrack) {
        new AudioGetRecommendations(100, musicTrack.getMid()).setCallback(new SimpleCallback<VKList<MusicTrack>>() { // from class: com.vk.music.model.PlayerModelImpl.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<MusicTrack> result) {
                if (result != null && result.size() > 0) {
                    PlayerModelImpl.this.togglePlayer(null, result);
                } else {
                    ToastUtils.showToast((int) R.string.music_toast_similar_tracks_not_found);
                }
            }
        }).wrapProgress(ctx).exec(ctx);
    }

    @Override // com.vkontakte.android.audio.player.PlayerListener
    public void onStateChanged(PlayerState state, TrackInfo trackInfo) {
        boolean notifyStop = true;
        switch (state) {
            case STOPPED:
                if (this.playingTrack == null) {
                    notifyStop = false;
                }
                this.playingTrack = null;
                if (notifyStop) {
                    notifyObservers(PlayerModelImpl$$Lambda$1.lambdaFactory$(this));
                    return;
                }
                return;
            case PLAYING:
                this.playerPlaying = true;
                this.playingTrack = trackInfo.getTrack();
                notifyObservers(PlayerModelImpl$$Lambda$2.lambdaFactory$(this));
                return;
            case PAUSED:
                this.playerPlaying = false;
                this.playingTrack = trackInfo.getTrack();
                notifyObservers(PlayerModelImpl$$Lambda$3.lambdaFactory$(this));
                return;
            case IDLE:
                this.playingTrack = null;
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onStateChanged$0(PlayerModel.Callback callback) {
        callback.onPlayingStopped(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onStateChanged$1(PlayerModel.Callback callback) {
        callback.onPlayingResumed(this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onStateChanged$2(PlayerModel.Callback callback) {
        callback.onPlayingPaused(this);
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
