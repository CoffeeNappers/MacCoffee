package com.vkontakte.android;

import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class TaggedPhoto extends Photo {
    public static final Serializer.Creator<TaggedPhoto> CREATOR = new Serializer.CreatorAdapter<TaggedPhoto>() { // from class: com.vkontakte.android.TaggedPhoto.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public TaggedPhoto mo1087createFromSerializer(Serializer in) {
            return new TaggedPhoto(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public TaggedPhoto[] mo1088newArray(int size) {
            return new TaggedPhoto[size];
        }
    };
    public int tagID;
    public int tagPlacerID;

    public TaggedPhoto() {
    }

    public TaggedPhoto(PhotoAttachment att) {
        super(att);
    }

    public TaggedPhoto(JSONObject obj) {
        super(obj);
        try {
            this.tagID = obj.getInt("tag_id");
            this.tagPlacerID = obj.getInt("placer_id");
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    public TaggedPhoto(Serializer p) {
        super(p);
        this.tagID = p.readInt();
        this.tagPlacerID = p.readInt();
    }

    @Override // com.vkontakte.android.Photo, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer p) {
        super.serializeTo(p);
        p.writeInt(this.tagID);
        p.writeInt(this.tagPlacerID);
    }
}
