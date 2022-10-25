package com.vk.music.dto;

import android.support.annotation.NonNull;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class Genre extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Genre> CREATOR = new Serializer.CreatorAdapter<Genre>() { // from class: com.vk.music.dto.Genre.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Genre mo1087createFromSerializer(Serializer s) {
            return new Genre(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Genre[] mo1088newArray(int size) {
            return new Genre[size];
        }
    };
    public final int id;
    public final String name;

    public Genre(@NonNull JSONObject jGenre) {
        this.id = jGenre.optInt("id");
        this.name = jGenre.optString("name");
    }

    private Genre(Serializer s) {
        this.id = s.readInt();
        this.name = s.readString();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeString(this.name);
    }
}
