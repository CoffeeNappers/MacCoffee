package com.vk.music.model;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vk.music.dto.Section;
import com.vk.music.model.RecommendedModel;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetCatalog;
import com.vkontakte.android.api.audio.AudioGetCatalogBlockById;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class RecommendedModelImpl extends ObservableModel<RecommendedModel.Callback> implements RecommendedModel, Callback<VKList<Section>> {
    private String errorMessage;
    @Nullable
    private ArrayList<Section> sections = null;
    @Nullable
    private AudioGetCatalog audioGetCatalog = null;
    private final PlayerModel playerModel = new PlayerModelImpl(PlayerRefer.none);
    private final MusicTrackModel musicTrackModel = new MusicTrackModelImpl();

    @Override // com.vk.music.model.RecommendedModel
    public /* bridge */ /* synthetic */ void subscribe(@NonNull RecommendedModel.Callback callback) {
        super.subscribe((RecommendedModelImpl) callback);
    }

    @Override // com.vk.music.model.RecommendedModel
    public /* bridge */ /* synthetic */ void unsubscribe(@NonNull RecommendedModel.Callback callback) {
        super.unsubscribe((RecommendedModelImpl) callback);
    }

    @Override // com.vk.music.model.RecommendedModel
    @Nullable
    public ArrayList<Section> getSections() {
        return this.sections;
    }

    @Override // com.vk.music.model.RecommendedModel
    public void load() {
        this.audioGetCatalog = new AudioGetCatalog();
        this.audioGetCatalog.setCallback(this);
        this.audioGetCatalog.exec((Context) null);
    }

    @Override // com.vk.music.model.RecommendedModel
    @NonNull
    public MusicTrackModel getMusicTrackModel() {
        return this.musicTrackModel;
    }

    @Override // com.vk.music.model.RecommendedModel
    public void playSection(@NonNull Section section, @Nullable MusicTrack musicTrack) {
        final ArrayList<MusicTrack> audios = section.audios == null ? null : new ArrayList<>(section.audios);
        getPlayerModel().togglePlayer(musicTrack, audios, PlayerRefer.parseRecommended(section.source));
        if (audios != null && audios.size() > 0 && audios.size() < 100) {
            new AudioGetCatalogBlockById.Builder(section.id, audios.size(), 100 - audios.size()).buildAudios().setCallback(new SimpleCallback<VKList<MusicTrack>>() { // from class: com.vk.music.model.RecommendedModelImpl.1
                @Override // com.vkontakte.android.api.Callback
                public void success(VKList<MusicTrack> result) {
                    List<PlayerTrack> playerTracks = AudioFacade.getActualTrackList();
                    if (audios.equals(playerTracks)) {
                        AudioFacade.addToPlaylist(VKApplication.context, result);
                    }
                }
            }).exec();
        }
    }

    @Override // com.vk.music.model.ActiveModel
    public void restore(@NonNull Bundle state) {
        this.sections = state.getParcelableArrayList("sections");
    }

    @Override // com.vk.music.model.ActiveModel
    @NonNull
    public Bundle save() {
        Bundle bundle = new Bundle();
        bundle.putParcelableArrayList("sections", this.sections);
        return bundle;
    }

    @Override // com.vk.music.model.ObservableModel, com.vk.music.model.ActiveModel
    public void clearCallbacks() {
        super.clearCallbacks();
        getPlayerModel().clearCallbacks();
    }

    @Override // com.vk.music.model.ActiveModel
    public void release() {
        clearCallbacks();
        AudioGetCatalog audioGetCatalog = this.audioGetCatalog;
        if (audioGetCatalog != null) {
            audioGetCatalog.cancel();
        }
    }

    @Override // com.vk.music.model.RecommendedModel
    @NonNull
    public PlayerModel getPlayerModel() {
        return this.playerModel;
    }

    @Override // com.vk.music.model.RecommendedModel
    @Nullable
    public String getError() {
        return this.errorMessage;
    }

    @Override // com.vkontakte.android.api.Callback
    public void success(VKList<Section> result) {
        this.sections = new ArrayList<>(result);
        notifyObservers(RecommendedModelImpl$$Lambda$1.lambdaFactory$(this));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$success$0(RecommendedModel.Callback callback) {
        callback.onLoadingDone(this);
    }

    @Override // com.vkontakte.android.api.Callback
    public void fail(VKAPIRequest.VKErrorResponse error) {
        this.errorMessage = error.message;
        notifyObservers(RecommendedModelImpl$$Lambda$2.lambdaFactory$(this, error));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$fail$1(VKAPIRequest.VKErrorResponse error, RecommendedModel.Callback callback) {
        callback.onLoadingError(this, error);
    }
}
