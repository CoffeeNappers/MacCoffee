package com.vk.core.common;

import android.os.Parcel;
import com.vkontakte.android.utils.Serializer;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ImageSize implements Serializer.Serializable {
    public static final Serializer.Creator<ImageSize> CREATOR = new Serializer.CreatorAdapter<ImageSize>() { // from class: com.vk.core.common.ImageSize.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public ImageSize mo1087createFromSerializer(Serializer in) {
            return new ImageSize(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public ImageSize[] mo1088newArray(int size) {
            return new ImageSize[size];
        }
    };
    private final int height;
    private final String url;
    private final int width;

    public ImageSize(JSONObject image) throws JSONException {
        if (image.has("url")) {
            this.url = image.getString("url");
        } else {
            this.url = image.getString("src");
        }
        this.width = image.getInt("width");
        this.height = image.getInt("height");
    }

    public ImageSize(Serializer image) {
        this.url = image.readString();
        this.height = image.readInt();
        this.width = image.readInt();
    }

    public String getUrl() {
        return this.url;
    }

    public int getHeight() {
        return this.height;
    }

    public int getWidth() {
        return this.width;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.url);
        s.writeInt(this.height);
        s.writeInt(this.width);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.url);
        dest.writeInt(this.height);
        dest.writeInt(this.width);
    }
}
