package com.vkontakte.android.data;

import com.vkontakte.android.Photo;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GoodAlbum extends Serializer.SerializableAdapter implements ServerKeys {
    public static final Serializer.Creator<GoodAlbum> CREATOR = new Serializer.CreatorAdapter<GoodAlbum>() { // from class: com.vkontakte.android.data.GoodAlbum.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public GoodAlbum mo1087createFromSerializer(Serializer in) {
            return new GoodAlbum(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public GoodAlbum[] mo1088newArray(int size) {
            return new GoodAlbum[size];
        }
    };
    public final int count;
    public final int id;
    public final int owner_id;
    public final Photo photo;
    public final String title;
    public final int updated_time;

    public GoodAlbum(JSONObject o) {
        this.id = o.optInt("id");
        this.owner_id = o.optInt("owner_id");
        this.title = o.optString("title");
        JSONObject jPhoto = o.optJSONObject("photo");
        this.photo = jPhoto == null ? null : new Photo(jPhoto);
        this.count = o.optInt(ServerKeys.COUNT);
        this.updated_time = o.optInt(ServerKeys.UPDATE_TIME);
    }

    public GoodAlbum(Serializer parcel) {
        this.id = parcel.readInt();
        this.owner_id = parcel.readInt();
        this.title = parcel.readString();
        this.photo = (Photo) parcel.readSerializable(Photo.class.getClassLoader());
        this.count = parcel.readInt();
        this.updated_time = parcel.readInt();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeInt(this.owner_id);
        s.writeString(this.title);
        s.writeSerializable(this.photo);
        s.writeInt(this.count);
        s.writeInt(this.updated_time);
    }
}
