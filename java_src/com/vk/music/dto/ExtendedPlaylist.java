package com.vk.music.dto;

import com.vkontakte.android.utils.Serializer;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ExtendedPlaylist extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<ExtendedPlaylist> CREATOR = new Serializer.CreatorAdapter<ExtendedPlaylist>() { // from class: com.vk.music.dto.ExtendedPlaylist.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public ExtendedPlaylist mo1087createFromSerializer(Serializer in) {
            return new ExtendedPlaylist(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public ExtendedPlaylist[] mo1088newArray(int size) {
            return new ExtendedPlaylist[size];
        }
    };
    public final Playlist playlist;
    public final String subtitle;
    public final String title;

    public ExtendedPlaylist(JSONObject object) {
        this.playlist = new Playlist(object.optJSONObject("playlist"));
        this.title = object.optString("title");
        this.subtitle = object.optString("subtitle");
    }

    public ExtendedPlaylist(Serializer s) {
        this.playlist = (Playlist) s.readSerializable(Playlist.class.getClassLoader());
        this.title = s.readString();
        this.subtitle = s.readString();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeSerializable(this.playlist);
        s.writeString(this.title);
        s.writeString(this.subtitle);
    }
}
