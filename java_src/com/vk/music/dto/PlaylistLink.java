package com.vk.music.dto;

import android.support.annotation.NonNull;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class PlaylistLink extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<PlaylistLink> CREATOR = new Serializer.CreatorAdapter<PlaylistLink>() { // from class: com.vk.music.dto.PlaylistLink.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PlaylistLink mo1087createFromSerializer(Serializer in) {
            return new PlaylistLink(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PlaylistLink[] mo1088newArray(int size) {
            return new PlaylistLink[size];
        }
    };
    public final String accessKey;
    public final int id;
    public final int ownerId;

    public PlaylistLink(@NonNull JSONObject jLink) {
        this.id = jLink.optInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_PLAY_LIST_ID);
        this.ownerId = jLink.optInt("owner_id");
        this.accessKey = jLink.optString("access_key");
    }

    protected PlaylistLink(Serializer s) {
        this.id = s.readInt();
        this.ownerId = s.readInt();
        this.accessKey = s.readString();
    }

    public PlaylistLink(int id, int ownerId) {
        this.id = id;
        this.ownerId = ownerId;
        this.accessKey = null;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeInt(this.ownerId);
        s.writeString(this.accessKey);
    }
}
