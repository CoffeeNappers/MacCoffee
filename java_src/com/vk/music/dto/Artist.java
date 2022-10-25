package com.vk.music.dto;

import android.support.annotation.NonNull;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class Artist extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Artist> CREATOR = new Serializer.CreatorAdapter<Artist>() { // from class: com.vk.music.dto.Artist.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Artist mo1087createFromSerializer(Serializer s) {
            return new Artist(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Artist[] mo1088newArray(int size) {
            return new Artist[size];
        }
    };
    public final int id;
    public final String name;

    public Artist(@NonNull JSONObject jGenre) {
        this.id = jGenre.optInt("id");
        this.name = jGenre.optString("name");
    }

    private Artist(Serializer s) {
        this.id = s.readInt();
        this.name = s.readString();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeString(this.name);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Artist artist = (Artist) o;
        return this.id == artist.id;
    }

    public int hashCode() {
        return this.id;
    }

    public String toString() {
        return this.name;
    }
}
