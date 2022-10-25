package com.vk.music.dto;

import android.support.annotation.NonNull;
import com.vk.core.util.CollectionUtils;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class PlaylistSearchResult extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<PlaylistSearchResult> CREATOR = new Serializer.CreatorAdapter<PlaylistSearchResult>() { // from class: com.vk.music.dto.PlaylistSearchResult.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PlaylistSearchResult mo1087createFromSerializer(Serializer s) {
            return new PlaylistSearchResult(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PlaylistSearchResult[] mo1088newArray(int size) {
            return new PlaylistSearchResult[size];
        }
    };
    private List<Playlist> global;
    private List<Playlist> local;

    public PlaylistSearchResult(@NonNull List<Playlist> playlists) {
        for (Playlist playlist : playlists) {
            if (VKAccountManager.isCurrentUser(playlist.ownerId)) {
                if (this.local == null) {
                    this.local = new ArrayList();
                }
                this.local.add(playlist);
            } else {
                if (this.global == null) {
                    this.global = new ArrayList();
                }
                this.global.add(playlist);
            }
        }
    }

    private PlaylistSearchResult(Serializer s) {
        this.local = s.createTypedArrayList(Playlist.CREATOR);
        this.global = s.createTypedArrayList(Playlist.CREATOR);
    }

    public List<Playlist> getLocal() {
        return this.local;
    }

    public List<Playlist> getGlobal() {
        return this.global;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeTypedList(this.local);
        s.writeTypedList(this.global);
    }

    public void fill(@NonNull PlaylistSearchResult result) {
        if (result.local != null) {
            if (this.local == null) {
                this.local = new ArrayList();
            }
            this.local.addAll(result.local);
        }
        if (result.global != null) {
            if (this.global == null) {
                this.global = new ArrayList();
            }
            this.global.addAll(result.global);
        }
    }

    public boolean isEmpty() {
        return CollectionUtils.isEmpty(this.local) && CollectionUtils.isEmpty(this.global);
    }
}
