package com.vk.music.dto;

import android.support.annotation.NonNull;
import com.vk.core.util.CollectionUtils;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class MusicSearchResult extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<MusicSearchResult> CREATOR = new Serializer.CreatorAdapter<MusicSearchResult>() { // from class: com.vk.music.dto.MusicSearchResult.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public MusicSearchResult mo1087createFromSerializer(Serializer s) {
            return new MusicSearchResult(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public MusicSearchResult[] mo1088newArray(int size) {
            return new MusicSearchResult[size];
        }
    };
    private List<MusicTrack> global;
    private List<MusicTrack> local;

    public MusicSearchResult(@NonNull List<MusicTrack> musicTracks) {
        for (MusicTrack musicTrack : musicTracks) {
            if (VKAccountManager.isCurrentUser(musicTrack.oid)) {
                if (this.local == null) {
                    this.local = new ArrayList();
                }
                this.local.add(musicTrack);
            } else {
                if (this.global == null) {
                    this.global = new ArrayList();
                }
                this.global.add(musicTrack);
            }
        }
    }

    private MusicSearchResult(Serializer s) {
        this.local = s.createTypedArrayList(MusicTrack.CREATOR);
        this.global = s.createTypedArrayList(MusicTrack.CREATOR);
    }

    public List<MusicTrack> getLocal() {
        return this.local;
    }

    public List<MusicTrack> getGlobal() {
        return this.global;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeTypedList(this.local);
        s.writeTypedList(this.global);
    }

    public void fill(@NonNull MusicSearchResult result) {
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
