package com.vk.music.dto;

import android.support.annotation.NonNull;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AlbumLink extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<AlbumLink> CREATOR = new Serializer.CreatorAdapter<AlbumLink>() { // from class: com.vk.music.dto.AlbumLink.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public AlbumLink mo1087createFromSerializer(Serializer s) {
            return new AlbumLink(s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public AlbumLink[] mo1088newArray(int size) {
            return new AlbumLink[size];
        }
    };
    public final String accessKey;
    public final int id;
    public final int ownerId;
    public final Thumb thumb;
    public final String title;

    public AlbumLink(@NonNull JSONObject jLink) {
        this.id = jLink.optInt("id");
        this.ownerId = jLink.optInt("owner_id");
        this.accessKey = jLink.optString("access_key");
        this.title = jLink.optString("title");
        if (jLink.has(AttachmentInfo.DATA_THUMB)) {
            this.thumb = new Thumb(jLink.optJSONObject(AttachmentInfo.DATA_THUMB));
        } else {
            this.thumb = null;
        }
    }

    private AlbumLink(Serializer s) {
        this.id = s.readInt();
        this.ownerId = s.readInt();
        this.accessKey = s.readString();
        this.title = s.readString();
        this.thumb = (Thumb) s.readSerializable(Thumb.class.getClassLoader());
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeInt(this.ownerId);
        s.writeString(this.accessKey);
        s.writeString(this.title);
        s.writeSerializable(this.thumb);
    }
}
